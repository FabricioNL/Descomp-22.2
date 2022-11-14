library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( 	opcode : in std_logic_vector(5 downto 0);
				funct  : in std_logic_vector(5 downto 0);
				saida : out std_logic_vector(9 downto 0)
  );
end entity;

architecture comportamento of decoderInstru is

  constant LW  	: std_logic_vector(5 downto 0) := "100011";
  constant SW  	: std_logic_vector(5 downto 0) := "101011";
  constant BEQ 	: std_logic_vector(5 downto 0) := "000100";
  constant SUBI 	: std_logic_vector(5 downto 0) := "001100";
  constant ADDI   : std_logic_vector(5 downto 0) := "001000";
  constant SOMA   : std_logic_vector(5 downto 0) := "100000";
  constant SUB    : std_logic_vector(5 downto 0) := "100010";
  constant JUMP 	: std_logic_vector(5 downto 0) := "000010";
  
  alias HabEscritaMEM 			: std_logic is saida(0);
  alias HabLeituraMEM 			: std_logic is saida(1);
  alias Operacao 					: std_logic_vector is saida(3 downto 2);
  alias HabilitaReg3				: std_logic is saida(4);
  alias Beq_s           		: std_logic is saida(5);
  alias MUX_estendido_ou_reg	: std_logic is saida(6);
  alias MUX_enderecos 			: std_logic is saida(7);
  alias MUX_escrita 				: std_logic is saida(8);
  alias MUX_j						: std_logic is saida(9);
  
 

  begin


HabEscritaMEM 	<= '1' when (opcode = SW) else '0';
HabLeituraMEM 	<= '1' when (opcode = LW) else '0';
Operacao 		<= "00" when (opcode = SUBI or funct = SUB) else "01" when (opcode = ADDI or funct = SOMA) else "11";
HabilitaReg3 	<= '1' when (opcode = LW or funct = SOMA or funct = SUB) else '0';
Beq_s 			<= '1' when (opcode = BEQ) else '0'; 

MUX_estendido_ou_reg <= '0' when (opcode = BEQ) else '1';

MUX_enderecos <= '0' when (opcode = BEQ or opcode = LW or opcode = SW or opcode = SUBI or opcode = ADDI)
							else '1';

MUX_escrita <= '1' when (opcode = BEQ or opcode = LW or opcode = SW or opcode = SUBI or opcode = ADDI)
							else '0';
							
MUX_j <= '1' when (opcode = JUMP) else '0';
end architecture;