library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( opcode : in std_logic_vector(3 downto 0);
				saida : out std_logic_vector(5 downto 0)
  );
end entity;

architecture comportamento of decoderInstru is

  constant NOP  : std_logic_vector(3 downto 0) := "0000";
  constant LDA  : std_logic_vector(3 downto 0) := "0001";
  constant SOMA : std_logic_vector(3 downto 0) := "0010";
  constant SUB  : std_logic_vector(3 downto 0) := "0011";
  constant LDI  : std_logic_vector(3 downto 0) := "0100";
  constant STA  : std_logic_vector(3 downto 0) := "0101";
  
  alias HabEscritaMEM : std_logic is saida(0);
  alias HabLeituraMEM : std_logic is saida(1);
  alias Operacao : std_logic_vector is saida(3 downto 2);
  alias Habilita : std_logic is saida(4);
  alias SelMux : std_logic is saida(5);
  
  
  

  begin


HabEscritaMEM <= '1' when (opcode = STA) else '0';
HabLeituraMEM <= '1' when (opcode = LDA) or (opcode = SOMA) or (opcode = SUB) else '0';
Operacao <= "00" when (opcode = SUB) else "01" when (opcode = SOMA) else "11";
Habilita <= '0' when (opcode = NOP) or (opcode = STA) else '1';
SelMux <= '1' when (opcode = LDI)  else '0';



end architecture;