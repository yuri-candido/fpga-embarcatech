-- Testbench para contador up/down com reset e carregamento
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.all;  -- Para usar std.env.stop

entity tb_contador_updown is
end tb_contador_updown;

architecture test of tb_contador_updown is
    signal clk_tb, rst_tb, ld_tb, up_tb : std_logic := '0';
    signal din_tb, count_tb : std_logic_vector(7 downto 0);

    component COUNT_8B
        port (
            RESET : in std_logic;
            CLK   : in std_logic;
            LD    : in std_logic;
            UP    : in std_logic;
            DIN   : in std_logic_vector(7 downto 0);
            COUNT : out std_logic_vector(7 downto 0)
        );
    end component;
begin
    uut: COUNT_8B
        port map (
            RESET => rst_tb,
            CLK   => clk_tb,
            LD    => ld_tb,
            UP    => up_tb,
            DIN   => din_tb,
            COUNT => count_tb
        );

    -- Geração de clock de 10 ns
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Estímulos de teste
    stim_proc: process
    begin
        rst_tb <= '1'; wait for 10 ns;
        rst_tb <= '0';

        din_tb <= "00000101";  -- Carrega valor 5
        ld_tb <= '1'; wait for 10 ns;
        ld_tb <= '0';

        up_tb <= '1'; wait for 50 ns;  -- Conta para cima

        up_tb <= '0'; wait for 50 ns;  -- Conta para baixo

        -- Finaliza simulação após 200 ns
        wait for 60 ns;
        report "Simulação finalizada com sucesso." severity note;
        std.env.stop;
    end process;
end test;

