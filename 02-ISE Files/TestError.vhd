----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:03 02/01/2020 
-- Design Name: 
-- Module Name:    TestError - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_signed.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestError is
   port( e_in : in std_logic_vector ( 14 downto 0 );          --signed
		   train_test , clk : in std_logic ;
		   e_test : out std_logic_vector ( 19 downto 0 ) );     --unsigned
end TestError;



architecture Behavioral of TestError is

	 signal e1    : integer range 0 to 100000000 ;
	 signal e_ts  : integer range 0 to 100000000 ;

begin

   e1 <= (conv_integer ( e_in )*conv_integer ( e_in )) / 10000 ;
	 
	 process(clk)            
    begin
   
	   if (clk'event and clk='1') then
	   	  if train_test = '1' then
			     
				  
              e_ts <= e_ts + (  e1 * e1  / 10000 );
           else e_ts <= 0 ; 
           end if;
      end if;
		
    end process;
  
  
  e_test <=  conv_std_logic_vector ( e_ts , 20 ) ; -- unsigned


end Behavioral;












