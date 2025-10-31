library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg8 is
    Port (
        D   : in  STD_LOGIC_VECTOR(7 downto 0); -- Entradas paralelas
        CLK : in  STD_LOGIC;                    -- Clock comum
        Q   : out STD_LOGIC_VECTOR(7 downto 0); -- Saídas normais
        Qn  : out STD_LOGIC_VECTOR(7 downto 0)  -- Saídas invertidas
    );
end reg8;

architecture arquitetura2 of reg8 is
    component flipflop
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;
begin
    -- Instanciando 8 flip-flops (um para cada bit do vetor)
    ff0: flipflop port map (D => D(0), CLK => CLK, Q => Q(0), Qn => Qn(0));
    ff1: flipflop port map (D => D(1), CLK => CLK, Q => Q(1), Qn => Qn(1));
    ff2: flipflop port map (D => D(2), CLK => CLK, Q => Q(2), Qn => Qn(2));
    ff3: flipflop port map (D => D(3), CLK => CLK, Q => Q(3), Qn => Qn(3));
    ff4: flipflop port map (D => D(4), CLK => CLK, Q => Q(4), Qn => Qn(4));
    ff5: flipflop port map (D => D(5), CLK => CLK, Q => Q(5), Qn => Qn(5));
    ff6: flipflop port map (D => D(6), CLK => CLK, Q => Q(6), Qn => Qn(6));
    ff7: flipflop port map (D => D(7), CLK => CLK, Q => Q(7), Qn => Qn(7));
end arquitetura2;
