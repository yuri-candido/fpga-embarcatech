library ieee;
use ieee.std_logic_1164.all;

entity tb_decodificador_2por4 is
end;

architecture sim of tb_decodificador_2por4 is
  signal sel : std_logic_vector(1 downto 0);
  signal Y   : std_logic_vector(3 downto 0);
begin
  DUT: entity work.decodificador_2por4 port map (sel => sel, Y => Y);

  stim_proc: process
  begin
    sel <= "00"; wait for 10 ns;
    sel <= "01"; wait for 10 ns;
    sel <= "10"; wait for 10 ns;
    sel <= "11"; wait for 10 ns;
    wait;
  end process;
end architecture;
