-- Decodificador binário 3:8 com enable
library IEEE;
use IEEE.std_logic_1164.all;

entity decodificador_3a8 is
    port (
        sel   : in std_logic_vector(2 downto 0);
        en    : in std_logic;
        saida : out std_logic_vector(7 downto 0)
    );
end decodificador_3a8;

architecture behavioral of decodificador_3a8 is
begin
    process(sel, en)
    begin
        if en = '1' then
            case sel is
                when "000" => saida <= "00000001";
                when "001" => saida <= "00000010";
                when "010" => saida <= "00000100";
                when "011" => saida <= "00001000";
                when "100" => saida <= "00010000";
                when "101" => saida <= "00100000";
                when "110" => saida <= "01000000";
                when "111" => saida <= "10000000";
                when others => saida <= (others => '0');
            end case;
        else
            saida <= (others => '0');
        end if;
    end process;
end behavioral;
