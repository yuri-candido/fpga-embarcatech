-- Sistema UART → BCD → Display 7 segmentos
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity uart_display_top is
    generic (
        CLK_DIV : integer := 16 -- Baud rate divisor
    );
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        rx      : in std_logic;
        seg     : out std_logic_vector(6 downto 0)
    );
end uart_display_top;

architecture structural of uart_display_top is
    -- Sinais internos
    signal rx_data  : std_logic_vector(7 downto 0);
    signal rx_ready : std_logic;
    signal bcd      : std_logic_vector(3 downto 0);
begin
    -- Instancia UART RX
    uart_rx_inst: entity work.uart_rx
        generic map (CLK_DIV => CLK_DIV)
        port map (
            clk => clk,
            rst => rst,
            rx => rx,
            rx_data => rx_data,
            rx_ready => rx_ready
        );

    -- Conversor ASCII para BCD
    process(rx_data, rx_ready)
    begin
        if rx_ready = '1' and rx_data >= x"30" and rx_data <= x"39" then
            bcd <= rx_data(3 downto 0);  -- ASCII '0'–'9' → BCD
        end if;
    end process;

    -- Decodificador BCD para 7 segmentos
    bcd_display: entity work.bcd_7segmentos
        port map (
            bcd => bcd,
            seg => seg
        );
end structural;
