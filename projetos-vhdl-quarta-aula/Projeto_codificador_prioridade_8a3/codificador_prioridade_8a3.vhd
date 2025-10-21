-- Codificador de prioridade 8:3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity codificador_prioridade_8a3 is
    port (
        entrada : in std_logic_vector(7 downto 0);
        saida   : out std_logic_vector(2 downto 0);
        valido  : out std_logic                       -- Indica se alguma entrada está ativa
    );
end codificador_prioridade_8a3;

architecture behavioral of codificador_prioridade_8a3 is
begin
    process(entrada)
    begin
        valido <= '1';
        case entrada is
            when "10000000" => saida <= "111";
            when "01000000" => saida <= "110";
            when "00100000" => saida <= "101";
            when "00010000" => saida <= "100";
            when "00001000" => saida <= "011";
            when "00000100" => saida <= "010";
            when "00000010" => saida <= "001";
            when "00000001" => saida <= "000";
            when others =>
                saida <= "000";
                valido <= '0'; -- Nenhuma entrada ativa
        end case;
    end process;
end behavioral;
