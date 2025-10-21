library ieee;
use ieee.std_logic_1164.all;

entity tb_or_gate is
end entity;

architecture sim of tb_or_gate is
  signal A, B, Y : std_logic;
begin
  DUT: entity work.or_gate
    port map (A => A, B => B, Y => Y);

  stim: process
  begin
    A <= '0'; B <= '0'; wait for 10 ns;
    A <= '0'; B <= '1'; wait for 10 ns;
    A <= '1'; B <= '0'; wait for 10 ns;
    A <= '1'; B <= '1'; wait for 10 ns;
    wait;
  end process;
end architecture;
