/*
fn_duelRequest.sqf
Kevin Webb // Editado por Rosen 
Description: "1v1 me bro!"
*/
if(count life_racers == 0) exitWith {
	hint "No hay corredores.";
};
createDialog "apuesta_diag"; //Custom Rosen
waitUntil{apostado};
if(!(apostado)) exitWith {};
apostado = false;
_stake = ctrlText 7331;
if(!([_stake] call TON_fnc_isnumber)) exitWith {hint "Eso no es un numero.";};
_stake = parseNumber _stake;
if(_stake < 0 || _stake > pop_din) exitWith {hint "No tienes suficiente dinero en mano."; closeDialog 0;};
closeDialog 0;
//racing
waitUntil{closeDialog 0; sleep 0.1; !dialog};
openMap [true, false];
_finishLine = createMarkerLocal["salida",getPos player];
_finishLine setMarkerTypeLocal "mil_warning";
_finishLine setMarkerColorLocal "ColorRed";
_finishLine setMarkerTextLocal "SALIDA";
onMapSingleClick "life_race = _pos; true";
waitUntil{!isNil "life_race" || !visibleMap};
deleteMarkerlocal _finishLine;
if(!visibleMap) exitWith {hint "No has elegido el recorrido."; onMapSingleClick ""; life_racers = [];};
openMap [false, false];
onMapSingleClick "";
vehicle player enableSimulation false;
[] spawn {sleep 31; vehicle player enableSimulation true}; //failsafe!
[player,_stake,life_race] remoteExec ["life_fnc_duelRequested",life_racers];
{missionNameSpace setVariable[str _x + "racer",0]} forEach life_racers;
hint "Has mandado el reto, esperando respuesta...";
_time = time;
waitUntil{
	sleep 1;
	_test1 = {if(call compile (str _x + "racer") != 1) exitWith {false}; true} forEach life_racers;
	_test3 = {if(call compile (str _x + "racer") == -1) exitWith {true}; false} forEach life_racers; 
	time - _time > 20 || 
	_test1 ||  
	_test3
};
_test = {if(call compile (str _x + "racer") != 1) exitWith {true}; false} forEach life_racers;
if(_test) exitWith { 
	hint "No todos los participantes estan listos";
	life_race = nil; 
	life_racers = [];
	{missionNameSpace setVariable[str _x + "racer",nil]} forEach life_racers;
};
life_racers pushBack player;
[life_racers,life_race,_stake] remoteExec ["TON_fnc_startRace",2];
life_race = nil; 
{missionNameSpace setVariable[str _x + "racer",nil]} forEach life_racers; 
life_racers = [];