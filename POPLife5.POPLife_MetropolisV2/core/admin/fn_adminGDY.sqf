#include <macro.h>
/*
	File: fn_adminGDY.sqf
    Author: tenshi	
*/
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint "No puedes usar esto.";};

if ((getPlayerUID player) in ["76561198072347051"]) then {
	[] spawn BIS_fnc_camera;
};