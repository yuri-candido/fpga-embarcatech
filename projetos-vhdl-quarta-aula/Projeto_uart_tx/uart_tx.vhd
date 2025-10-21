-- Transmissor UART 8N1 com FSM
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity uart_tx is
    generic (
        CLK_DIV : integer := 16 -- Fator de divisão (ex: 16 = 1/16 do clock)
    );
    port (
        clk      : in std_logic;
        rst      : in std_logic;
        tx_start : in std_logic;
        tx_data  : in std_logic_vector(7 downto 0);
        tx       : out std_logic;
        busy     : out std_logic
    );
end uart_tx;

architecture behavioral of uart_tx is
    type state_type is (IDLE, START, DATA, STOP, DONE);
    signal state : state_type := IDLE;

    signal clk_cnt : integer range 0 to CLK_DIV - 1 := 0;
    signal bit_cnt : integer range 0 to 7 := 0;

    signal tx_reg : std_logic_vector(7 downto 0);
    signal tx_buf : std_logic := '1';
begin
    process(clk, rst)
    begin
        if rst = '1' then
            state <= IDLE;
            tx_buf <= '1';
            busy <= '0';
            clk_cnt <= 0;
            bit_cnt <= 0;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    tx_buf <= '1';
                    busy <= '0';
                    if tx_start = '1' then
                        tx_reg <= tx_data;
                        clk_cnt <= 0;
                        bit_cnt <= 0;
                        state <= START;
                        busy <= '1';
                    end if;

                when START =>
                    tx_buf <= '0';
                    if clk_cnt = CLK_DIV - 1 then
                        clk_cnt <= 0;
                        state <= DATA;
                    else
                        clk_cnt <= clk_cnt + 1;
                    end if;

                when DATA =>
                    tx_buf <= tx_reg(bit_cnt);
                    if clk_cnt = CLK_DIV - 1 then
                        clk_cnt <= 0;
                        if bit_cnt = 7 then
                            bit_cnt <= 0;
                            state <= STOP;
                        else
                            bit_cnt <= bit_cnt + 1;
                        end if;
                    else
                        clk_cnt <= clk_cnt + 1;
                    end if;

                when STOP =>
                    tx_buf <= '1';
                    if clk_cnt = CLK_DIV - 1 then
                        clk_cnt <= 0;
                        state <= DONE;
                    else
                        clk_cnt <= clk_cnt + 1;
                    end if;

                when DONE =>
                    busy <= '0';
                    state <= IDLE;
            end case;
        end if;
    end process;

    tx <= tx_buf;
end behavioral;
