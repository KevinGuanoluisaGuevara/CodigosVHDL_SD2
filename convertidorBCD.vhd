LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY convertidorBCD IS
	PORT(	Resetn,Clock: IN STD_LOGIC;
			direccion: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			salida: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END convertidorBCD;

ARCHITECTURE solucion1 OF convertidorBCD IS
SIGNAL reglones: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL columnas: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
	PROCESS(direccion)
	BEGIN
		IF Resetn='0' THEN salida<="00000000";
		ELSIF (Clock'EVENT AND Clock='1') THEN
		
			reglones(0)<=direccion(3) OR direccion(2) OR direccion(1) OR direccion(0);
			reglones(1)<=direccion(7) OR direccion(6) OR direccion(5) OR direccion(4);
			reglones(2)<=direccion(9) OR direccion(8);
			
			columnas(0)<=direccion(0) OR direccion(4) OR direccion(8);
			columnas(1)<=direccion(1) OR direccion(5) OR direccion(9);
			columnas(2)<=direccion(2) OR direccion(6);
			columnas(3)<=direccion(3) OR direccion(7);
			
			IF reglones(0)='1' THEN
				IF columnas(0)='1' THEN salida<="00000001";
				ELSIF columnas(1)='1' THEN salida<="00000010";
				ELSIF columnas(2)='1' THEN salida<="00000011";
				ELSIF	columnas(3)='1' THEN salida<="00000100"; END IF;
			
			ELSIF reglones(1)='1' THEN
				IF columnas(0)='1' THEN salida<="00000101";
				ELSIF columnas(1)='1' THEN salida<="00000110";
				ELSIF columnas(2)='1' THEN salida<="00000111";
				ELSIF columnas(3)='1' THEN salida<="00001000"; END IF;
				
			ELSIF reglones(2)='1' THEN
				IF columnas(0)='1' THEN salida<="00001001";
				ELSIF columnas(1)='1' THEN salida<="00010000"; END IF;
				
			ELSE 
				salida<="00000000";
			END IF;
		END IF;
	END PROCESS;
END solucion1;