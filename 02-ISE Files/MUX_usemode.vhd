----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:15:01 02/01/2020 
-- Design Name: 
-- Module Name:    MUX_usemode - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_usemode is
 generic (n : integer range 0 to 100 := 14);
 port( x1 , x2 , my_x1 , my_x2 : in std_logic_vector(n-1 downto 0);
       use_mode : in std_logic ;
       x1_out , x2_out : out std_logic_vector(n-1 downto 0)
		 );
end MUX_usemode;




architecture Behavioral of MUX_usemode is
begin

 process( x1 , x2 , my_x1 , my_x2 , use_mode )
 begin
 
    if use_mode = '1' then 
      x1_out <= my_x1;
      x2_out <= my_x2;
    else
      x1_out <= x1;
      x2_out <= x2;
    end if;
 
 end process;


end Behavioral;






