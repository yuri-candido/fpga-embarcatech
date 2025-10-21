library ieee;
use ieee.std_logic_1164.all;

entity tb_contador_binario is
end;

architecture sim of tb_contador_binario is
  signal clk, rst : std_logic := '0';
  signal Q : std_logic_vector(3 downto 0);
begin
  DUT: entity work.contador_binario port map (clk => clk, rst => rst, Q => Q);

  clk_gen: process
  begin
    for i in 0 to 15 loop
      clk <= '0'; wait for 10 ns;
      clk <= '1'; wait for 10 ns;
    end loop;
    wait;
  end process;

  stim_proc: process
  begin
    rst <= '1'; wait for 20 ns;
    rst <= '0'; wait;
  end process;
end architecture;
