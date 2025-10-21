-- Temporizador programável com pulso de done
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity timer_programavel is
    port (
        clk    : in std_logic;
        rst    : in std_logic;
        start  : in std_logic;                            -- Inicia a contagem
        preset : in unsigned(7 downto 0);                 -- Valor de tempo
        done   : out std_logic                            -- Pulso de término
    );
end timer_programavel;

architecture behavioral of timer_programavel is
    signal count : unsigned(7 downto 0) := (others => '0');
    signal counting : std_logic := '0';
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= (others => '0');
            counting <= '0';
            done <= '0';
        elsif rising_edge(clk) then
            if start = '1' then
                count <= (others => '0');                 -- Reinicia contagem
                counting <= '1';
                done <= '0';
            elsif counting = '1' then
                if count = preset then
                    done <= '1';                          -- Pulso de saída
                    counting <= '0';
                else
                    count <= count + 1;
                    done <= '0';
                end if;
            else
                done <= '0';
            end if;
        end if;
    end process;
end behavioral;
