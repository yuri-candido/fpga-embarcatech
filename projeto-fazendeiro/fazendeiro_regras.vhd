library ieee;
use ieee.std_logic_1164.all;

entity fazendeiro_regras is
  port (
    Lobo   : in std_logic;
    Ovelha : in std_logic;
    Alface : in std_logic;
    Fazendeiro : in std_logic;
    Erro : out std_logic
  );
end fazendeiro_regras;

architecture regras of fazendeiro_regras is
begin
  -- Erro se Lobo e Ovelha estão juntos sem o fazendeiro
  -- ou se Ovelha e Alface estão juntos sem o fazendeiro
  Erro <= '1' when ((Lobo = '1' and Ovelha = '1' and Fazendeiro = '0')    or
                    (Ovelha = '1' and Alface = '1' and Fazendeiro = '0')  or 
                    (Ovelha = '0' and Alface = '0' and Fazendeiro = '1')  or 
                    ((Lobo = '0' and Ovelha = '0' and Fazendeiro = '1'))) else '0';
end regras;
