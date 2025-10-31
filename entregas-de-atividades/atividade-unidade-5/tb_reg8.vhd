library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_reg8 is
end tb_reg8;

architecture arquitetura3 of tb_reg8 is
    signal D   : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal CLK : STD_LOGIC := '0';
    signal Q   : STD_LOGIC_VECTOR(7 downto 0);
    signal Qn  : STD_LOGIC_VECTOR(7 downto 0);
begin
    -- Instancia do registrador
    uut: entity work.reg8
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Qn  => Qn
        );

    -- Geração de clock (período = 20ns)
    clk_process : process
    begin
        while true loop
            CLK <= '0';
            wait for 10 ns;
            CLK <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Estímulos de entrada
    stim_proc: process
    begin
        -- Valor inicial
        D <= "00000000"; wait for 25 ns;

        -- Carregar novo valor
        D <= "10101010"; wait for 20 ns;

        -- Novo valor
        D <= "11110000"; wait for 20 ns;

        -- Novo valor
        D <= "00001111"; wait for 20 ns;

        wait;
    end process;
end arquitetura3;
