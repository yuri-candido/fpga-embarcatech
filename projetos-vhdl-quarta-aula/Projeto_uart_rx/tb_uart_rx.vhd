-- Testbench para receptor UART
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_uart_rx is
end tb_uart_rx;

architecture test of tb_uart_rx is
    signal clk_tb, rst_tb, rx_tb, rx_ready_tb : std_logic := '1';
    signal rx_data_tb : std_logic_vector(7 downto 0);

    component uart_rx
        generic (CLK_DIV : integer := 4);
        port (
            clk      : in std_logic;
            rst      : in std_logic;
            rx       : in std_logic;
            rx_data  : out std_logic_vector(7 downto 0);
            rx_ready : out std_logic
        );
    end component;

    procedure send_byte(signal clk : in std_logic;
                        signal rx : out std_logic;
                        b : in std_logic_vector(7 downto 0)) is
    begin
        rx <= '0'; wait for 4*10 ns;  -- start bit
        for i in 0 to 7 loop
            rx <= b(i); wait for 4*10 ns;
        end loop;
        rx <= '1'; wait for 4*10 ns;  -- stop bit
    end procedure;

begin
    uut: uart_rx
        generic map (CLK_DIV => 4)
        port map (
            clk => clk_tb,
            rst => rst_tb,
            rx => rx_tb,
            rx_data => rx_data_tb,
            rx_ready => rx_ready_tb
        );

    -- Geração de clock
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Estímulo
    stim_proc: process
    begin
        rst_tb <= '1'; wait for 20 ns;
        rst_tb <= '0';

        wait for 40 ns;
        send_byte(clk_tb, rx_tb, "01010101");
        wait for 200 ns;

        send_byte(clk_tb, rx_tb, "10101010");
        wait;
    end process;
end test;
