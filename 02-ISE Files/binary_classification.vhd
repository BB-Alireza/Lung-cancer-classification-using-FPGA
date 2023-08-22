----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:04:31 02/02/2020 
-- Design Name: 
-- Module Name:    binary_classification - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_classification is

port ( my_x1 , my_x2 : in  std_logic_vector(13 downto 0);
       clk , reset   : in  std_logic;
		 output        : out std_logic_vector(13 downto 0);
		 error_of_tset  : out std_logic_vector(19 downto 0)
		);
		
end binary_classification;

architecture structural of binary_classification is

  component BackPropagation 
  port(   dsig : in std_logic_vector ( 11 downto 0) ;
          e    : in std_logic_vector ( 14 downto 0) ;
	   	 delta: out std_logic_vector( 14 downto 0) 
		  );
  end component;
  
  component CONTROL_UNIT 
  generic(num_of_train : integer range 0 to 1000:=675 ;
          num_of_test  : integer range 0 to 1000:=75 );
				 
		port( clk,reset : in std_logic ;
		      train_test , use_mode , register_reset : out std_logic ; 
				addr_out : out std_logic_vector(9 downto 0) 
			  );
		
  end component;
  
  component DATASET_ROM
  generic(num_of_train : integer range 0 to 1000:=674 ;
          num_of_test  : integer range 0 to 1000:=74 );
  Port(  
           addr : in std_logic_vector(9 downto 0);        --in  integer range 1 to (num_of_train );
			  train_test : in std_logic;                     -- train=0
           x1_out : out std_logic_vector(13 downto 0);    --out  integer range 0 to 8000;
			  x2_out : out std_logic_vector(13 downto 0);    --out  integer range 0 to 5000;
			  y_out  : out std_logic_vector(13 downto 0)     --out  integer range 0 to  10000);
		);   
  end component;
  
  component DSIGMOID_ROM
  Port(  x : in  std_logic_vector(13 downto 0);                               
	      y : out std_logic_vector(11 downto 0)
		 ); 
  end component;
  
  component ERROR_fcn
  port( o_in  :  in std_logic_vector ( 13 downto 0 );
        d_in  :  in std_logic_vector ( 13 downto 0 );
		  e_out :  out std_logic_vector ( 14 downto 0 )
		 );
  end component;
  
  component Feed_Forward
  port(      x1,x2:in std_logic_vector(13 downto 0);     --unsigned
	          w1,w2,b:in std_logic_vector(19 downto 0);      --signed
			    net:out std_logic_vector(18 downto 0)      --signed 
		 );                  
  end component;
  
  component MUX_usemode
  generic (n : integer range 0 to 100 := 14);
  port( x1 , x2 , my_x1 , my_x2 : in std_logic_vector(n-1 downto 0);
        use_mode : in std_logic ;
        x1_out , x2_out : out std_logic_vector(n-1 downto 0)
		 );
  end component;
  
  component SIGMOID_ROM
  Port(  x : in  std_logic_vector(18 downto 0);                               
	      y : out std_logic_vector(13 downto 0)
		);   
  end component;
  
  component TestError
  port( e_in : in std_logic_vector ( 14 downto 0 );          --signed
		   train_test , clk : in std_logic ;
		   e_test : out std_logic_vector ( 19 downto 0 )     --unsigned
		 );     
  end component;
  
  component Updater
   generic( n : integer range 0 to 10000 := 10000);
   port ( w1_in , w2_in , b_in : in std_logic_vector (19 downto 0);
        delta :  in std_logic_vector (14 downto 0);
		  x1,x2 :  in std_logic_vector (13 downto 0);
		  w1_out , w2_out , b_out : out std_logic_vector (19 downto 0)
		  );
  end component;
  
  component WB_REGISTER
   generic ( n : integer range 0 to 64 := 20 );
   port (w1_in , w2_in , b_in : in  std_logic_vector ( n-1 downto 0 );
          reset , clk , train_test , use_mode : in std_logic ;
		    w1_out , w2_out , b_out :  out std_logic_vector ( n-1 downto 0 )
			 );
   end component;

 signal addr : std_logic_vector(9 downto 0);
 signal train_test : std_logic;
 signal use_mode : std_logic;
 signal reset_register : std_logic;
 signal x11 , x22 : std_logic_vector(13 downto 0);
 signal x1 , x2 : std_logic_vector(13 downto 0);
 signal net : std_logic_vector(18 downto 0);
 signal w1 , w2 , b : std_logic_vector(19 downto 0);
 signal w1_n , w2_n , b_n : std_logic_vector(19 downto 0);
 signal dsig : std_logic_vector(11 downto 0);
 signal e : std_logic_vector(14 downto 0);
 signal d : std_logic_vector(13 downto 0);
 signal delta : std_logic_vector(14 downto 0);
 signal out_temp : std_logic_vector(13 downto 0);
 
begin

 u1 : BackPropagation port map(dsig , e ,delta);
 u2 : CONTROL_UNIT generic map(675 , 75) port map(clk  , reset , train_test , use_mode , reset_register , addr );
 u3 : DATASET_ROM  generic map(674 , 74) port map(addr ,train_test , x11 , x22 , d); 
 u4 : DSIGMOID_ROM port map(out_temp , dsig);
 u5 : ERROR_fcn port map(out_temp , d , e);
 u6 : Feed_Forward port map(x1 , x2 , w1 , w2 , b , net);
 u7 : MUX_usemode generic map(14) port map(x11 , x22 , my_x1 , my_x2 , use_mode , x1 , x2);
 u8 : SIGMOID_ROM port map(net , out_temp);
 u9 : TestError port map( e , train_test , clk , error_of_tset);
 u10: Updater generic map(10000)port map(w1 , w2 , b , delta , x11 , x22 , w1_n , w2_n , b_n);
 u11: WB_REGISTER generic map(20) port map(w1_n , w2_n , b_n , reset_register , clk , train_test , use_mode , w1 , w2 , b );
 
 output <= out_temp;
 
end ; 

