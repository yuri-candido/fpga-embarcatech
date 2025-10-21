-- Testbench do transmissor UART
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_uart_tx is
end tb_uart_tx;

architecture test of tb_uart_tx is
    signal clk_tb, rst_tb, tx_start_tb, tx_tb, busy_tb : std_logic := '0';
    signal tx_data_tb : std_logic_vector(7 downto 0) := "01010101";

    component uart_tx
        generic (CLK_DIV : integer := 4);
        port (
            clk      : in std_logic;
            rst      : in std_logic;
            tx_start : in std_logic;
            tx_data  : in std_logic_vector(7 downto 0);
            tx       : out std_logic;
            busy     : out std_logic
        );
    end component;
begin
    uut: uart_tx
        generic map (CLK_DIV => 4)
        port map (
            clk => clk_tb,
            rst => rst_tb,
            tx_start => tx_start_tb,
            tx_data => tx_data_tb,
            tx => tx_tb,
            busy => busy_tb
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
        rst_tb <= '1'; wait for 20 ns;
        rst_tb <= '0';

        tx_start_tb <= '1'; wait for 10 ns;
        tx_start_tb <= '0';

        wait for 500 ns; -- aguarda transmissão completa

        tx_data_tb <= "10101010";
        tx_start_tb <= '1'; wait for 10 ns;
        tx_start_tb <= '0';

        wait;
    end process;
end test;
