----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:57:26 01/31/2020 
-- Design Name: 
-- Module Name:    Feed_Forward - Behavioral 
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

entity Feed_Forward is
   port(   x1,x2:in std_logic_vector(13 downto 0);                    --unsigned
	      w1,w2,b:in std_logic_vector(19 downto 0);                    --signed
			    net:out std_logic_vector(18 downto 0));                  --signed 
end Feed_Forward;


architecture Behavioral of Feed_Forward is
  
 -- signal x11,x22 : integer range 0 to 10000 ;
 -- signal w11,w22 : integer range -310000 to 310000 ;
 -- signal s1   : integer range -35000000 to 35000000 ;
 -- signal s2   : integer range -35000000 to 35000000 ;
  signal net1: std_logic_vector(19 downto 0);

begin  

	-- x11 <= (conv_integer('0' & x1)) / 100 ;
	-- x22 <= (conv_integer('0' & x2)) / 100 ;
	-- w11 <= conv_integer(w1) ;
	-- w22 <= conv_integer(w2) ;
	-- s1 <= x11 * w11 / 100 ;
	-- s2 <= x22 * w22 / 100 ;
	 
	 net1 <= (conv_std_logic_vector( ((conv_integer('0' & x1)) / 100) * (conv_integer(w1)) / 100 ,20) 
	        + conv_std_logic_vector( ((conv_integer('0' & x2)) / 100) * (conv_integer(w2)) / 100 ,20) + b);
	 net <= net1(18 downto 0);
  
end Behavioral;

