LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparador IS
	PORT(A, B: IN std_logic_vector(3 DOWNTO 0);
			AigualB, AmenorB, AmayorB: OUT std_logic);
END comparador;

ARCHITECTURE solucion5 OF comparador IS
BEGIN
	AigualB<='1' WHEN A=B ELSE '0';
	AmenorB<='1' WHEN A<B ELSE '0';
	AmayorB<='1' WHEN A>B ELSE '0';
END solucion5;