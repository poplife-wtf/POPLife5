// By FuRixX Lamborghini \\

//Enviar Funciones

FuncionesFuRixX = ["Autobuses","EmsAutoEquip", "SistemaLogs", "TiempoConectado", "Arreglos", "EncriptandoVariables", "Testers", "FuncionesBase", "AdminEspectear", "RedSocial"];
FuRixXTotal = count FuncionesFuRixX;

for "_idx" from 0 to FuRixXTotal -1 do {
	FuRixXResultado = "";
	FuRixXResultado = format ["FuRixX_fnc_%1", FuncionesFuRixX select _idx];
	publicVariable FuRixXResultado;
};

///////////////////


//DiagLog
diag_log "**********************************************";
diag_log "***-Funciones FuRixX Enviadas Al Cliente-***";
diag_log "**********************************************";
/////////


[] spawn FuRixX_fnc_FuncionesServerSide;

// By FuRixX Lamborghini \\