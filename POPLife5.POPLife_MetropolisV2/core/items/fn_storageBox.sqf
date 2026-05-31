#include "..\..\script_macros.hpp"
/*
    File : fn_storageBox.sqf
    Author: NiiRoZz
	Mod by AxE 
	
    Description:
    Create Storage and attachto player;
*/
private ["_object","_attachPos"];
params [
    ["_tipo","",[""]]
];
//if (!(nearestObject [player, "House"] in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse";};

_arrCasas = listaCasas + apartamentos;

_arrNear = nearestObjects [player, _arrCasas, 20];
_casilla = ObjNull;

{
	if (typeof _x in _arrCasas) exitWith {_casilla = _x;};
} foreach _arrNear;

if (isNull _casilla) exitWith {hint localize "STR_ISTR_Box_NotinHouse";};

closeDialog 0;

[_tipo] spawn ica_fnc_objetos;
