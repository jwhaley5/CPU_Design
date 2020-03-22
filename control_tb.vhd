library ieee;
use ieee.std_logic_1164.ALL;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Control_testbench is
end Control_testbench;

architecture behavior of Control_testbench is

	component control_unit
	Port ( clk : in std_logic;
		   OP_code : in std_logic_vector(3 downto 0);
		   ALU_OP : out std_logic_vector(2 downto 0);
		   mem_toreg, branch, mem_read, mem_write, immediate, reg_write : out std_logic);
	end component;

signal clk : std_logic := '0';
signal op_code : std_logic_vector (3 downto 0) := (others => '0');
signal mem_toreg : std_logic := '0';
signal branch : std_logic := '0';
signal mem_read : std_logic := '0';
signal mem_write : std_logic := '0';
signal immediate : std_logic := '0';
signal reg_write : std_logic := '0';
signal ALU_OP : std_logic_vector(2 downto 0) := "000";

-- clocks
constant clk_period : time := 10 ns;

begin

test: control_unit PORT MAP (
	clk => clk,
	op_code => op_code,
	mem_toreg => mem_toreg,
	branch => branch,
	mem_read => mem_read,
	mem_write => mem_write,
	immediate => immediate,
	reg_write => reg_write,
	ALU_OP => ALU_OP);

clk_process: process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;

stim_proc: process
begin
	wait for 10 ns;
	op_code <= "0000"; 
	wait for clk_period *2;
	op_code <= "0001"; 
	wait for clk_period *2;
	op_code <= "0010";
	wait for clk_period *2;
	op_code <= "0011";
	wait for clk_period *2;
	op_code <= "0100";
	wait for clk_period *2;
	op_code <= "0101";
	wait for clk_period *2;
	op_code <= "0110";
	wait for clk_period *2;
	op_code <= "0111";
	wait for clk_period *2;
	op_code <= "1000";
	wait for clk_period *2;
	op_code <= "1001";
	wait for clk_period *2;
	op_code <= "1010";
	wait for clk_period *2;
	op_code <= "1011";
	wait for clk_period *2;
	op_code <= "1100";
	wait for clk_period *2;
	op_code <= "1101";
	wait for clk_period *2;
	op_code <= "1110";
	wait for clk_period *2;
	op_code <= "1111";
	wait for clk_period *2;
	wait;
end process;

end;






