
/*
por: Icaruk
	["class"] call des_fnc_classToName;
*/

private ["_class", "_nom"];
_class = _this select 0;

if ((typeName _class) == "SCALAR") exitWith {""};
if (_class == "") exitWith {_class};

if (isClass (configFile >> "CfgMagazines" >> _class)) then { // si es cargador
	_nom = getText (configFile >> "CfgMagazines" >> _class >> "Displayname"); // busco nombre cargador
};

if (isClass (configFile >> "CfgWeapons" >> _class)) then { // si es arma
	_nom = getText (configFile >> "CfgWeapons" >> _class >> "Displayname"); // lo busco de arma
};

if (isClass (configFile >> "CfgVehicles" >> _class)) then { // si es veh
	_nom = getText (configFile >> "CfgVehicles" >> _class >> "Displayname"); // pues de veh
};

if (isClass (configFile >> "CfgGlasses" >> _class)) then { // si son gafas
	_nom = getText (configFile >> "CfgGlasses" >> _class >> "Displayname");
};

if (isNil {_nom}) then {

	_nom = _class
};

_nom
