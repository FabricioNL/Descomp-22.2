library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULASomaSub is
    generic ( larguraDados : natural := 32 );
    port (
      entradaA, entradaB:  in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
      seletor:  in STD_LOGIC_VECTOR(1 downto 0);
      saida:    out STD_LOGIC_VECTOR((larguraDados-1) downto 0)
    );
end entity;

architecture comportamento of ULASomaSub is
   signal soma :      STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal subtracao : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal passa :      STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	
	constant SUB  : std_logic_vector(1 downto 0) := "00";
	constant PASS  : std_logic_vector(1 downto 0) := "11";
	constant SUM : std_logic_vector(1 downto 0) := "01";
		
    begin	
  
      soma      <= STD_LOGIC_VECTOR(unsigned(entradaA) + unsigned(entradaB));
      subtracao <= STD_LOGIC_VECTOR(unsigned(entradaA) - unsigned(entradaB));
		passa      <= STD_LOGIC_VECTOR(unsigned(entradaB));
		
		
      saida <= soma when (seletor = SUM) else 
					subtracao when (seletor = SUB) else
					passa;
		
		
end architecture;