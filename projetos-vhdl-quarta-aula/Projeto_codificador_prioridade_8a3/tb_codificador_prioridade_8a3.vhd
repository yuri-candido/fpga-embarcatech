-- Testbench do codificador de prioridade 8:3
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_codificador_prioridade_8a3 is
end tb_codificador_prioridade_8a3;

architecture test of tb_codificador_prioridade_8a3 is
    signal entrada_tb : std_logic_vector(7 downto 0);
    signal saida_tb : std_logic_vector(2 downto 0);
    signal valido_tb : std_logic;

    component codificador_prioridade_8a3
        port (
            entrada : in std_logic_vector(7 downto 0);
            saida   : out std_logic_vector(2 downto 0);
            valido  : out std_logic
        );
    end component;
begin
    uut: codificador_prioridade_8a3
        port map (
            entrada => entrada_tb,
            saida   => saida_tb,
            valido  => valido_tb
        );

    stim_proc: process
    begin
        entrada_tb <= "00000000"; wait for 10 ns;  -- Inativo
        entrada_tb <= "00000001"; wait for 10 ns;  -- Prioridade 0
        entrada_tb <= "00001010"; wait for 10 ns;  -- Prioridade 3 (entrada(3))
        entrada_tb <= "01011010"; wait for 10 ns;  -- Prioridade 6
        entrada_tb <= "10000000"; wait for 10 ns;  -- Prioridade 7
        wait;
    end process;
end test;
