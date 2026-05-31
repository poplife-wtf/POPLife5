/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

_info = _this select 0;
_detenido = _this select 1;

disableserialization;
_display = finddisplay 777;
_list = _display displayCtrl 3012;

if (isnull (findDisplay 777)) exitWith {};
_mylist = [];
existe = false;
lbClear _list;
{
	_entry = _x;
	if((_entry select 0) == name _detenido) exitwith
	{
		existe = true;
		if (isnull (findDisplay 777)) exitWith {};
		
		_list lbadd format["Nombre: %1", name _detenido];
		_list lbadd "Delitos:";
		_crimes = _entry select 2;
		{
			_crime = _x;
			if(!(_crime in _mylist)) then
			{
				if (isnull (findDisplay 777)) exitWith {};
				_mylist pushBack _crime;
				_list lbAdd format["- %1 %2(s)",{_x == _crime} count _crimes,_crime];
			};
		} foreach _crimes;
	};
} foreach _info;

if !(existe) then 
{
	_list lbAdd format["Nombre: %1", name _detenido];
	_list lbAdd "Delitos:";
	_list lbAdd "- Ningun delito";
};
existe = nil;
ocupado = nil;