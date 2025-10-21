library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate is
    port (
        a, b : in std_logic;
        y    : out std_logic
    );
end xor_gate;

architecture behavioral of xor_gate is
begin
    y <= a xor b;
end behavioral;
