/*
    File: fn_houseCleanup.sqf
    Author: NiiRoZz

    Description:
    Cleans up containers inside in house of player.
*/
private ["_query","_containers"];
_query = format ["SELECT pid, pos, apto FROM containers WHERE pid='%1' AND owned='1'",_this];

_containers = [_query,2,true] call DB_fnc_asyncCall;

if (count _containers isEqualTo 0) exitWith {};

//[["76561198219297039","[4479.35,659.877,0.00143814]",0]]

{
	_container = [];
    _pos = call compile format ["%1",_x select 1];
	if ((_x select 2) isEqualTo 0) then {
	_container = nearestObjects[_pos,["pop_armario1_box","pop_armario2_box","pop_nevera_box","pop_mesa_tv_box","pop_cama","pop_sofa"],12];
	}else{
	_container = nearestObjects[_pos,["pop_armario1_box","pop_armario2_box","pop_nevera_box","pop_mesa_tv_box","pop_cama","pop_sofa"],3];
	};
    {
        deleteVehicle _x;
    } forEach _container;
} forEach _containers;
