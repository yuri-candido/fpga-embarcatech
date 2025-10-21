library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_multiplicador_serial is
end tb_multiplicador_serial;

architecture test of tb_multiplicador_serial is
    signal clk_tb, rst_tb, start_tb, done_tb : std_logic := '0';
    signal A_tb, B_tb : unsigned(7 downto 0);
    signal produto_tb : unsigned(15 downto 0);

    component multiplicador_serial
        port (
            clk     : in std_logic;
            rst     : in std_logic;
            start   : in std_logic;
            A       : in unsigned(7 downto 0);
            B       : in unsigned(7 downto 0);
            done    : out std_logic;
            produto : out unsigned(15 downto 0)
        );
    end component;
begin
    uut: multiplicador_serial port map (
        clk => clk_tb, rst => rst_tb, start => start_tb,
        A => A_tb, B => B_tb, done => done_tb, produto => produto_tb
    );

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

        A_tb <= to_unsigned(13, 8);
        B_tb <= to_unsigned(5, 8);  -- 13 × 5 = 65
        wait for 10 ns;

        start_tb <= '1'; wait for 10 ns;
        start_tb <= '0';

        wait for 150 ns;  -- simulação limitada
        report "Simulação finalizada com sucesso." severity note;
        wait;
    end process;
end test;
