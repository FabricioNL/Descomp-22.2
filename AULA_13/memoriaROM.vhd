library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaROM IS
   generic (
          dataWidth: natural := 32;
          addrWidth: natural := 32;
			 memoryAddrWidth:  natural := 6 );   -- 64 posicoes de 32 bits cada
   port (
		    clk : in std_logic;
          Endereco : in  std_logic_vector (addrWidth-1 downto 0);
          Dado     : out std_logic_vector (dataWidth-1 downto 0) );
end entity;

architecture assincrona OF memoriaROM IS
  type blocoMemoria IS ARRAY(0 TO 2**memoryAddrWidth - 1) OF std_logic_vector(dataWidth-1 downto 0);

  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
		  
  begin
		  
					   -- 6 bit    5 bit      5 bit    5 bit     5 bit      6 bit
						-- opcode     Rs         Rt       Rd      shamt      funct
        tmp(0) := "000000" & "01001" & "01010" & "01000" & "00000" & "100000"; -- Add t0 - 8, t1 - 9(0A), t2 - 10 (0B) = 21 [10+11]
        tmp(1) := "000000" & "01000" & "01010" & "01000" & "00000" & "100111"; -- Sub t0, t0 (21), t2 - 10 (0B) = 10 [21 - 11]

        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;
-- Utiliza uma quantidade menor de endereços locais:
   signal EnderecoLocal : std_logic_vector(memoryAddrWidth-1 downto 0);

begin
  EnderecoLocal <= Endereco(memoryAddrWidth+1 downto 2);
  Dado <= memROM (to_integer(unsigned(EnderecoLocal)));
end architecture;