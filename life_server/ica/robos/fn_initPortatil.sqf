
_param = _this select 0;

_pos = [
	[8567.26,6878.28,0.00143814],
	[8726.67,6418.49,0.00143909],
	[8556.9,6473.86,0.00143814],
	[8525,6519.93,0.00943814],
	[8106.26,6279.86,0.00143909],
	[8199.07,6243.51,0.00143814],
	[8294.15,6303.27,0.00143814],
	[4999.77,2667.17,0.00143814]
] call BIS_fnc_selectRandom;

if (_param == "reset0") exitWith {
	desencriptando = nil;
	publicVariable "desencriptando";

	sleep (60 * 15);

	cajaFuerte setPos [8170.42,5131.08,3.85776];
	itemDocumentos setPos _pos;
	_codigoDSC = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	_codigoSEG = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	estadoPortatil = [0, _codigoDSC, _codigoSEG];
};

if (_param == "reset") exitWith {
	desencriptando = nil;
	publicVariable "desencriptando";
	cajaFuerte setPos (getMarkerPos "lejos");
	estadoPortatil = [99, estadoPortatil select 1, estadoPortatil select 2]; publicVariableServer "estadoPortatil";

	sleep (60 * 45);

	cajaFuerte setPos [7966.75,5384.38,3.28513]; // vuelta a su sitio
	itemDocumentos setPos _pos;
	_codigoDSC = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	_codigoSEG = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	estadoPortatil = [0, _codigoDSC, _codigoSEG];
};

if (_param == "loop") exitWith {
	fondosPublicos = 0;
	while {true} do {
		_g = ((WEST countSide playableUnits) + (EAST countSide playableUnits) + (CIVILIAN countSide playableUnits));
		fondosPublicos = fondosPublicos + (80 * _g);
		sleep (60 * 5);
	};
};

if (_param == "policia") exitWith {
	if ((side player) != WEST) exitWith {hint "¿Para qué vas a querer hacer eso?"; };

	[player, ["estadoPortatil"]] call ica_fnc_varToServer; waitUntil {recibido};
	if ((estadoPortatil select 0) == 0) exitWith {hint "Nadie ha robado nada, no sé que estás intentando..."; };

	desencriptando = nil;
	publicVariable "desencriptando";

	itemDocumentos setPos _pos;
	_codigoDSC = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	_codigoSEG = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
	estadoPortatil = [99, _codigoDSC, _codigoSEG];
	publicVariableServer "estadoPortatil";

	sleep (60 * 15);

	estadoPortatil = [0, _codigoDSC, _codigoSEG];
	publicVariableServer "estadoPortatil";
};


