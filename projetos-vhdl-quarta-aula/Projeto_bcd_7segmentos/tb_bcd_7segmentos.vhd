-- Testbench para decodificador BCD para 7 segmentos
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_bcd_7segmentos is
end tb_bcd_7segmentos;

architecture test of tb_bcd_7segmentos is
    signal bcd_tb : std_logic_vector(3 downto 0);
    signal seg_tb : std_logic_vector(6 downto 0);

    component bcd_7segmentos
        port (
            bcd : in std_logic_vector(3 downto 0);
            seg : out std_logic_vector(6 downto 0)
        );
    end component;
begin
    uut: bcd_7segmentos port map (
        bcd => bcd_tb,
        seg => seg_tb
    );

    stim_proc: process
    begin
        for i in 0 to 15 loop
            bcd_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;
        wait;
    end process;
end test;
