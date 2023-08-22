--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:49:28 01/31/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/DSIGMOID_ROM_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DSIGMOID_ROM
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
use IEEE.STD_LOGIC_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DSIGMOID_ROM_testbench IS
END DSIGMOID_ROM_testbench;
 
ARCHITECTURE behavior OF DSIGMOID_ROM_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DSIGMOID_ROM
    PORT(
         x : IN  std_logic_vector(13 downto 0);
         y : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(11 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DSIGMOID_ROM PORT MAP (
          x => x,
          y => y
        );

   x <= (conv_std_logic_vector(1200,14)) after 100 ns , (conv_std_logic_vector(5000,14)) after 200 ns , (conv_std_logic_vector(9500,14)) after 300 ns ;

END;
