
/*
	Por Icaruk
	
	Usar con [player, true] remoteExec ["ica_fnc_ocultame",0]; -> activar
	[player, false] remoteExec ["ica_fnc_ocultame",0]; -> desactivar
*/

/*
private ["_obj", "_bool", "_admin"];

_obj = _this select 0;
_bool = _this select 1;
_admin = _this select 2;


if (!isNil {_admin}) exitWith {
	[_obj, true] remoteExec ["ica_fnc_ocultame",0];
};

if (_bool) then {
	_obj hideObjectGlobal true;
} else {
	_obj hideObjectGlobal false;
};
*/

// By FuRixX Lamborghini \\

_estado = player getVariable ["FuRixX_AdminInvisible", false];

_cambio = !_estado;
FuRixX_AdminInvisible = [player, _cambio];
publicVariable "FuRixX_AdminInvisible";
player setVariable ["FuRixX_AdminInvisible", _cambio];

if (_cambio) then {
	hint "Ahora eres invisible";
} else {
	hint "Ya no eres invisible";
};


// By FuRixX Lamborghini \\