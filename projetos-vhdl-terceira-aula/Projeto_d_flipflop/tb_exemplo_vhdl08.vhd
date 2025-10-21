-- Testbench que requer VHDL-2008 (usa std.env.stop)
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.all;  -- ❗ Requer VHDL-2008

entity tb_exemplo_vhdl08 is
end tb_exemplo_vhdl08;

architecture test of tb_exemplo_vhdl08 is
    signal clk_tb : std_logic := '0';
    signal d_tb   : std_logic := '0';
begin
    -- Clock
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Estímulos usando recursos do VHDL-2008
    stim_proc: process
    begin
        report "Início da simulação com std.env.stop" severity note;
        wait for 30 ns;
        d_tb <= '1'; wait for 10 ns;
        d_tb <= '0'; wait for 10 ns;
        report "Finalizando com std.env.stop" severity note;
        std.env.stop;  -- ❗ só funciona com --std=08
    end process;
end test;
