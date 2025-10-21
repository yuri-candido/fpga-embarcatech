library ieee;
use ieee.std_logic_1164.all;

entity tb_flipflop_jk is
end;

architecture sim of tb_flipflop_jk is
  signal clk : std_logic := '0';
  signal J, K, Q : std_logic;
begin
  DUT: entity work.flipflop_jk port map (clk => clk, J => J, K => K, Q => Q);

  clk_gen: process
  begin
    for i in 0 to 7 loop
      clk <= '0'; wait for 10 ns;
      clk <= '1'; wait for 10 ns;
    end loop;
    wait;
  end process;

  stim_proc: process
  begin
    J <= '0'; K <= '0'; wait for 20 ns;
    J <= '1'; K <= '0'; wait for 20 ns;
    J <= '0'; K <= '1'; wait for 20 ns;
    J <= '1'; K <= '1'; wait for 20 ns;
    wait;
  end process;
end architecture;
