-- Contador de 8 bits com controle up/down, reset assíncrono e carregamento síncrono
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity COUNT_8B is
    port (
        RESET : in std_logic;                        -- Reset assíncrono
        CLK   : in std_logic;                        -- Clock
        LD    : in std_logic;                        -- Sinal de carregamento
        UP    : in std_logic;                        -- Direção: '1' = up, '0' = down
        DIN   : in std_logic_vector(7 downto 0);     -- Entrada paralela
        COUNT : out std_logic_vector(7 downto 0)     -- Saída do contador
    );
end COUNT_8B;

architecture my_count of COUNT_8B is
    signal t_cnt : unsigned(7 downto 0);  -- Registrador interno
begin
    process (CLK, RESET)
    begin
        if (RESET = '1') then
            t_cnt <= (others => '0');                -- Reset
        elsif rising_edge(CLK) then
            if (LD = '1') then
                t_cnt <= unsigned(DIN);              -- Carregamento paralelo
            else
                if (UP = '1') then
                    t_cnt <= t_cnt + 1;              -- Incrementa
                else
                    t_cnt <= t_cnt - 1;              -- Decrementa
                end if;
            end if;
        end if;
    end process;

    COUNT <= std_logic_vector(t_cnt);                -- Conversão para saída
end my_count;
