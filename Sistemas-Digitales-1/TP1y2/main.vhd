----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:33 09/29/2019 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( P1 : in  STD_LOGIC;
           P2 : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           L : out  STD_LOGIC);
end main;

architecture Behavioral of main is
signal a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16: std_logic;--describe transiciones del petri
signal e1,e2,e3,e4,e5,e6,e7,e8,e9,e10,e11: std_logic;--describe estados del petri
signal ct5,ft5: std_logic; signal cuenta: integer :=0; --describe temporizador
begin

------ TRANSICIONES------
a1<= e1 and P1 and (not P2);
a2<= e2 and (not P1);
a3<= e3 and P1;
a4<= e4 and (not ft5)and (not P1);
a5<= e1 and P2 and (not P1);
a6<= e6 and (not P2);
a7<= e7 and P2;
a8<= e8 and (not ft5)and (not P2);
a9<= e3 and P2;
a10<= e10 and (not P1);
a11<= e9 and (not P2);
a12<= e7 and P1;
a13<= e7 and ft5;
a14<= e3 and ft5;
a15<= e5 and (P1 or P2);
a16<= e11 and (not P1) and (not P2);
------------------------------------
----MARCADO Y DESMARCADO DE LUGARES----
process (reset, clock)
begin
--- marcado inicial---
if reset= '1' then
	e1<= '1'; e2<='0'; e3<='0'; e4<='0'; e5<='0'; e6<='0'; e7<='0'; e8<='0'; e9<='0'; e10<='0'; e11<='0';
	elsif(clock'event and clock='1') then
			if a1='1' then e2<='1'; e1<='0';end if;
			if a2='1' then e3<='1'; e2<='0'; end if;
			if a3='1' then e4<='1';e3<='0';end if;
			if a4='1' then e5<='1';e4<='0'; end if;
			if a5='1' then e6<='1';e1<='0'; end if;
			if a6='1' then e7<='1';e6<='0'; end if;
			if a7='1' then e8<='1'; e7<='0'; end if;
			if a8='1' then e5<='1'; e8<='0'; end if;
			if a9='1' then e9<='1'; e3<='0'; end if;
			if a10='1' then e3<='1'; e10<='0'; end if;
			if a11='1' then e7<='1'; e9<='0';end if;
			if a12='1' then e10<='1'; e7<='0'; end if;
			if a13='1' then e1<='1';e3<='0'; end if;
			if a14='1' then e1<='1';e3<='0'; end if;
			if a15='1' then e11<='1';e5<='0'; end if;
			if a16='1' then e1<='1';e11<='0';end if;
end if;
end process;
---- salidas----
ct5 <= e3 or e7;
L <=	e5;


---clock
process(reset, clock)
begin
if reset ='1' then ft5<='0';cuenta<=0;
elsif (clock'event and clock='1')then
		cuenta <= cuenta +1;
		if cuenta >=7 then 
			ft5<= '1';
			cuenta <= 0;
		end if;
end if;
end process;
end Behavioral;

