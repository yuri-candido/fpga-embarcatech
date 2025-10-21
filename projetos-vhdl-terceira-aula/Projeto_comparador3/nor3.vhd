-- Porta NOR de 3 entradas
library IEEE;
use IEEE.std_logic_1164.all;

entity nor3 is
    port (
        i1, i2, i3 : in std_logic;
        y         : out std_logic
    );
end nor3;

architecture behavior of nor3 is
begin
    y <= not (i1 or i2 or i3);
end behavior;
