library IEEE;
use IEEE.std_logic_1164.all;

-- Entidade principal do MUX
entity mux_structural is
    port (
        a, b : in std_logic;
        sel : in std_logic;
        y : out std_logic
    );
end entity mux_structural;

-- Arquitetura do MUX, conectando componentes
architecture structural of mux_structural is
-- Declaração de componentes (equivalente a entidades)
component not_gate is
    port (
        input : in std_logic;
        output : out std_logic
    );
end component;

-- Declaração de sinais internos (fios)
signal not_sel, a_out, b_out: std_logic;
begin
-- Instanciação da porta NOT
    not_sel_gate : not_gate
        port map (
            input => sel,
            output => not_sel
        );
-- Conectando os componentes
a_out <= a and not_sel;
b_out <= b and sel;
y <= a_out or b_out ;
end architecture structural;