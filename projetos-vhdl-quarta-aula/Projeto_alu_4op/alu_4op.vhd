-- ALU simples com 4 operações: AND, OR, ADD, SUB
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu_4op is
    port (
        A, B     : in std_logic_vector(7 downto 0);     -- operandos
        sel      : in std_logic_vector(1 downto 0);     -- seletor da operação
        result   : out std_logic_vector(7 downto 0);    -- resultado da operação
        carryout : out std_logic                        -- flag de carry para ADD/SUB
    );
end alu_4op;

architecture behavioral of alu_4op is
    signal a_int, b_int : unsigned(7 downto 0);
    signal res_int : unsigned(8 downto 0);  -- para detectar carry
begin
    a_int <= unsigned(A);
    b_int <= unsigned(B);

    process(a_int, b_int, sel)
    begin
        case sel is
            when "00" =>                          -- AND
                res_int <= ('0' & (a_int and b_int));

            when "01" =>                          -- OR
                res_int <= ('0' & (a_int or b_int));

            when "10" =>                          -- ADD
                res_int <= ('0' & a_int) + ('0' & b_int);

            when "11" =>                          -- SUB
                res_int <= ('0' & a_int) - ('0' & b_int);

            when others =>
                res_int <= (others => '0');
        end case;
    end process;

    result   <= std_logic_vector(res_int(7 downto 0));
    carryout <= res_int(8);                       -- bit de overflow
end behavioral;
