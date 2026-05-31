/*
	File: fn_startTrackAction.sqf
	Author: Akryllax
	Desc: Starts a race!
*/

private["_raceID"];

_raceID = [_this select 3, 0, "", [""]] call BIS_fnc_param;
_conf   = [_raceID] call life_fnc_raceConf;
_mode 	= _conf select 0;
_price = [_conf, 1, -1, [-1]] call BIS_fnc_param;

if(inRace || (count currentTrackOrbs) > 0) exitWith {
	hint "Ya estas compitiendo";
};

if(_price < 0) exitWith {
	hint "Error";
};

_FuRixX_Fuera = 0;

if(_mode == 1) then {
	if(missionNamespace getVariable[("license_civ_driver"),false]) exitWith {
		hint "Ya tienes el permiso de conducir!";
		_FuRixX_Fuera = 1;
	};
};

if(_mode == 2) then {
	if(missionNamespace getVariable[("license_civ_truck"),false]) exitWith {
		hint "Ya tienes el permiso de camion!";
		_FuRixX_Fuera = 1;
	};
};

if (_FuRixX_Fuera == 1) exitWith {};


if(_price > pop_din) exitWith {
	_resta = _price - pop_din;
	hint format ["Necesitas %1€ más para empezar (%2€)", _resta, _price];
};

pop_din = pop_din - _price;

[_raceID] call life_fnc_loadTrack;
[_raceID, [_raceID] call life_fnc_loadVehicle] call life_fnc_startRace;