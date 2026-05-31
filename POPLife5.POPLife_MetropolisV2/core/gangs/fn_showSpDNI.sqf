/*
 By Akrilax
 Mod by AxE para Seguridad Privada
*/

private["_player", "_badgeNumber"];

_player = player;
_badgeNumber = getPlayerUID player;

_substring = {
	_string = [_this, 0, "", [""]] call BIS_fnc_param;
	_start = [_this, 1, -1, [-1]] call BIS_fnc_param;
	_end = [_this, 2, -1,[-1]] call BIS_fnc_param;
	
	_stringAr = toArray _string;
	_outAr = [];
	
	for "_i" from _start to _end do {
		_outAr pushBack (_stringAr select _i);
	};
	
	toString _outAr
};

if(showing_documentation) exitWith {};

hint "Has enseñado tu ID de Seguridad Privada";

showing_documentation = true;

nombre_real = player getVariable "realname"

{
	if(isPlayer _x && (player distance _x) < 3) then {
		if( _x != _player) then {
			[[nombre_real], "life_fnc_spDNI", _x, false] call life_fnc_MP;
		};

	};
} forEach ((position _player) nearObjects["Man", 10]);

[] spawn {
	sleep 10;
	showing_documentation = false;
};