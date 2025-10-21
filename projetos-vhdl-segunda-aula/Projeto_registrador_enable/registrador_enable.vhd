library ieee;
use ieee.std_logic_1164.all;

entity registrador_enable is
  port (
    clk    : in std_logic;
    rst    : in std_logic;
    en     : in std_logic;
    D      : in std_logic_vector(3 downto 0);
    Q      : out std_logic_vector(3 downto 0)
  );
end entity;

architecture rtl of registrador_enable is
  signal q_reg : std_logic_vector(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        q_reg <= (others => '0');
      elsif en = '1' then
        q_reg <= D;
      end if;
    end if;
  end process;
  Q <= q_reg;
end architecture;
