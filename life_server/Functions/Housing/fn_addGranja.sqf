#include "\life_server\script_macros.hpp"
/*
    File: fn_addGranjas.sqf
    Author: AxE

    Description:
    No existe nada como esto ... osea ... q pro no ?
*/
private ["_housePos","_query"];
params [
    ["_granja",ObjNull],
	["_uid",""]
];

_housePos = getposATL _granja;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
	_log = format ["Addgranja linea 17 - uid: %1, house: %2, apto: %3 ",_uid,_housePos];
	[_log] call ica_fnc_axeLog;
};

if (_uid isEqualTo "") exitWith { diag_log "Intentando agregar casa sin objeto o uid";};


_query = format ["INSERT INTO granjas (pid, pos, owned) VALUES('%1', '%2', '1')",_uid,_housePos];
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

[_query,1] call DB_fnc_asyncCall;

uiSleep 0.3;

_query = format ["SELECT id FROM granjas WHERE pos='%1' AND pid='%2' AND owned='1' ",_housePos,_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;
//systemChat format ["House ID assigned: %1",_queryResult select 0];
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
	_log = format ["Addhouse linea 38 - QueryResultselect0 : %1",_queryResult select 0];
	[_log] call ica_fnc_axeLog;
};

_granja setVariable ["granja_id",(_queryResult select 0),true]; //lulwat

