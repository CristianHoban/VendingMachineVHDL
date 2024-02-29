library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity reg_univ is
	port( 
	d_in : in std_logic_vector (7 downto 0);
	en, r, clk: in std_logic;
	q : out std_logic_vector(7 downto 0));
end entity; 

architecture arh_reguniv of reg_univ is
signal q1 : std_logic_vector(7 downto 0) := "00000000";
begin
process(en, r, clk, d_in)
begin							   
	if(en = '1') then 
		if(r = '1')then
			q1 <= "00000000";
		elsif(clk'event and clk = '1') then
			q1<=d_in; --incarcare paralela
		end if;
		end if;
end process;
q<= q1;
end architecture;