-- Testbench para UART → BCD → Display
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_uart_display_top is
end tb_uart_display_top;

architecture test of tb_uart_display_top is
    signal clk_tb, rst_tb, rx_tb : std_logic := '1';
    signal seg_tb : std_logic_vector(6 downto 0);

    component uart_display_top
        generic (CLK_DIV : integer := 4);
        port (
            clk : in std_logic;
            rst : in std_logic;
            rx  : in std_logic;
            seg : out std_logic_vector(6 downto 0)
        );
    end component;

    procedure send_uart(signal clk : in std_logic;
                        signal rx : out std_logic;
                        val : in std_logic_vector(7 downto 0)) is
    begin
        rx <= '0'; wait for 4*10 ns;  -- Start bit
        for i in 0 to 7 loop
            rx <= val(i); wait for 4*10 ns;
        end loop;
        rx <= '1'; wait for 4*10 ns;  -- Stop bit
    end procedure;

begin
    uut: uart_display_top
        generic map (CLK_DIV => 4)
        port map (
            clk => clk_tb,
            rst => rst_tb,
            rx => rx_tb,
            seg => seg_tb
        );

    -- Clock
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

        wait for 40 ns;
        send_uart(clk_tb, rx_tb, x"33"); -- Envia ASCII '3'
        wait for 200 ns;

        send_uart(clk_tb, rx_tb, x"37"); -- Envia ASCII '7'
        wait for 200 ns;

        send_uart(clk_tb, rx_tb, x"39"); -- Envia ASCII '9'
        wait;
    end process;
end test;
