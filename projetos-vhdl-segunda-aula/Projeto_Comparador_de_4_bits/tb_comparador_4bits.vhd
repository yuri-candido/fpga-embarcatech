library ieee;
use ieee.std_logic_1164.all;

entity tb_comparador_4bits is
end;

architecture sim of tb_comparador_4bits is
  signal A, B       : std_logic_vector(3 downto 0);
  signal Maior, Igual : std_logic;
begin
  DUT: entity work.comparador_4bits
    port map (A => A, B => B, Maior => Maior, Igual => Igual);

  stim_proc: process
  begin
    A <= "0001"; B <= "0000"; wait for 10 ns;  -- Maior = 1, Igual = 0
    A <= "0010"; B <= "0010"; wait for 10 ns;  -- Maior = 0, Igual = 1
    A <= "0011"; B <= "0100"; wait for 10 ns;  -- Maior = 0, Igual = 0
    wait;
  end process;
end architecture;
