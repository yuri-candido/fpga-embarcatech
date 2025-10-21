library IEEE;
use IEEE.std_logic_1164.all;

-- Entidade para a porta NOT
entity not_gate is
    port (
        input : in std_logic;
        output : out std_logic
    );
end entity not_gate;

-- Arquitetura para a porta NOT
architecture rtl of not_gate is
    begin
        output <= not input;
end architecture rtl;

