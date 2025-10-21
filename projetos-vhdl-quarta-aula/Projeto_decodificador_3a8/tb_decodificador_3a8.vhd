-- Testbench para decodificador 3:8
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_decodificador_3a8 is
end tb_decodificador_3a8;

architecture test of tb_decodificador_3a8 is
    signal sel_tb : std_logic_vector(2 downto 0);
    signal en_tb  : std_logic;
    signal saida_tb : std_logic_vector(7 downto 0);

    component decodificador_3a8
        port (
            sel   : in std_logic_vector(2 downto 0);
            en    : in std_logic;
            saida : out std_logic_vector(7 downto 0)
        );
    end component;
begin
    uut: decodificador_3a8 port map (
        sel => sel_tb,
        en => en_tb,
        saida => saida_tb
    );

    stim_proc: process
    begin
        en_tb <= '0'; sel_tb <= "000"; wait for 10 ns; -- desabilitado

        en_tb <= '1';
        sel_tb <= "000"; wait for 10 ns;
        sel_tb <= "001"; wait for 10 ns;
        sel_tb <= "010"; wait for 10 ns;
        sel_tb <= "011"; wait for 10 ns;
        sel_tb <= "100"; wait for 10 ns;
        sel_tb <= "101"; wait for 10 ns;
        sel_tb <= "110"; wait for 10 ns;
        sel_tb <= "111"; wait for 10 ns;

        en_tb <= '0'; wait for 10 ns; -- desabilita novamente

        wait;
    end process;
end test;
