library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-----------------------------------------------------

entity lab1 is
port(	
	
	--inputs
	enable:		in std_logic;
	forward:		in std_logic;
	clock:		in std_logic;
	reset:		in std_logic;
	velocity:	in std_logic;
	select1:    in std_logic;
	select2:   in std_logic;
	
	
	--outputs
	display_right : out  STD_LOGIC_VECTOR (0 to 6); -- for the number(unit)
	display_left : out  STD_LOGIC_VECTOR (0 to 6); -- for the number2(hexena)

	-- display de current velocity
	display_velocity1 : out  STD_LOGIC_VECTOR (0 to 6); 
	display_velocity2 : out  STD_LOGIC_VECTOR (0 to 6);

   -- display the current increment
	display_increment : out  STD_LOGIC_VECTOR (0 to 6)
);
end lab1;

-----------------------------------------------------

architecture FSM of lab1 is

	signal clockTimer: integer:= 0; --2hz 
	signal count: integer := 0;
	signal increment: integer:= 1; -- future values 1,2,3
	
	signal number: std_logic_vector(7 downto 0):= "00000000";
	signal r1: std_logic_vector(3 downto 0);
	signal l1: std_logic_vector(3 downto 0);

begin

-- this process verify the number of the count
process(clock, reset, forward, enable) 
	
	begin
	
	if (reset='1') then
		number<="00000000";	
		
	elsif(rising_edge(clock))then
	   count <= count +1;
		 
		-- selection of the increment and decrement	
		if select2 = '0' and select1 = '1' then -- 1 in binary: 01
			increment <= 1;
		elsif select2 = '1' and select1 = '0' then -- 2 in binary: 10
			increment <= 2;
		elsif select2 = '1' and select1 = '1' then -- 3 in binary: 11
			increment <= 3;
		end if;
		
		if (count >= clocktimer)then
			count <= 0;
			if (enable = '1')then
				
				-- advance
				if (forward = '1') then
					number <= number + increment;
				elsif(forward = '0')then
					number <= number - increment;
				end if;
		
				
			end if;	
		end if; 
	end if;

end process;						  

 process(number) begin
 
		
		--Divide vector called number
		------------------------------------------------	
			r1(0) <= number(0);
			r1(1) <= number(1);
			r1(2) <= number(2);
			r1(3) <= number(3);
			--------------------------------------
			l1(0) <= number(4);
			l1(1) <= number(5);
			l1(2) <= number(6);
			l1(3) <= number(7);
		------------------------------------------------
		

		case r1 is
				when "0000" => display_right <= "0000001";--0
				when "0001" => display_right <= "1001111";--1
				when "0010" => display_right <= "0010010";--2
				when "0011" => display_right <= "0000110";--3
				when "0100" => display_right <= "1001100";--4
				when "0101" => display_right <= "0100100";--5	
				when "0110" => display_right <= "0100000";--6			
				when "0111" => display_right <= "0001111";--7		
				when "1000" => display_right <= "0000000";--8
				when "1001" => display_right <= "0001100";--9
				when "1010" => display_right <= "0001000";--A
            when "1011" => display_right <= "1100000";--b
				when "1100" => display_right <= "0110001";--c
				when "1101" => display_right <= "1000010";--d	
				when "1110" => display_right <= "0110000";--e	
				when others => display_right <= "0111000";--f	--"1111"
			end case;

		case l1 is
				when "0000" => display_left <= "0000001";--0
				when "0001" => display_left <= "1001111";--1
				when "0010" => display_left <= "0010010";--2
				when "0011" => display_left <= "0000110";--3
				when "0100" => display_left <= "1001100";--4
				when "0101" => display_left <= "0100100";--5	
				when "0110" => display_left <= "0100000";--6			
				when "0111" => display_left <= "0001111";--7		
				when "1000" => display_left <= "0000000";--8
				when "1001" => display_left <= "0001100";--9
				when "1010" => display_left <= "0001000";--A
            when "1011" => display_left <= "1100000";--b
				when "1100" => display_left <= "0110001";--c
				when "1101" => display_left <= "1000010";--d	
				when "1110" => display_left <= "0110000";--e	
				when others => display_left <= "0111000";--f	--"1111"
			end case;

		case clocktimer is
			when 12500000 =>  display_velocity2 <= "0010010"; 
									display_velocity1 <= "0000001"; --2.0hz
			when others => display_velocity2 <= "0000001";
								display_velocity1 <= "0100100"; -- 0.5hz
		end case;
		
		case increment is
			when 1 => display_increment <= "1001111" ; --1
			when 2 => display_increment <= "0010010" ; --2
			when others => display_increment <= "0000110" ; --3	
		end case;
	 

    end process;

process(velocity) begin
	 
		if(velocity = '1')then
			clocktimer <= 12500000; -- 2hz
		else
			clocktimer <= 50000000; -- 0,5hz
			
		end if;
		
end process;


end FSM;