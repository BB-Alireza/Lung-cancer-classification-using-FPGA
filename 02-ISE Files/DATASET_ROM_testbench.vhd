--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:38:25 01/30/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/DATASET_ROM_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATASET_ROM
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DATASET_ROM_testbench IS
END DATASET_ROM_testbench;
 
ARCHITECTURE behavior OF DATASET_ROM_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATASET_ROM
    PORT(
         addr : IN  std_logic_vector(9 downto 0);
         train_test : IN  std_logic;
         x1_out : OUT  std_logic_vector(13 downto 0);
         x2_out : OUT  std_logic_vector(13 downto 0);
         y_out : OUT  std_logic_vector(13 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal addr : std_logic_vector(9 downto 0) := (others => '0');
   signal train_test : std_logic := '0';

 	--Outputs
   signal x1_out : std_logic_vector(13 downto 0);
   signal x2_out : std_logic_vector(13 downto 0);
   signal y_out : std_logic_vector(13 downto 0);


 
BEGIN 
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATASET_ROM PORT MAP (
          addr => addr,
          train_test => train_test,
          x1_out => x1_out,
          x2_out => x2_out,
          y_out => y_out
        );

	train_test <= '1' after 180 ns ;
	addr <= "0000000001" after 10 ns , "1001011001" after 100 ns , "0001001010" after 210 ns , "0000000000" after 230 ns ;

END;
