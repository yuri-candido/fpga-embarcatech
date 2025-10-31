library IEEE;
use IEEE.std_logic_1164.all;

entity tb_yuri_gomes_exe_unidade4 is
end tb_yuri_gomes_exe_unidade4;

architecture sim of tb_yuri_gomes_exe_unidade4 is
  signal a,b,c,d : std_logic := '0';
  signal y       : std_logic;
begin 
  uut: entity work.exe01
    port map(a => a, b => b, c => c, d => d, y => y);

  process
begin
    a <= '0'; b <= '0'; c <= '0'; d <= '0'; wait for 10 ns;
    a <= '0'; b <= '0'; c <= '0'; d <= '1'; wait for 10 ns;
    a <= '0'; b <= '0'; c <= '1'; d <= '0'; wait for 10 ns;
    a <= '0'; b <= '0'; c <= '1'; d <= '1'; wait for 10 ns;

    a <= '0'; b <= '1'; c <= '0'; d <= '0'; wait for 10 ns;
    a <= '0'; b <= '1'; c <= '0'; d <= '1'; wait for 10 ns;
    a <= '0'; b <= '1'; c <= '1'; d <= '0'; wait for 10 ns;
    a <= '0'; b <= '1'; c <= '1'; d <= '1'; wait for 10 ns;

    a <= '1'; b <= '0'; c <= '0'; d <= '0'; wait for 10 ns;
    a <= '1'; b <= '0'; c <= '0'; d <= '1'; wait for 10 ns;
    a <= '1'; b <= '0'; c <= '1'; d <= '0'; wait for 10 ns;
    a <= '1'; b <= '0'; c <= '1'; d <= '1'; wait for 10 ns;

    a <= '1'; b <= '1'; c <= '0'; d <= '0'; wait for 10 ns;
    a <= '1'; b <= '1'; c <= '0'; d <= '1'; wait for 10 ns;
    a <= '1'; b <= '1'; c <= '1'; d <= '0'; wait for 10 ns;
    a <= '1'; b <= '1'; c <= '1'; d <= '1'; wait for 10 ns;

    wait;
end process;

end sim;

