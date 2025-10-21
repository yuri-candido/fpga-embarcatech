library ieee;
use ieee.std_logic_1164.all;

entity decodificador_2por4 is
  port (
    sel : in std_logic_vector(1 downto 0);
    Y   : out std_logic_vector(3 downto 0)
  );
end entity;

architecture rtl of decodificador_2por4 is
begin
  process(sel)
  begin
    case sel is
      when "00" => Y <= "0001";
      when "01" => Y <= "0010";
      when "10" => Y <= "0100";
      when "11" => Y <= "1000";
      when others => Y <= "0000";
    end case;
  end process;
end rtl;
