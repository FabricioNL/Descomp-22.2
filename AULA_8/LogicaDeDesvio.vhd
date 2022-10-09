library ieee;
use ieee.std_logic_1164.all;

entity LogicaDeDesvio 
	is port (	
		JMP: in std_logic;
		JEQ : in std_logic;
		FlagEQ : in std_logic;
		JSR : in std_logic;
		RET : in std_logic;
		SelMux: out std_logic_vector(1 downto 0)	
	);
end entity;	


architecture comportamento of LogicaDeDesvio is

alias sel_mux_bit_zero : std_logic is SelMux(0);
alias sel_mux_bit_um : std_logic is SelMux(1);

begin
	
	sel_mux_bit_um <= '1' when (RET = '1') else '0';
	
	--sel_mux_bit_zero <= '1' when (JMP = '1') or (JEQ = '1' and FlagEQ = '1') or (JSR = '1') else '0'; nao funciona!!
	
	sel_mux_bit_zero <= (JMP) or (JEQ and FlagEQ) or (JSR);
end architecture;