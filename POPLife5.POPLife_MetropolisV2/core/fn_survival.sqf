#include "..\script_macros.hpp"
/*
    File: fn_survival.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    All survival? things merged into one thread.
*/
private ["_dam","_din","_bp","_lastState"];

//Setup the time-based variables.

_bp = "";
_lastState = vehicle player;
_dam = damage player;
_din = pop_din;

for "_i" from 0 to 1 step 0 do {

	if !((damage player) isEqualTo _dam) then {
	_dam = damage player;
	[] call life_fnc_hudUpdate;
	};

	if (!(typeName pop_din isEqualTo "SCALAR") OR pop_din < 0) then {
	
		pop_din = 0;
		["AntiHack Kick",player] call ica_fnc_axeLog;
		[true] spawn ica_fnc_posicion;
		[[player],format ["AntiHack Kick: %1 Ha sido kickeado de manera preventiva por el sistema antiHack",name (_this select 0)]] remoteExec ["hint",-2];
		[player] call ica_fnc_axeKick;
	
	};
	
	if !(_din isEqualTo pop_din) then {
	_din = pop_din;
	[] call life_fnc_hudUpdate;	
	};

	
    /* Adjustment of carrying capacity based on backpack changes */
    if (backpack player isEqualTo "") then {
        life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
        _bp = backpack player;
    } else {
        if (!(backpack player isEqualTo "") && {!(backpack player isEqualTo _bp)}) then {
            _bp = backpack player;
            life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,"CfgVehicles",_bp,"maximumload") / 4);
        };
    };

    /* Check if the player's state changed? */
    if (!(vehicle player isEqualTo _lastState) || {!alive player}) then {
        [] call life_fnc_updateViewDistance;
        _lastState = vehicle player;
    };

    /* Check if the weight has changed and the player is carrying to much */
    if (life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
        player forceWalk true;
        if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 1) then {player setFatigue 1;};
        hint localize "STR_NOTF_MaxWeight";
    } else {
        if (isForcedWalk player) then {
            player forceWalk false;
        };
    };

    /* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
    uiSleep 0.5;
};
