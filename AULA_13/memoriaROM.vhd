library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaROM is
   generic (
          dataWidth: natural := 9;
          addrWidth: natural := 32;
			 memoryAddrWidth:  natural := 6
    );
   port (
          Endereco : in std_logic_vector (addrWidth-1 DOWNTO 0);
          Dado : out std_logic_vector (dataWidth-1 DOWNTO 0)
    );
end entity;

architecture assincrona of memoriaROM is

  type blocoMemoria IS ARRAY(0 TO 2**memoryAddrWidth - 1) OF std_logic_vector(dataWidth-1 downto 0);
  
  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
  begin
      -- Palavra de Controle = SelMUX, Habilita_A, Reset_A, Operacao_ULA
      -- Inicializa os endereços:
		  		  
		  tmp(0)  := "00000000000000000000000000000000" ;
		  tmp(1)  := "00000000000000000000000000000000" ;
		  tmp(2)  := "00000000000000000000000000000000" ;
		  tmp(3)  := "00000000000000000000000000000000" ;
		  tmp(4)  := "00000000000000000000000000000000" ;
		  tmp(5)  := "00000000000000000000000000000000" ;
		  tmp(6)  := "00000000000000000000000000000000" ;
		
		    
		  return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;