--------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: C3C Erik Thompson
--
-- Create Date:   20:38:27 02/13/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Erik.Thompson/Documents/Class Things/ECE281/Comp/Lab2_4Bit/Adder_Test.vhd
-- Project Name:  Lab2_4Bit
-- Target Device:  
-- Tool versions:  
-- Description:   Testbench for 4bit adder
-- 
-- VHDL Test Bench Created by ISE for module: FourBit_Add
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
USE ieee.numeric_std.ALL;
 
ENTITY Adder_Test IS
END Adder_Test;
 
ARCHITECTURE behavior OF Adder_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBit_Add
    PORT(
         Ain : IN  std_logic_vector(3 downto 0);
         Bin : IN  std_logic_vector(3 downto 0);
         Sum : OUT  std_logic_vector(3 downto 0);
			Pick : in std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic_vector(3 downto 0) := (others => '0');
   signal Bin : std_logic_vector(3 downto 0) := (others => '0');
	signal Pick : std_logic := '0';
 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
	signal Overflow : std_logic := '0';
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBit_Add PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Sum => Sum,
			 Pick => Pick
        );

 

   -- Stimulus process
   stim_proc: process
   begin		

	
	for i in 0 to 15 loop
		
		for j in 0 to 15 loop
		
			wait for 10 ns;
			
			Bin <= std_logic_vector(to_signed(j,4));
			--assert true Sum =(signed(Ain) + signed(Bin));
			--	report "the call failed";
		end loop;
		
		Ain <= std_logic_vector(to_signed(i,4));
	end loop;

wait for 10 ns;

Pick <= '1';
for i in 0 to 15 loop
		
		for j in 0 to 15 loop
		
			wait for 10 ns;
			
			Bin <= std_logic_vector(to_signed(j,4));
		end loop;
		
		Ain <= std_logic_vector(to_signed(i,4));
	end loop;
      wait;
   end process;

END;
