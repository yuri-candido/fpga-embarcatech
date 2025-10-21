library IEEE;
use IEEE.std_logic_1164.all;

entity tb_comparador3 is
end tb_comparador3;

architecture test of tb_comparador3 is
    signal A_tb, B_tb : std_logic_vector(2 downto 0);
    signal EQ_tb      : std_logic;

    component comparador3
        port (A, B : in std_logic_vector(2 downto 0); EQ : out std_logic);
    end component;
begin
    uut: comparador3 port map (A => A_tb, B => B_tb, EQ => EQ_tb);

    stim_proc: process
    begin
        A_tb <= "000"; B_tb <= "000"; wait for 20 ns;
        A_tb <= "001"; B_tb <= "001"; wait for 20 ns;
        A_tb <= "101"; B_tb <= "100"; wait for 20 ns;
        A_tb <= "111"; B_tb <= "111"; wait for 20 ns;

        report "Simulação finalizada com sucesso." severity note;
        wait;
    end process;
end test;
