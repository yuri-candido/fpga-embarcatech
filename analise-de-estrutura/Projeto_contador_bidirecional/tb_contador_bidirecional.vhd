-- Testbench para o contador bidirecional com preload
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_contador_bidirecional is
end tb_contador_bidirecional;

architecture test of tb_contador_bidirecional is
    signal clk_tb, rst_tb, en_tb, dir_tb, load_tb : std_logic := '0';
    signal din_tb, q_tb : unsigned(7 downto 0);

    component contador_bidirecional
        port (
            clk   : in std_logic;
            rst   : in std_logic;
            en    : in std_logic;
            dir   : in std_logic;
            load  : in std_logic;
            din   : in unsigned(7 downto 0);
            q     : out unsigned(7 downto 0)
        );
    end component;
begin
    uut: contador_bidirecional port map (
        clk => clk_tb, rst => rst_tb,
        en => en_tb, dir => dir_tb, load => load_tb,
        din => din_tb, q => q_tb
    );

    -- Clock 10 ns
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

        -- Carrega valor 100
        din_tb <= to_unsigned(100, 8);
        load_tb <= '1'; wait for 10 ns;
        load_tb <= '0';

        -- Conta para cima
        dir_tb <= '1'; en_tb <= '1'; wait for 40 ns;

        -- Conta para baixo
        dir_tb <= '0'; wait for 40 ns;

        -- Pause
        en_tb <= '0'; wait for 20 ns;

        -- Carrega valor 200
        din_tb <= to_unsigned(200, 8); load_tb <= '1'; wait for 10 ns;
        load_tb <= '0'; en_tb <= '1'; dir_tb <= '0'; wait for 30 ns;

        wait;
    end process;
end test;
