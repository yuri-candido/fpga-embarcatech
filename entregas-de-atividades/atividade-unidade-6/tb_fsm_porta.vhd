library IEEE;
use IEEE.std_logic_1164.all;

entity tb_fsm_porta is
end tb_fsm_porta;

architecture test of tb_fsm_porta is
    
    constant CLK_PERIOD : time := 10 ns;    
    signal clk_tb               : std_logic := '0';
    signal rst_n_tb             : std_logic := '0';
    signal sensor_tb            : std_logic := '0';
    signal fechar_manual_tb     : std_logic := '0';
    signal fim_curso_aberta_tb  : std_logic := '0';
    signal fim_curso_fechada_tb : std_logic := '1'; 
    signal motor_abrir_tb       : std_logic;
    signal motor_fechar_tb      : std_logic;
    
    constant T_ABRINDO_SIM : time := 30 ns;
    constant T_FECHANDO_SIM : time := 40 ns;
    constant T_ABERTA_GEN   : natural := 20; 

begin

    -- Instanciação da UUT
    uut: entity work.fsm_porta
        generic map (
            T_ABERTA => T_ABERTA_GEN 
        )
        port map (
            clk               => clk_tb,
            rst_n             => rst_n_tb,
            sensor            => sensor_tb,
            fechar_manual     => fechar_manual_tb,
            fim_curso_aberta  => fim_curso_aberta_tb,
            fim_curso_fechada => fim_curso_fechada_tb,
            motor_abrir       => motor_abrir_tb,
            motor_fechar      => motor_fechar_tb
        );

    -- Geração do Clock
    clk_process : process
    begin
        clk_tb <= '0';
        wait for CLK_PERIOD / 2;
        clk_tb <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Processo de estímulos para simulação
    stim_proc : process
    begin
        
        rst_n_tb <= '0';
        wait for 15 ns;
        rst_n_tb <= '1';
        wait for CLK_PERIOD;

        -- === CENÁRIO 1: Pessoa chega, espera, e a porta fecha por tempo ===
        report "CENARIO 1: Abertura normal e fechamento por timeout.";
        
        sensor_tb <= '1';
        fim_curso_fechada_tb <= '0';
        wait for T_ABRINDO_SIM; -- Simula o tempo que leva para abrir

        -- Porta atinge o fim de curso aberta -> Deve ir para o estado ABERTA
        fim_curso_aberta_tb <= '1';
        wait for CLK_PERIOD;
        sensor_tb <= '0'; -- Pessoa sai da frente do sensor
        fim_curso_aberta_tb <= '0';
        
        -- Aguarda o contador T_ABERTA expirar.
        -- T_ABERTA = 20 ciclos * 10ns/ciclo = 200ns.
        report "Aguardando T_ABERTA (" & integer'image(T_ABERTA_GEN) & " ciclos) expirar...";
        wait for T_ABERTA_GEN * CLK_PERIOD + (CLK_PERIOD / 2);

        wait for T_FECHANDO_SIM; -- Simula o tempo que leva para fechar
        
        -- Porta atinge o fim de curso fechada
        fim_curso_fechada_tb <= '1';
        wait for 5 * CLK_PERIOD; -- Aguarda um tempo no estado FECHADA

        -- === CENÁRIO 2: Pessoa fica no sensor, reiniciando o timer ===
        report "CENARIO 2: Pessoa permanece no sensor, reiniciando o timer.";
        
        sensor_tb <= '1';
        fim_curso_fechada_tb <= '0';
        wait for T_ABRINDO_SIM;
        fim_curso_aberta_tb <= '1';
        wait for CLK_PERIOD;
        
        -- Pessoa fica na porta por um tempo
        report "Pessoa no sensor, timer deve ser zerado.";
        wait for 10 * CLK_PERIOD;
        
        -- Pessoa sai, timer começa a contar
        report "Pessoa saiu, timer inicia contagem.";
        sensor_tb <= '0';
        fim_curso_aberta_tb <= '0';
        wait for T_ABERTA_GEN * CLK_PERIOD + (CLK_PERIOD / 2); -- Espera o timer expirar novamente

        wait for T_FECHANDO_SIM;
        fim_curso_fechada_tb <= '1';
        wait for 5 * CLK_PERIOD;

        -- === CENÁRIO 3: Fechamento manual ===
        report "CENARIO 3: Fechamento manual.";
        
        sensor_tb <= '1';
        fim_curso_fechada_tb <= '0';
        wait for T_ABRINDO_SIM;
        fim_curso_aberta_tb <= '1';
        wait for 5 * CLK_PERIOD; -- Porta fica aberta por um tempo
        sensor_tb <= '0';
        fim_curso_aberta_tb <= '0';
        
        -- Botão de fechamento manual é pressionado
        report "Botao de fechamento manual pressionado.";
        fechar_manual_tb <= '1';
        wait for CLK_PERIOD;
        fechar_manual_tb <= '0';

        -- Porta deve fechar imediatamente
        wait for T_FECHANDO_SIM;
        fim_curso_fechada_tb <= '1';
        
        report "Fim da simulacao.";
        wait; -- Fim da simulação
    end process;

end architecture;