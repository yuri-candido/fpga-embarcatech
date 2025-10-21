library ieee;
use ieee.std_logic_1164.all;

entity tb_flipflop_d is
end;

architecture sim of tb_flipflop_d is
  signal clk : std_logic := '0';
  signal D   : std_logic := '0';
  signal Q   : std_logic;
begin

  -- Instancia o DUT (Device Under Test)
  DUT: entity work.flipflop_d
    port map (
      clk => clk,
      D   => D,
      Q   => Q
    );

  -- Geração do clock (20 ns de período)
  clk_gen: process
  begin
    while now < 100 ns loop
      clk <= '0'; wait for 10 ns;
      clk <= '1'; wait for 10 ns;
    end loop;
    wait;
  end process;

  -- Estímulos para a entrada D
  stim_proc: process
  begin
    wait for 5 ns;  D <= '0';  -- antes da primeira borda
    wait for 20 ns; D <= '1';  -- será capturado na próxima borda
    wait for 40 ns; D <= '0';  -- novo valor para ser capturado
    wait for 40 ns; D <= '1';
    wait;
  end process;

end architecture;
