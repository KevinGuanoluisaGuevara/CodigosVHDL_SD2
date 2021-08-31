LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY MSS IS
	PORT( Resetn,Clock: IN STD_LOGIC;
		   Start,senal,Seconds2: IN STD_LOGIC;
		   pulso1,pulso2,Resetn0,En2,Sel: OUT STD_LOGIC);
END MSS;

ARCHITECTURE solucion7 OF MSS IS
	TYPE estado IS (Ta, Tb, Tc, Td, Te, Tf);
	SIGNAL y: estado;
BEGIN
	PROCESS(Resetn,Clock)
	BEGIN
		IF Resetn='0' THEN y<=Ta;
		ELSIF (Clock'EVENT AND Clock='1') THEN
			CASE y IS
				WHEN Ta=>
					IF Start='0' THEN y<=Ta;
					ELSE y<=Tb; END IF;
				WHEN Tb=>
					IF Start='1' THEN y<=Tb;
					ELSE y<=Tc; END IF;
				WHEN Tc=>
					IF senal='1' THEN y<=Td;
					ELSE y<=Tc; END IF;
				WHEN Td=>
					IF senal='1' THEN y<=Td;
					ELSE y<=Te; END IF;
				WHEN Te=>
					IF Seconds2='1' THEN y<=Tf;
					ELSE y<=Te; END IF;
				WHEN Tf=>
					y<=Tc;
			END CASE;
		END IF;
	END PROCESS;
	
	PROCESS(y,Start,senal,Seconds2)
	BEGIN
		CASE y IS
			WHEN Tc=>
				Sel<='1';
				pulso2<='0';
				Resetn0<='0';
			WHEN Td=>
				pulso2<='0';
				Resetn0<='0';
				IF senal='0' THEN pulso1<='1';
				END IF;
			WHEN Te=>
				Sel<='0';
				pulso1<='0';
				En2<='1';
				pulso2<='0';
				Resetn0<='1';
				IF Seconds2='0' THEN pulso2<='1';
				END IF;
			WHEN Tf=>
				pulso2<='0';
				Sel<='1';
				Resetn0<='0';
				En2<='1';
			WHEN OTHERS=>
				pulso1<='0';
				pulso2<='0';
				Resetn0<='0';
		END CASE;
	END PROCESS;
END solucion7;