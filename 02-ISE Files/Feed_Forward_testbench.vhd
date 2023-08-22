--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:17:52 01/31/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/Feed_Forward_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Feed_Forward
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_signed.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Feed_Forward_testbench IS
END Feed_Forward_testbench;
 
ARCHITECTURE behavior OF Feed_Forward_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Feed_Forward
    PORT(
         x1 : IN  std_logic_vector(13 downto 0);
         x2 : IN  std_logic_vector(13 downto 0);
         w1 : IN  std_logic_vector(19 downto 0);
         w2 : IN  std_logic_vector(19 downto 0);
         b : IN  std_logic_vector(19 downto 0);
         net : OUT  std_logic_vector(18 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x1 : std_logic_vector(13 downto 0) := (others => '0');
   signal x2 : std_logic_vector(13 downto 0) := (others => '0');
   signal w1 : std_logic_vector(19 downto 0) := (others => '0');
   signal w2 : std_logic_vector(19 downto 0) := (others => '0');
   signal b : std_logic_vector(19 downto 0) := (others => '0');

 	--Outputs
   signal net : std_logic_vector(18 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Feed_Forward PORT MAP (
          x1 => x1,
          x2 => x2,
          w1 => w1,
          w2 => w2,
          b => b,
          net => net
        );
		  
		  x1<= (conv_std_logic_vector(8000,14)) after 100 ns ,(conv_std_logic_vector(2000,14)) after 400 ns ;
		  x2<= (conv_std_logic_vector(3000,14)) after 100 ns ,(conv_std_logic_vector(1000,14)) after 400 ns ;
		  w1<= (conv_std_logic_vector(154283,20)) after 100 ns ,(conv_std_logic_vector(160000,20)) after 400 ns ;
		  w2<= (conv_std_logic_vector(308660,20)) after 100 ns ,(conv_std_logic_vector(310000,20)) after 400 ns ; 
		  b <= (conv_std_logic_vector(-156339,20)) after 100 ns ,(conv_std_logic_vector(-160000,20)) after 400 ns ;
		  
END;

