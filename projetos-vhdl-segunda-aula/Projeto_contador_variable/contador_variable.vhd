library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_variable is
  port (
    clk : in std_logic;
    Q   : out std_logic_vector(1 downto 0)
  );
end;

architecture rtl of contador_variable is
begin
  process(clk)
    variable count : integer range 0 to 3 := 0;
  begin
    if rising_edge(clk) then
      count := (count + 1) mod 4;
      Q <= std_logic_vector(to_unsigned(count, 2));
    end if;
  end process;
end;
