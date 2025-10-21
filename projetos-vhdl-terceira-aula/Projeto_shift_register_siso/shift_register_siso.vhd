-- Registrador de Deslocamento Serial-In Serial-Out (SISO)
library IEEE;
use IEEE.std_logic_1164.all;

entity shift_register_siso is
    port (
        clk  : in std_logic;                          -- Clock
        rst  : in std_logic;                          -- Reset assíncrono
        din  : in std_logic;                          -- Entrada serial
        dout : out std_logic                          -- Saída serial (bit menos significativo)
    );
end shift_register_siso;

architecture behavioral of shift_register_siso is
    signal shift_reg : std_logic_vector(7 downto 0);  -- Registrador interno
begin
    process(clk, rst)
    begin
        if rst = '1' then
            shift_reg <= (others => '0');             -- Limpa todos os bits
        elsif rising_edge(clk) then
            shift_reg <= din & shift_reg(7 downto 1); -- Desloca para a direita
        end if;
    end process;

    dout <= shift_reg(0);                            -- Saída do bit menos significativo
end behavioral;
