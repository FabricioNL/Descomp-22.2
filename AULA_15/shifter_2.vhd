library ieee;
use ieee.std_logic_1164.all;

entity shifter_2 is 
	generic (
         larguraDados: natural := 32
    );
	port (
		entrada  : in std_logic_vector(larguraDados-1 downto 0);
		saida 	: out std_logic_vector(larguraDados-1 downto 0)
	);
end entity;

architecture comportamento of shifter_2 is 
	begin 
		saida <= entrada(larguraDados-3 downto 0) & "00";
end architecture;