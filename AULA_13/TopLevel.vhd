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
	 OP 				: in std_logic_vector(1 downto 0);
	 WR_enable  	: in std_logic;
	 
	 -- saidas 
	 
	 instrucao  	: out std_logic_vector(5 downto 0);
	 conteudo_ULA  : out std_logic_vector(31 downto 0);
	 
	 end_REGS 		: out std_logic_vector(4 downto 0);
	 end_REGT 		: out std_logic_vector(4 downto 0);
	 end_REGD 		: out std_logic_vector(4 downto 0)
  );
end entity;


architecture arquitetura of TopLevel is

  signal CLK 					: std_logic;
  signal saida_ULA			: std_logic_vector(31 downto 0);
  
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
				DIN => entrada_PC, 
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
		  
-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => 32)
          port map (
				entradaA 	=> saida_reg_a, 
				entradaB 	=> saida_reg_b, 
				saida 		=> saida_ULA, 
				seletor 		=> OP
			);
 
-- Memória ROM
ROM1 : entity work.memoriaROM   generic map (dataWidth => 32, addrWidth => 32)
          port map (
			 clk => CLK,
				Endereco => saida_PC, 
				Dado 		=> saida_ROM
			);

bancoRegistradores : entity work.bancoReg generic map (
				larguraDados        => 32,
				larguraEndBancoRegs => 5
			) port map (
				clk => CLK,
				enderecoA 		=> saida_ROM(25 downto 21),
				enderecoB 		=> saida_ROM(20 downto 16),
				enderecoC 		=> saida_ROM(15 downto 11),
				dadoEscritaC 	=> saida_ULA,
				escreveC 		=> WR_enable,
				saidaA 			=> saida_reg_a,
				saidaB 			=> saida_reg_b
			);

			
end_REGS 		<= saida_ROM(25 downto 21);
end_REGT 		<= saida_ROM(20 downto 16);
end_REGD 		<= saida_ROM(15 downto 11);
conteudo_ULA 	<= saida_ULA;		
instrucao 		<= saida_ROM(31 downto 26);
	
end architecture;