--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:00:43 02/02/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/CONTROL_UNIT_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL_UNIT
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
 
ENTITY CONTROL_UNIT_testbench IS
END CONTROL_UNIT_testbench;
 
ARCHITECTURE behavior OF CONTROL_UNIT_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL_UNIT
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         train_test : OUT  std_logic;
         use_mode : OUT  std_logic;
         register_reset : OUT  std_logic;
         addr_out : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';

 	--Outputs
   signal train_test : std_logic;
   signal use_mode : std_logic;
   signal register_reset : std_logic;
   signal addr_out : std_logic_vector(9 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL_UNIT PORT MAP (
          clk => clk,
          reset => reset,
          train_test => train_test,
          use_mode => use_mode,
          register_reset => register_reset,
          addr_out => addr_out
        );
		  
		  clk<= not clk after 10ns;
		  reset<= '0' after 50 ns ;

END;

 
