library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity sign_extend is
Port (
	clk : in std_logic;
	ten_bit : in std_logic_vector(9 downto 0);
    sixteen_bit : out std_logic_vector(15 downto 0));
end sign_extend;

architecture behavioral of sign_extend is

begin 
process(clk)
begin 
if (clk'event and clk = '1') then
    sixteen_bit <= std_logic_vector(resize(signed(ten_bit), sixteen_bit'length));
end if;
end process;
end behavioral;