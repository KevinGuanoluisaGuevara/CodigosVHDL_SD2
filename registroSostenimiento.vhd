LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registroSostenimiento IS
	PORT( Resetn,Clock,En: IN STD_LOGIC;
			Entrada: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END registroSostenimiento;

ARCHITECTURE solucion2 OF registroSostenimiento IS
BEGIN
	PROCESS(Resetn, Clock)
	BEGIN
		IF Resetn='0' THEN 
			Q<="00000000";
		ELSIF (Clock'EVENT AND Clock='1') THEN
			IF En='1' THEN 
				Q<=Entrada;
			END IF;
		END IF;
	END PROCESS;
END solucion2;