/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

[player] call ica_fnc_cualesmitelefono;

*/
_quien = _this select 0;

_num = [];
{
	if (_x isEqualTo _quien) exitwith {
		
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
		_num pushBack _numerollamada;
	};
} foreach playableUnits;

_tlf = _num select 0;
_tlf