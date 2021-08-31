LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY contador IS
	PORT( Resetn,Clock,En: IN STD_LOGIC;
			Decena,Unidad: BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0));
END contador;

ARCHITECTURE solucion3 of contador IS
BEGIN 
	PROCESS(Resetn,Clock)
	BEGIN
		IF Resetn='0' THEN 
			Decena<="0000";
			Unidad<="0000";
		ELSIF (Clock'EVENT AND Clock='1') THEN
			IF En='1' THEN
				IF Unidad="1001" THEN
					Unidad<="0000";
					IF Decena="1001" THEN
						Decena<="0000";
					ELSE
						Decena<=Decena+'1';
					END IF;
				ELSE 
					Unidad<=Unidad+'1';
				END IF;
			END IF;
		END IF;
	END PROCESS;
END solucion3;