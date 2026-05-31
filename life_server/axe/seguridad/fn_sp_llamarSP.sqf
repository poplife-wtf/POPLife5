// Tomo parametros

_player = [_this, 0, objNull] call BIS_fnc_param;

// Excepciones

if (_player == objNull) exitWith {};
if (isNil "SPenServicio") then { SPenServicio = []; publicVariable "SPenServicio"; };
if (isNil "LlamadasSP") then { LlamadasSP = []; };

// Todo okay

if (count SPenServicio == 0) exitWith {hint "No hay Agentes de Seguridad Privada Disponibles"; };

LlamadasSP = LlamadasSP + [_player];

{ [[7,LlamadasSP],"ica_fnc_taxi_respuesta",_x,false] spawn life_fnc_mp; } forEach SPenServicio; // Llamo SP!

[_player] spawn {
	_player = _this select 0;
	sleep 90;
	if (_player in LlamadasSP) then {
		LlamadasSP = LlamadasSP - [_player];
		hint "Ningún agente de seguridad privada aceptó tu solicitud luego de 90 segundos, Serás mala paga ?, Se te quitó de la lista de espera puedes volver solicitar seguridad cuando quieras.";
		axe_SPLlamado = false;
		{ [[8,LlamadasSP],"ica_fnc_taxi_respuesta",_x,false] spawn life_fnc_mp; } forEach SPenServicio;
	};
};