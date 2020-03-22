library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY adder IS
PORT(
	clk : in std_logic;
    data_in1: in Std_logic_vector(15 downto 0);
    data_in2: in Std_logic_vector(15 downto 0);
    data_out: out std_logic_vector(15 downto 0));
end adder;

architecture behavioral of adder is

begin

process(clk)
begin 
	if(clk'event and clk = '1') then 
		data_out <= std_logic_vector(unsigned(data_in1(15 downto 0)) + unsigned(data_in2(15 downto 0)));
	end if;
end process;
end behavioral;
