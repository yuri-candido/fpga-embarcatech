library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop is
    Port (
        D   : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Qn  : out STD_LOGIC
    );
end flipflop;

architecture arquitetura of flipflop is
    signal Q_int : STD_LOGIC := '0';
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            Q_int <= D;
        end if;
    end process;

    Q  <= Q_int;
    Qn <= not Q_int;
end arquitetura;
