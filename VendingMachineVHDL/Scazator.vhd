 ---------------------------------------------------------------------------------------------------
--
-- Title       : Scazator
-- Design      : Automat
-- Author      : Cristian
-- Company     : PERSONAL
--
---------------------------------------------------------------------------------------------------
--
-- File        : Scazator.vhd
-- Generated   : Thu May 19 20:04:42 2022
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
--{entity {Scazator} architecture {Scazator}}

library ieee;
use ieee.std_logic_1164.all;

entity SCAZATOR_1BIT is
	port(a,b, i: in std_logic;
	br,d: out std_logic);
end SCAZATOR_1BIT;

architecture arh of SCAZATOR_1BIT is
begin
	br<=((not a) and b) or ((not a) and i) or ( b and i);
	d<= a xor b xor i;
end architecture arh;  

library ieee;
use ieee.std_logic_1164.all;

entity Scazator_8b is
	port(n1, n2: in std_logic_vector(7 downto 0);
	bin8b:in std_logic;
	dif: inout std_logic_vector(7 downto 0);
	bout8b: out std_logic);
end Scazator_8b;

architecture arh_scaz_8b of Scazator_8b is   
Component SCAZATOR_1BIT is
	port(a,b, i: in std_logic;
	br,d: out std_logic);
end component;
signal c1, c2, c3, c4, c5, c6, c7:std_logic;
begin
Scaz1: Scazator_1bit port map(n1(0), n2(0), bin8b, c1, dif(0));
Scaz2: Scazator_1bit port map(n1(1), n2(1), c1, c2, dif(1));
Scaz3: Scazator_1bit port map(n1(2), n2(2), c2, c3, dif(2));
Scaz4: Scazator_1bit port map(n1(3), n2(3), c3, c4, dif(3));
Scaz5: Scazator_1bit port map(n1(4), n2(4), c4, c5, dif(4));
Scaz6: Scazator_1bit port map(n1(5), n2(5), c5, c6, dif(5));
Scaz7: Scazator_1bit port map(n1(6), n2(6), c6, c7, dif(6));
Scaz8: Scazator_1bit port map(n1(7), n2(7), c7, bout8b, dif(7));

end arh_scaz_8b;
