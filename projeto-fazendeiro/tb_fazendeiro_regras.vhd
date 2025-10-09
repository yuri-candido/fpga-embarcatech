library ieee;
use ieee.std_logic_1164.all;

entity tb_fazendeiro_regras is
end entity;

architecture sim of tb_fazendeiro_regras is
  signal Lobo, Ovelha, Alface, Fazendeiro, Erro : std_logic;
begin
  DUT: entity work.fazendeiro_regras
    port map (Lobo => Lobo, Ovelha => Ovelha, Alface => Alface,
              Fazendeiro => Fazendeiro, Erro => Erro);

  stim: process
  begin
    Lobo <= '0'; Ovelha <= '0'; Alface <= '0'; Fazendeiro <= '0'; wait for 10 ns; 
    Lobo <= '0'; Ovelha <= '0'; Alface <= '1'; Fazendeiro <= '0'; wait for 10 ns; 
    Lobo <= '0'; Ovelha <= '1'; Alface <= '0'; Fazendeiro <= '0'; wait for 10 ns; 
    Lobo <= '0'; Ovelha <= '1'; Alface <= '1'; Fazendeiro <= '0'; wait for 10 ns;
    Lobo <= '1'; Ovelha <= '0'; Alface <= '0'; Fazendeiro <= '0'; wait for 10 ns; 
    Lobo <= '1'; Ovelha <= '0'; Alface <= '1'; Fazendeiro <= '0'; wait for 10 ns;
    Lobo <= '1'; Ovelha <= '1'; Alface <= '0'; Fazendeiro <= '0'; wait for 10 ns; 
    Lobo <= '1'; Ovelha <= '1'; Alface <= '1'; Fazendeiro <= '0'; wait for 10 ns;
    Lobo <= '0'; Ovelha <= '0'; Alface <= '0'; Fazendeiro <= '1'; wait for 10 ns; 
    Lobo <= '0'; Ovelha <= '0'; Alface <= '1'; Fazendeiro <= '1'; wait for 10 ns;
    Lobo <= '0'; Ovelha <= '1'; Alface <= '0'; Fazendeiro <= '1'; wait for 10 ns; 
    Lobo <= '0'; Ovelha <= '1'; Alface <= '1'; Fazendeiro <= '1'; wait for 10 ns;
    Lobo <= '1'; Ovelha <= '0'; Alface <= '0'; Fazendeiro <= '1'; wait for 10 ns; 
    Lobo <= '1'; Ovelha <= '0'; Alface <= '1'; Fazendeiro <= '1'; wait for 10 ns;
    Lobo <= '1'; Ovelha <= '1'; Alface <= '0'; Fazendeiro <= '1'; wait for 10 ns; 
    Lobo <= '1'; Ovelha <= '1'; Alface <= '1'; Fazendeiro <= '1'; wait for 10 ns;            
    wait;
  end process;
end sim;
