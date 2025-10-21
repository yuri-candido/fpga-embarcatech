library ieee;
use ieee.std_logic_1164.all;

entity flipflop_duplo is
  port (
    clk        : in std_logic;
    D          : in std_logic;
    Q_subida   : out std_logic;
    Q_descida  : out std_logic
  );
end entity;

architecture comportamento of flipflop_duplo is
begin

  -- Flip-Flop sensível à borda de subida
  process(clk)
  begin
    if rising_edge(clk) then
      Q_subida <= D;
    end if;
  end process;

  -- Flip-Flop sensível à borda de descida
  process(clk)
  begin
    if falling_edge(clk) then
      Q_descida <= D;
    end if;
  end process;

end architecture;
