library ieee;
use ieee.std_logic_1164.all;

entity tb_registrador_enable is
end;

architecture sim of tb_registrador_enable is
  signal clk, rst, en : std_logic := '0';
  signal D, Q : std_logic_vector(3 downto 0);
begin
  DUT: entity work.registrador_enable port map (clk => clk, rst => rst, en => en, D => D, Q => Q);

  clk_gen: process
  begin
    for i in 0 to 5 loop
      clk <= '0'; wait for 10 ns;
      clk <= '1'; wait for 10 ns;
    end loop;
    wait;
  end process;

  stim_proc: process
  begin
    rst <= '1'; wait for 20 ns;
    rst <= '0'; en <= '1'; D <= "1010"; wait for 20 ns;
    D <= "1111"; wait for 20 ns;
    en <= '0'; D <= "0000"; wait for 20 ns;
    wait;
  end process;
end architecture;
