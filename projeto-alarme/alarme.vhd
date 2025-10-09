-- Definição da biblioteca padrão IEEE para usar std_logic.
library ieee;
use ieee.std_logic_1164.all;

-- Definição da entidade (interface) do nosso sistema de alarme.
entity alarme is
    port (
        A : in  std_logic; -- Sensor da janela (A)
        B : in  std_logic; -- Sensor da porta (B)
        C : in  std_logic; -- Sistema ativado (C)
        Y : out std_logic  -- Saída do alarme (Y)
    );
end entity alarme;

-- Definição da arquitetura (comportamento/lógica) do sistema.
architecture logica of alarme is
begin
    -- Implementação direta da expressão lógica: Y = A + (B . C)
    -- Em VHDL, o '+' (soma lógica) é 'or' e o '.' (produto lógico) é 'and'.
    -- A atribuição é concorrente, ou seja, Y é reavaliado sempre que A, B ou C mudam.
    Y <= A or (B and C);

end architecture logica;