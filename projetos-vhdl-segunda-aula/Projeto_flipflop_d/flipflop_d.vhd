library ieee;
use ieee.std_logic_1164.all;

entity flipflop_d is
  port (
    clk : in std_logic;
    D   : in std_logic;
    Q   : out std_logic
  );
end entity;

architecture comportamento of flipflop_d is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      Q <= D;
    end if;
  end process;
end architecture;
