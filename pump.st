// Declaración de variables
VAR
    start_button : BOOL;      // Botón de Start (NO)
    stop_button : BOOL;       // Botón de Stop (NC)
    water_level : INT ; // valor del sensor de sensor de temperatura 
    pump : BOOL := FALSE;    // Estado de la bomba (inicialmente apagado)
END_VAR

// Lógica de control de la bomba
// Mantener la bomba encendida si se presiona start y 
IF start_button  OR (water_level<=70) THEN
    pump := TRUE;   // Iniciar la cinta si se presiona Start
END_IF;

// Detener la bomba si se presiona Stop o si se baja de 70 
IF NOT stop_button OR (water_level>70) THEN
    pump := FALSE;  // Detener la bomba
END_IF;


