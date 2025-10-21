library ieee;
use ieee.std_logic_1164.all;

entity tb_contador_variable is
end;

architecture sim of tb_contador_variable is
  signal clk : std_logic := '0';
  signal Q   : std_logic_vector(1 downto 0);
begin
  DUT: entity work.contador_variable port map (clk => clk, Q => Q);

  clk_gen: process
  begin
    for i in 0 to 7 loop
      clk <= '0'; wait for 10 ns;
      clk <= '1'; wait for 10 ns;
    end loop;
    wait;
  end process;
end;
