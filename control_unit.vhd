library ieee;
use ieee.std_logic_1164.ALL;

ENTITY control_unit IS
PORT(
    clk : in Std_logic;
    OP_CODE : in STD_LOGIC_VECTOR (3 DOWNTO 0);
    mem_toreg : out std_logic; 
    branch: out std_logic;
    mem_read : out std_logic;
    mem_write : out std_logic;
    immediate : out std_logic;
    reg_write : out STD_LOGIC;
    ALU_OP : out std_logic_vector(2 downto 0));
end control_unit;

architecture behavioral of control_unit is 

begin 

process(clk)
begin 
	if(clk'event and clk = '1') then 
	case OP_CODE is 
		-- Halt 1
		when "0000" => 
			mem_toreg <= '0';
			branch <= '1';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "001";
			immediate <= '1';
			reg_write <= '0';
		-- Add 2
		when "0001" => 
			mem_toreg <= '1';
			branch <= '0';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "000";
			immediate <= '0';
			reg_write <= '1';
		-- Sub 3
		when "0010" => 
			mem_toreg <= '1';
			branch <= '0';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "001";
			immediate <= '0';
			reg_write <= '1';
		-- Load 4
		when "0011" => 
			mem_toreg <= '1';
			branch <= '0';
			mem_read <= '1';
			mem_write <= '0';
			ALU_OP <= "000";
			immediate <= '0';
			reg_write <= '0';
		-- Stor 5
		when "0100" => 
			mem_toreg <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_write <= '1';
			ALU_OP <= "000";
			immediate <= '0';
			reg_write <= '0';
		-- And 6
		when "0101" => 
			mem_toreg <= '1';
			branch <= '0';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "010";
			immediate <= '0';
			reg_write <= '1';
		-- Or 7
		when "0110" => 
			mem_toreg <= '1';
			branch <= '0';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "011";
			immediate <= '0';
			reg_write <= '1';
		-- Beq 8
		when "0111" => 
			mem_toreg <= '0';
			branch <= '1';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "001";
			immediate <= '0';
			reg_write <= '1';
		-- Bne 9
		when "1000" => 
			mem_toreg <= '0';
			branch <= '1';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "100";
			immediate <= '0';
			reg_write <= '1';
		-- bgt 10
		when "1001" => 
			mem_toreg <= '0';
			branch <= '1';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "101";
			immediate <= '0';
			reg_write <= '1';
		-- bge 11
		when "1010" => 
			mem_toreg <= '0';
			branch <= '1';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "110";
			immediate <= '0';
			reg_write <= '1';
		-- blt 12
		when "1011" => 
			mem_toreg <= '0';
			branch <= '1';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "111";
			immediate <= '0';
			reg_write <= '1';
		-- ldi 13
		when "1100" => 
			mem_toreg <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "001";
			immediate <= '1';
			reg_write <= '1';
		-- jump 14
		when "1101" => 
			mem_toreg <= '0';
			branch <= '1';
			mem_read <= '0';
			mem_write <= '0';
			ALU_OP <= "100";
			immediate <= '1';
			reg_write <= '0';
		-- push 15
		when "1110" => 
			mem_toreg <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_write <= '1';
			ALU_OP <= "000";
			immediate <= '0';
			reg_write <= '0';
		-- pop
		when "1111" => 
			mem_toreg <= '1';
			branch <= '0';
			mem_read <= '1';
			mem_write <= '0';
			ALU_OP <= "000";
			immediate <= '1';
			reg_write <= '1';
		when others => 
			mem_toreg <= '1';
			branch <= '0';
			mem_read <= '1';
			mem_write <= '0';
			ALU_OP <= "000";
			immediate <= '1';
			reg_write <= '1';
	end case;
	end if; 
end process;
end Behavioral;
