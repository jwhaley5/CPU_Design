library ieee;
use ieee.std_logic_1164.ALL;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity regfile_testbench is
end regfile_testbench;

architecture behavior of regfile_testbench is

	component register_file
	PORT(
    input_data       : in  std_logic_vector(15 downto 0);
    regWriteEnable : in  std_logic;
    reg1     : in  std_logic_vector(3 downto 0);
    reg2     : in  std_logic_vector(3 downto 0);
    writeReg : in  std_logic_vector(3 downto 0);
    clk         : in  std_logic;
    immediate : in std_logic;
    outA        : out std_logic_vector(15 downto 0);
    outB        : out std_logic_vector(15 downto 0);
    branch_data : out std_logic_vector(15 downto 0)
    );
end component;

signal input_data : std_logic_vector(15 downto 0) := (others => '0');
signal regWriteEnable : std_logic := '0';
signal reg1 : std_logic_vector(3 downto 0) := (others => '0');
signal reg2 : std_logic_vector(3 downto 0) := (others => '0');
signal writeReg : std_logic_vector(3 downto 0) := (others => '0');
signal clk : std_logic := '0';
signal immediate : std_logic := '0';
signal outA : std_logic_vector (15 downto 0) := (others => '0');
signal outB : std_logic_vector (15 downto 0) := (others => '0');
signal branch_data : std_logic_vector (15 downto 0) := (others => '0');

-- clocks
constant clk_period : time := 10 ns;

begin

test: register_file PORT MAP (
	input_data => input_data,
	regWriteEnable => regWriteEnable,
	reg1 => reg1,
	reg2 => reg2,
	writeReg => writeReg,
	clk => clk,
	immediate => immediate,
	outA => outA,
	outB => outB,
	branch_data => branch_data);

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
	reg1 <= "0000";
	reg2 <= "0001";
	input_Data <= "0000000011111111"; -- 0x00FF into 0010
	regWriteEnable <= '1'; 
	writeReg <= "0010";
	immediate <= '0';
	wait for clk_period * 2;
	reg1 <= "0010";
	reg2 <= "0100";
	input_Data <= "0000000011110000"; -- 0x00F0 into 0001
	regWriteEnable <= '1'; 
	writeReg <= "0001";
	wait for clk_period * 2;
	reg1 <= "0001";
	reg2 <= "0010";
	input_Data <= "0000000011110000"; -- 0x00F0 into 0100
	regWriteEnable <= '1'; 
	writeReg <= "0100";
	wait for clk_period * 2;
	
	wait for clk_period * 2;
	
	wait for clk_period * 2;

	wait;
end process;

end;