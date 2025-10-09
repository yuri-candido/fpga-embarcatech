-- Definição das bibliotecas padrão.
library ieee;
use ieee.std_logic_1164.all;

-- A entidade de um testbench é geralmente vazia.
entity tb_alarme is
end entity tb_alarme;

-- Definição da arquitetura de teste.
architecture test of tb_alarme is
    -- 1. Declaração do componente que vamos testar (Unit Under Test - UUT).
    -- A declaração deve ser idêntica à entidade do arquivo alarme.vhd.
    component alarme is
        port (
            A : in  std_logic;
            B : in  std_logic;
            C : in  std_logic;
            Y : out std_logic
        );
    end component alarme;

    -- 2. Criação de sinais internos para conectar ao UUT.
    signal s_A, s_B, s_C : std_logic := '0'; -- Sinais de entrada para o teste
    signal s_Y           : std_logic;      -- Sinal de saída do teste

begin
    -- 3. Instanciação do UUT, conectando os sinais internos às portas do componente.
    uut : alarme
        port map (
            A => s_A,
            B => s_B,
            C => s_C,
            Y => s_Y
        );

    -- 4. Processo para gerar os estímulos (todas as 8 combinações de A, B, C).
    stimulus_process : process
    begin
        -- Exibe uma mensagem no console do simulador para indicar o início.
        report "Iniciando a simulação do sistema de alarme...";

        -- Teste 0: A=0, B=0, C=0  (Esperado Y=0)
        s_A <= '0'; s_B <= '0'; s_C <= '0';
        wait for 10 ns;

        -- Teste 1: A=0, B=0, C=1  (Esperado Y=0)
        s_A <= '0'; s_B <= '0'; s_C <= '1';
        wait for 10 ns;

        -- Teste 2: A=0, B=1, C=0  (Esperado Y=0)
        s_A <= '0'; s_B <= '1'; s_C <= '0';
        wait for 10 ns;

        -- Teste 3: A=0, B=1, C=1  (Esperado Y=1)
        s_A <= '0'; s_B <= '1'; s_C <= '1';
        wait for 10 ns;

        -- Teste 4: A=1, B=0, C=0  (Esperado Y=1)
        s_A <= '1'; s_B <= '0'; s_C <= '0';
        wait for 10 ns;

        -- Teste 5: A=1, B=0, C=1  (Esperado Y=1)
        s_A <= '1'; s_B <= '0'; s_C <= '1';
        wait for 10 ns;

        -- Teste 6: A=1, B=1, C=0  (Esperado Y=1)
        s_A <= '1'; s_B <= '1'; s_C <= '0';
        wait for 10 ns;

        -- Teste 7: A=1, B=1, C=1  (Esperado Y=1)
        s_A <= '1'; s_B <= '1'; s_C <= '1';
        wait for 10 ns;

        report "Simulação concluída.";
        -- O 'wait' final suspende o processo indefinidamente, terminando a simulação.
        wait;
    end process stimulus_process;

end architecture test;