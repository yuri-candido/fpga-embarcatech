library ieee;
use ieee.std_logic_1164.all;

entity flipflop_jk is
  port (
    clk : in std_logic;
    J   : in std_logic;
    K   : in std_logic;
    Q   : out std_logic
  );
end entity;

architecture rtl of flipflop_jk is
  signal q_reg : std_logic := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if J = '0' and K = '0' then
        q_reg <= q_reg;           -- mantém
      elsif J = '0' and K = '1' then
        q_reg <= '0';             -- reset
      elsif J = '1' and K = '0' then
        q_reg <= '1';             -- set
      elsif J = '1' and K = '1' then
        q_reg <= not q_reg;       -- toggle
      end if;
    end if;
  end process;
  Q <= q_reg;
end architecture;
