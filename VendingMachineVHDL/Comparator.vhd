---------------------------------------------------------------------------------------------------
--
-- Title       : Comparator
-- Design      : Automat
-- Author      : Cristian
-- Company     : PERSONAL
--
---------------------------------------------------------------------------------------------------
--
-- File        : Comparator.vhd
-- Generated   : Thu May 19 02:46:00 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Comparator} architecture {Comparator}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comparator_2b is 
	port(n1, n0,m1, m0: in std_logic;
	maimic,maimare,egalitate:out std_logic);
end entity;

architecture arh_comp_2b of comparator_2b is
begin
	process(n1, n0,m1, m0)
	begin
		if(n1>m1 or (n1=m1 and n0>m0))then
		egalitate<='0';
			maimare<='1';
			maimic<='0';
		end if;
		if(n1<m1 or (n1=m1 and n0<m0))then
			egalitate<='0';
			maimare<='0';
			maimic<='1';
		end if;	
		if(n1=m1 and n0=m0)then
			egalitate<='1';
			maimare<='0';
			maimic<='0';
		end if;

end process;
end arh_comp_2b;


library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comparator_8b is
	port(a, b: in std_logic_vector(7 downto 0);
	Mic, Mare, Egal: out std_logic);
end comparator_8b;

architecture arh_comp_8b  of comparator_8b is	

component comparator_2b is 
	port(n1, n0,m1, m0: in std_logic;
	maimic,maimare,egalitate:out std_logic);
end component;

signal Mic1, Mare1, Egal1, Mic2, Mare2, Egal2, Mic3, Mare3, Egal3, Mic4, Mare4, Egal4:std_logic;
begin	 
	comp1: comparator_2b port map(a(7), a(6), b(7), b(6), Mic1, Mare1, Egal1);
	comp2: comparator_2b port map(a(5), a(4), b(5), b(4), Mic2, Mare2, Egal2);
	comp3: comparator_2b port map(a(3), a(2), b(3), b(2), Mic3, Mare3, Egal3);
	comp4: comparator_2b port map(a(1), a(0), b(1), b(0), Mic4, Mare4, Egal4);	
	
	Mare<= Mare1 or(Egal1 and Mare2) or (Egal1 and Egal2 and Mare3) or (Egal1 and Egal2 and Egal3 and Mare4);
	Mic<= Mic1 or(Egal1 and Mic2) or (Egal1 and Egal2 and Mic3) or (Egal1 and Egal2 and Egal3 and Mic4); 
	Egal<= Egal1 and Egal2 and Egal3 and Egal4;
		end arh_comp_8b;
		
	

