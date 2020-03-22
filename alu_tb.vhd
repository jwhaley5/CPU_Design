library ieee;
use ieee.std_logic_1164.ALL;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity alu_testbench is
end alu_testbench;

architecture behavior of alu_testbench is

	component ALU
	PORT(
    data_in1: in Std_logic_vector(15 downto 0);
    data_in2: in STD_LOGIC_VECTOR(15 downto 0);
    clk: in std_logic;
    rst: in std_logic;
    ALU_operation: in std_logic_vector(2 downto 0);
    zero_flag : out std_logic; 
    ALU_result: out std_logic_vector(15 downto 0));
end component;

signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal data_in1 : std_logic_vector (15 downto 0) := (others => '0');
signal data_in2 : std_logic_vector (15 downto 0) := (others => '0');
signal ALU_operation : std_logic_vector(2 downto 0) := (others => '0');
signal zero_flag : std_logic := '0';
signal ALU_result : std_logic_vector(15 downto 0) := (others => '0');

-- clocks
constant clk_period : time := 10 ns;

begin

test: ALU PORT MAP (
	clk => clk,
	rst => rst,
	data_in1 => data_in1,
	data_in2 => data_in2,
	ALU_operation => ALU_operation,
	zero_flag => zero_flag,
	ALU_result => ALU_result);

clk_process: process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;

-- Test Cases for ALU
stim_proc: process
begin
	wait for 15 ns;


	-- Add and Subtract --
	ALU_operation <= "000";
	rst <= '0';
	data_in1 <= "0000001100110000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "001";
	rst <= '0';
	data_in1 <= "0000001100110000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "000";
	rst <= '0';
	data_in1 <= "0000001100110000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "001";
	rst <= '0';
	data_in1 <= "0000001100110000";
	data_in2 <= "0000001100110000";
	wait for clk_period * 2;
	ALU_operation <= "010";
	rst <= '0';
	data_in1 <= "0000001111111111";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;


	-- And and Or --
	ALU_operation <= "011";
	rst <= '0';
	data_in1 <= "0000001111111111";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "010";
	rst <= '0';
	data_in1 <= "0000001100110000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "011";
	rst <= '0';
	data_in1 <= "0000001100110000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;


	-- BNE and BGT --
	ALU_operation <= "100";
	rst <= '0';
	data_in1 <= "0000000000000000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "101";
	rst <= '0';
	data_in1 <= "0000000000000000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "100";
	rst <= '0';
	data_in1 <= "0000000000000001";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "101";
	rst <= '0';
	data_in1 <= "0000000000000001";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "101";
	rst <= '0';
	data_in1 <= "0000000000000010";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;

	-- BGE and BLT --
	ALU_operation <= "110";
	rst <= '0';
	data_in1 <= "0000000000000000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "111";
	rst <= '0';
	data_in1 <= "0000000000000000";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "110";
	rst <= '0';
	data_in1 <= "0000000000000001";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "111";
	rst <= '0';
	data_in1 <= "0000000000000001";
	data_in2 <= "0000000000000001";
	wait for clk_period * 2;
	ALU_operation <= "110";
	rst <= '0';
	data_in1 <= "0000000000000001";
	data_in2 <= "0000000000000000";
	wait for clk_period * 2;
	ALU_operation <= "111";
	rst <= '0';
	data_in1 <= "0000000000000001";
	data_in2 <= "0000000000000000";
	wait for clk_period * 2;

	wait;
end process;

end;






