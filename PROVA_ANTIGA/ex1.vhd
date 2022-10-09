library ieee ;
use ieee.std_logic_1164.all ;

entity top_level is 
    port  (
        CLK         : in std_logic;
        Entrada     : in std_logic_vector(31 downto 0);
        Habilita    : in std_logic;
        Selec       : in std_logic;
        Op          : in std_logic;
        Saida       : out std_logic_vector(31 downto 0)
    );
end entity;

architecture arquitetura of top_level is 

    signal SaidaRegistrador1    : std_logic_vector(31 downto 0);
    signal SaidaRegistrador2    : std_logic_vector(31 downto 0);
    signal SaidaMux             : std_logic_vector(31 downto 0);
    signal SaidaULA             : std_logic_vector(31 downto 0);

begin

REG1 : entity work.registrador_generico
    port map (
        DIN     =>  Entrada,
        DOUT    =>  SaidaRegistrador1,
        ENABLE  =>  Habilita,
        CLK     =>  CLK,
        RST     =>  '0'
);

REG2 : entity work.registrador_generico
    port map (
        DIN     =>  SaidaULA,
        DOUT    =>  SaidaRegistrador2,
        ENABLE  =>  Habilita,
        CLK     =>  CLK,
        RST     =>  '0'
);

MUX : entity work.mux_2x1
    port map (
        EntradaA    =>  SaidaRegistrador1,
        EntradaB    =>  SaidaRegistrador2,
        SeMux       =>  Selec,
        Saida       =>  SaidaMux
    
);

ULA : entity work.ULA 
    port map (
        EntradaA    =>  SaidaRegistrador1,
        EntradaB    =>  SaidaMux,
        Operacao    =>  Op,
        Saida       =>  SaidaULA
);


Saida <= SaidaRegistrador2;

end architecture;