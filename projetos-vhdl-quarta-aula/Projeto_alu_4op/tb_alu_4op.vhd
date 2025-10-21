-- Testbench para ALU com 4 operações
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_alu_4op is
end tb_alu_4op;

architecture test of tb_alu_4op is
    signal A_tb, B_tb, result_tb : std_logic_vector(7 downto 0);
    signal sel_tb : std_logic_vector(1 downto 0);
    signal carry_tb : std_logic;

    component alu_4op
        port (
            A, B     : in std_logic_vector(7 downto 0);
            sel      : in std_logic_vector(1 downto 0);
            result   : out std_logic_vector(7 downto 0);
            carryout : out std_logic
        );
    end component;
begin
    uut: alu_4op port map (
        A => A_tb, B => B_tb, sel => sel_tb,
        result => result_tb, carryout => carry_tb
    );

    stim_proc: process
    begin
        A_tb <= "00001111"; B_tb <= "11110000";

        sel_tb <= "00"; wait for 10 ns; -- AND
        sel_tb <= "01"; wait for 10 ns; -- OR
        sel_tb <= "10"; wait for 10 ns; -- ADD
        sel_tb <= "11"; wait for 10 ns; -- SUB

        A_tb <= "11111111"; B_tb <= "00000001"; sel_tb <= "10"; wait for 10 ns; -- ADD com carry

        wait;
    end process;
end test;
