-- Testbench para registrador de 8 bits com enable
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_registrador8b_enable is
end tb_registrador8b_enable;

architecture test of tb_registrador8b_enable is
    signal clk_tb, rst_tb, load_tb : std_logic := '0';
    signal din_tb, dout_tb : std_logic_vector(7 downto 0);

    component registrador8b_enable
        port (
            clk   : in std_logic;
            rst   : in std_logic;
            load  : in std_logic;
            din   : in std_logic_vector(7 downto 0);
            dout  : out std_logic_vector(7 downto 0)
        );
    end component;
begin
    uut: registrador8b_enable port map (
        clk => clk_tb, rst => rst_tb,
        load => load_tb, din => din_tb, dout => dout_tb
    );

    -- Geração do clock: 10 ns de período
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
    end process;

    stim_proc: process
    begin
        rst_tb <= '1'; din_tb <= "00000000"; wait for 15 ns;
        rst_tb <= '0';

        din_tb <= "10101010"; load_tb <= '1'; wait for 10 ns;
        load_tb <= '0'; din_tb <= "11110000"; wait for 20 ns;

        load_tb <= '1'; wait for 10 ns;
        din_tb <= "00001111"; wait for 10 ns;
        load_tb <= '0'; wait;

        wait;
    end process;
end test;
