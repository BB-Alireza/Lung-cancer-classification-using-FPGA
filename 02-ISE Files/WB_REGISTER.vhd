----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:01:48 01/31/2020 
-- Design Name: 
-- Module Name:    WB_REGISTER - Behavioral 
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

entity WB_REGISTER is
    generic ( n : integer range 0 to 64 := 20 );
    port (w1_in , w2_in , b_in : in  std_logic_vector ( n-1 downto 0 );
          reset , clk , train_test , use_mode : in std_logic ;
		    w1_out , w2_out , b_out :  out std_logic_vector ( n-1 downto 0 ));
end WB_REGISTER;

architecture Behavioral of WB_REGISTER is
begin

  process(clk , reset)
  begin
  
  if reset = '1' then 
  w1_out <= "00000000001111101000" ;
  w2_out <= "00000000001111101000" ;
  b_out  <= "00000000001111101000" ;
  elsif (clk'event and clk = '1') then 
	  if train_test = '0' then
	   if use_mode = '0' then
	    w1_out <= w1_in ;
	    w2_out <= w2_in ; 
	    b_out  <= b_in  ;
		 end if;
	  end if;
  end if ;
  
  end process;

end Behavioral;

