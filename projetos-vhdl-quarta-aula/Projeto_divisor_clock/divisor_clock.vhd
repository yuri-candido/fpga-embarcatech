-- Divisor de clock parametrizável com duty cycle ~50%
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divisor_clock is
    generic (
        N : integer := 10     -- Valor do divisor (precisa ser >=2)
    );
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        clk_out : out std_logic
    );
end divisor_clock;

architecture behavioral of divisor_clock is
    signal count : integer range 0 to N-1 := 0;
    signal toggle : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                count <= 0;
                toggle <= '0';
            elsif count = N/2 - 1 then
                toggle <= not toggle;
                count <= 0;
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    clk_out <= toggle;
end behavioral;
