library ieee;
use ieee.std_logic_1164.all;

entity tb_nand_nor_gate is
end;

architecture sim of tb_nand_nor_gate is
  signal A, B, Y1, Y2 : std_logic;
begin
  DUT: entity work.nand_nor_gate
    port map (A => A, B => B, Y1 => Y1, Y2 => Y2);

  stim: process
  begin
    A <= '0'; B <= '0'; wait for 10 ns;
    A <= '0'; B <= '1'; wait for 10 ns;
    A <= '1'; B <= '0'; wait for 10 ns;
    A <= '1'; B <= '1'; wait for 10 ns;
    wait;
  end process;
end sim;
