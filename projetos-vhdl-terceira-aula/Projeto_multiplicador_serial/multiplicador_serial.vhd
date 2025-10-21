library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplicador_serial is
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        start   : in std_logic;
        A       : in unsigned(7 downto 0);
        B       : in unsigned(7 downto 0);
        done    : out std_logic;
        produto : out unsigned(15 downto 0)
    );
end multiplicador_serial;

architecture behavioral of multiplicador_serial is
    type state_type is (IDLE, RUN, DONE_STATE);  -- ← nome do estado alterado
    signal state : state_type := IDLE;

    signal reg_a : unsigned(7 downto 0);
    signal reg_b : unsigned(7 downto 0);
    signal acc   : unsigned(15 downto 0);
    signal count : integer range 0 to 8 := 0;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            state  <= IDLE;
            acc    <= (others => '0');
            reg_a  <= (others => '0');
            reg_b  <= (others => '0');
            count  <= 0;
            done   <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    done <= '0';
                    if start = '1' then
                        reg_a <= A;
                        reg_b <= B;
                        acc   <= (others => '0');
                        count <= 0;
                        state <= RUN;
                    end if;

                when RUN =>
                    if reg_b(0) = '1' then
                        acc(15 downto 8) <= acc(15 downto 8) + reg_a;
                    end if;
                    reg_b <= '0' & reg_b(7 downto 1); -- desloca B
                    acc   <= acc(14 downto 0) & '0';  -- desloca ACC
                    count <= count + 1;
                    if count = 8 then
                        state <= DONE_STATE;
                    end if;

                when DONE_STATE =>
                    done <= '1';
                    state <= IDLE;
            end case;
        end if;
    end process;

    produto <= acc;
end behavioral;
