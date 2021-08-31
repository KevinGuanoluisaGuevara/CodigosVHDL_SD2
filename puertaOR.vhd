LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY puertaOR IS
	PORT(	Entrada: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			salida: OUT STD_LOGIC);
END puertaOR;

ARCHITECTURE solucion OF puertaOR IS

BEGIN
	PROCESS(Entrada)
		BEGIN
			salida<= Entrada(9) OR Entrada(8) OR Entrada(7) OR Entrada(6) OR Entrada(5) 
					OR Entrada(4) OR Entrada(3) OR Entrada(2) OR Entrada(1) OR Entrada(0);
	END PROCESS;
END solucion;