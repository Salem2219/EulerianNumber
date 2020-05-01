library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity compj is
    port (
    j : in std_logic_vector(3 downto 0);
    y : out std_logic);
end compj;

architecture rtl of compj is
begin
    y <= '1' when j = "0000" else '0';
    

end rtl;
