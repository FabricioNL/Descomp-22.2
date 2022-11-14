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
    CLOCK_50 		: in std_logic;
    KEY				: in std_logic_vector(3 downto 0);
	 WR_enable  	: in std_logic;
	 
	 -- saidas 
	 
	 instrucao  			: out std_logic_vector(5 downto 0);
	 conteudo_ULA  		: out std_logic_vector(31 downto 0);
	 
	 end_REGS 				: out std_logic_vector(4 downto 0);
	 end_REGT 				: out std_logic_vector(4 downto 0);
	 end_PC					: out std_logic_vector(31 downto 0);
	 
	 end_pontos_controle : out std_logic_vector(9 downto 0);
	 
	 end_saida_reg_b		: out std_logic_vector(31 downto 0);
	 end_saida_reg_a 		: out std_logic_vector(31 downto 0);
	 
	 end_REGD 				: out std_logic_vector(4 downto 0);
	 saida_ram_simu	   : out std_logic_vector(31 downto 0);
	 sel_mux 				: out std_logic
  );
end entity;


architecture arquitetura of TopLevel is

  signal CLK 					: std_logic;
  signal saida_ULA			: std_logic_vector(31 downto 0);
  signal flag_zero         : std_logic;
  
  -- entrada da ULA
  signal RG_rs					: std_logic_vector(31 downto 0);
  signal RG_rt					: std_logic_vector(31 downto 0);
  
  -- entradas e saidas do Program Counter
  signal saida_PC				: std_logic_vector(31 downto 0);
  signal entrada_PC			: std_logic_vector(31 downto 0);
  
  -- saida memoria ROM
  signal saida_ROM 			: std_logic_vector(31 downto 0);

  -- saidas banco de registradores
  signal saida_reg_a 		: std_logic_vector(31 downto 0);
  signal saida_reg_b			: std_logic_vector(31 downto 0);
  
  -- saida do estensor 
  signal saida_estendia    : std_logic_vector(31 downto 0);
  
  -- saida RAM
  signal saida_RAM    		: std_logic_vector(31 downto 0);
  
  -- saida decoder
  signal pontos_controle 	: std_logic_vector(9 downto 0);
  
  -- saida incrementa bech
  signal bech_somador      : std_logic_vector(31 downto 0);
  
  -- saida do mux de jump 
  signal  saida_mux        : std_logic_vector(31 downto 0);
  
   -- entrada do incrementa jmp 
  signal entrada_jmp    	: std_logic_vector(31 downto 0);
  
  -- saida do mux de selecao entre imediato estendido e saida B do banco de reg 
  signal saida_mux_reg_imediado : std_logic_vector(31 downto 0);
  
  -- saida do mux de enderecos 
  signal saida_mux_enderecos    : std_logic_vector(4 downto 0);
  
  -- saida do mux de escrita 	  
  signal saida_mux_escrita		  : std_logic_vector(31 downto 0);
  
  -- saida da rom SHIFTADA para instrucao J
  signal saida_shift_j 			  : std_logic_vector(25 downto 0);
  
  -- saida do mux de escolha entre jump e beq 
   signal saida_ula_jump_beq    : std_logic_vector(31 downto 0);
  
  
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

 
-- O port map completo do Program Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => 32)
          port map (
				DIN => saida_ula_jump_beq , 
				DOUT => saida_PC, 
				ENABLE => '1', 
				CLK => CLK, 
				RST => '0'
			);
			 
-- O port map completo do incrementa
incrementaPC :  entity work.somaConstante  generic map (larguraDados => 32, constante => 4)
        port map( 
				entrada	=> saida_PC, 
				saida 	=> entrada_PC
			);
shifter_2_item : entity work.shifter_2 

		  port map (
					entrada =>saida_estendia,
					saida => entrada_jmp
		  
		  );
		  
			
shifter_2_item_J : entity work.shifter_2 generic map (larguraDados => 26)
		  port map (
					entrada 	=> saida_ROM(25 downto 0),
					saida 	=> saida_shift_j
		  
		  );
		  
somaJump :  entity work.somaNaoConstante  generic map (larguraDados => 32)
        port map( 
				entradaA	=> entrada_jmp,
				entradaB => entrada_PC, 
				saida 	=> bech_somador
			); 
		  
