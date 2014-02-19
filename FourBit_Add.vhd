----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: C3C Erik Thompson
-- 
-- Create Date:    18:48:20 02/13/2014 
-- Design Name: 	 Four Bit Adder
-- Module Name:    FourBit_Add - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	Structural/Behavioral design of a fourbit adder
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBit_Add is
    Port ( Ain : in  STD_LOGIC_VECTOR (3 downto 0);
           Bin : in  STD_LOGIC_VECTOR (3 downto 0);
			  Pick : in STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
			  Overflow : out std_logic);
			  
end FourBit_Add;

architecture Structural of FourBit_Add is

component Full_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component Full_Adder;

signal mid : std_logic_vector(3 downto 0);
signal carry : std_logic_vector(3 downto 0);
signal twoBin : std_logic_vector(3 downto 0);

begin 

mid <= Bin;	
twoBin <= mid when Pick = '0' else
			STD_LOGIC_VECTOR (SIGNED(not mid)+1) when Pick = '1';
			


Bit0: component Full_Adder
	port map (A => Ain(0),
				 B => twoBin(0),
				 Cin => '0',
				 Sum => Sum(0),
				 Cout => carry(0)
				 );
				 
Bit1: component Full_Adder
	port map (A => Ain(1),
				 B => twoBin(1),
				 Cin => carry(0),
				 Sum => Sum(1),
				 Cout => carry(1)
				 );		
				 
Bit2: component Full_Adder
	port map (A => Ain(2),
				 B => twoBin(2),
				 Cin => carry(1),
				 Sum => Sum(2),
				 Cout => carry(2)
				 );

Bit3: component Full_Adder
	port map (A => Ain(3),
				 B => twoBin(3),
				 Cin => carry(2),
				 Sum => Sum(3),
				 Cout => carry(3)
				 );

				 
Overflow <= carry(3) xor carry(2); 
				

end Structural;

