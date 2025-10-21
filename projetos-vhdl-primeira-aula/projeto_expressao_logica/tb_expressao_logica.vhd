library ieee;
use ieee.std_logic_1164.all;

entity tb_expressao_logica is
end;

architecture sim of tb_expressao_logica is
  signal A, B, C, Y : std_logic;
begin
  DUT: entity work.expressao_logica
    port map (A => A, B => B, C => C, Y => Y);

  stim: process
  begin
    A <= '0'; B <= '0'; C <= '0'; wait for 10 ns;
    A <= '0'; B <= '0'; C <= '1'; wait for 10 ns;
    A <= '0'; B <= '1'; C <= '0'; wait for 10 ns;
    A <= '0'; B <= '1'; C <= '1'; wait for 10 ns;
    A <= '1'; B <= '0'; C <= '0'; wait for 10 ns;
    A <= '1'; B <= '0'; C <= '1'; wait for 10 ns;
    A <= '1'; B <= '1'; C <= '0'; wait for 10 ns;
    A <= '1'; B <= '1'; C <= '1'; wait for 10 ns;
    wait;
  end process;
end sim;
