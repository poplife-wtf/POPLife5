#include "\life_server\script_macros.hpp"
/*
    File: fn_clientDisconnect.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    When a client disconnects this will remove their corpse and
    clean up their storage boxes in their house. Also, saves player infos & position.
*/
private ["_unit","_id","_uid","_name","_alive","_position","_side"];
_unit = _this select 0;
if (isNull _unit) exitWith {};
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;
_side = side _unit;

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;
deleteVehicle _unit;

_uid spawn TON_fnc_houseCleanup;
