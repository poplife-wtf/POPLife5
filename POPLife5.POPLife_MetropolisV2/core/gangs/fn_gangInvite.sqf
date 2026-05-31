#include "..\..\script_macros.hpp"
#include <macro.h>
/*
    File: fn_gangInvite.sqf
    Author: AxE

*/
private ["_action","_grpMembers"];
params [
    ["_name","",[""]],
    ["_group",grpNull,[grpNull]]
];

if (_name isEqualTo "" || isNull _group) exitWith {}; //Fail horn anyone?
if (!isNil {(group player) getVariable "gang_name"}) exitWith {hint localize "STR_GNOTF_AlreadyInGang";};

_gangName = _group getVariable "gang_name";
_action = [
    format [localize "STR_GNOTF_InviteMSG",_name,_gangName],
    localize "STR_Gang_Invitation",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [player] join _group;
    _members = _group getVariable "gang_members";
	_members pushBack [getPlayerUID player, player getvariable ["realname",name player],1];
    _group setVariable ["gang_members",_members,true];

	life_in_gang = true;
	life_ganggroup = _group;

	life_gangRank = 1;
	life_gangZona = _group getVariable ["gang_zona",0];
	life_gangid = _group getVariable ["gang_id",-1];
	life_gangname = _group getVariable ["gang_name",""];
	life_gangmembers = _members;
	life_gangMaxMembers = _group getVariable ["gang_maxMembers",25];
	life_gangowner = _group getVariable ["gang_owner",""];
	life_gangbank = _group getVariable ["gang_bank",0];	
	player setVariable ["mafia",life_gangname,true];
	player setVariable ["mafia_zona",life_gangzona,true];
	player setVariable ["mafia_rango",life_gangrank,true];
	
    if (life_HC_isActive) then {
        [4,_group] remoteExecCall ["HC_fnc_updateGang",HC_Life];
    } else {
        [4,_group] remoteExecCall ["TON_fnc_updateGang",RSERV];
    };

} else {
    hint "Haz rechazado la oferta.";

};
