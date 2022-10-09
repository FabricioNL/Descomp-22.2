library ieee;
use ieee.std_logic_1164.all;

entity sete_segmentos is
	port(
	
		-- entrada
		CLK				: in std_logic;
		DATA_OUT			: in std_logic_vector(3 downto 0);
		MEM_LINHA_5		: in std_logic;
		Escrita 			: in std_logic;
		decoder_indice	: in std_logic_vector (7 downto 0);
		decoder_OUT 	: in std_logic;
		
		-- saida
		HEX0			: out std_logic_vector	(6 downto 0);
	   HEX1			: out std_logic_vector	(6 downto 0);
	   HEX2			: out std_logic_vector	(6 downto 0);
	   HEX3			: out std_logic_vector	(6 downto 0);
	   HEX4			: out std_logic_vector	(6 downto 0);
	   HEX5			: out std_logic_vector	(6 downto 0)
	
);

end entity;
	
architecture arquitetura of sete_segmentos is

	signal saida_reg_zero 	: std_logic_vector(3 downto 0);
	signal saida_reg_um 		: std_logic_vector(3 downto 0);
	signal saida_reg_dois 	: std_logic_vector(3 downto 0);
	signal saida_reg_tres 	: std_logic_vector(3 downto 0);
	signal saida_reg_quatro : std_logic_vector(3 downto 0);
	signal saida_reg_cinco 	: std_logic_vector(3 downto 0);

begin

	REGISTRADOR_0 : entity work.registradorGenerico generic map (larguraDados => 4)
			 port map (
						DIN => DATA_OUT,
						DOUT => saida_reg_zero,
						ENABLE => (MEM_LINHA_5 and decoder_OUT and Escrita and decoder_indice(0)),
						CLK => CLK,
						RST => '0');

	HEXADECIMAL_0 :  entity work.conversorHex7Seg
        port map(
					  dadoHex => saida_reg_zero,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX0);
					  
	REGISTRADOR_1 : entity work.registradorGenerico generic map (larguraDados => 4)
			 port map (
						DIN => DATA_OUT,
						DOUT => saida_reg_um,
						ENABLE => (MEM_LINHA_5 and decoder_OUT and Escrita and decoder_indice(1)),
						CLK => CLK,
						RST => '0');

	HEXADECIMAL_1 :  entity work.conversorHex7Seg
        port map(
					  dadoHex => saida_reg_um,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX1);
	
	REGISTRADOR_2 : entity work.registradorGenerico generic map (larguraDados => 4)
			 port map (
						DIN => DATA_OUT,
						DOUT => saida_reg_dois,
						ENABLE => (MEM_LINHA_5 and decoder_OUT and Escrita and decoder_indice(2)),
						CLK => CLK,
						RST => '0');

	HEXADECIMAL_2 :  entity work.conversorHex7Seg
        port map(
					  dadoHex => saida_reg_dois,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX2);
					  
	REGISTRADOR_3 : entity work.registradorGenerico generic map (larguraDados => 4)
			 port map (
						DIN => DATA_OUT,
						DOUT => saida_reg_tres,
						ENABLE => (MEM_LINHA_5 and decoder_OUT and Escrita and decoder_indice(3)),
						CLK => CLK,
						RST => '0');

	HEXADECIMAL_3 :  entity work.conversorHex7Seg
        port map(
					  dadoHex => saida_reg_tres,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX3);
					  
	REGISTRADOR_4 : entity work.registradorGenerico generic map (larguraDados => 4)
			 port map (
						DIN => DATA_OUT,
						DOUT => saida_reg_quatro,
						ENABLE => (MEM_LINHA_5 and decoder_OUT and Escrita and decoder_indice(4)),
						CLK => CLK,
						RST => '0');

	HEXADECIMAL_4 :  entity work.conversorHex7Seg
        port map(
					  dadoHex => saida_reg_quatro,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX4);
					  
	REGISTRADOR_5 : entity work.registradorGenerico generic map (larguraDados => 4)
			 port map (
						DIN => DATA_OUT,
						DOUT => saida_reg_cinco,
						ENABLE => (MEM_LINHA_5 and decoder_OUT and Escrita and decoder_indice(5)),
						CLK => CLK,
						RST => '0');

	HEXADECIMAL_5 :  entity work.conversorHex7Seg
        port map(
					  dadoHex => saida_reg_cinco,
                 apaga =>  '0',
                 negativo => '0',
                 overFlow =>  '0',
                 saida7seg => HEX5);
					  

end architecture;