-- Receptor UART 8N1 com FSM
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity uart_rx is
    generic (
        CLK_DIV : integer := 16   -- Divisor para baud rate
    );
    port (
        clk      : in std_logic;
        rst      : in std_logic;
        rx       : in std_logic;
        rx_data  : out std_logic_vector(7 downto 0);
        rx_ready : out std_logic
    );
end uart_rx;

architecture behavioral of uart_rx is
    type state_type is (IDLE, START, DATA, STOP, DONE);
    signal state : state_type := IDLE;

    signal clk_cnt : integer range 0 to CLK_DIV - 1 := 0;
    signal bit_cnt : integer range 0 to 7 := 0;

    signal shift_reg : std_logic_vector(7 downto 0);
    signal rx_sample : std_logic;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            state <= IDLE;
            clk_cnt <= 0;
            bit_cnt <= 0;
            rx_data <= (others => '0');
            rx_ready <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    rx_ready <= '0';
                    if rx = '0' then
                        clk_cnt <= 0;
                        state <= START;
                    end if;

                when START =>
                    if clk_cnt = CLK_DIV / 2 then
                        clk_cnt <= 0;
                        state <= DATA;
                        bit_cnt <= 0;
                    else
                        clk_cnt <= clk_cnt + 1;
                    end if;

                when DATA =>
                    if clk_cnt = CLK_DIV - 1 then
                        clk_cnt <= 0;
                        shift_reg(bit_cnt) <= rx;
                        if bit_cnt = 7 then
                            state <= STOP;
                        else
                            bit_cnt <= bit_cnt + 1;
                        end if;
                    else
                        clk_cnt <= clk_cnt + 1;
                    end if;

                when STOP =>
                    if clk_cnt = CLK_DIV - 1 then
                        clk_cnt <= 0;
                        state <= DONE;
                    else
                        clk_cnt <= clk_cnt + 1;
                    end if;

                when DONE =>
                    rx_data <= shift_reg;
                    rx_ready <= '1';
                    state <= IDLE;
            end case;
        end if;
    end process;
end behavioral;
