library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
  port (
    clk   : in std_logic;
    rst   : in std_logic;
    D_in  : in std_logic;
    Q     : out std_logic_vector(3 downto 0)
  );
end;

architecture rtl of shift_register is
  signal reg : std_logic_vector(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        reg <= (others => '0');
      else
        reg <= D_in & reg(3 downto 1);
      end if;
    end if;
  end process;
  Q <= reg;
end;
