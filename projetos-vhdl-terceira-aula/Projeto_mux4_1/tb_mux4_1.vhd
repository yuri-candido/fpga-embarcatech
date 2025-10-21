-- Testbench para o MUX 4:1 com seletor de 2 bits
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mux4_1 is
end tb_mux4_1;

architecture behavior of tb_mux4_1 is
    signal sel_tb : std_logic_vector(1 downto 0);
    signal a_tb, b_tb, c_tb, d_tb, y_tb : std_logic;

    component mux4_1
        port (
            sel : in std_logic_vector(1 downto 0);
            a, b, c, d : in std_logic;
            y : out std_logic
        );
    end component;
begin
    uut: mux4_1 port map (
        sel => sel_tb, a => a_tb, b => b_tb,
        c => c_tb, d => d_tb, y => y_tb
    );

    stimulus: process
    begin
        -- Configura entradas
        a_tb <= '0'; b_tb <= '1'; c_tb <= '0'; d_tb <= '1';

        sel_tb <= "00"; wait for 10 ns;
        sel_tb <= "01"; wait for 10 ns;
        sel_tb <= "10"; wait for 10 ns;
        sel_tb <= "11"; wait for 10 ns;

        -- Teste de default
        sel_tb <= "ZZ"; wait for 10 ns;

        wait;
    end process;
end behavior;
