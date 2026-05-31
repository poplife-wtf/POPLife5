/*
fn_startRace.sqf //editado por rosen
Kevin Webb
Sets up the race for the "true_racers"
*/
params [["_racers", [], [[]]], ["_point", [], [[]]], ["_stake", 0, [0]]];

[_point,_stake] remoteExec ["life_fnc_initRace",_racers];
_winner = ObjNull;
_exit = false;
while {isNull _winner} do {
	{
		if(vehicle _x distance _point < 12) exitWith {_winner = _x};
	} forEach _racers;
};
_stake = parseNumber _stake;
[2,format["%1 ha ganado la carrera!",name _winner]] remoteExecCall ["life_fnc_broadcast",_racers];
{pop_din = pop_din + _stake;} remoteExecCall ["bis_fnc_call", _winner];
["raceDone",true] remoteExecCall ["life_fnc_netSetVar",_racers];