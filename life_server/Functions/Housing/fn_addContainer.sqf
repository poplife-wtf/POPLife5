#include "\life_server\script_macros.hpp"
/*
    File: fn_addContainer.sqf
    Author: AxE ... si ... de cero por mi.

    Description:
    Add container in Database.

	
*/
private ["_containerPos","_query","_className","_dir","_uid","_container","_apto"];

params [
    ["_uid","",[""]],
    ["_containerPos",[]],
	["_apto",0],
	["_className",""],
	["_dir",60]
];
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
diag_log format ["-------- Agregando contendor 1 ------- %1 - %2 - %3",_uid,_containerPos,_dir];
};

_query = format ["INSERT INTO containers (pid, pos, classname, inventory, gear, owned, dir, apto) VALUES('%1', '%2', '%3', '""[[],0]""', '""[]""', '1', '%4', '%5')",_uid,_containerPos,_className,_dir,_apto];
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

[_query,1] call DB_fnc_asyncCall;

uiSleep 0.3;

_query = format ["SELECT id FROM containers WHERE pos='%1' AND pid='%2' AND owned='1'",_containerPos,_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;
//systemChat format ["House ID assigned: %1",_queryResult select 0];
_containerLoco = nearestObject [_containerPos, _className];
//nearestObject [[4871.73,3085.88,0.254942], "pop_cama"]
_containerLoco setVariable ["container_id",(_queryResult select 0),true];

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
diag_log format ["-------- Agregando contendor 2 ------- %1 - %2 - %3",str (_containerLoco),_containerPos,_dir];
};