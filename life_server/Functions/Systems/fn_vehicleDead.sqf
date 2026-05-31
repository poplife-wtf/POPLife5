/*
	File: fn_vehicleDead.sqf

	Description:
	Tells the database that this vehicle has died and can't be recovered.
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread","_asegurado"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint str _vehicle;
if(isNull _vehicle) exitWith {}; //NULL

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;

sleep (4 * 60);

_asegurado = _vehicle getVariable "asegurado";
if(isNil "_asegurado") then { _asegurado = 0};

_apagado = _vehicle getVariable "apagado";
if(isNil "_apagado") then { _apagado = 0};

if(!isNil "_vehicle" && {!isNull _vehicle} && _asegurado > 0.5) exitWith {
	deleteVehicle _vehicle;
};

if(!isNil "_vehicle" && {!isNull _vehicle} && _apagado > 0.9) exitWith {};

if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};

_query = format["SetAliveVehicleByPidPlate:0:%1:%2",_uid,_plate];
waitUntil {!DB_Async_Active};
_thread = [_query,1] call DB_fnc_asyncCall;