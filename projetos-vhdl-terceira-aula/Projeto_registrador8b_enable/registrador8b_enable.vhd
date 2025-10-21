-- Registrador de 8 bits com controle de carga (enable)
library IEEE;
use IEEE.std_logic_1164.all;

entity registrador8b_enable is
    port (
        clk   : in std_logic;                         -- Clock
        rst   : in std_logic;                         -- Reset assíncrono
        load  : in std_logic;                         -- Sinal de carga (enable)
        din   : in std_logic_vector(7 downto 0);      -- Entrada paralela
        dout  : out std_logic_vector(7 downto 0)      -- Saída paralela
    );
end registrador8b_enable;

architecture behavioral of registrador8b_enable is
    signal reg : std_logic_vector(7 downto 0);
begin
    process(clk, rst)
    begin
        if rst = '1' then
            reg <= (others => '0');                  -- Reset
        elsif rising_edge(clk) then
            if load = '1' then
                reg <= din;                          -- Armazena entrada
            end if;
        end if;
    end process;

    dout <= reg;                                     -- Saída contínua
end behavioral;
