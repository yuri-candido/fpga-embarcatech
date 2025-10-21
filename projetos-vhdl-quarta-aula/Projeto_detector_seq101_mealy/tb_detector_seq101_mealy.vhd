-- Testbench para FSM Mealy que detecta a sequência 101
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_detector_seq101_mealy is
end tb_detector_seq101_mealy;

architecture test of tb_detector_seq101_mealy is
    signal clk_tb, rst_tb, x_tb, z_tb : std_logic;

    component detector_seq101_mealy
        port (
            clk : in std_logic;
            rst : in std_logic;
            x   : in std_logic;
            z   : out std_logic
        );
    end component;
begin
    uut: detector_seq101_mealy port map (
        clk => clk_tb, rst => rst_tb,
        x => x_tb, z => z_tb
    );

    -- Geração de clock
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Estímulo com sobreposição: "101101"
    stim_proc: process
    begin
        rst_tb <= '1'; x_tb <= '0'; wait for 12 ns;
        rst_tb <= '0';

        x_tb <= '1'; wait for 10 ns;  -- S0 → S1
        x_tb <= '0'; wait for 10 ns;  -- S1 → S2
        x_tb <= '1'; wait for 10 ns;  -- S2 → S1 + saída '1'
        x_tb <= '1'; wait for 10 ns;  -- S1
        x_tb <= '0'; wait for 10 ns;  -- S2
        x_tb <= '1'; wait for 10 ns;  -- S1 + saída '1'
        x_tb <= '0'; wait for 10 ns;
        wait;
    end process;
end test;
