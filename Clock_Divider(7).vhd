-------------------------------------------------------------------------------------------
--    Project  : Programmable Up/Down Counter Design 
--    File     : Clock_Divider.vhd
--    Authors  : Alistair A. McEwan and Irfan Mir
--    Company  : University of Leicester
--    Date     : 10 March 2013
-------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Clock_Divider is
	GENERIC(LIMIT : integer := 2); 
	PORT (
			Clock	  : IN	STD_LOGIC;
			Reset	  : IN	STD_LOGIC;
			Clk_Div : OUT	STD_LOGIC
		  );
end Clock_Divider;

architecture Behavioral of Clock_Divider is
signal cnt : STD_LOGIC_VECTOR(31 downto 0);
begin

PC: process (Clock, Reset)						
	 begin
		if rising_edge(Clock) then
			if Reset = '1' then
				cnt <= (others => '0');
				Clk_Div <= '0';
			elsif cnt = LIMIT-1 then
				cnt <= (others => '0');
				Clk_Div <= '1';
			else
				cnt <= cnt+1;
				Clk_Div <= '0';
			end if;
		end if;
	 end process;
	 
end Behavioral;