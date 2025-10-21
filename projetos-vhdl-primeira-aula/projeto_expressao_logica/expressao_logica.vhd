library ieee;
use ieee.std_logic_1164.all;

entity expressao_logica is
  port (
    A, B, C : in std_logic;
    Y       : out std_logic
  );
end expressao_logica;

architecture rtl of expressao_logica is
begin
  Y <= (A and B) or (not C);
end rtl;
