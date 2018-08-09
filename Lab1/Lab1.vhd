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
	a:		in std_logic;
	clock:		in std_logic;
	reset:		in std_logic;
	l0:		out std_logic;
	l1:		out std_logic;
	l2:		out std_logic;
	l3:		out std_logic;
	l4:		out std_logic;
	l5:		out std_logic;
	l6:		out std_logic
);
end lab1;

-----------------------------------------------------

architecture FSM of lab1 is

    -- define the states of FSM model

    type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15);
    signal next_state, current_state: state_type;

begin
    
    -- cocurrent process#1: state registers
    state_reg: process(clock, reset)
    begin

	if (reset='1') then
            current_state <= S0;
	elsif (clock'event and clock='1') then
	    current_state <= next_state;
	end if;

    end process;						  

    -- cocurrent process#2: combinational logic
    comb_logic: process(current_state, a)
    begin

	-- use case statement to show the 
	-- state transistion

	case current_state is

	    when S0 =>	
				l0 	<= '0';
				l1		<= '0';
				l2		<= '0';
				l3		<= '0';
				l4		<= '0';
				l5		<= '0';
				l6		<= '1';
			if a='0' then
			    next_state <= S0;
			elsif a ='1' then
			    next_state <= S1;
			end if;

	    when S1 =>					
				l0		<= '1';
				l1		<= '0';
				l2		<= '0';
				l3		<= '1';
				l4		<= '1';
				l5		<= '1';
				l6		<= '1';
			if a='0' then 
			    next_state <= S1;
			elsif a='1' then 
			    next_state <= S2;
			end if;

	    when S2 =>	
				l0		<= '0';
				l1		<= '0';
				l2		<= '1';
				l3		<= '0';
				l4		<= '0';
				l5		<= '1';
				l6		<= '0';
			if a='0' then
			    next_state <= S2;
			elsif a='1' then
			    next_state <= S3;
			end if;

	    when S3 =>					
				l0		<= '0';
				l1		<= '0';
				l2		<= '0';
				l3		<= '0';
				l4		<= '1';
				l5		<= '1';
				l6		<= '0';
			if a='0' then 
			    next_state <= S3;
			elsif a='1' then 
			    next_state <= S4;
			end if;
			
		when S4 =>					
				l0		<= '1';
				l1		<= '0';
				l2		<= '0';
				l3		<= '1';
				l4		<= '1';
				l5		<= '0';
				l6		<= '0';
			if a='0' then 
			    next_state <= S4;
			elsif a='1' then 
			    next_state <= S5;
			end if;
			
		when S5 =>					
				l0		<= '0';
				l1		<= '1';
				l2		<= '0';
				l3		<= '0';
				l4		<= '1';
				l5		<= '0';
				l6		<= '0';
			if a='0' then 
			    next_state <= S5;
			elsif a='1' then 
			    next_state <= S6;
			end if;
			
		when S6 =>					
				l0		<= '0';
				l1		<= '1';
				l2		<= '0';
				l3		<= '0';
				l4		<= '0';
				l5		<= '0';
				l6		<= '0';
			if a='0' then 
			    next_state <= S6;
			elsif a='1' then 
			    next_state <= S7;
			end if;
			
		when S7 =>					
				l0		<= '0';
				l1		<= '0';
				l2		<= '0';
				l3		<= '1';
				l4		<= '1';
				l5		<= '1';
				l6		<= '1';
			if a='0' then 
			    next_state <= S7;
			elsif a='1' then 
			    next_state <= S8;
			end if;
			
		when S8 =>					
				l0		<= '0';
				l1		<= '0';
				l2		<= '0';
				l3		<= '0';
				l4		<= '0';
				l5		<= '0';
				l6		<= '0';
			if a='0' then 
			    next_state <= S8;
			elsif a='1' then 
			    next_state <= S9;
			end if;
			
		when S9 =>					
				l0		<= '0';
				l1		<= '0';
				l2		<= '0';
				l3		<= '1';
				l4		<= '1';
				l5		<= '0';
				l6		<= '0';
			if a='0' then 
			    next_state <= S9;
			elsif a='1' then 
			    next_state <= S10;
			end if;
			
			when S10 =>					
				l0		<= '0';
				l1		<= '0';
				l2		<= '0';
				l3		<= '1';
				l4		<= '0';
				l5		<= '0';
				l6		<= '0';
			if a='0' then 
			    next_state <= S10;
			elsif a='1' then 
			    next_state <= S11;
			end if;
			
			when S11 =>					
				l0		<= '1';
				l1		<= '0';
				l2		<= '0';
				l3		<= '0';
				l4		<= '0';
				l5		<= '1';
				l6		<= '0';
			if a='0' then 
			    next_state <= s11;
			elsif a='1' then 
			    next_state <= S12;
			end if;
			
			when S12 =>					
				l0		<= '0';
				l1		<= '1';
				l2		<= '1';
				l3		<= '0';
				l4		<= '0';
				l5		<= '0';
				l6		<= '1';
			if a='0' then 
			    next_state <= S12;
			elsif a='1' then 
			    next_state <= S13;
			end if;

			when S13 =>					
				l0		<= '1';
				l1		<= '0';
				l2		<= '0';
				l3		<= '0';
				l4		<= '0';
				l5		<= '1';
				l6		<= '0';
			if a='0' then 
			    next_state <= S13;
			elsif a='1' then 
			    next_state <= S14;
			end if;

			when S14 =>					
				l0		<= '0';
				l1		<= '1';
				l2		<= '1';
				l3		<= '0';
				l4		<= '0';
				l5		<= '0';
				l6		<= '0';
			if a='0' then 
			    next_state <= S14;
			elsif a='1' then 
			    next_state <= S15;
			end if;

			when S15 =>					
				l0		<= '0';
				l1		<= '1';
				l2		<= '1';
				l3		<= '1';
				l4		<= '0';
				l5		<= '0';
				l6		<= '0';
			if a='0' then 
			    next_state <= S15;
			elsif a='1' then 
			    next_state <= S0;
			end if;

	    when others =>
				l0		<= '1';
				l1		<= '1';
				l2		<= '0';
				l3		<= '1';
				l4		<= '1';
				l5		<= '0';
				l6		<= '1';
			next_state <= S0;

	end case;

    end process;

end FSM;

-----------------------------------------------------