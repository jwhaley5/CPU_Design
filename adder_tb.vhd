library ieee;
use ieee.std_logic_1164.ALL;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity adder_testbench is
end adder_testbench;

architecture behavior of adder_testbench is

	component adder
	PORT(
    clk : in std_logic;
    data_in1: in Std_logic_vector(15 downto 0);
    data_in2: in Std_logic_vector(15 downto 0);
    data_out: out std_logic_vector(15 downto 0));
end component;

signal clk : std_logic := '0';
signal data_in1 : std_logic_vector (15 downto 0) := (others => '0');
signal data_in2 : std_logic_vector (15 downto 0) := (others => '0');
signal data_out : std_logic_vector (15 downto 0) := (others => '0');

-- clocks
constant clk_period : time := 10 ns;

begin

test: adder PORT MAP (
	clk => clk,
	data_in1 => data_in1,
	data_in2 => data_in2,
	data_out => data_out);

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
	data_in1 <= "0000000011110000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	data_in1 <= "0000000011111111";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	data_in1 <= "1111111111110000";
	data_in2 <= "1111111111111111";
	wait for clk_period * 2;
	
	wait for clk_period * 2;

	wait;
end process;

end;