----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:44:36 02/01/2020 
-- Design Name: 
-- Module Name:    BackPropagation - Behavioral 
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
use IEEE.STD_LOGIC_signed.all;
use IEEE.STD_LOGIC_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BackPropagation is
   port( dsig : in std_logic_vector ( 11 downto 0) ;
         e    : in std_logic_vector ( 14 downto 0) ;
	   	 delta: out std_logic_vector( 14 downto 0) 
		  );
end BackPropagation;



architecture Behavioral of BackPropagation is

begin

 delta  <= conv_std_logic_vector((conv_integer(e) * conv_integer('0' & dsig)) / 10000 , 15) ;

end Behavioral;

