library ieee;
use ieee.std_logic_1164.all;

entity LogicaDeDesvio 
	is port (	
		JMP: in std_logic;
		JEQ : in std_logic;
		FlagEQ : in std_logic;
		SelMux: out std_logic	
	);
end entity;	


architecture comportamento of LogicaDeDesvio is
	
begin
	
   SelMux <= '1' when (JMP = '1' or (JEQ = '1' and FlagEQ = '1')) else
					'0';
end architecture;