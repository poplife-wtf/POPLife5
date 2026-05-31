/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

private["_display","_list","_crimes","_bounty","_mylist"];
disableSerialization;

if (isnull (findDisplay 777)) exitWith {};

_display = uiNamespace getVariable 'dlgPDA'; 
_list = _display displayCtrl 3023;
_data = lbData[3022,(lbCurSel 3022)];
_mylist = [];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {lbClear _list;};
if(typeName _data != "ARRAY") exitWith {lbClear _list;};
if(count _data == 0) exitWith {lbClear _list;};
lbClear _list;

_crimes = _data select 2;
_bounty = _data select 3;

if (isnull (findDisplay 777)) exitWith {};
{
	_crime = _x;
	if(!(_crime in _mylist)) then
	{
		if (isnull (findDisplay 777)) exitWith {};
		_mylist pushBack _crime;
		_list lbAdd format["%1 %2(s)",{_x == _crime} count _crimes,_crime];
	};
} foreach _crimes;

