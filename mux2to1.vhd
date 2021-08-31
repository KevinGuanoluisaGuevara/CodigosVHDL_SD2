LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux2to1 IS
	PORT( Sel: IN std_logic;
			D0, D1: IN std_logic_vector (7 DOWNTO 0);
			Q: OUT std_logic_vector (7 DOWNTO 0));
END mux2to1;

ARCHITECTURE solucion4 OF mux2to1 IS
SIGNAL temp: std_logic_vector (7 DOWNTO 0);

BEGIN
	PROCESS(Sel)
	BEGIN
		CASE Sel IS
			WHEN '0' => temp<=D0;
			WHEN '1' => temp<=D1;
		END CASE;
	END PROCESS;
Q<=temp;
END solucion4;