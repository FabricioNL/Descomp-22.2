library ieee;
use ieee.std_logic_1164.all;

entity Processador is
  port   (
	 -- entradas 
    CLK 					: in std_logic;
	 Data_IN 			: in std_logic_vector(7 downto 0);
	 Instruction_IN 	: in std_logic_vector(12 downto 0);
	 
	 -- saidas 
	 wr 					: out std_logic;
	 rd 					: out std_logic;
	 ROM_Address 		: out std_logic_vector(8 downto 0);
	 Data_OUT 			: out std_logic_vector(7 downto 0);
	 Data_Address 		: out  std_logic_vector(8 downto 0)
  );
end entity;


architecture arquitetura of Processador is

  signal MUX_REG1 : std_logic_vector (7 downto 0);
  signal MUX_REG2 : std_logic_vector (8 downto 0);
  signal REG1_ULA_A : std_logic_vector (7 downto 0);
  signal Saida_ULA : std_logic_vector (7 downto 0);
  signal Sinais_Controle : std_logic_vector (12 downto 0);
  signal Endereco : std_logic_vector (8 downto 0);
  signal proxPC : std_logic_vector (8 downto 0);
  signal SelMUX : std_logic;
  signal SelMuxPC : std_logic_vector (1 downto 0);
  signal Habilita_A : std_logic;
  signal Operacao_ULA : std_logic_vector(1 downto 0);
  signal Saida_Decoder : std_logic_vector(11 downto 0);
  signal saida_regE    : std_logic;
  signal saida_regRetorno    : std_logic_vector(8 downto 0);
  signal saida_ULA_E    : std_logic;


begin

-- Instanciando os componentes:



-- O port map completo do MUX.
MUX2 :  entity work.muxGenerico4x1  generic map (larguraDados => 9)
        port map( entradaA_MUX => proxPC,
                 entradaB_MUX => Sinais_Controle(8 downto 0),
					  entradaC_MUX => saida_regRetorno,
					  entradaD_MUX => "000000000",
                 seletor_MUX => SelMuxPC,
                 saida_MUX => MUX_REG2);
					  
-- O port map completo do MUX.
MUX1 :  entity work.muxGenerico2x1  generic map (larguraDados => 8)
        port map( entradaA_MUX => Data_IN,
                 entradaB_MUX =>  Sinais_Controle(7 downto 0),
                 seletor_MUX => SelMUX,
                 saida_MUX => MUX_REG1);

-- o port map completo do decoder
DECODER : entity work.decoderInstru 
			 port map (opcode => Sinais_Controle(12 downto 9), saida => Saida_Decoder);

-- o port map completo da logica de desvio			 
LOGICADESVIO : entity work.LogicaDeDesvio
			 port map ( JMP => Saida_Decoder(6), 
							JEQ => Saida_Decoder(7), 
							FlagEQ => saida_regE, 
							JSR => Saida_Decoder(10), 
							RET => Saida_Decoder(9), 
							SelMux => SelMuxPC);

-- O port map completo do Acumulador.
REGA : entity work.registradorGenerico   generic map (larguraDados => 8)
          port map (DIN => Saida_ULA, DOUT => REG1_ULA_A, ENABLE => Habilita_A, CLK => CLK, RST => '0');
			 
-- .
END_RETORNO : entity work.registradorGenerico   generic map (larguraDados => 9)
          port map (DIN => proxPC, DOUT => saida_regRetorno, ENABLE => Saida_Decoder(11), CLK => CLK, RST => '0');
			 
-- O port map completo do Registrador Equal.
REGE : entity work.FlipFlopUnitario
          port map (DIN => saida_ULA_E, DOUT => saida_regE, ENABLE => Saida_Decoder(8), CLK => CLK, RST => '0');

-- O port map completo do Program Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => 9)
          port map (DIN => MUX_REG2, DOUT => Endereco, ENABLE => '1', CLK => CLK, RST => '0');

			 
incrementaPC :  entity work.somaConstante  generic map (larguraDados => 9, constante => 1)
        port map( entrada => Endereco, saida => proxPC);


-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => 8)
          port map (entradaA => REG1_ULA_A, entradaB => MUX_REG1, saida => Saida_ULA, flagEqual => saida_ULA_E, seletor => Operacao_ULA);


selMUX <= Saida_Decoder(5);
Habilita_A <= Saida_Decoder(4);
Operacao_ULA <= Saida_Decoder(3 downto 2);

wr <= Saida_Decoder(0);
rd <= Saida_Decoder(1);

Data_OUT <= REG1_ULA_A;
ROM_Address <= Endereco;
Data_Address <= instruction_IN(8 downto 0);


end architecture;