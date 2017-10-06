library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bi_shifter is
	port(
	sil, sir : in std_logic;
	mode : in std_logic_vector(1 downto 0);
	datain : in std_logic_vector(7 downto 0);
	clk, reset: in std_logic;
	
	sol, sor : out std_logic;
	dataout  : out std_logic_vector(7 downto 0) );

end bi_shifter;


architecture lefty of bi_shifter is
	signal shift_register : std_logic_vector(7 downto 0);

begin

	process (clk, reset)
	begin	
	
		if reset = '1' then
			shift_register <= "00000000";
		
		elsif (clk'event and clk = '1') then
		
			case mode is
				when "00" =>
					sol <= shift_register(7);
					shift_register <= shift_register(6 downto 0) & sil;
					
				
				when "01" =>
					sor <= shift_register(0);
					shift_register <= sir & shift_register(7 downto 1);
				
				
				when "10" =>
					shift_register <= datain;
					
				when "11" =>
					null;
					
				when others =>
					null;
			end case;		
				
			
		
		
		end if;
		
		
	end process;
	
	dataout <= shift_register;

		
	
end lefty;
