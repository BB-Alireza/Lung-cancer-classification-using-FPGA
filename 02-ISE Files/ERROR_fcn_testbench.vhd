--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:04:32 02/01/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/ERROR_fcn_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ERROR_fcn
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
 
ENTITY ERROR_fcn_testbench IS
END ERROR_fcn_testbench;
 
ARCHITECTURE behavior OF ERROR_fcn_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ERROR_fcn
    PORT(
         o_in : IN  std_logic_vector(13 downto 0);
         d_in : IN  std_logic_vector(13 downto 0);
         e_out : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal o_in : std_logic_vector(13 downto 0) := (others => '0');
   signal d_in : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal e_out : std_logic_vector(14 downto 0);

 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ERROR_fcn PORT MAP (
          o_in => o_in,
          d_in => d_in,
          e_out => e_out
        );

 d_in <= conv_std_logic_vector(10000,14) after 100 ns ,   conv_std_logic_vector(10000,14) after 200 ns ,conv_std_logic_vector(10000,14) after 300 ns ,
         	conv_std_logic_vector(10000,14) after 400 ns ,   conv_std_logic_vector(0,14) after 500 ns   ;
 o_in <= conv_std_logic_vector(0,14) after 100 ns     ,   conv_std_logic_vector(2000,14) after 200 ns  ,conv_std_logic_vector(0,14) after 300 ns  ,
          conv_std_logic_vector(2000,14) after 400 ns  ,   conv_std_logic_vector(1160,14) after 500 ns ;
 

END;
