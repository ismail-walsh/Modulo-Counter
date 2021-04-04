library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity modulo_register is
	PORT (
			Clock	  : IN	STD_LOGIC;
			Reset	  : IN	STD_LOGIC;
			mod_value : IN STD_LOGIC_VECTOR (4 DOWNTO 0); --A 4-bit bus that is used to set the maximum value the counter can count up to. The value of the bus is set when the counter is reset
			Cnt : OUT	STD_LOGIC_VECTOR (4 downto 0)
		  );
end modulo_register;

architecture Behavioral of modulo_register is

begin

PROCESS(CLOCK,RESET) --asynchronous reset
BEGIN
  IF RESET = "1" THEN 
      cnt <= "0000";
  ELSIF RISING_EDGE(CLOCK)THEN 
      mod_value <= cnt;
  END IF;
END PROCESS;


	 
end Behavioral;