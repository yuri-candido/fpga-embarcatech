-- MUX 4:1 com seletor de 2 bits - Implementação com estrutura case
library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_1 is
    port (
        sel : in std_logic_vector(1 downto 0); -- seletor
        a, b, c, d : in std_logic;             -- entradas
        y : out std_logic                      -- saída
    );
end mux4_1;

architecture behavior of mux4_1 is
begin
    process(sel, a, b, c, d)
    begin
        case sel is
            when "00" => y <= a;
            when "01" => y <= b;
            when "10" => y <= c;
            when "11" => y <= d;
            when others => y <= 'X'; -- segurança
        end case;
    end process;
end behavior;
