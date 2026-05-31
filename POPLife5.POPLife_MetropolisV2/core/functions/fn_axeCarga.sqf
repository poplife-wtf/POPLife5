/*

By AxE
Guardamos en el Perfil información de posición coches y etc.

[[191,getPlayerUID player,[8574.39,6449.78,0.00143862],objNull,1,120],"TON_fnc_spawnVehicle",false,false] call life_fnc_MP;

*/


profileNameSpace setVariable ["axeRestart",false];

_arraycoches =  profileNameSpace getVariable ["coches",[]];
if !(_arraycoches isEqualTo []) then {
	
	{

	_vid = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	[[_vid,getPlayerUID player,_pos,player,1,_dir],"TON_fnc_spawnVehicle",false,false] call life_fnc_MP;
	
	sleep 2;

	} forEach _arraycoches;


};

sleep 5; 

hint "Tu progreso y vehiculos han sido restaurados tal como estaban, despues de dar un tiempo de gracia a los demas usuarios puedes continuar tu rol.";

