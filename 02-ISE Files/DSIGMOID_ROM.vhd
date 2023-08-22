----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:19:51 01/31/2020 
-- Design Name: 
-- Module Name:    DSIGMOID_ROM - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use std.textio.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DSIGMOID_ROM is
  Port(  x : in  std_logic_vector(13 downto 0);                               
	      y : out std_logic_vector(11 downto 0)); 
end DSIGMOID_ROM;



architecture Behavioral of DSIGMOID_ROM is
  
   type ram_type is array(0 to 10000) of  bit_vector(11 downto 0);

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
	
	 signal dsigmoid_rom : ram_type  := Init_rom ("dsig_data.txt");
begin

  	 y <= to_stdlogicvector(dsigmoid_rom(conv_integer(x)));


end Behavioral;

