library ieee;
use ieee.std_logic_1164.ALL;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ram_testbench is
end ram_testbench;

architecture behavior of ram_testbench is

	component Ram_sync
	PORT(
    clk     : in  std_logic;
    we      : in  std_logic;
    address : in  std_logic_vector(9 downto 0);
    writeAddress : in std_logic_vector(9 downto 0);
    datain  : in  std_logic_vector(15 downto 0);
    dataout : out std_logic_vector(15 downto 0)
  );
end component;

signal clk : std_logic := '0';
signal we : std_logic := '0';
signal address : std_logic_vector (9 downto 0) := (others => '0');
signal writeAddress : std_logic_vector (9 downto 0) := (others => '0');
signal datain : std_logic_vector (15 downto 0) := (others => '0');
signal dataout : std_logic_vector (15 downto 0) := (others => '0');

-- clocks
constant clk_period : time := 10 ns;

begin

test: Ram_sync PORT MAP (
	clk => clk,
	we => we,
	address => address,
	writeAddress => writeAddress,
	datain => datain,
	dataout => dataout);

clk_process: process
begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;

-- Test Cases for RAM 
stim_proc: process
begin
	wait for 15 ns;
	we <= '1';
	address <= "0000000000";
	writeAddress <= "0000000001";
	datain <= "0000000011110000";
	wait for clk_period * 2;
	we <= '0';
	address <= "0000000001";
	writeAddress <= "0000000000";
	datain <= "0000000011110000";
	wait for clk_period * 2;
	we <= '1';
	address <= "0000000001";
	writeAddress <= "0000000001";
	datain <= "0000000011111111";
	wait for clk_period * 2;
	we <= '0';
	address <= "0000000001";
	writeAddress <= "0000000000";
	datain <= "0000000011110000";
	wait for clk_period * 2;
	
	wait for clk_period * 2;

	wait;
end process;

end;