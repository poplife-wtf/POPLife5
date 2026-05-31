/*

By AxE
Guardamos en el Perfil información de posición coches y etc.

[[191,getPlayerUID player,[8574.39,6449.78,0.00143862],objNull,1,120],"TON_fnc_spawnVehicle",false,false] call life_fnc_MP;

*/

if (!hasinterface) exitwith {};
sincronizo = false;
_arraycoches = [];

{
if (_x isKindOf "CAR") then {

	_vars = _x getVariable ["vehicle_info_owners",[]];
	_vars = _vars select 0;
	if (count _vars >= 1) then {
	_vid = _vars select 2;
	_posATL = getPos _x;
	_dir = getDir _x;
	_datos = [_vid,_posATL,_dir];
	_arraycoches pushback _datos;
	};

};
} forEach life_vehicles;

	profileNameSpace setVariable ["axeRestart",true];
	profileNameSpace setVariable ["coches",_arraycoches];

	//[3] remoteExec ["SOCK_fnc_updatePartial", player];
	
	//[] call SOCK_fnc_updateRequest;
	
	[true] call ica_fnc_guardaCargaMed;
	
	[true] spawn ica_fnc_posicion;
	
	systemchat "Se ha guardado tu progreso y la ubicación de tus coches en la db.";


