-----------------------------------------------------
-- VHDL FSM (Finite State Machine) modeling
-- (ESD book Figure 2.7)
-- by Weijun Zhang, 04/2001
--
-- FSM model consists of two concurrent processes
-- state_reg and comb_logic
-- we use case statement to describe the state 
-- transistion. All the inputs and signals are
-- put into the process sensitive list.  
-----------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;

-----------------------------------------------------

entity lab1 is
port(	
	enable:		in std_logic;
	forward:		in std_logic;
	clock:		in std_logic;
	reset:		in std_logic;
	display_right : out  STD_LOGIC_VECTOR (6 downto 0);
	display_left1 : out  STD_LOGIC_VECTOR (6 downto 0);
	
	number: in std_logic_vector(7 to 0)
	--number <= "00000000"
);
end lab1;

-----------------------------------------------------

architecture FSM of lab1 is

begin
   -- this process verify the number of the count
main: process(clock, reset) begin
	if (reset='1') then
		number<="00000000";
	elsif (number = "11111111") then
	
	elsif(clock'event and clock='1')then
	    
	end if;

    end process;						  

second: process(number) begin
	
		one: in std_logic_vector(7 to 0);
		--one <="0000001";
		r1: in std_logic_vector(3 to 0);
		l1: in std_logic_vector(3 to 0);
		
		
		--Logic of the problem
		------------------------------------------------
			if enable='1' then
				if forward='1' then
					 -- Move forward
					 number <= number + one;
				elsif forward='0' then
					 -- Move backward
					 number <= number - one;
					 
				end if;
				
			end if;

			--Divide vector called number
		------------------------------------------------	
			r1(0) <= number(4);
			r1(1) <= number(5);
			r1(2) <= number(6);
			r1(3) <= number(7);
			--------------------------------------
			l1(0) <= number(4);
			l1(1) <= number(5);
			l1(2) <= number(6);
			l1(3) <= number(7);
		------------------------------------------------
		
		--Call fuction
		------------------------------------------------
		display_right <= choose_output(r1);
		display_left <= choose_output(l1);
		------------------------------------------------
					 
		--Function
		------------------------------------------------
		  function choose_output (
			 number : in std_logic_vector(3 downto 0))
			 return std_logic_vector is
			 variable vector : std_logic_vector(6 downto 0);
		  begin
			 with number select
				 vector <="0000001" when "0000",--0
							"1001111"  when "0001",--1
							"0010010" when "0010",--2
							"0000110" when "0011",--3
							"1001100" when "0100",--4
							"0100100"  when "0101",--5
							"0100000" when "0110",--6
							"0001111"when "0111",--7
							"0000000" when "1000",--8
							"0001100" when "1001",--9
							"0001000"when "1010",--A
							"1100000" when "1011",--b
							"0110001" when "1100",--C
							"1000010" when "1101",--d
							"0110000"  when "1110",--e
							"0111000" when "1111",--f
							"0000000" when others;
			 return std_logic_vector(vector);
			 
		  end;
		-------------------------------------------------  

    end process;

end FSM;

-----------------------------------------------------