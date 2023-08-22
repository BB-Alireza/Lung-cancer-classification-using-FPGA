--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:22:32 02/02/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/binary_classification_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: binary_classification
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;
use IEEE.STD_LOGIC_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY binary_classification_testbench IS
END binary_classification_testbench;
 
ARCHITECTURE behavior OF binary_classification_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binary_classification
    PORT(
         my_x1 : IN  std_logic_vector(13 downto 0);
         my_x2 : IN  std_logic_vector(13 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         output : OUT  std_logic_vector(13 downto 0);
         error_of_tset : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal my_x1 : std_logic_vector(13 downto 0) := (others => '0');
   signal my_x2 : std_logic_vector(13 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';

 	--Outputs
   signal output : std_logic_vector(13 downto 0);
   signal error_of_tset : std_logic_vector(19 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binary_classification PORT MAP (
          my_x1 => my_x1,
          my_x2 => my_x2,
          clk => clk,
          reset => reset,
          output => output,
          error_of_tset => error_of_tset
        );

  clk   <= not clk after 62 ns ;       --10ns
  reset <= '0' after 100 ns ;           -- 45ns
  my_x1 <= (conv_std_logic_vector(1000,14)) after 5000 us , (conv_std_logic_vector(8000,14)) after 5400 us , (conv_std_logic_vector(5000,14)) after 5600 us ;
  my_x2 <= (conv_std_logic_vector(500 ,14)) after 5000 us , (conv_std_logic_vector(3000,14)) after 5400 us , (conv_std_logic_vector(4000,14)) after 5600 us ;
  
END;
