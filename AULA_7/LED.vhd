library ieee;
use ieee.std_logic_1164.all;

entity LED is
	port(
		
		-- entrada 
		CLK					: in std_logic;
		LEDS_Address		: in std_logic_vector(2 downto 0);
		Decoder_OUT 		: in std_logic;
		Escrita 				: in std_logic;
		DATA_OUT				: in std_logic_vector(7 downto 0);
		
		-- saida
		LEDR_Address 		: out std_logic_vector(7 downto 0);
		LED1_Address		: out std_logic;
		LED2_Address		: out std_logic
	);
	
end entity;

architecture arquitetura of LED is

	-- sinais 
	signal habilita_LED1 : std_logic;
	signal habilita_LED2 : std_logic;
	signal habilita_LEDR : std_logic;
	
begin

habilita_LEDR <= (decoder_OUT and Escrita and LEDS_Address(0));
habilita_LED1 <= (decoder_OUT and Escrita and LEDS_Address(1));
habilita_LED2 <= (decoder_OUT and Escrita and LEDS_Address(2));

-- Registrador referente ao LED 1.
LED1 : entity work.FlipFlopUnitario
          port map (DIN => DATA_OUT(0), DOUT => LED1_Address, ENABLE => habilita_LED1, CLK => CLK, RST => '0');
			 
-- Registrador referente ao LED 2.
LED2 : entity work.FlipFlopUnitario
          port map (DIN => DATA_OUT(0), DOUT => LED2_Address, ENABLE => habilita_LED2, CLK => CLK, RST => '0');
			 

-- Registrador referente ao Vetor de LEDS.
LEDR : entity work.registradorGenerico   generic map (larguraDados => 8)
          port map (DIN => DATA_OUT, DOUT => LEDR_Address, ENABLE => habilita_LEDR, CLK => CLK, RST => '0');
	
		


end architecture;