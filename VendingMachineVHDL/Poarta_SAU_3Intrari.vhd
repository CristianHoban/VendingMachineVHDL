 ---------------------------------------------------------------------------------------------------
--
-- Title       : Poarta_SAU_3Intrari
-- Design      : Automat
-- Author      : Cristian
-- Company     : PERSONAL
--
---------------------------------------------------------------------------------------------------
--
-- File        : Poarta_SAU_3Intrari.vhd
-- Generated   : Thu May 19 22:05:12 2022
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
--{entity {Poarta_SAU_3Intrari} architecture {Poarta_SAU_3Intrari}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Poarta_SAU_3Intrari is 
	port(a, b, c:in std_logic;
	q:out std_logic);
end Poarta_SAU_3Intrari;

--}} End of automatically maintained section

architecture Poarta_SAU_3Intrari of Poarta_SAU_3Intrari is
begin
	q<=a or b or c;

end Poarta_SAU_3Intrari;
