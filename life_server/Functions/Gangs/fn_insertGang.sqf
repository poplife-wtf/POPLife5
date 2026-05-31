#include "\life_server\script_macros.hpp"
/*
    File: fn_insertGang.sqf
    By AxE

    Description:
    Inserts the gang into the database.
*/
private ["_query","_queryResult","_gangMembers","_group"];
params [
    ["_ownerID",objNull,[objNull]],
    ["_uid","",[""]],
    ["_gangName","",[""]]
];
_group = group _ownerID;
_playerName = name _ownerID;

if (isNull _ownerID || _uid isEqualTo "" || _gangName isEqualTo "") exitWith {}; //Fail

_ownerID = owner _ownerID;
_gangName = [_gangName] call DB_fnc_mresString;
_query = format ["SELECT id FROM gangs WHERE name='%1' AND active='1'",_gangName];

_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"Ya hay una organización con ese nombre."] remoteExecCall ["life_fnc_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

_query = format ["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND active='1'",_uid,"%"];

_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"Ya estas en otra organizacion ... cuidado con lo que haces la traicion no se perdona."] remoteExecCall ["life_fnc_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

//Check to see if a gang with that name already exists but is inactive.
_query = format ["SELECT id, active FROM gangs WHERE name='%1' AND active='0'",_gangName];

_queryResult = [_query,2] call DB_fnc_asyncCall;
_gangMembers = [[[_uid,_playerName,5]]] call DB_fnc_mresArray;

if (!(count _queryResult isEqualTo 0)) then {
    _query = format ["UPDATE gangs SET active='1', owner='%1',members='%2' WHERE id='%3'",_uid,_gangMembers,(_queryResult select 0)];
} else {
    _query = format ["INSERT INTO gangs (owner, name, members) VALUES('%1','%2','%3')",_uid,_gangName,_gangMembers];
};

_queryResult = [_query,1] call DB_fnc_asyncCall;

_group setVariable ["gang_name",_gangName,true];
_group setVariable ["gang_owner",_uid,true];
_group setVariable ["gang_bank",0,true];
_group setVariable ["gang_maxMembers",25,true];
_group setVariable ["gang_members",[[_uid,_playerName,5]],true];
_group setVariable ["gang_zona",0,true];
[_group] remoteExecCall ["life_fnc_gangCreated",_ownerID];

uiSleep 0.35;
_query = format ["SELECT id FROM gangs WHERE owner='%1' AND active='1'",_uid];

_queryResult = [_query,2] call DB_fnc_asyncCall;

_group setVariable ["gang_id",(_queryResult select 0),true];
