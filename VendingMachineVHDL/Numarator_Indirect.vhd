---------------------------------------------------------------------------------------------------
--
-- Title       : Numarator_Indirect
-- Design      : Automat
-- Author      : Cristian
-- Company     : PERSONAL
--
---------------------------------------------------------------------------------------------------
--
-- File        : Numarator_Indirect.vhd
-- Generated   : Thu May 19 21:27:17 2022
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
--{entity {Numarator_Indirect} architecture {Numarator_Indirect}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Numarator_Indirect is
port(d_in:  inout std_logic_vector (7 downto 0);
	clk, r, en, l:  in std_logic;
	q: out std_logic_vector (7 downto 0);
	c: out std_logic); 
end Numarator_Indirect;

architecture arh_num_indir of Numarator_Indirect is
begin
process(clk, en, r, l) 
variable m: std_logic_vector (7 downto 0):="00000000";
begin
	if (l='1') then 
			m:=d_in;	 
			c<='0';
elsif (en='1')	then
	if (CLK = '1' and CLK'event) then 
		if (r='1') then 
			m:="00000000";
		elsif (m>"00000001") then 
			m:=(m-'1');
		elsif(m="00000001") then 
			m:=(m-'1');
			c<='1';		
		end if;
	end if;	
end if;	
q<=m;
end process;
end arh_num_indir;
