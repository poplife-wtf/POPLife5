
if (hasinterface) exitWith {
	diag_log "** Hostias un player ejecutando limpiador WTF!! **";
};

/*

	Limpiador Chungo por AxE
	para Pop 4
	!ojo !! max cada 20 minutos.
	
	Uso:

	fnc_limpiador_chungo = compileFinal preprocessFileLineNumbers "axe_hc\limpiadorChungo.sqf";

	[] spawn {

		while {true} do {        

			[] call fnc_limpiador_chungo;

		sleep (60 * 20);
		};
	};

*/


		{                    
			if ({alive _x} count crew _x == 0) then {
			if (count (_x nearEntities ["Man", 30]) < 1) then {
				if !(_x getVariable ["persistent",false]) then {
					deleteVehicle _x;
					_i = _i + 1;
				};
				};
			};
		} forEach vehicles;

		{ 
		
		if (str _x find ": <no shape>" > -1) then { 
        deleteVehicle _x; 
		};  
     
		} forEach (allMissionObjects "");
		
		
		{
		if !(_x getVariable ["persistent",false]) then {
		deletevehicle agent _x
		};
		} forEach agents;

