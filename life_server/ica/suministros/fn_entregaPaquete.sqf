
/*
por: Icaruk
	
	["init"] spawn ica_fnc_entregaPaquete; // Sólo servidor
	["compro1"] call ica_fnc_entregaPaquete;
	["compro5"] call ica_fnc_entregaPaquete;
	["entrego"] call ica_fnc_entregaPaquete;
	
	
		this addAction ["Comprar 1 paquete (5.000€)", '["compro1"] call ica_fnc_entregaPaquete'];
		this addAction ["Comprar 5 paquetes (23.000€)", '["compro5"] call ica_fnc_entregaPaquete'];
		this addAction ["Entregar paquete(s)", '["entrego"] call ica_fnc_entregaPaquete'];
*/

_param = _this select 0;

if (_param isEqualTo "init") exitWith { // srv
	
	paquetesCorreos = 2;
	
	while {true} do {
		paquetesCorreos = (paquetesCorreos + 1) min 20;
		
		sleep (60 * 3); // En 1h se suman 20 paquetes
	};	
};



_class = "pop_correos";

if (_param isEqualTo "compro1") exitWith { // cli

	[player, [paquetesCorreos]] call des_fnc_varToServer; // pido variable
	waitUntil {recibido};
	
	if (isNil {paquetesCorreos}) exitWith {hint "Error: no se ha inicializado fn_entregaPaquete."};
	
	_n = 1;
	_precio = 500;
	
	if !(paquetesCorreos >= _n) exitWith {hint "No me queda ningún paquete para darte, vuelve más tarde."};
	if !(player canAdd [_class, _n]) exitWith {hint "No tienes suficiente espacio."};
	if (pop_din >= _precio) exitWith {hint "No tienes suficiente dinero."};
	
	paquetesCorreos = paquetesCorreos - _n;
	publicVariableServer "paquetesCorreos";
	
	[_class] call des_fnc_item;
	[format ["- %1", _precio]] call ica_fnc_infolog;	
	[format ["+ %1", [_class] call ica_fnc_classToName]] call ica_fnc_infolog;
};

if (_param isEqualTo "compro5") exitWith { // cli

	[player, [paquetesCorreos]] call des_fnc_varToServer; // pido variable
	waitUntil {recibido};

	_n = 5;
	_precio = 2300;
	
	if !(paquetesCorreos >= _n) exitWith {hint "No me quedan 5 paquetes para darte, vuelve más tarde o pide menos cantidad."};
	if !(player canAdd [_class, _n]) exitWith {hint "No tienes suficiente espacio."};
	if (pop_din >= _precio) exitWith {hint "No tienes suficiente dinero."};

	paquetesCorreos = paquetesCorreos - _n;
	publicVariableServer "paquetesCorreos";
	
	[_class, _n] call des_fnc_item;
	[format ["- %1", _precio]] call ica_fnc_infolog;	
	[format ["+ %1 %2", _n, [_class] call ica_fnc_classToName]] call ica_fnc_infolog;	
};


if (_param isEqualTo "entrego") exitWith { // cli
	
	// Anti-spam
	if (!isNil {ocupado}) exitWith {hint "Estás ocupado"};
	0 spawn {
		ocupado = true;
		sleep 2;
		ocupado = nil;
	};
	
	
	_paquetes = [_class] call ica_fnc_tengo;
	
	if (_paquetes == 0) exitWith {hint "No tienes ningún paquete que entregarme."};
	
	[_class, _paquetes * -1] call ica_fnc_item;
	[format ["- %1 %2", _paquetes * -1, [_class] call ica_fnc_classToName]] call ica_fnc_infolog;
    
	// Recompensa común
	_regalo1 = [
		// ["className", cantidadSegura, cantidadRandomAñadida],
		["pop_esposas", 1, 2],
		["pop_bolsadesangre", 1, 2],
		["pop_lingotehierro", 1, 2]
	] call BIS_fnc_selectRandom;
	
	_regalitoComun = _regalo1 select 0;
	_canComun = (_regalo1 select 1) + round random (_regalo1 select 2);
	
	[_regalitoComun, _canComun] call ica_fnc_item;
	[format ["+ %1 %2", _canComun, [_regalitoComun] call ica_fnc_classToName]] call ica_fnc_infolog;	
	
	_str1 = format ["Recompensa: %1 %2 \n\n", _canComun, _regalitoComun];
	
	// Recompensa rara
	private ["_regalitoRaro", "_canRaro"];
	_str2 = "";
	
	if ((floor random 100) > 24) then { // 25% de regalo raro
		_regalo2 = [
			// ["className", cantidadSegura, cantidadRandomAñadida],
			["pop_bisturi_item", 1, 0],
			["optic_DMS", 1, 0],
			["pop_componentes", 1, 0]
		] call BIS_fnc_selectRandom;
		
		_regalitoRaro = _regalo2 select 0;
		_canRaro = (_regalo2 select 1) + round random (_regalo2 select 2);
		
		[_regalitoRaro, _canRaro] call ica_fnc_item;
		[format ["+ %1 %2", _canRaro, [_regalitoRaro] call ica_fnc_classToName]] call ica_fnc_infolog;	
		
		_str2 = format ["Recompensa rara: %1 %2 \n\n", _canRaro, _regalitoRaro];
	};
	
	
	// Recompensa en dinero
	_din = 1000 + (round random 1500); // min 10.000 max 25.000 (menos los 5000 que te ha costado el paquete)
	pop_din = pop_din + _din;
	[format ["+ %1€", _din]] call ica_fnc_infolog;
	
	_str3 = format ["Dinero: %1", _din];
	
	// Hint final
	_strFinal = _str1 + _str2 + _str3;
	hint _strFinal;
	
};
