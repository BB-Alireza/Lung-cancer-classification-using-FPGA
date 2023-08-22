----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:09:03 01/29/2020 
-- Design Name: 
-- Module Name:    DATASET_ROM - Behavioral 
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

entity DATASET_ROM is
  generic(num_of_train : integer range 0 to 1000:=674 ;
          num_of_test  : integer range 0 to 1000:=74 );
  Port(  
           addr : in std_logic_vector(9 downto 0);        --in  integer range 1 to (num_of_train );
			  train_test : in std_logic;                     -- train=0
           x1_out : out std_logic_vector(13 downto 0);    --out  integer range 0 to 8000;
			  x2_out : out std_logic_vector(13 downto 0);    --out  integer range 0 to 5000;
			  y_out  : out std_logic_vector(13 downto 0));   --out  integer range 0 to  10000);
end DATASET_ROM;



architecture Behavioral of DATASET_ROM is
 
 type TRAIN_ROM is array(0 to num_of_train ) of  bit_vector(13 downto 0);
 type TEST_ROM  is array(0 to num_of_test )  of  bit_vector(13 downto 0);

 function Init_train(FileName : in string) return TRAIN_ROM is
	File file1 : text is in FileName; 
	variable line1 : line; 
	variable RAM1  : TRAIN_ROM; 
 begin
		for i in TRAIN_ROM'range loop
			readline (file1, line1); 
			read (line1, RAM1(i));
		end loop; 
		return RAM1; 
 end function;
 
 function Init_test(FileName : in string) return TEST_ROM is
	File file1 : text is in FileName; 
	variable line1 : line; 
	variable RAM1 : TEST_ROM; 
 begin
		for i in TEST_ROM'range loop
			readline (file1, line1); 
			read (line1, RAM1(i));
		end loop; 
		return RAM1; 
 end function;

 signal x1_train : TRAIN_ROM := Init_train("x1_train.txt");
 signal x2_train : TRAIN_ROM := Init_train("x2_train.txt");
 signal y_train  : TRAIN_ROM := Init_train("y_train.txt");
 signal x1_test  : TEST_ROM  := Init_test ("x1_test.txt");
 signal x2_test  : TEST_ROM  := Init_test ("x2_test.txt");
 signal y_test   : TEST_ROM  := Init_test ("y_test.txt");

begin
 process(addr) begin
		if (train_test = '0') then
			 x1_out <= to_stdlogicvector(x1_train(conv_integer (addr)));
			 x2_out <= to_stdlogicvector(x2_train(conv_integer (addr)));
			 y_out <=  to_stdlogicvector(y_train(conv_integer (addr)));
		else
			 x1_out <= to_stdlogicvector(x1_test(conv_integer (addr)));
			 x2_out <= to_stdlogicvector(x2_test(conv_integer (addr)));
			 y_out <=  to_stdlogicvector(y_test(conv_integer (addr)));
		end if;
 end process;

end Behavioral;

