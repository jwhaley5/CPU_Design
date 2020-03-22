library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
  port(
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
end register_file;


architecture behavioral of register_file is
  type registerFile is array(0 to 15) of std_logic_vector(15 downto 0);
  signal registers : registerFile;
begin
  
regFile : process (clk) is
  begin
    if rising_edge(clk) then
      outA <= registers(to_integer(unsigned(reg1)));
      outB <= registers(to_integer(unsigned(reg2)));
      -- Write and bypass
      if (regWriteEnable = '1') then
        registers(to_integer(unsigned(writeReg))) <= input_data;  -- Write
      end if;
      if immediate = '0' then
        branch_data <= registers(to_integer(unsigned(writeReg)));
      end if;
    end if;
  end process;
end behavioral;