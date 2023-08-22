--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:56:35 02/01/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/TestError_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestError
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
 
ENTITY TestError_testbench IS
END TestError_testbench;
 
ARCHITECTURE behavior OF TestError_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestError
    PORT(
         e_in : IN  std_logic_vector(14 downto 0);
         train_test : IN  std_logic;
         clk : IN  std_logic;
         e_test : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal e_in : std_logic_vector(14 downto 0) := (others => '0');
   signal train_test : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal e_test : std_logic_vector(19 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestError PORT MAP (
          e_in => e_in,
          train_test => train_test,
          clk => clk,
          e_test => e_test
        );

 clk <= not clk after 5 ns ;
 
 e_in <= conv_std_logic_vector(10000,15) after 17 ns ,   conv_std_logic_vector(10000,15) after 27 ns ,conv_std_logic_vector(-10000,15) after 37 ns ,
         	conv_std_logic_vector(-8000,15) after 47 ns ,   conv_std_logic_vector(1160,15) after 57 ns   ;
 
 
  train_test <= '1' after 35 ns ;

END;
