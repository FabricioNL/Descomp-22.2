library ieee ;
use ieee.std_logic_1164.all ;

entity top_level is
    port (
        CLK         : in std_logic;
        entrada     : in std_logic_vector(31 downto 0);
        habilita    : in std_logic;
        op          : in std_logic;
        saida       : out std_logic_vector(31 downto 0)
);
end entity;


architecture arquitetura of top_level  is

    signal 
    
        saida_reg_um        : std_logic_vector(31 downto 0);
        saida_reg_dois      : std_logic_vector(31 downto 0);
        saida_mux           : std_logic_vector(31 downto 0);
        
begin

REG1 : entity work.registrador_generico
    port map (
        DIN     => entrada,
        DOUT    => saida_reg_um,
        HAB     => habilita,
        CLK     => CLK,
        RST     => '0'
    );

REG1 : entity work.registrador_generico
    port map (
        DIN     => saida_mux,
        DOUT    => saida_reg_dois,
        HAB     => habilita,
        CLK     => CLK,
        RST     => '0'
    );

ULA : entity work.ULA   
    port map (
        entrada_a   => saida_reg_dois,
        entrada_b   => saida_reg_um, 
        selmux      => op,
        saida       => saida_mux
    );

saida <= saida_reg_dois;

end architecture