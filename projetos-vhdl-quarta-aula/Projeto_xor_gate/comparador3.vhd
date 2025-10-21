library IEEE;
use IEEE.std_logic_1164.all;

entity comparador3 is
    port (
        A, B : in std_logic_vector(2 downto 0);
        EQ  : out std_logic
    );
end comparador3;

architecture structural of comparador3 is
    component xor_gate
        port (a, b : in std_logic; y : out std_logic);
    end component;

    component nor3
        port (i1, i2, i3 : in std_logic; y : out std_logic);
    end component;

    signal xor0, xor1, xor2 : std_logic;
begin
    xor0_gate : xor_gate port map (A(0), B(0), xor0);
    xor1_gate : xor_gate port map (A(1), B(1), xor1);
    xor2_gate : xor_gate port map (A(2), B(2), xor2);

    nor_eq : nor3 port map (xor0, xor1, xor2, EQ);
end structural;
