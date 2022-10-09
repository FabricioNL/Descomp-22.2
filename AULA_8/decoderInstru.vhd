library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( opcode : in std_logic_vector(3 downto 0);
				saida : out std_logic_vector(11 downto 0)
  );
end entity;

architecture comportamento of decoderInstru is

  constant NOP  : std_logic_vector(3 downto 0) := "0000";
  constant LDA  : std_logic_vector(3 downto 0) := "0001";
  constant SOMA : std_logic_vector(3 downto 0) := "0010";
  constant SUB  : std_logic_vector(3 downto 0) := "0011";
  constant LDI  : std_logic_vector(3 downto 0) := "0100";
  constant STA  : std_logic_vector(3 downto 0) := "0101";
  constant JMP  : std_logic_vector(3 downto 0) := "0110";
  constant JEQ  : std_logic_vector(3 downto 0) := "0111";
  constant CEQ  : std_logic_vector(3 downto 0) := "1000";
  constant RET  : std_logic_vector(3 downto 0) := "1001";
  constant JSR  : std_logic_vector(3 downto 0) := "1010";
  
  alias HabEscritaMEM : std_logic is saida(0);
  alias HabLeituraMEM : std_logic is saida(1);
  alias Operacao : std_logic_vector is saida(3 downto 2);
  alias Habilita : std_logic is saida(4);
  alias SelMux : std_logic is saida(5);
  alias Jump : std_logic is saida(6);
  alias JumpEq : std_logic is saida(7);
  alias HabilitaFlagIgual : std_logic is saida(8);
  alias ReturnJump : std_logic is saida(9);
  alias JumpSubRotina : std_logic is saida(10);
  alias HabEscritaRetorno : std_logic is saida(11);

  begin


HabEscritaMEM <= '1' when (opcode = STA) else '0';
HabLeituraMEM <= '1' when (opcode = LDA) or (opcode = SOMA) or (opcode = SUB) else '0';
Operacao <= "00" when (opcode = SUB) else "01" when (opcode = SOMA) else "11";
Habilita <= '0' when (opcode = NOP) or (opcode = STA) else '1';
SelMux <= '1' when (opcode = LDI)  else '0';
Jump <= '1' when (opcode = JMP) else '0';
JumpEq <= '1' when (opcode = JEQ) else '0';
HabilitaFlagIgual <= '1' when (opcode = CEQ) else '0';
ReturnJump <= '1' when (opcode = RET) else '0';
JumpSubRotina <= '1' when (opcode = JSR) else '0';
HabEscritaRetorno <= '1' when (opcode = JSR) else '0';




end architecture;