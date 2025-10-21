-- Testbench do registrador de deslocamento SISO
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_shift_register_siso is
end tb_shift_register_siso;

architecture test of tb_shift_register_siso is
    signal clk_tb, rst_tb, din_tb, dout_tb : std_logic;

    component shift_register_siso
        port (
            clk  : in std_logic;
            rst  : in std_logic;
            din  : in std_logic;
            dout : out std_logic
        );
    end component;
begin
    uut: shift_register_siso port map (
        clk => clk_tb, rst => rst_tb,
        din => din_tb, dout => dout_tb
    );

    -- Geração do clock de 20 ns
    clk_process: process
    begin
        while true loop
            clk_tb <= '0'; wait for 10 ns;
            clk_tb <= '1'; wait for 10 ns;
        end loop;
    end process;

    -- Estímulo
    stim_proc: process
    begin
        rst_tb <= '1'; din_tb <= '0'; wait for 25 ns;
        rst_tb <= '0';

        din_tb <= '1'; wait for 20 ns;  -- desloca '1'
        din_tb <= '0'; wait for 20 ns;  -- desloca '0'
        din_tb <= '1'; wait for 20 ns;  -- desloca '1'
        din_tb <= '1'; wait for 20 ns;  -- desloca '1'
        din_tb <= '0'; wait for 20 ns;  -- desloca '0'
        din_tb <= '0'; wait for 20 ns;
        din_tb <= '1'; wait for 20 ns;
        din_tb <= '1'; wait for 20 ns;

        wait;
    end process;
end test;
