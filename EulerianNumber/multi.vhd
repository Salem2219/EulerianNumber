library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity multi is
    port (a : in std_logic_vector(3 downto 0);
     b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end multi;

architecture rtl of multi is
signal y_uns : unsigned(11 downto 0);
begin
y_uns <= unsigned(a) * unsigned(b);
y <= std_logic_vector(y_uns(7 downto 0));
end rtl;
