library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_acumulador_saturado is
end tb_acumulador_saturado;

architecture test of tb_acumulador_saturado is
    signal clk_tb, rst_tb, en_tb : std_logic;
    signal entrada_tb : signed(7 downto 0);
    signal saida_tb   : signed(7 downto 0);

    component acumulador_saturado
        port (
            clk     : in std_logic;
            rst     : in std_logic;
            en      : in std_logic;
            entrada : in signed(7 downto 0);
            saida   : out signed(7 downto 0)
        );
    end component;
begin
    uut: acumulador_saturado port map (
        clk => clk_tb, rst => rst_tb,
        en => en_tb, entrada => entrada_tb, saida => saida_tb
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
        rst_tb <= '1'; en_tb <= '0'; entrada_tb <= to_signed(0, 8); wait for 15 ns;
        rst_tb <= '0';

        en_tb <= '1';
        entrada_tb <= to_signed(50, 8); wait for 10 ns;
        entrada_tb <= to_signed(50, 8); wait for 10 ns;
        entrada_tb <= to_signed(50, 8); wait for 10 ns;

        entrada_tb <= to_signed(-100, 8); wait for 10 ns;
        entrada_tb <= to_signed(-100, 8); wait for 10 ns;

        en_tb <= '0'; entrada_tb <= to_signed(0, 8); wait for 20 ns;

        report "Simulação finalizada com sucesso." severity note;
        wait;
    end process;
end test;
