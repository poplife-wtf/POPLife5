// Tomo parametros

_player = [_this, 0, objNull] call BIS_fnc_param;

// Excepciones

if (_player == objNull) exitWith {};
if (isNil "TaxistasEnServicio") then { TaxistasEnServicio = []; };
if (isNil "LlamadasTaxi") then { LlamadasTaxi = []; };

// Todo okay

if (count TaxistasEnServicio == 0) exitWith { [4] remoteExec ["ica_fnc_taxi_respuesta",_player]; };

LlamadasTaxi = LlamadasTaxi + [_player];
//publicVariable "LlamadasTaxi";

{ [1,LlamadasTaxi] remoteExec ["ica_fnc_taxi_respuesta",_x]; } forEach TaxistasEnServicio; // Llamo taxistas!

[_player] spawn {
	_player = _this select 0;
	sleep 30;
	if (_player in LlamadasTaxi) then {
		LlamadasTaxi = LlamadasTaxi - [_player];
		[3] remoteExec ["ica_fnc_taxi_respuesta",_player];
		{ [1,LlamadasTaxi] remoteExec ["ica_fnc_taxi_respuesta",_x]; } forEach TaxistasEnServicio;
	};
};