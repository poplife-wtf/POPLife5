
/*
por: Icaruk
	[obj, [0,50,1]] call ica_fnc_setVelocity;
*/

private ["_vehicle"];

_vehicle = _this select 0;

_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 40;
_vehicle setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	(_vel select 2)
];