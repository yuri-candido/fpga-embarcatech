library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity acumulador_saturado is
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        en      : in std_logic;
        entrada : in signed(7 downto 0);     -- valor a acumular
        saida   : out signed(7 downto 0)     -- valor acumulado saturado
    );
end acumulador_saturado;

architecture behavioral of acumulador_saturado is
    signal acc : signed(7 downto 0) := (others => '0');
begin
    process(clk, rst)
        variable resultado : signed(8 downto 0); -- variável local evita metavalue
    begin
        if rst = '1' then
            acc <= (others => '0');
        elsif rising_edge(clk) then
            if en = '1' then
                resultado := resize(acc, 9) + resize(entrada, 9);

                if resultado > to_signed(127, 9) then
                    acc <= to_signed(127, 8);
                elsif resultado < to_signed(-128, 9) then
                    acc <= to_signed(-128, 8);
                else
                    acc <= resultado(7 downto 0);
                end if;
            end if;
        end if;
    end process;

    saida <= acc;
end behavioral;
