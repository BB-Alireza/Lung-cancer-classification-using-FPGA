----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:06 02/01/2020 
-- Design Name: 
-- Module Name:    ERROR_fcn - Behavioral 
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

entity ERROR_fcn is
 port( o_in : in std_logic_vector ( 13 downto 0 );
       d_in : in std_logic_vector ( 13 downto 0 );
		 e_out :  out std_logic_vector ( 14 downto 0 ) );
end ERROR_fcn;

architecture Behavioral of ERROR_fcn is

  begin
  
   e_out <= ('0' & d_in )- ('0' & o_in ); -- signed 

end Behavioral;

