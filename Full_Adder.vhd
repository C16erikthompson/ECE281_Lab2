----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:35:24 02/10/2014 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

signal A_NOT, B_NOT, C_NOT, F, G, H, I, J, K, L, M, N, O, P: STD_LOGIC;

begin

A_NOT <= not A;
B_NOT <= not B;
C_NOT <= not Cin;
F <= Cin or B;
G <= F and A;
H <= Cin and B;
I <= B and Cin;
J <= B_NOT and C_NOT;
K <= I or J;
L <= B_NOT and Cin;
M <= C_NOT and B;
N <= L or M;
O <= A and K;
P <= A_NOT and N;
Sum <= O or P;
Cout <= G or H;

end Behavioral;

