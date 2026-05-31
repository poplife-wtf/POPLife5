/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

if (isnull (findDisplay 777)) exitWith {};

ada_sacardni = 
{
	private["_player", "_badgeNumber"];

	_player = _this select 0;
	_badgeNumber = getPlayerUID _player;

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
	
	if (isnull (findDisplay 777)) exitWith {hint "Has cerrado la PDA..."};

	{
		if(isPlayer _x && (player distance _x) < 3) then {
			if( _x == _player) then {
			if (isnull (findDisplay 777)) exitWith {hint "Has cerrado la PDA..."};
			[[_player, ([_badgeNumber, (count _badgeNumber) - 7, (count _badgeNumber) - 1] call _substring)], "life_fnc_seeDNI", player, false] call life_fnc_MP;
			};
		};
	} forEach ((position _player) nearObjects["Man", 10]);
};

_quien = cursortarget;

if !(isnil "ocupado") exitwith {Hint "Solo puedes identificar a una persona a la vez"};

if (isPlayer _quien && _quien isKindOf "Man") then 
{
	if ((_quien getVariable ["restrained", false]) && playerSide == WEST) then 
	{
		if ((player getVariable ["restrained", false])) exitwith {hint "Pretendes identificar a alguien mientras estas esposado?? Humm..."};
		ocupado = true;
		disableserialization;
		_display = findDisplay 777;
		
		_nombre = name _quien;
		_tiempo = (round (random 20)) + 1;
		
		"Un policia te está buscando el DNI..." remoteExec ["hint", _quien];
		
		[_tiempo, "Buscando DNI al objetivo..."] spawn ica_fnc_barrita;
		sleep _tiempo;
		if (isnull (findDisplay 777)) exitWith {hint "Has cerrado la PDA..."};
		
		[_quien] call ada_sacardni;	
		hint "Has obtenido el DNI de la persona objetivo.\nApuntandolo en la PDA...";
			
		(_display displayCtrl 3027) ctrlSetText format["%1", _nombre];
		ocupado = nil;
	} else
	{
		hint "Debes ser policia y la persona a la que apuntas debe estar esposada para identificarla.";
	};
} else
{
	hint "No hay nadie delante de ti...\nTienes que apuntar a una persona esposada para identificarla.";
};
