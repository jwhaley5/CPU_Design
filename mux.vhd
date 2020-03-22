library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity mux is
Generic ( signalSize : integer := 16);

Port (
		clk : in std_logic;
		input1 : in std_logic_vector (signalSize - 1 downto 0);
		input2 : in std_logic_vector (signalSize - 1 downto 0);
		output : out std_logic_vector (signalSize - 1 downto 0);
		sel : in std_logic);
end mux;

architecture behavioral of mux is

begin
process (clk)
begin 
	if (clk'event and clk = '1') then 
		if (sel = '0') then
			output <= input1;
		else 
			output <= input2;
		end if;
	end if;
end process;
end;

