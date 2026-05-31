/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

private["_licencias","_policia"];

if (isnull (findDisplay 777)) exitWith {ocupado = nil;};
disableserialization;

_licencias = _this select 0;
_policia = _this select 1;

if (_policia != player) exitWith {};

_display = findDisplay 777;
_list = _display displayctrl 3020;

lbClear _list;
{	
	if (isnull (findDisplay 777)) exitWith {ocupado = nil;};
	_list lbAdd format["%1", _x];
	_list lbSetData [(lbSize _list)-1,str(_x)];
} foreach _licencias;
ocupado = nil;
