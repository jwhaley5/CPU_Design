library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity RAM_sync is
  port (
    clk     : in  std_logic;
    we      : in  std_logic;
    writeAddress : in std_logic_vector(9 downto 0);
    address : in  std_logic_vector(9 downto 0);
    datain  : in  std_logic_vector(15 downto 0);
    dataout : out std_logic_vector(15 downto 0)
  );
end entity RAM_sync;

architecture RTL of RAM_sync is

   type ram_type is array (0 to (integer'(2)**address'length)-1) of std_logic_vector(datain'range);
   signal ram : ram_type;
   signal read_address : std_logic_vector(address'range);

begin

  RamProc: process(clk) is

  begin
    if rising_edge(clk) then
      if we = '1' then
        ram(to_integer(unsigned(writeAddress))) <= datain;
      end if;
      read_address <= address;
    end if;
  end process RamProc;

  dataout <= ram(to_integer(unsigned(read_address)));

end architecture RTL;