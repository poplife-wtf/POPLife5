/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_vehicle","_displayName","_isVehicle","_distance","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_vehicle = cursorTarget;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

life_interrupted = false;
if(life_action_inUse) exitWith {};

if(isPlayer _vehicle) exitWith {};
if(isNull _vehicle) exitWith {};

_distance = ((boundingBox _vehicle select 1) select 0) + 2;

_isVehicle = if((_vehicle isKindOf "LandVehicle") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air")) then {true} else {false};
if(_isVehicle && _vehicle in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

if(player distance _vehicle > _distance) exitWith {}; //Too far
if(typeof _vehicle in listaCasas) exitWith {["menu", 0.98, "cas", _vehicle] call ica_fnc_ganzua}; // En el caso de usar una ganzua para una casa
if(typeof _vehicle in listaGarajes) exitWith {hint "No puedes robar un garaje"}; // En el caso de usar una ganzua para una Garaje


_title = format[localize "STR_ISTR_Lock_Process",_displayName];

// salto el ganzuamiento de tonic y meto el de ica
if (true) exitWIth {["menu", 0.9, "veh", _vehicle] call ica_fnc_ganzua};

life_action_inUse = true; //Lock out other actions
