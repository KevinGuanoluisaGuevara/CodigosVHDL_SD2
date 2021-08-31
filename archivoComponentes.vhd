LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

PACKAGE archivoComponentes IS

	COMPONENT divisorFrecuencia
		 PORT
		 (  CLOCK_10MHz     :IN   STD_LOGIC;
			 CLOCK_1MHz     :OUT  STD_LOGIC;
			 CLOCK_100KHz   :OUT  STD_LOGIC;
			 CLOCK_10KHz    :OUT  STD_LOGIC;
			 CLOCK_1KHz     :OUT  STD_LOGIC;
			 CLOCK_100Hz    :OUT  STD_LOGIC;
			 CLOCK_10Hz     :OUT  STD_LOGIC;
			 CLOCK_1Hz      :OUT  STD_LOGIC);
	END COMPONENT;

	COMPONENT MSS
		PORT( Resetn,Clock: IN STD_LOGIC;
				Start,senal,Seconds2: IN STD_LOGIC;
				pulso1,pulso2,Resetn0,En2,Sel: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT decod4to7
		PORT( entradas: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			   leds: OUT STD_LOGIC_VECTOR(1 TO 7));
	END COMPONENT;
	
	COMPONENT comparador
		port( A, B: in std_logic_vector(3 downto 0);
				AigualB, AmenorB, AmayorB: out std_logic);
	END COMPONENT;
	
	COMPONENT mux2to1
		port( Sel: in std_logic;
				D0, D1: in std_logic_vector (7 downto 0);
				Q: out std_logic_vector (7 downto 0));
	END COMPONENT;
	
	COMPONENT contador
			PORT( Resetn,Clock,En: IN STD_LOGIC;
					Decena,Unidad: BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT registroSostenimiento
		PORT( Resetn,Clock,En: IN STD_LOGIC;
				Entrada: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				Q: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT convertidorBCD
			PORT(	Resetn,Clock: IN STD_LOGIC;
					direccion: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
					salida: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	
END archivoComponentes;