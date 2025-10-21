library ieee;
use ieee.std_logic_1164.all;

entity tb_shift_register is
end;

architecture sim of tb_shift_register is
  signal clk, rst, D_in : std_logic := '0';
  signal Q : std_logic_vector(3 downto 0);
begin
  DUT: entity work.shift_register port map (clk => clk, rst => rst, D_in => D_in, Q => Q);

  clk_gen: process
  begin
    for i in 0 to 8 loop
      clk <= '0'; wait for 10 ns;
      clk <= '1'; wait for 10 ns;
    end loop;
    wait;
  end process;

  stim_proc: process
  begin
    rst <= '1'; wait for 20 ns;
    rst <= '0';
    D_in <= '1'; wait for 20 ns;
    D_in <= '0'; wait for 20 ns;
    D_in <= '1'; wait for 20 ns;
    wait;
  end process;
end;
