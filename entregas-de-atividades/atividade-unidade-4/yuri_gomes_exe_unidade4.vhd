library IEEE;
use IEEE.std_logic_1164.all;

entity exe01 is
  port(
    a,b,c,d : in std_logic;
    y : out std_logic
  );
end entity exe01;

architecture behavioral of exe01 is
  begin
    y <= (a and c) or (a and b) or (b and c and d);
  end behavioral;