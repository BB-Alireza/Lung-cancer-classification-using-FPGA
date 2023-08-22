----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:17:37 02/02/2020 
-- Design Name: 
-- Module Name:    CONTROL_UNIT - Behavioral 
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

entity CONTROL_UNIT is

     generic(num_of_train : integer range 0 to 1000:=675 ;
             num_of_test  : integer range 0 to 1000:=75 );
		port( clk,reset : in std_logic ;
		      train_test , use_mode , register_reset : out std_logic ; 
				addr_out : out std_logic_vector(9 downto 0) );
		
end CONTROL_UNIT;




architecture Behavioral of CONTROL_UNIT is
	
	type state is ( train_s , test_s , use_s );
	signal cur : state;
   signal addr : integer range 0 to 675 :=0;
   signal epoch : integer range 0 to 61 :=0;	
begin

  process(clk,reset)
    
  begin
    
	  if reset='1' then  train_test<='0' ; use_mode<='0' ; register_reset<='1'; addr<=0; cur<=train_s;
	  elsif (clk'event and clk='1') then
		  
		  case cur is
		  
				
				when train_s => register_reset<='0' ; 
				                if epoch<60 then
									    if addr<674 then 
									    addr<=addr+1;
										 elsif addr=674 then  epoch<=epoch+1;addr<=0;   if(epoch=59)then cur<=test_s; train_test<='1'; end if;
										 end if;
                            end if;
                            

									 
			  when test_s =>	if addr<74 then 				 
	                         addr<=addr+1;
									 else  cur<=use_s; use_mode<='1';			
                            end if;
									 
			  when use_s => use_mode<='1';	
        	  
			  
			  end case;
			  
		end if;
			  
 end process;	

 addr_out <= conv_std_logic_vector(addr,10); 


end Behavioral;

