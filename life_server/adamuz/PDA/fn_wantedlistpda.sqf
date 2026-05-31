/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

private["_info","_display","_list","_units","_entry"];
disableSerialization;

if (isnull (findDisplay 777)) exitWith {};

_info = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 777;
_list = _display displayctrl 3022;
_units = [];
{
	_units pushBack (_x getVariable["realname",name _x]);
} foreach playableUnits;

if (isnull (findDisplay 777)) exitWith {};

{
	_entry = _x;
	if((_entry select 0) in _units) then
	{
		if (isnull (findDisplay 777)) exitWith {};
		_list lbAdd format["%1", _entry select 0];
		_list lbSetData [(lbSize _list)-1,str(_entry)];
	};
} foreach _info;

[1, "Conexión establecida"] spawn ica_fnc_barrita; 

if (isnull (findDisplay 777)) exitWith {};

if(((lbSize _list)-1) == -1) then
{
	if (isnull (findDisplay 777)) exitWith {};
	_list lbAdd "Ningun criminal";
};
ocupado = nil;