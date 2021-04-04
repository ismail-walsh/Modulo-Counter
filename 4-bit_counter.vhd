LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Fourbit_counter IS 
    PORT (direction : in STD_LOGIC; --1 bit signal that causes the counter to count up or down
	       enable_count : in STD_LOGIC; --signal that causes the counter to increment or decrement when high
			 clock : in STD_LOGIC; --1 bit 50Mhz  clock signal 
			 reset : in STD_LOGIC; -- 1 bit reset line that puts counter back into original state
			 mod_value : in STD_LOGIC_VECTOR (15 DOWNTO 0); --A 4-bit bus that is used to set the maximum value the counter can count up to. The value of the bus is set when the counter is reset
			 output_counter : out STD_LOGIC_VECTOR (4 DOWNTO 0));
END Fourbit_counter;

ARCHITECTURE Structural OF Fourbit_counter IS

COMPONENT Clock_Divider IS
    PORT(Clock, Reset : IN STD_LOGIC;
         Clk_div : OUT STD_LOGIC
         );
			
END COMPONENT;

COMPONENT modulo_register IS
    PORT(Clock	  : IN	STD_LOGIC;
			Reset	  : IN	STD_LOGIC;
			mod_value : IN STD_LOGIC_VECTOR (4 DOWNTO 0); --A 4-bit bus that is used to set the maximum value the counter can count up to. The value of the bus is set when the counter is reset
			Cnt : OUT	STD_LOGIC_VECTOR (4 downto 0)
        );
		  
END COMPONENT;


signal clk_div1: STD_LOGIC;

signal counter: STD_LOGIC_VECTOR (4 DOWNTO 0);

BEGIN 

---Instatiation of Modulo_register

U1: modulo_register port map(cnt => counter);
						 
---Instatiation of a Clock_Divider

U2: Clock_Divider port map( clk_div => clk_div1);

END Structural;


ARCHITECTURE Behavioural OF Fourbit_counter IS
begin
						 
PROCESS(COUNTER) --Counter
BEGIN 
    IF  RESET = '1' THEN --Active High Reset hence Asynchronous Reset
	 output_counter <= "0000";
	 end if;
	  
	 if (direction = '0') & (enable_count = '1') THEN
	 output_counter <= "0000";
	 end if;
	     
	 if (direction = '0') & (rising_edge(clock)) & (enable_count = '1') THEN
	 output_counter <= output_counter + '1';
	 end if;
	 
	 if (direction = '1') & (enable_count = '1') THEN
	 output_counter <= "1111"; 
	 end if;
	 
	 if direction = '1' & (rising_edge(clock)) & (enable_count = '1')THEN
	 output_counter <= output_counter - '1';
	 
	 end if;
	 

END PROCESS;


PROCESS(Enable_count)
BEGIN 
    IF enable_count <= '0' THEN
	 output_counter <= output_counter;
end if;

END PROCESS;

END BEHAVIOURAL;



	  



	 --0000 Zero
	 --0001 One
	 --0010 Two
	 --0011 Three
	 --0100 Four
	 --0101 Five
	 --0110 Six
	 --0111 Seven
	 --1000 Eight
	 --1001 Nine
	 --1010 Ten