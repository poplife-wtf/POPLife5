/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

disableserialization;

private["_detenido", "_policia"];

if (isnull (findDisplay 777)) exitWith {};

if (side player != WEST) exitWith {hint "No tienes permiso"};

if !(isnil "ocupado") exitwith {Hint "Solo puedes consultar una persona a la vez"};

_display = finddisplay 777;
_list = _display displayCtrl 3012;
_detenido = format ["%1", ctrlText 3013];
_policia = player;

if ((_detenido == "")) exitWith {Hint "Debes poner un nombre en la casilla para buscarlo."};

ocupado = true;
lbClear _list;

_detenidoX = [];
{
	if (name _x == _detenido) then 
	{
		_detenidoX pushBack _x;
	};
} forEach playableUnits;

if (isnull (findDisplay 777)) exitWith {hint "Has cerrado la PDA..."; ocupado = nil;};

_tiempo = (round (random 5)) + 1;
[_tiempo, "Buscando sujeto en la base de datos..."] spawn ica_fnc_barrita; 
sleep _tiempo;

if (count _detenidoX == 0) exitWith {ocupado = nil; Hint "La persona que buscas no se encuentra en la base de datos..."; titleText ["La persona que buscas no se encuentra en la base de datos...", "PLAIN"];};
_detenido = _detenidoX select 0;

[2, "Encontrada entrada en base de datos..."] spawn ica_fnc_barrita; 
sleep 1;

if (isnull (findDisplay 777)) exitWith {ocupado = nil; hint "Has cerrado la PDA..."};

//[[player, _detenido],"ica_fnc_wantedfetchpdaindividual",false,false] call life_fnc_MP;
[player, _detenido] remoteExec ["ica_fnc_wantedfetchpdaindividual",2];



