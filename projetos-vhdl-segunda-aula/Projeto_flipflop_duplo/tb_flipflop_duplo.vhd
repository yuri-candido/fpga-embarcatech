library ieee;
use ieee.std_logic_1164.all;

entity tb_flipflop_duplo is
end;

architecture sim of tb_flipflop_duplo is
  signal clk        : std_logic := '0';
  signal D          : std_logic := '0';
  signal Q_subida   : std_logic;
  signal Q_descida  : std_logic;
begin

  -- Instancia a unidade sob teste
  DUT: entity work.flipflop_duplo
    port map (
      clk        => clk,
      D          => D,
      Q_subida   => Q_subida,
      Q_descida  => Q_descida
    );

  -- Geração de clock com 20 ns de período
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
    wait for 5 ns;  D <= '0';
    wait for 15 ns; D <= '1';  -- antes da descida
    wait for 20 ns; D <= '0';  -- antes da subida
    wait for 20 ns; D <= '1';  -- antes da descida
    wait for 20 ns; D <= '0';  -- antes da subida
    wait for 30 ns; D <= '1';
    wait;
  end process;

end architecture;
