
/*
por: Icaruk

Función: devuelve el número de objetos con la classname X que tengo
Params:
	0: STRING - classname a buscar
	1: BOOL - false (default) para unidad, true para vehículo
	
	["ItemRadio"] call ica_fnc_tengo
	["ItemRadio", true] call ica_fnc_tengo // devuelve items veh actual

	returns: SCALAR
*/

private ["_item", "_veh", "_equipo", "_cargo", "_fin"];

_item = _this select 0;
_veh = param [1, false];
_quien = _this select 2;
_cargo = [];
_fin = 0;

if !(_veh) then {
	_equipo = items _quien + weapons _quien + magazines _quien;
	_fin = {_item == _x} count _equipo;
} else {
	_cargo = itemCargo vehicle _quien + weaponCargo vehicle _quien + magazineCargo vehicle _quien;
	if (isNil "_cargo") then {_cargo = [];};
	_fin = {_item == _x} count _cargo;
};

_fin
