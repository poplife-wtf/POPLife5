/*
	File: fn_roulleteBet.sqf
	Author: Paronity
	Mod by AxE
	Description: Add/Remove values from the bet array.
*/

_number = [_this,0,0,[0]] call BIS_fnc_param;
_addOrRemove = [_this,1,0,[0]] call BIS_fnc_param; //0 = remove | 1 = add

switch(_addOrRemove) do
{
	case 0:
	{
		_index = [_number,axe_ruleta_apuestas] call _fnc_index;
		if(_index != -1) then
		{
			axe_ruleta_apuestas set [_index,-1];
			axe_ruleta_apuestas = axe_ruleta_apuestas - [-1];
		};
	};
	case 1:
	{
		axe_ruleta_apuestas pushBack _number;
	};
};

_fnc_index =
{
	private["_item","_stack"];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item == _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
};
