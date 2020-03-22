library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY ALU IS
PORT(
    data_in1: in Std_logic_vector(15 downto 0);
    data_in2: in STD_LOGIC_VECTOR(15 downto 0);
    clk: in std_logic;
    rst: in std_logic;
    ALU_operation: in std_logic_vector(2 downto 0);
    zero_flag : out std_logic; 
    ALU_result: out std_logic_vector(15 downto 0));
end ALU;

architecture behavioral of ALU is 
--signal result : unsigned(15 downto 0) := 0;

begin 

process(clk)
begin 
	if(clk'event and clk = '1') then 
	case ALU_operation is 
		-- add
		when "000" => 
			ALU_result <= std_logic_vector(unsigned(data_in1(15 downto 0)) + unsigned(data_in2(15 downto 0)));
			zero_flag <= '0';
		-- subtract
		when "001" => 
			ALU_result <= std_logic_vector(unsigned(data_in1(15 downto 0)) - unsigned(data_in2(15 downto 0)));
			if (unsigned(data_in1(15 downto 0)) - unsigned(data_in2(15 downto 0)) = 0)
				then zero_flag <= '1'; 
			else 
				zero_flag <= '0';
			end if; 
		-- And
		when "010" => 
			ALU_result <= data_in1 AND data_in2;
			if (unsigned(data_in1 AND data_in2) = 0)
				then zero_flag <= '1'; 
			else 
				zero_flag <= '0';
			end if; 
		-- OR
		when "011" => 
			ALU_result <= data_in1 OR data_in2;
			zero_flag <= '0';
		-- BNE Function
		when "100" => 
			ALU_result <= data_in1;
			if (unsigned(data_in1(15 downto 0)) - unsigned(data_in2(15 downto 0)) = 0)
				then zero_flag <= '0'; 
			else 
				zero_flag <= '1';
			end if; 
		-- BGT Function
		when "101" => 
			ALU_result <= std_logic_vector(unsigned(data_in1(15 downto 0)) - unsigned(data_in2(15 downto 0)));
			if (signed(data_in1(15 downto 0)) - signed(data_in2(15 downto 0)) > 0)
				then zero_flag <= '1'; 
			else 
				zero_flag <= '0';
			end if; 
		-- BGE Function
		when "110" => 
			ALU_result <= std_logic_vector(unsigned(data_in1(15 downto 0)) + unsigned(data_in2(15 downto 0)));
			if (signed(data_in1(15 downto 0)) - signed(data_in2(15 downto 0)) >= 0)
				then zero_flag <= '1'; 
			else 
				zero_flag <= '0';
			end if; 		
		-- BLT Function
		when "111" => 
			ALU_result <= std_logic_vector(unsigned(data_in1(15 downto 0)) + unsigned(data_in2(15 downto 0)));
			if (signed(data_in1(15 downto 0)) - signed(data_in2(15 downto 0)) < 0)
				then zero_flag <= '1'; 
			else 
				zero_flag <= '0';
			end if; 
		when others => 
			ALU_result <= std_logic_vector(unsigned(data_in1(15 downto 0)) + unsigned(data_in2(15 downto 0)));
			zero_flag <= '0';
	end case;
	end if; 
end process;
end Behavioral;