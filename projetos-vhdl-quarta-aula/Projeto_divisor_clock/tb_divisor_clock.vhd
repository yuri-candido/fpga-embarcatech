-- Testbench do divisor de clock
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_divisor_clock is
end tb_divisor_clock;

architecture test of tb_divisor_clock is
    signal clk_tb, rst_tb, clk_out_tb : std_logic;

    component divisor_clock
        generic (N : integer := 4);
        port (
            clk     : in std_logic;
            rst     : in std_logic;
            clk_out : out std_logic
        );
    end component;
begin
    uut: divisor_clock
        generic map (N => 6) -- Divide por 6 (alternância a cada 3 ciclos)
        port map (
            clk => clk_tb,
            rst => rst_tb,
            clk_out => clk_out_tb
        );

    -- Clock de 10 ns
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        rst_tb <= '1'; wait for 15 ns;
        rst_tb <= '0';

        wait for 200 ns;
        wait;
    end process;
end test;
