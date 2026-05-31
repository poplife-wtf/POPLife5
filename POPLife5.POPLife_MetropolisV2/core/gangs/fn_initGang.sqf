#include "..\..\script_macros.hpp"
/*
    File: fn_initGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main initialization for gangs.
*/
private ["_exitLoop","_group","_wait"];
if !(playerSide isEqualTo civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if (count life_gangData isEqualTo 0) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
    _groupName = _x getVariable "gang_name";
    if (!isNil "_groupName") then {
        _groupOwner = _x getVariable ["gang_owner",""];
        _groupID = _x getVariable "gang_id";
        if (_groupOwner isEqualTo "" || isNil "_groupID") exitWith {}; //Seriously?
        if ((life_gangData select 0) isEqualTo _groupID && {(life_gangData select 1) isEqualTo _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
    };
} forEach allGroups;

if (!isNil "_group") then {
    [player] join _group;
    if ((life_gangData select 1) isEqualTo getPlayerUID player) then {
        _group selectLeader player;
        [player,_group] remoteExecCall ["TON_fnc_clientGangLeader",(units _group)];
    };
	life_in_gang = true;
	life_ganggroup = _group;
	player setVariable ["mafia",life_gangname,true];
	player setVariable ["mafia_zona",life_gangzona,true];
	player setVariable ["mafia_rango",life_gangrank,true];
	_group setVariable ["gang_id",life_gangid,true];
	_group setVariable ["gang_name",life_gangname,true];
	_group setVariable ["gang_members",life_gangmembers,true];
	_group setVariable ["gang_maxMembers",life_gangMaxMembers,true];
	_group setVariable ["gang_owner",life_gangowner,true];	
	_group setVariable ["gang_bank",life_gangbank,true];	
	_group setVariable ["gang_zona",life_gangzona,true];
	_group setVariable ["gang_casa",life_gangCasa,true];
	_group setVariable ["gang",true,true];
	if (life_gangzona != 0) then {
	_zonan = format ["zona_%1",life_gangzona];
	_zona = call compile _zonan;
	if!((_zona getVariable ["inCapture",FALSE])) then {
		_zona setVariable["gangOwner",_group,true];
		_zona setVariable["gang_id",life_gangid,true];			
		[_zona,_group] spawn life_fnc_initExtorsion;
	};};
	
} else {

	_group = group player;
	_group setVariable ["gang_id",life_gangid,true];
	_group setVariable ["gang_name",life_gangname,true];
	_group setVariable ["gang_members",life_gangmembers,true];
	_group setVariable ["gang_maxMembers",life_gangMaxMembers,true];
	_group setVariable ["gang_owner",life_gangowner,true];	
	_group setVariable ["gang_bank",life_gangbank,true];	
	_group setVariable ["gang_zona",life_gangzona,true];
	_group setVariable ["gang_casa",life_gangCasa,true];	
	_group setVariable ["gang",true,true];
	if (life_gangzona != 0) then {
	_zonan = format ["zona_%1",life_gangzona];
	_zona = call compile _zonan;
	if!((_zona getVariable ["inCapture",FALSE])) then {
		_zona setVariable["gangOwner",_group,true];
		_zona setVariable["gang_id",life_gangid,true];			
		[_zona,_group] spawn life_fnc_initExtorsion;
	};};
	player setVariable ["mafia",life_gangname,true];
	player setVariable ["mafia_zona",life_gangzona,true];
	player setVariable ["mafia_rango",life_gangrank,true];
	life_in_gang = true;
	life_ganggroup = _group;	
};

if !(life_gangCasa isEqualTo []) then {
	life_houses pushBack life_gangCasa;
	_house = nearestObject [life_gangCasa, "House"];
	if (isNil "_house" or isNull _house) exitWith {};
	life_vehicles pushBack _house;
	casaDeMafia = _house;

    _house setVariable ["gang_uid",round(random 99999),true];
    _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_position = getpos _house;
	_marker = format ["house_%1",(_house getVariable "uid")];
    _markerObj = createMarkerLocal [_marker,_position];
    _marker setMarkerTextLocal format ["Casa de Mafia: %1",_houseName];
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerTypeLocal "loc_Lighthouse";	
	
};