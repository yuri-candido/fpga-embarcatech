library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity acumulador is
  port (
    clk    : in std_logic;
    rst    : in std_logic;
    en     : in std_logic;
    D      : in std_logic_vector(3 downto 0);
    Q      : out std_logic_vector(3 downto 0)
  );
end;

architecture rtl of acumulador is
  signal acc : unsigned(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        acc <= (others => '0');
      elsif en = '1' then
        acc <= acc + unsigned(D);
      end if;
    end if;
  end process;
  Q <= std_logic_vector(acc);
end;
