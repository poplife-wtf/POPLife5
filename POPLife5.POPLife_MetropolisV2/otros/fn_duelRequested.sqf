/*
fn_duelrequested.sqf
Kevin Webb //Editado por Rosen
Tells us someone wants to 1v1 us bro
*/
if(dialog) then {closeDialog 0};
params [["_dueler", objNull, [objNull]], ["_stake", 0, [0]], ["_point", [], [[]]]];

if(_stake > pop_din) exitWith {
	hint format["%1 te ha retado a una carrera, pero no tiene suficiente dinero.",name _dueler];
};
_wording = format[
"%1 te ha retado a una carrera. La apuesta es de %2€. La meta esta a %3m. Aceptas el duelo?",
name _dueler,
[_stake] call life_fnc_numberText,
round(player distance _point)
];
_action = [
	_wording,
	"Carrera",
	"Si",
	"No"
] call BIS_fnc_guiMessage;
life_racers = [];
if(_action) then {
	[str player + "racer",1] remoteExecCall ["life_fnc_netSetVar",_dueler];
	vehicle player enableSimulation false;
	[] spawn {sleep 29; vehicle player enableSimulation true}; //failsafe!
	hint "Carrera aceptada! Espera a que empiece.";
} else {
	[str player + "racer",-1] remoteExecCall ["life_fnc_netSetVar",_dueler];
};