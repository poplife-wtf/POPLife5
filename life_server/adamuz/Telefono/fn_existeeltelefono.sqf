/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

["647851236"] call ica_fnc_existeeltelefono;

*/
_quien = player;
_numero = _this select 0;
_para = [];
{
	_uid = getplayeruid _x;
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
	_numerollamada = "6" + ([_uid, (count _uid) - 8, (count _uid) - 1] call _substring);
	
	if (_numero isEqualTo (_numerollamada)) exitWith
	{
		_para = [_x, name _x, _numerollamada];
	};
} foreach playableUnits;
if (count _para isEqualTo 0) exitwith {objNull};
_fin = _para select 0;
_fin