
/*
Creador de barras de proceso por Icaruk
Se invoca con:
	[20, "Reparando..."] spawn ica_fnc_barrita;
*/

_t = param [0, 1, [0]];

_t = _t max 1; // elige el valor más alto. Si el tiempo es menor que 1,  elegirá 1
// if (_t < 1) then {_t = 1}; // esto es lo mismo que lo de arriba

_texto = param [1, "Proceso...", [""]];

private ["_barra", "_progreso", "_tx", "_largo", "_t"];
("icapa7" call BIS_fnc_rscLayer) cutRsc ["barrita","PLAIN"];

disableSerialization;
_barra = uiNameSpace getVariable "barrita";
_progreso = _barra displayCtrl 5010;
_tx = _barra displayCtrl 5011;
_tx ctrlSetText _texto;

_largo = ctrlPosition _progreso select 2;
_progreso ctrlSetPosition [ctrlPosition _progreso  select 0, ctrlPosition _progreso  select 1, 0, ctrlPosition _progreso  select 3];
_progreso ctrlCommit 0;
_progreso ctrlSetPosition [ctrlPosition _progreso  select 0, ctrlPosition _progreso  select 1, _largo, ctrlPosition _progreso  select 3];
_progreso ctrlCommit _t;

sleep (_t + 1);
("icapa7" call BIS_fnc_rscLayer) cutText ["","PLAIN"];

/*

_frag = ((100 / _t) / 100);
while {true} do {
	if (_t <= 0) exitWith {	("icapa7" call BIS_fnc_rscLayer) cutText ["","PLAIN"];	};
	_progreso progressSetPosition ((progressPosition _progreso) + _frag);
	_t = _t - 1;
	sleep 1;
};
*/
