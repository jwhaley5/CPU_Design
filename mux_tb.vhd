library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity mux_testbench is
	generic( signalSize : integer := 16);
end mux_testbench;

architecture behavior of mux_testbench is

	component mux
	PORT(
    input1 : in std_logic_vector (signalSize - 1 downto 0);
	input2 : in std_logic_vector (signalSize - 1 downto 0);
	output : out std_logic_vector (signalSize - 1 downto 0);
	sel : in std_logic;
	clk : in std_logic);
end component;

signal clk : std_logic := '0';
signal sel : std_logic := '0';
signal input1 : std_logic_vector (15 downto 0) := (others => '0');
signal input2 : std_logic_vector (15 downto 0) := (others => '0');
signal output : std_logic_vector (15 downto 0) := (others => '0');

-- clocks
constant clk_period : time := 10 ns;

begin

test: mux PORT MAP (
	sel => sel,
	clk => clk,
	input1 => input1,
	input2 => input2,
	output => output);

clk_process: process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;

-- Test Cases for adder
stim_proc: process
begin
	wait for 15 ns;
	sel <= '0';
	input1 <= "0000000011110000";
	input2 <= "0000000000000001";
	wait for 10 ns;
	sel <= '1';
	input1 <= "0000000011110000";
	input2 <= "0000000000000001";
	wait for 10 ns;
	sel <= '1';
	input1 <= "0000000011110000";
	input2 <= "0000000000000001"; 
	wait;
end process;

end;