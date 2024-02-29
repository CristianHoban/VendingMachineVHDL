

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_1164.all;

entity SUMATOR_1b is 
	port (a, b, cin: in std_logic;	   
	cout, s: out std_logic);
end SUMATOR_1b;

--}} End of automatically maintained section

architecture arh_sum_1b of SUMATOR_1b is
begin
	s <= a xor b xor cin;
	cout <= (a and b) or (a and cin) or (b and cin);
end arh_sum_1b;			   


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_1164.all;   

entity SUMATOR_8b is
	port(n1, n2: in std_logic_vector(7 downto 0);
	cin8b:in std_logic;
	sum: inout std_logic_vector(7 downto 0);
	cout8b: out std_logic);
end SUMATOR_8b;

architecture arh_sum_8b of SUMATOR_8b is   
component SUMATOR_1b is 
	port (a, b, cin: in std_logic;	   
	cout, s: out std_logic);
end component;	
signal c1, c2, c3, c4, c5, c6, c7:std_logic;
begin
Sum1: SUMATOR_1b port map(n1(0), n2(0), cin8b, c1, sum(0));
Sum2: SUMATOR_1b port map(n1(1), n2(1), c1, c2, sum(1));
Sum3: SUMATOR_1b port map(n1(2), n2(2), c2, c3, sum(2));
Sum4: SUMATOR_1b port map(n1(3), n2(3), c3, c4, sum(3));
Sum5: SUMATOR_1b port map(n1(4), n2(4), c4, c5, sum(4));
Sum6: SUMATOR_1b port map(n1(5), n2(5), c5, c6, sum(5));
Sum7: SUMATOR_1b port map(n1(6), n2(6), c6, c7, sum(6));
Sum8: SUMATOR_1b port map(n1(7), n2(7), c7, cout8b, sum(7));

end arh_sum_8b;
