-- Testbench do temporizador programável
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_timer_programavel is
end tb_timer_programavel;

architecture test of tb_timer_programavel is
    signal clk_tb, rst_tb, start_tb, done_tb : std_logic := '0';
    signal preset_tb : unsigned(7 downto 0) := (others => '0');

    component timer_programavel
        port (
            clk    : in std_logic;
            rst    : in std_logic;
            start  : in std_logic;
            preset : in unsigned(7 downto 0);
            done   : out std_logic
        );
    end component;
begin
    uut: timer_programavel port map (
        clk => clk_tb,
        rst => rst_tb,
        start => start_tb,
        preset => preset_tb,
        done => done_tb
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

        preset_tb <= to_unsigned(5, 8);  -- 5 ciclos de clock

        start_tb <= '1'; wait for 10 ns;
        start_tb <= '0';

        wait for 100 ns; -- observar saída done

        start_tb <= '1'; wait for 10 ns;
        start_tb <= '0';

        wait;
    end process;
end test;
