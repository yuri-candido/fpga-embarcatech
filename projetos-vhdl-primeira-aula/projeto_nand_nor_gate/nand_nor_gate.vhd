library ieee;
use ieee.std_logic_1164.all;

entity nand_nor_gate is
  port (
    A, B : in std_logic;
    Y1   : out std_logic; -- NAND
    Y2   : out std_logic  -- NOR
  );
end nand_nor_gate;

architecture rtl of nand_nor_gate is
begin
  Y1 <= not (A and B);
  Y2 <= not (A or B);
end rtl;
