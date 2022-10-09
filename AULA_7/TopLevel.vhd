library ieee;
use ieee.std_logic_1164.all;

entity TopLevel is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8;
        larguraEnderecos : natural := 3;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
	 -- entrada
    CLOCK_50 	: in std_logic;
    KEY			: in std_logic_vector(3 downto 0);
    SW			: in std_logic_vector(9 downto 0);
	 
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
  signal Data_Address 		: std_logic_vector(7 downto 0);
  
  -- sinal do decoder
  signal DEC1_OUT 			: std_logic_vector(7 downto 0);
  signal DEC2_OUT 			: std_logic_vector(7 downto 0);
  
  -- endereços dos LEDS 
  signal LED1_endereco		: std_logic;
  signal LED2_endereco 		: std_logic;
  signal LEDR_endereco		: std_logic_vector(7 downto 0);
  
  
begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector

gravar:  if simulacao generate
CLK <= KEY(0);
else generate
detectorSub0: work.edgeDetector(bordaSubida)
        port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => CLK);
end generate;

LEDS : entity work.LED 
			   port map(
					CLK 				=> CLK,
					LEDS_Address	=>	DEC1_OUT(2 downto 0),
					Decoder_OUT 	=>	DEC1_OUT(4),
					Escrita 			=> write_enable,	
					DATA_OUT			=>	Data_OUT,
					LEDR_Address 	=> LEDR_endereco,
					LED1_Address 	=>	LED1_endereco,
					LED2_Address 	=>	LED2_endereco);

-- Decoder 3x8 de blocos
DEC1 : entity work.Decoder3x8
				port map(
					 entrada => Instruction_IN(8 downto 6),
                saida => DEC1_OUT);
					 
					 
-- Decoder 3x8 de endereços
DEC2 : entity work.Decoder3x8
				port map(
					 entrada => Instruction_IN(2 downto 0),
                saida => DEC2_OUT);
		 
		 
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