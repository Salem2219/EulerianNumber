library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram is
port(clk, wr1, wr2 : in std_logic;
i, j, m, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end ram;
architecture rtl of ram is
type ram_type is array (0 to 15, 0 to 15) of
std_logic_vector(7 downto 0) ;
signal program: ram_type:= (others => (others => "00000000"));
signal iminus1, jminus1, iminusj, jplus1 : std_logic_vector(3 downto 0);
signal dp1, dp2, add, idp, jdp : std_logic_vector(7 downto 0);

component minus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component adder is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component multi is
    port (a : in std_logic_vector(3 downto 0);
     b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component sub is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;

begin
u1 : minus1 port map (i, iminus1);
u2 : minus1 port map (j, jminus1);
u5 : sub port map (i, j, iminusj);
u3 : adder port map (idp, jdp, add);
u4 : multi port map (iminusj, dp1, idp);
u6 : multi port map (jplus1, dp2, jdp);
u7 : plus1 port map (j, jplus1);
dp1 <= program(conv_integer(unsigned(iminus1)), conv_integer(unsigned(jminus1)));
dp2 <= program(conv_integer(unsigned(iminus1)), conv_integer(unsigned(j)));
process(clk)
begin
if (rising_edge(clk)) then
if (wr1 = '1') then
program(conv_integer(unsigned(i)), conv_integer(unsigned(j))) <= "00000001";
elsif (wr2 = '1') then
program(conv_integer(unsigned(i)), conv_integer(unsigned(j))) <= add;
end if;
end if;
end process;
y <= program(conv_integer(unsigned(n)), conv_integer(unsigned(m)));
end rtl;