--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:51:02 02/01/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/BackPropagation_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BackPropagation
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
 
ENTITY BackPropagation_testbench IS
END BackPropagation_testbench;
 
ARCHITECTURE behavior OF BackPropagation_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BackPropagation
    PORT(
         dsig : IN  std_logic_vector(11 downto 0);
         e : IN  std_logic_vector(14 downto 0);
         delta : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dsig : std_logic_vector(11 downto 0) := (others => '0');
   signal e : std_logic_vector(14 downto 0) := (others => '0');

 	--Outputs
   signal delta : std_logic_vector(14 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BackPropagation PORT MAP (
          dsig => dsig,
          e => e,
          delta => delta
        );

   dsig <= conv_std_logic_vector(2500,12) after 100 ns ,   conv_std_logic_vector(2500,12) after 200 ns ,conv_std_logic_vector(1200,12) after 300 ns     
 ,        conv_std_logic_vector(1200,12) after 400 ns ,   conv_std_logic_vector(30,12) after 500 ns   ;
  e <= conv_std_logic_vector(0,15) after 100 ns     ,   conv_std_logic_vector(-10000,15) after 200 ns  ,conv_std_logic_vector(0,15) after 300 ns    
 ,       conv_std_logic_vector(2000,15) after 400 ns  ,   conv_std_logic_vector(1160,15) after 500 ns ;
 
END;
