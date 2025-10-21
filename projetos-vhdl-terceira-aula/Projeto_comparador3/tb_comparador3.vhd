-- Testbench para o comparador de 3 bits estrutural
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_comparador3 is
end tb_comparador3;

architecture behavior of tb_comparador3 is
    signal A_tb, B_tb: std_logic_vector(2 downto 0);
    signal EQ_tb: std_logic;

    component comparador3
        port (A, B: in std_logic_vector(2 downto 0); EQ: out std_logic);
    end component;
begin
    DUT: comparador3 port map (A_tb, B_tb, EQ_tb);

    stimulus: process
    begin
        A_tb <= "000"; B_tb <= "000"; wait for 10 ns;
        A_tb <= "001"; B_tb <= "001"; wait for 10 ns;
        A_tb <= "101"; B_tb <= "100"; wait for 10 ns;
        A_tb <= "111"; B_tb <= "111"; wait;
    end process;
end behavior;
