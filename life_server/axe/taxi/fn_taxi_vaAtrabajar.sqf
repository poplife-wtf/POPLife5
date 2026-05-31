//if (playerSide == WEST)exitWith{hint "Policia en taxi?";};
_driver = _this select 0;
if (isNil "TaxistasEnServicio") then { TaxistasEnServicio = []; };
if (isNil "LlamadasTaxi") then { LlamadasTaxi = []; };
//_lvl = "tl" call ica_fnc_expToLevel;
//if !(license_civ_taxista) exitWith {hint "Hombre ... para ser taxista no basta con saber manejar ... esto es un arte, deja de ser vagancia y pasa por la u primero."};
if !(_driver in TaxistasEnServicio) then {TaxistasEnServicio = TaxistasEnServicio + [_driver];};

[1,LlamadasTaxi] remoteExec ["ica_fnc_taxi_respuesta",_driver];