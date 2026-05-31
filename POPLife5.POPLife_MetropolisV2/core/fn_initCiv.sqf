#include "..\script_macros.hpp"
/*
    File: fn_initCiv.sqf
    Author: Bryan "Tonic" Boardwine
	Mod By AxE.

    Description:
    Initializes the civilian.
*/


civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", [],350];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", [],350];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", [],350];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", [],350];

waitUntil {!(isNull (findDisplay 46))};
if (life_is_alive && !life_is_arrested) then {
    /* Spawn at our last position */
    _ejecutar = ["Establecer"] call FuRixX_fnc_EncriptandoVariables;

} else {
    if (!life_is_alive && !life_is_arrested) then {
        
            _handle = [] spawn life_fnc_civLoadout;
            waitUntil {scriptDone _handle};
            pop_din = 0;
            [0] call SOCK_fnc_updatePartial;
        waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
        waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
    } else {
        if (life_is_arrested) then {
            life_is_arrested = false;
            [player,true] spawn life_fnc_jail;
        };
    };
};
life_is_alive = true;
player addRating 9999999;
