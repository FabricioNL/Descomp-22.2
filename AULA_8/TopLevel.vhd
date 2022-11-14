library ieee;
use ieee.std_logic_1164.all;

entity TopLevel is

  -- Total de bits das entradas e saidas
  generic ( 
			larguraDados : natural := 8;
			larguraEnderecos : natural := 3;
			simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  
  port   (
  
	 -- entrada
    CLOCK_50 	: in std_logic;
    KEY			: in std_logic_vector(3 downto 0);
    SW			: in std_logic_vector(9 downto 0);
	 RESET_FPGA	: in 	std_logic;
	 
	 -- saida 
    LEDR  		: out std_logic_vector(9 downto 0)
  
  );
end entity;


architecture arquitetura of TopLevel is

  signal CLK 					: std_logic;
  
  -- sinais do processador 
  signal write_enable 		: std_logic;
  signal read_enable 		: std_logic;
  signal ROM_Address 		: std_logic_vector(8 downto 0);
  signal Instruction_IN    : std_logic_vector(12 downto 0);
  signal Data_IN				: std_logic_vector(7 downto 0);
  signal Data_OUT				: std_logic_vector(7 downto 0);
  signal Data_Address 		: std_logic_vector(8 downto 0);
  
  -- sinal do decoder
  signal DEC1_OUT 			: std_logic_vector(7 downto 0);
  signal DEC2_OUT 			: std_logic_vector(7 downto 0);
  
  -- endereços dos LEDS 
  signal LED1_endereco		: std_logic;
  signal LED2_endereco 		: std_logic;
  signal LEDR_endereco		: std_logic_vector(7 downto 0);
  
  
  -- sete segmentos
  
  signal HEX0					: std_logic_vector	(6 downto 0);
  signal HEX1					: std_logic_vector	(6 downto 0);
  signal HEX2					: std_logic_vector	(6 downto 0);
  signal HEX3					: std_logic_vector	(6 downto 0);
  signal HEX4					: std_logic_vector	(6 downto 0);
  signal HEX5					: std_logic_vector	(6 downto 0);
  
  
  -- registrador FF (deboucer)
  
  signal FF_OUT 				: std_logic;
  signal FF_RESET				: std_logic;
  
begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector

gravar:  if simulacao generate

CLK <= KEY(0);

else generate

detectorSub0: work.edgeDetector(bordaSubida)
        port map (
			clk => CLOCK_50, 
			entrada => (not KEY(0)), 
			saida => CLK
		);
		
end generate;

FF_RESET <= Data_Address(8) and Data_Address(7) and Data_Address(6)
			and Data_Address(5) and Data_Address(4) and Data_Address(3)
				and Data_Address(2) and Data_Address(1) and Data_Address(0)
					and write_enable;


FF_REG: entity work.flipflopGenerico
		port map(
			DIN 		=> '1',
			DOUT 		=> FF_OUT,
			ENABLE 	=> '1',

			CLK		=> ,
			RST		=> FF_RESET
	);
		

KEY0 : entity work.buffer_3_state_8portas 
				port map(
					entrada => "0000000" & FF_OUT,
					habilita => read_enable and (Data_Address(5)) and DEC2_OUT(0) and DEC1_OUT(5),
					saida => Data_IN
				);

KEY1 : entity work.buffer_3_state_8portas 
				port map(
					entrada => "0000000" & KEY(1),
					habilita => read_enable and (Data_Address(5)) and DEC2_OUT(1) and DEC1_OUT(5),
					saida => Data_IN
				);

KEY2 : entity work.buffer_3_state_8portas 
  				port map(
  					entrada => "0000000" & KEY(2),
  					habilita => read_enable and (Data_Address(5)) and DEC2_OUT(2) and DEC1_OUT(5),
  					saida => Data_IN
				);
  					
KEY3 : entity work.buffer_3_state_8portas 
  				port map(
  					entrada => "0000000" & KEY(3),
  					habilita => read_enable and (Data_Address(5)) and DEC2_OUT(3) and DEC1_OUT(5),
  					saida => Data_IN
				);
					
FPGA_RESET : entity work.buffer_3_state_8portas 
 				port map(
 					entrada => "0000000" & RESET_FPGA,
					habilita => read_enable and (Data_Address(5)) and DEC2_OUT(4) and DEC1_OUT(5),
  					saida => Data_IN
				);
  
SW_0_7 : entity work.buffer_3_state_8portas 
   			port map(
  					entrada => SW(7 downto 0),
  					habilita => (read_enable and not (Data_Address(5)) and DEC2_OUT(0) and DEC1_OUT(5)),
  					saida => Data_IN
				);
  					
SW_8 : entity work.buffer_3_state_8portas 
  				port map(
  					entrada => "0000000" & SW(8),
  					habilita => read_enable and not (Data_Address(5)) and DEC2_OUT(1) and DEC1_OUT(5),
  					saida => Data_IN
				);

SW_9 : entity work.buffer_3_state_8portas 
  				port map(
  					entrada => "0000000" & SW(9),
  					habilita => read_enable and not (Data_Address(5)) and DEC2_OUT(2) and DEC1_OUT(5),
  					saida => Data_IN
				);

HEXS : entity work.sete_segmentos
				port map(
					CLK				=>	CLK,
					DATA_OUT			=>	Data_OUT(3 downto 0),
					MEM_LINHA_5		=>	Data_Address(5),
					Escrita 			=>	write_enable,
					decoder_indice	=>	DEC2_OUT,
					decoder_OUT 	=>	DEC1_OUT(4),
					HEX0				=> HEX0,
					HEX1				=>	HEX1,
					HEX2				=>	HEX2,
					HEX3				=>	HEX3,	
					HEX4				=>	HEX4,
					HEX5				=> HEX5
				);


LEDS : entity work.LED 
			   port map(
					CLK 				=> CLK,
					LEDS_Address	=>	DEC2_OUT(2 downto 0),
					Decoder_OUT 	=>	DEC1_OUT(4),
					Escrita 			=> write_enable,	
					DATA_OUT			=>	Data_OUT,
					MEM_LINHA_5 	=> Data_Address(5),
					LEDR_Address 	=> LEDR_endereco,
					LED1_Address 	=>	LED1_endereco,
					LED2_Address 	=>	LED2_endereco
				);

					
-- Decoder 3x8 de blocos
DEC1 : entity work.Decoder3x8
				port map(
				
					 entrada => Instruction_IN(8 downto 6),
                saida => DEC1_OUT
				
				);
					 
					 
-- Decoder 3x8 de endereços
DEC2 : entity work.Decoder3x8
				port map(
				
					 entrada => Instruction_IN(2 downto 0),
                saida => DEC2_OUT
				);
		 
		 
-- Processador
MP : entity work.Processador 
			port map ( CLK => CLK, 
						  wr => write_enable, 
						  rd => read_enable, 
						  Instruction_IN => Instruction_IN, 
						  ROM_Address => ROM_Address, 
						  Data_IN => Data_IN, 
						  Data_OUT => Data_OUT, 
						  Data_Address => Data_Address);
		 
		 
-- Memória RAM 		 
RAM1 : entity work.memoriaRAM   generic map (dataWidth => 8, addrWidth => 6)
          port map ( addr => Data_Address(5 downto 0),
							we => write_enable, 
							re => read_enable, 
							habilita => DEC1_OUT(0), 
							dado_in => Data_OUT, 
							dado_out => Data_IN, 
							clk => CLK);
			 
-- Memória ROM
ROM1 : entity work.memoriaROM   generic map (dataWidth => 13, addrWidth => 9)
          port map (Endereco => ROM_Address, Dado => Instruction_IN);

end architecture;