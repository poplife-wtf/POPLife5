#include "..\..\script_macros.hpp"
/*
    File: fn_gangCreated.sqf
    By: AxE

    Description:
    Tells the player that the gang is created and throws him into it.
*/
private "_group";
life_action_gangInUse = nil;

if (pop_atmdin < 25000) exitWith {
    hint format [localize "STR_GNOTF_NotEnoughMoney",[(25000 - pop_atmdin)] call life_fnc_numberText];
    {group player setVariable [_x,nil,true];} forEach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

pop_atmdin = pop_atmdin - 25000;
[1] call SOCK_fnc_updatePartial;

	life_in_gang = true;
	life_ganggroup = group player;

	life_gangRank = 5;
	life_gangZona = _group getVariable ["gang_zona",0];
	life_gangid = _group getVariable ["gang_id",-1];
	life_gangname = _group getVariable ["gang_name",""];
	life_gangmembers = _group getVariable ["members",[]];
	life_gangMaxMembers = _group getVariable ["gang_maxMembers",25];
	life_gangowner = _group getVariable ["gang_owner",""];
	life_gangbank = _group getVariable ["gang_bank",0];	
	player setVariable ["mafia",life_gangname,true];
	player setVariable ["mafia_zona",life_gangzona,true];
	player setVariable ["mafia_rango",life_gangrank,true];
	
	
hint format [localize "STR_GNOTF_CreateSuccess",(group player) getVariable "gang_name",[25000] call life_fnc_numberText];