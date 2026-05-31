#include "\life_server\script_macros.hpp"
/*
    File: fn_addHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the players newly bought house in the database.
*/
private ["_housePos","_query"];
params [
    ["_uid","",[""]],
    ["_housePos",[0,0,0]],
	["_apto",0]
];

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
	_log = format ["Addhouse linea 17 - uid: %1, house: %2, apto: %3 ",_uid,_housePos,_apto];
	[_log] call ica_fnc_axeLog;
};

if (_uid isEqualTo "") exitWith { diag_log "Intentando agregar casa sin objeto o uid";};


_query = format ["INSERT INTO houses (pid, pos, owned, apto) VALUES('%1', '%2', '1', '%3')",_uid,_housePos,_apto];
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

[_query,1] call DB_fnc_asyncCall;

uiSleep 0.3;

_query = format ["SELECT id FROM houses WHERE pos='%1' AND pid='%2' AND owned='1' AND apto='%3'",_housePos,_uid,_apto];
_queryResult = [_query,2] call DB_fnc_asyncCall;
//systemChat format ["House ID assigned: %1",_queryResult select 0];
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
	_log = format ["Addhouse linea 38 - QueryResultselect0 : %1",_queryResult select 0];
	[_log] call ica_fnc_axeLog;
};
_house = nearestObject [_housePos, "House"];
if (_apto isEqualTo 0) then {
_house setVariable ["house_id",(_queryResult select 0),true];

} else {
_house setVariable [format ["%1_id",_apto],(_queryResult select 0),true]; //lulwat

};
