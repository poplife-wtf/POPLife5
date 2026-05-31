// Tomo parametros

_player = [_this, 0, objNull] call BIS_fnc_param;

// Excepciones

if (_player == objNull) exitWith {};
if (isNil "BBenServicio") then { BBenServicio = []; publicVariable "BBenServicio"; };
if (isNil "LlamadasBB") then { LlamadasBB = []; };

// Todo okay

if (count BBenServicio == 0) exitWith {hint "No hay Bomberos Disponibles"; };

LlamadasBB = LlamadasBB + [_player];

{ [[9,LlamadasBB],"ica_fnc_taxi_respuesta",_x,false] spawn life_fnc_mp; } forEach BBenServicio; // Llamo taxistas!

[_player] spawn {
	_player = _this select 0;
	sleep 30;
	if (_player in LlamadasBB) then {
		LlamadasBB = LlamadasBB - [_player];
		hint "Ningún agente de seguridad privada aceptó tu solicitud luego de 30 segundos, Serás mala paga ?, Se te quitó de la lista de espera puedes volver solicitar seguridad cuando quieras.";
		axe_BBLlamado = false;
		{ [[10,LlamadasBB],"ica_fnc_taxi_respuesta",_x,false] spawn life_fnc_mp; } forEach BBenServicio;
	};
};