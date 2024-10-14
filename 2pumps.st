(*
Tienes un sistema de dos bombas en un tanque de agua. Las bombas deben activarse de manera alternada 
para evitar sobrecarga en una de ellas. Ambas bombas están conectadas al mismo tanque, y las condiciones para activarse son:
    Bomba 1: Se activa cuando el nivel de agua está por debajo de 40, pero solo si la Bomba 2 está apagada.
    Bomba 2: Se activa cuando el nivel de agua está por debajo de 40, pero solo si la Bomba 1 está apagada.
    Ambas bombas se detienen si el nivel de agua supera los 70.

    OJO , no se hace uso del boton de start es automático
 *)

// Declaración de variables
VAR
    start_button : BOOL;      // Botón de Start (NO)
    stop_button : BOOL;       // Botón de Stop (NC)
    water_level : INT ; // valor del sensor de sensor de temperatura 
    pump1 : BOOL := FALSE;    // Estado de la bomba (inicialmente apagado)
    pump2 : BOOL := FALSE;    // Estado de la bomba (inicialmente apagado)
    
END_VAR

// Lógica de control de la bomba
// Mantener la bomba encendida si se presiona start y 
IF water_level<40 THEN (*Si el nivel es inferior a 40L Pump1 o Pump2 tienen que encender *)
    IF NOT pump1 THEN;
        pump1:=TRUE;
        pump2:=FALSE ;
    ELSE
     pump1:= FALSE ;
     pump2:= TRUE ;
     
    END_IF
 END_IF

IF water_level>70 THEN // si el nivel es mayor que 70 desactivamos las dos bombas que estén en funcionamiento
    pump1:= FALSE ;
    pump2:= FALSE ; 

    END_IF

IF start_button AND (water_level<70) THEN
    IF NOT pump1
        pump1 := TRUE; 
        pump2 := FALSE;  // Iniciar la bomnba si se presiona start y el nivel es menor que 70, asegurar Pump2 está apagada   
    ELSIF NOT pump2 THEN // cuando la bomba 1 esté desactivada, estará funcionando la bomba 2 
        pump1 := FALSE ; 
        pump2 :=  TRUE ;        
    END_IF;
    
END_IF;

// Detener las bombas si se presiona Stop 
IF NOT stop_button THEN
    pump1 := FALSE;  // Detener la bomba1
    pump2:=FALSE; // Detener la bomba 2 
END_IF;