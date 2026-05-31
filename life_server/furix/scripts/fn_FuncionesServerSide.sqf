// By FuRixX Lamborghini \\


"FuRixX_AdminInvisible" addPublicVariableEventHandler {

	_parametros = _this select 1;

	_objeto = _parametros select 0;
	_estado = _parametros select 1;
	
	_objeto hideObjectGlobal _estado;

};

"FuRixX_AdminZeus" addPublicVariableEventHandler {

	_Paramentros = _this select 1;
	_UID = _Paramentros select 0;
	_NombreEnString = _Paramentros select 1;

	_Codigo = format [' 
		FuRixX_ZeusGrupo_%1 = createCenter sideLogic;  
		FuRixX_ZeusGrupo_%1 = createGroup sideLogic;  
		
		FuRixX_Zeus_%1%3 = FuRixX_ZeusGrupo_%1 createUnit ["ModuleCurator_F",[0,0,0],[],0,"NONE"];  
		FuRixX_Zeus_%1%3 setVehicleVarname "FuRixX_Zeus_%1%3";  
		
		FuRixX_Zeus_%1%3 setVariable ["Owner", ""];  
		FuRixX_Zeus_%1%3 setVariable ["Name", ""];  
		FuRixX_Zeus_%1%3 setVariable ["Addons", 2];  
		FuRixX_Zeus_%1%3 setVariable ["Forced", 0];  
			
		FuRixX_Zeus_%1%3 synchronizeObjectsAdd [%2];  
		%2 assignCurator FuRixX_Zeus_%1%3;  
		
		', _UID, _NombreEnString, round(random 99999)
	]; 
	 
	[] spawn (compile _Codigo);
	
};

// By FuRixX Lamborghini \\