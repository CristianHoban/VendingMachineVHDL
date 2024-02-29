---------------------------------------------------------------------------------------------------
--
-- Title       : Dozator
-- Design      : Automat
-- Author      : Cristian
-- Company     : PERSONAL
--
---------------------------------------------------------------------------------------------------
--
-- File        : Dozator.vhd
-- Generated   : Fri May 20 00:47:09 2022
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
--{entity {Dozator} architecture {Dozator}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Dozator is 
	port(I, F0, F1, F2, F3, OK: inout std_logic; 
	CLK: inout std_logic;
	ResetD: in std_logic;
	E, FS, AT:inout std_logic;
	RM, ER: inout std_logic_vector(7 downto 0));
end Dozator;

--}} End of automatically maintained section

architecture arh_dozator of Dozator is
component reg_univ is
	port( 	
	d_in : in std_logic_vector (7 downto 0);
	en, r, clk: in std_logic;
	q : out std_logic_vector(7 downto 0));
end component; 						

component SUMATOR_8b is
	port(n1, n2: in std_logic_vector(7 downto 0);
	cin8b:in std_logic;
	sum: inout std_logic_vector(7 downto 0);
	cout8b: out std_logic);
end component;	 

component comparator_8b is
	port(a, b: in std_logic_vector(7 downto 0);
	Mic, Mare, Egal: out std_logic);
end component;		 

component Scazator_8b is
	port(n1, n2: in std_logic_vector(7 downto 0);
	bin8b:in std_logic;
	dif: inout std_logic_vector(7 downto 0);
	bout8b: out std_logic);
end component;

component Numarator_Indirect is
	port(d_in:  inout std_logic_vector (7 downto 0);
	clk, r, en, l:  in std_logic;
	q: out std_logic_vector (7 downto 0);
	c: out std_logic); 
end component;

component Poarta_SAU_3Intrari is 
	port(a, b, c:in std_logic;											
	q:out std_logic);
end component; 	 

signal Nr_Sucuri_Ramase:std_logic_vector(7 downto 0);
signal Nr_Sucuri_Introduse, Rest: std_logic_vector(7 downto 0);
signal r_numarator, en_numarator, l_numarator:std_logic;
signal  Moneda_curenta, Sum_curenta, SUMAA, SUMA:std_logic_vector(7 downto 0);
signal cin8b, cout8b: std_logic;  
signal Mic, Mare, Egal: std_logic;
signal en_registru, r_registru:std_logic;
signal bout8b: std_logic; 
signal q_registru:std_logic_vector(7 downto 0);
type STARE is (Z, A, B, C, D, EE, F, G);
signal ST, NXST:STARE;

begin			
Numarator: Numarator_Indirect port map(Nr_Sucuri_Introduse, CLK, r_numarator, E, l_numarator,Nr_Sucuri_Ramase, FS);	
Poarta_SAU: Poarta_SAU_3Intrari port map(F0, F1, F2, F3); 
Sumator: SUMATOR_8b port map(Sum_curenta, Moneda_Curenta, cin8b, SUMA, cout8b);
Comparator: comparator_8b port map(SUMA, "01100100", Mic, Mare, Egal);
Registru: reg_univ port map(SUMA, en_registru, '0', CLK, q_registru);
Scazator: Scazator_8b port map(SUMA, "01100100", '0', Rest, bout8b);	
Nr_Sucuri_Ramase <= Nr_Sucuri_Introduse;
cin8b <= '0';

ACTUALIZARE_STARE: process(CLK, ResetD)
begin
	if(ResetD = '1') then ST <= A;
	elsif(CLK = '1' and CLK'EVENT) then ST <= NXST;
	end if;
	end process ACTUALIZARE_STARE;	
	
	
TRANZITII: process(ST, FS, I, F0, F1, F2, OK, Mic, Mare, Egal)
	begin
		case ST is
			when Z => NXST <= A;
			
			when A => if(FS = '0') then NXST <=B;
			else
				NXST <= Z;
				end if;
			when B => if(I = '1')then NXST <= C;
			else 
				NXST <= B;
			end if;
			when C=> if(F3 = '1') then NXST <= D;
			else 
				NXST <= B;
			end if;
			when D => if(OK = '1') then NXST <= EE;
			else
				NXST <= B;
			end if;
			when EE => if(Mic = '1') then NXST <= G;
			else
				NXST <= F;
			end if;
			when F => NXST <= A;
			when G=> NXST <= A;
			end case;
			end process TRANZITII;
			
			
--process(CLK)
--begin
	---if(Nr_Sucuri_Introduse > "00000000") then FS <='0'; end if;
	--Sum_curenta <= "00000000";
	--en_numarator <= '0'; 
--end process;

process(ST)
begin
	case ST is
		When Z => --Introducere Nr Sucuri in Automat
		l_numarator <= '1';
		
		when A => --Initializare
		E <= '0';
		OK <= '0';
		AT <='0';
		RM <= "00000000";
		ER <= "00000000"; 
		--en_registru <= '1';
		--l_numarator <= '0'; 
		--r_registru <= '0';
		Sum_curenta <= "00000000";
		SUMAA <= "00000000";
		--Moneda_curenta <= "00000000";
		
		
		when B => -- Verificare Introducere Moneda	  
		if(I = '1') then I<='1';
		else
			I <= '0';
		end if;
		
		when C => --Verificare Validare Moneda si Adunare la Suma Curenta
		if(F3 = '1') then 
			if(F0 = '1') then
				Moneda_Curenta <= "00000101"; 
				--CLK <= '0';
				--CLK <= '1';
				--Sum_curenta <= q_registru;
			elsif(F1 = '1') then
				Moneda_Curenta <= "00001010";
				--CLK <= '0';
				--CLK <= '1';
				--Sum_curenta <= q_registru; 
			elsif(F2 = '1') then
				Moneda_Curenta <= "00110010";
				--CLK <= '0';
				--CLK <= '1';
				--Sum_curenta <= q_registru;
			end if;	
			end if;
			
		When D => --OK
		if(OK = '1') then OK <='1';
			I<='0';
		else
			OK <= '0';
			Sum_Curenta <= SUMA; 
			--Sum_curenta <= q_registru;
		end if;	
		
		When EE => --Acceptare Total
		AT <= '1';
		
		When F => -- Eliberare Suc si Rest(daca e cazul)
		ER <= Rest;
		E <= '1';
		
		when G => --Nu s-au introdus destui bani - Acestia se inapoiaza
		RM <= SUMA;
		end case; 
		end process;
		
				
				


	
		

end arh_dozator;
																  