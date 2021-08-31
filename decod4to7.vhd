LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decod4to7 IS
	PORT(entradas: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			   leds: OUT STD_LOGIC_VECTOR(1 TO 7));
END decod4to7;
	
ARCHITECTURE solucion6 OF decod4to7 IS
BEGIN
	PROCESS(entradas)
	BEGIN
		CASE entradas IS
			WHEN "0000" => leds <= "1111110";
			WHEN "0001" => leds <= "0110000";
			WHEN "0010" => leds <= "1101101";
			WHEN "0011" => leds <= "1111001";
			WHEN "0100" => leds <= "0110011";
			WHEN "0101" => leds <= "1011011";
			WHEN "0110" => leds <= "1011111";
			WHEN "0111" => leds <= "1110000";
			WHEN "1000" => leds <= "1111111";
			WHEN "1001" => leds <= "1111011";
			WHEN OTHERS => leds <= "-------";
		END CASE;
	END PROCESS;
END solucion6;