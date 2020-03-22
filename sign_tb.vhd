library ieee;
use ieee.std_logic_1164.ALL;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity sign_testbench is
end sign_testbench;

architecture behavior of sign_testbench is

	component sign_extend
	PORT(
    clk : in std_logic;
	ten_bit : in std_logic_vector(9 downto 0);
    sixteen_bit : out std_logic_vector(15 downto 0));
end component;

signal clk : std_logic := '0';
signal ten_bit : std_logic_vector (9 downto 0) := (others => '0');
signal sixteen_bit : std_logic_vector (15 downto 0) := (others => '0');

-- clocks
constant clk_period : time := 10 ns;

begin

test: sign_extend PORT MAP (
	clk => clk,
	ten_bit => ten_bit,
	sixteen_bit => sixteen_bit);

clk_process: process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;

-- Test Cases for sign extend
stim_proc: process
begin
	wait for 15 ns;
	ten_bit <= "0011111111";
	wait for clk_period * 2;
	ten_bit <= "1111111111";
	wait for clk_period * 2;
	ten_bit <= "1100000000";
	wait for clk_period * 2;
	wait;
end process;

end;