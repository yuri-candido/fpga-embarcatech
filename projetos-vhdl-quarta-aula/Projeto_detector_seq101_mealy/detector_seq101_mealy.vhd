-- FSM Mealy para detectar a sequência binária 101
library IEEE;
use IEEE.std_logic_1164.all;

entity detector_seq101_mealy is
    port (
        clk : in std_logic;
        rst : in std_logic;
        x   : in std_logic;      -- Entrada serial
        z   : out std_logic      -- Saída ativa quando 101 for detectado
    );
end detector_seq101_mealy;

architecture behavioral of detector_seq101_mealy is
    type state_type is (S0, S1, S2);      -- Estados
    signal state, next_state : state_type;
begin
    -- Processo de transição de estados
    process(clk, rst)
    begin
        if rst = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;

    -- Processo de próxima transição e saída (Mealy)
    process(state, x)
    begin
        z <= '0';  -- saída padrão
        case state is
            when S0 =>
                if x = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                if x = '0' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;

            when S2 =>
                if x = '1' then
                    next_state <= S1;
                    z <= '1';  -- Detectou "101"
                else
                    next_state <= S0;
                end if;
        end case;
    end process;
end behavioral;
