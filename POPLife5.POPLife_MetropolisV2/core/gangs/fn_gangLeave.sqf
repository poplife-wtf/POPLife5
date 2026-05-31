#include <macro.h>
#include "..\..\script_macros.hpp"
/*
AxE y punto .
*/
private["_unitID","_members"];
if(life_gangrank == 5) exitWith {hint localize "No seas cobarde ... De la organización no sales asi tan fácil ... al menos designa un lider pro-tempore."};
_unitID = getPlayerUID player;
_members = group player getVariable "gang_members";
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};
if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};

if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

{
	_uid = _x select 0;
	if (_uid == _unitID) then {
		_members set [_forEachIndex, -1];
	};
} forEach _members;

SUB(_members,[-1]);

group player setVariable ["gang_members",_members,true];

[player,group player] remoteExec ["TON_fnc_clientGangLeft",player];

if (life_HC_isActive) then {
    [4,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
} else {
    [4,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
};

closeDialog 0;

[player] joinSilent (createGroup civilian);

life_gangmembers = [];
life_gangid = -1;
life_gangowner = "-1";
life_gangname = "";
life_gangbank = 0;
life_gangrank = 0;
life_in_gang = false;
life_ganggroup = ObjNull;
life_gangzona = 0;
closeDialog 0;