----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:44 01/30/2020 
-- Design Name: 
-- Module Name:    SIGMOID_ROM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SIGMOID_ROM is
  Port(  x : in  std_logic_vector(18 downto 0);                               
	      y : out std_logic_vector(13 downto 0));   
end SIGMOID_ROM;

architecture Behavioral of SIGMOID_ROM is
  
   type ram_type is array(-150000 to 150000) of  bit_vector(13 downto 0);

   function Init_rom(FileName : in string) return ram_type is
	  File file1 : text is in FileName; 
	  variable line1 : line; 
	  variable RAM1  : ram_type; 
   begin
		for i in ram_type'range loop
	   	readline (file1, line1); 
   		read (line1, RAM1(i));
		end loop; 
		return RAM1; 
   end function;
	
	 signal sigmoid_rom : ram_type  := Init_rom ("sig_data.txt");
begin

  	 y <= to_stdlogicvector(sigmoid_rom(conv_integer(x)));

end Behavioral;