-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => 32)
          port map (
				entradaA 	=> saida_reg_a, 
				entradaB 	=> saida_mux_reg_imediado, 
				saida 		=> saida_ULA, 
				seletor 		=> pontos_controle(3 downto 2),
				saida_zero  => flag_zero
			);
 
-- Memória ROM
ROM1 : entity work.memoriaROM   generic map (dataWidth => 32, addrWidth => 32)
          port map (
			 clk => CLK,
				Endereco => saida_PC, 
				Dado 		=> saida_ROM
			);
			
ESTENSOR : entity work.estendeSinal
			 port map (
				entrada => saida_ROM(15 downto 0),
				saida   => saida_estendia
			 );
			 
RAM : entity work.RAMMIPS 
			 port map (
			   clk => CLK,
				Endereco => saida_ULA,
				Dado_in =>  saida_reg_b,
				Dado_out => saida_RAM,
				we => pontos_controle(0),
				re => pontos_controle(1),
				habilita => '1'
			 );
			 
MUX : entity work.muxGenerico2x1 generic map (
				larguraDados        => 32
			) port map (
				entradaA_MUX => entrada_PC,
				entradaB_MUX => bech_somador,
				seletor_MUX  => (flag_zero and pontos_controle(5)),
				saida_mux => saida_mux
			);

			
MUX_PROX_PC : entity work.muxGenerico2x1 generic map (
				larguraDados        => 32
			) port map (
				entradaA_MUX => saida_mux,
				entradaB_MUX => entrada_PC(31 downto 28) & saida_shift_j & "00",
				seletor_MUX  => pontos_controle(9),
				saida_mux => saida_ula_jump_beq
			);
			
MUX_ENDERECOS : entity work.muxGenerico2x1 generic map (
				larguraDados        => 5
			) port map (
				entradaA_MUX 	=> saida_ROM(20 downto 16),
				entradaB_MUX 	=> saida_ROM(15 downto 11),
				seletor_MUX 	=> pontos_controle(7),
				saida_mux 		=> saida_mux_enderecos
			);
			
MUX_IMEDIATO_RT : entity work.muxGenerico2x1 generic map (
				larguraDados        => 32
			) port map (
				entradaA_MUX => saida_reg_b,
				entradaB_MUX => saida_estendia,
				seletor_MUX  => pontos_controle(6),
				saida_mux => saida_mux_reg_imediado
			);
			
MUX_ESCRITA : entity work.muxGenerico2x1 generic map (
				larguraDados        => 32
			) port map (
				entradaA_MUX => saida_ULA,
				entradaB_MUX => saida_RAM,
				seletor_MUX  => pontos_controle(8),
				saida_mux => saida_mux_escrita
			);
			 

bancoRegistradores : entity work.bancoReg generic map (
				larguraDados        => 32,
				larguraEndBancoRegs => 5
			) port map (
				clk => CLK,
				enderecoA 		=> saida_ROM(25 downto 21),
				enderecoB 		=> saida_ROM(20 downto 16),
				enderecoC 		=> saida_mux_enderecos,
				dadoEscritaC 	=> saida_mux_escrita,
				escreveC 		=> pontos_controle(4),
				saidaA 			=> saida_reg_a,
				saidaB 			=> saida_reg_b
			);
			
decoder : entity work.decoderInstru 
			 port map (
				opcode => saida_ROM(31 downto 26),
				funct  => saida_ROM(5 downto 0),
				saida => pontos_controle
			 
			 );

			
end_REGS 				<= saida_ROM(25 downto 21);
end_REGT 				<= saida_ROM(20 downto 16);
end_REGD 				<= saida_ROM(15 downto 11);
conteudo_ULA 			<= saida_ULA;		
instrucao 				<= saida_ROM(31 downto 26);
end_PC 					<= saida_PC; 
end_pontos_controle 	<= pontos_controle;

end_saida_reg_b 		<= saida_reg_b;
end_saida_reg_a 		<= saida_reg_a;
saida_ram_simu 		<= saida_RAM;
sel_mux 					<= flag_zero and pontos_controle(5);

end architecture;