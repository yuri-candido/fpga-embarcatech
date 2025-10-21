-- Contador bidirecional com preload (carregamento)
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador_bidirecional is
    port (
        clk   : in std_logic;
        rst   : in std_logic;
        en    : in std_logic;
        dir   : in std_logic;                      -- '1' para contar ↑, '0' para contar ↓
        load  : in std_logic;
        din   : in unsigned(7 downto 0);           -- Valor a ser carregado
        q     : out unsigned(7 downto 0)           -- Valor atual do contador
    );
end contador_bidirecional;

architecture behavioral of contador_bidirecional is
    signal count : unsigned(7 downto 0) := (others => '0');
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                count <= din;
            elsif en = '1' then
                if dir = '1' then
                    count <= count + 1;
                else
                    count <= count - 1;
                end if;
            end if;
        end if;
    end process;

    q <= count;
end behavioral;
