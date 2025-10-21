library ieee;
use ieee.std_logic_1164.all;

entity xor_not_gate is
  port (
    A, B : in std_logic;
    Y1   : out std_logic;  -- XOR
    Y2   : out std_logic   -- NOT A
  );
end xor_not_gate;

architecture rtl of xor_not_gate is
begin
  Y1 <= A xor B;
  Y2 <= not A;
end rtl;
