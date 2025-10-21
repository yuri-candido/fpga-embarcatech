-- Flip-Flop tipo D com Reset Assíncrono e Clock Enable
library IEEE;
use IEEE.std_logic_1164.all;

entity d_flipflop is
    port (
        clk   : in std_logic;    -- Clock
        rst   : in std_logic;    -- Reset assíncrono
        en    : in std_logic;    -- Enable
        d     : in std_logic;    -- Entrada D
        q     : out std_logic    -- Saída Q
    );
end d_flipflop;

architecture behavioral of d_flipflop is
begin
    process(clk, rst)
    begin
        if rst = '1' then
            q <= '0';                        -- Reset assíncrono
        elsif rising_edge(clk) then
            if en = '1' then
                q <= d;                     -- Armazena dado na borda de subida
            end if;
        end if;
    end process;
end behavioral;
