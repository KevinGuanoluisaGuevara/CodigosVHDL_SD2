LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.archivoComponentes.all;

ENTITY atencionUsuarios IS
	PORT( Resetn,Clock,Start: IN STD_LOGIC;
			cabinas: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			displayDecena,displayUnidad: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END atencionUsuarios;

ARCHITECTURE solucionFinal OF atencionUsuarios IS

--Se definen las señales internas del Sistema
SIGNAL senal,Seconds2,pulso1,pulso2,Resetn0,Selector,En2: STD_LOGIC;
SIGNAL tiempoActual: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL menor,mayor: STD_LOGIC;
SIGNAL cabinaBCD,cabinaBCDActual: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL decena,decena00,unidad: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ticket,salidaActual,valorFinal: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL salidaDecena,salidaUnidad: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
		contador1: contador PORT MAP(Resetn0,Clock,pulso2,decena00,tiempoActual);
		
		comparador1: comparador PORT MAP(tiempoActual,"0001",Seconds2,mayor,menor);

		convertidorBCD1: convertidorBCD PORT MAP(Resetn,Clock,cabinas,cabinaBCD);
		
		registro1: registroSostenimiento PORT MAP(Resetn,Clock,pulso1,cabinaBCD,cabinaBCDActual);
	
		contador2: contador PORT MAP(Resetn,Clock,pulso1,decena,unidad);
		
		ticket<=decena&unidad;
		
		multiplexor1: mux2to1 PORT MAP(Selector,ticket,cabinaBCDActual,salidaActual);
		
		registro2: registroSostenimiento PORT MAP(Resetn,Clock,En2,salidaActual,valorFinal);
		
		salidaDecena<=valorFinal(7 DOWNTO 4);
		salidaUnidad<=valorFinal(3 DOWNTO 0);
		
		decodificador1: decod4to7 PORT MAP(salidaDecena,displayDecena);
		decodificador2: decod4to7 PORT MAP(salidaUnidad,displayUnidad);
		
		controlador: MSS PORT MAP(Resetn,Clock,Start,senal,Seconds2,pulso1,pulso2,Resetn0,En2,Selector);
		
		senal<=cabinas(0) OR cabinas(1) OR cabinas(2) OR cabinas(3) OR cabinas(4) OR cabinas(5) OR cabinas(6) OR cabinas(7) OR cabinas(8) OR cabinas(9);

END solucionFinal;