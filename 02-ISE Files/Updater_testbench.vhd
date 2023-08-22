--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:42:27 02/01/2020
-- Design Name:   
-- Module Name:   C:/Users/Javad Hasanpour/Desktop/FPGA Project/FPGA/BinaryClassification/Updater_testbench.vhd
-- Project Name:  BinaryClassification
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Updater
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
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Updater_testbench IS
END Updater_testbench;
 
ARCHITECTURE behavior OF Updater_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Updater
    PORT(
         w1_in : IN  std_logic_vector(19 downto 0);
         w2_in : IN  std_logic_vector(19 downto 0);
         b_in : IN  std_logic_vector(19 downto 0);
         delta : IN  std_logic_vector(14 downto 0);
         x1 : IN  std_logic_vector(13 downto 0);
         x2 : IN  std_logic_vector(13 downto 0);
         w1_out : OUT  std_logic_vector(19 downto 0);
         w2_out : OUT  std_logic_vector(19 downto 0);
         b_out : OUT  std_logic_vector(19 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal w1_in : std_logic_vector(19 downto 0) := (others => '0');
   signal w2_in : std_logic_vector(19 downto 0) := (others => '0');
   signal b_in : std_logic_vector(19 downto 0) := (others => '0');
   signal delta : std_logic_vector(14 downto 0) := (others => '0');
   signal x1 : std_logic_vector(13 downto 0) := (others => '0');
   signal x2 : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal w1_out : std_logic_vector(19 downto 0);
   signal w2_out : std_logic_vector(19 downto 0);
   signal b_out : std_logic_vector(19 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Updater PORT MAP (
          w1_in => w1_in,
          w2_in => w2_in,
          b_in => b_in,
          delta => delta,
          x1 => x1,
          x2 => x2,
          w1_out => w1_out,
          w2_out => w2_out,
          b_out => b_out
        );

  w1_in <= conv_std_logic_vector(150000,20) after 100 ns ;
  w2_in <= conv_std_logic_vector(300000,20) after 100 ns ;
  b_in <= conv_std_logic_vector(-156000,20) after 100 ns ;
  delta <= conv_std_logic_vector(-1400,15) after 100 ns ;
  x1 <= conv_std_logic_vector(9000,14) after 100 ns ;
  x2 <= conv_std_logic_vector(4000,14) after 100 ns ; 

END;
