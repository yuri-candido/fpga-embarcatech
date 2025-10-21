library ieee;
use ieee.std_logic_1164.all;

entity tb_acumulador is
end;

architecture sim of tb_acumulador is
  signal clk, rst, en : std_logic := '0';
  signal D, Q : std_logic_vector(3 downto 0);
begin
  DUT: entity work.acumulador port map (clk => clk, rst => rst, en => en, D => D, Q => Q);

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
    rst <= '1'; wait for 20 ns;
    rst <= '0'; en <= '1';
    D <= "0001"; wait for 20 ns;
    D <= "0010"; wait for 20 ns;
    D <= "0011"; wait for 20 ns;
    en <= '0'; wait for 20 ns;
    wait;
  end process;
end;
