----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:54 02/01/2020 
-- Design Name: 
-- Module Name:    Updater - Behavioral 
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

entity Updater is

 generic( n : integer range 0 to 10000 := 10000);
 port ( w1_in , w2_in , b_in : in std_logic_vector (19 downto 0);
        delta :  in std_logic_vector (14 downto 0);
		  x1,x2 :  in std_logic_vector (13 downto 0);
		  w1_out , w2_out , b_out : out std_logic_vector (19 downto 0)
		  );
		  
end Updater;



architecture Behavioral of Updater is

 --signal x1_temp : integer range 0 to 10000;
 --signal x2_temp : integer range 0 to 10000;
 --signal update1 : integer range -530000 to 530000;
 --signal update2 : integer range -530000 to 530000;
 --signal delta_temp : integer range -33000 to 33000;

begin

 --x1_temp <= conv_integer('0' & x1);
 --x2_temp <= conv_integer('0' & x2);
 --delta_temp <= conv_integer(delta);
 --update1 <= ((conv_integer('0' & x1)) * (conv_integer(delta)) ) / 10000;
 --update2 <= ((conv_integer('0' & x2)) * (conv_integer(delta)) ) / 10000;
 
 w1_out  <= w1_in + conv_std_logic_vector((( (conv_integer('0' & x1)) * (conv_integer(delta))  ) / 10000) , 20);
 w2_out  <= w2_in + conv_std_logic_vector((( (conv_integer('0' & x2)) * (conv_integer(delta))  ) / 10000) , 20);
 b_out   <= b_in  + conv_std_logic_vector((conv_integer(delta)) , 20);

end Behavioral;

