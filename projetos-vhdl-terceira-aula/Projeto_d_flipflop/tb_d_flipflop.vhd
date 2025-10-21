-- Testbench para Flip-Flop tipo D com Enable e Reset
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_d_flipflop is
end tb_d_flipflop;

architecture test of tb_d_flipflop is
    signal clk_tb, rst_tb, en_tb, d_tb, q_tb : std_logic := '0';

    component d_flipflop
        port (
            clk : in std_logic;
            rst : in std_logic;
            en  : in std_logic;
            d   : in std_logic;
            q   : out std_logic
        );
    end component;
begin
    uut: d_flipflop port map (
        clk => clk_tb,
        rst => rst_tb,
        en  => en_tb,
        d   => d_tb,
        q   => q_tb
    );

    -- Clock com período de 10 ns
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Estímulo principal
    stim_proc: process
    begin
        rst_tb <= '1'; wait for 12 ns;   -- Reset ativo
        rst_tb <= '0';                   -- Libera reset

        en_tb <= '1'; d_tb <= '1'; wait for 20 ns;
        d_tb <= '0'; wait for 20 ns;
        en_tb <= '0'; d_tb <= '1'; wait for 20 ns;
        en_tb <= '1'; wait for 20 ns;

        -- Finaliza simulação naturalmente (sem std.env.stop)
        wait for 20 ns;
        report "Simulação encerrada com sucesso." severity note;
    end process;
end test;
