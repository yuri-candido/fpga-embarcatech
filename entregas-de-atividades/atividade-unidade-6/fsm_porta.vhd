library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all; 

entity fsm_porta is
    generic (
        T_ABERTA : natural := 50_000_000 
    );
    port (
        clk               : in  std_logic;
        rst_n             : in  std_logic;
        sensor            : in  std_logic;
        fechar_manual     : in  std_logic;
        fim_curso_aberta  : in  std_logic;
        fim_curso_fechada : in  std_logic;
        motor_abrir       : out std_logic;
        motor_fechar      : out std_logic
    );
end entity;

architecture behavioral of fsm_porta is

    type state_type is (FECHADA, ABRINDO, ABERTA, FECHANDO);
    signal state, next_state : state_type := FECHADA;

    constant C_COUNTER_WIDTH : natural := integer(ceil(log2(real(T_ABERTA))));

    signal contador : unsigned(C_COUNTER_WIDTH - 1 downto 0) := (others => '0');
    signal timer_expirou : std_logic := '0';

begin

    -- Processo síncrono para registrar o estado e gerenciar o contador
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state <= FECHADA;
            contador <= (others => '0');
        elsif rising_edge(clk) then
            state <= next_state;

            if state = ABERTA then
                if sensor = '1' then
                    contador <= (others => '0'); -- Reinicia se pessoa é detectada
                elsif contador < T_ABERTA -1 then
                    contador <= contador + 1;    -- Incrementa até atingir o limite
                end if;
            else
                contador <= (others => '0'); -- Zera o contador fora do estado ABERTA
            end if;
        end if;
    end process;

    timer_expirou <= '1' when (state = ABERTA and contador >= T_ABERTA -1) else '0';

    -- Lógica combinacional para transição de estados
    process(state, sensor, fechar_manual, fim_curso_aberta, fim_curso_fechada, timer_expirou)
    begin
        next_state <= state; 

        case state is
            when FECHADA =>
                if sensor = '1' then
                    next_state <= ABRINDO;
                end if;
            when ABRINDO =>
                if fim_curso_aberta = '1' then
                    next_state <= ABERTA;
                end if;
            when ABERTA =>
                if (timer_expirou = '1' and sensor = '0') or fechar_manual = '1' then
                    next_state <= FECHANDO;
                end if;
            when FECHANDO =>
                if fim_curso_fechada = '1' then
                    next_state <= FECHADA;
                end if;
        end case;
    end process;

    -- Lógica de Saída (Máquina de Moore)
    process(state)
    begin
        motor_abrir  <= '0';
        motor_fechar <= '0';

        case state is
            when ABRINDO  => motor_abrir  <= '1';
            when FECHANDO => motor_fechar <= '1';
            when others   => null;
        end case;
    end process;

end architecture;