--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:29:30 01/30/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/SIGMOID_ROM_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SIGMOID_ROM
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
 
ENTITY SIGMOID_ROM_testbench IS
END SIGMOID_ROM_testbench;
 
ARCHITECTURE behavior OF SIGMOID_ROM_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SIGMOID_ROM
    PORT(
         x : IN  std_logic_vector(18 downto 0);
         y : OUT  std_logic_vector(13 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(18 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(13 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SIGMOID_ROM PORT MAP (
          x => x,
          y => y
        );

  x<= "0000000001110000100" after 20 ns , "0000010001100101000" after 40 ns , "1111111101101010000" after 60 ns , "0000111010100110000" after 80 ns ,"1110110001111000000" after 100 ns,
       (conv_std_logic_vector(100000,19)) after 120 ns , (conv_std_logic_vector(-120000,19)) after 140 ns;

END;
