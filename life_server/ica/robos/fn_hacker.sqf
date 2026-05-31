/*
Canjeo de datos por Icaruk
	["menu"] spawn ica_fnc_hacker;
	["server"] spawn ica_fnc_hacker;
*/
_param = _this select 0;
_wifi = param [1, false];

if (_param isEqualTo "server") exitWith {
	hackerOcupado = true;
	publicVariable "hackerOcupado";
	sleep 60;
	hackerOcupado = nil;
	publicVariable "hackerOcupado";
};

if ((["baj"] call ica_fnc_expToLevel) < 4) exitWith {hint "Si no sabes, no toques"};

if (_param == "menu") exitWith {
	if (!isNil {hackerOcupado}) exitWith {
		hint "El hacker está ocupado ahora mismo, intenta contactar con él dentro de 1 minuto";	
	};
	[["server"], "ica_fnc_hacker", false, false, false] call life_fnc_MP;
	
	private ["_fuera"];
	if (!_wifi) then {
		_pc = [pchacker1, pchacker2, pchacker3] call ica_fnc_mascercano;
		if ((player distance _pc) > 3) then {_fuera = true; hint "Desde aquí no se ve nada"};
		if ((count (nearestObjects [(getPos _pc), ["Man"], 4])) > 1) then {
			hint "Demasiada gente por aquí.";
			_fuera = true;
		};
	};
	if (!isNil {_fuera}) exitWith {hint "asd";};
	
	disableSerialization;
	createDialog "hacker";
	_ui = uiNamespace getVariable "hacker";
	_lista = _ui displayCtrl 4085;
	_boton = _ui displayCtrl 4087;

	lbClear _lista;

	_elem = ["Dinero", "Posición de policía", "Posición de civiles", "Posición de archivos secretos", "Clave del banco central", "DDoS", "Rastrear último DDoS"];
	_idx = 0;
	while {_idx < count _elem} do {
		_lista lbAdd (_elem select _idx);
		_lista lbSetData [_idx, (_elem select _idx)];
		_idx = _idx + 1;
	};
};

_revela = {
	_side = _this select 0; // WEST O CIVILIAN
	_tios = [];
	{ if ((isPlayer _x) AND (side _x == _side)) then {
			_tios pushBack _x;
		}; } forEach playableUnits;
	{ player reveal [_x, 1.5] } forEach _tios;
};

if (_param == "verifica") exitWith {
	_entrada = parseNumber (_this select 1);
	_elegido = _this select 2;

	closeDialog 0;

	[player, ["datos"]] call ica_fnc_varToServer; waitUntil {recibido};

	if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
	_numero = parseNumber (datos select 1);

	if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
	if (_elegido == "") exitWith {hint "No has elegido nada, no creo que quieras hacer un donativo"; };
	if ((_elegido == "DDoS") AND (pop_din < 4000)) exitWith {hint "Necesito 7.500€ para lo que quieres"};

	switch (_elegido) do {
		case "Dinero": {
			hint "Te mereces 3.500€ por este código, gracias majo.";
			pop_din = pop_din + 3500;
			["envio", player, 20, 60*5] call ica_fnc_bloqueoDinero;

			if (isNil {repeHack}) then {repeHack = 0};	 // soy nuevo
			repeHack = repeHack + 1;				 // y he entrado +1 vez

			if (repeHack >= 2) exitWith {			// es la segunda vez que entro
				pop_din = pop_din - 3500;
				pop_atmdin = pop_atmdin - 7000;
			};
			[] spawn {
				sleep 2;
				repeHack = nil;
			};

			if (isNil {exploitHacker}) then {exploitHacker = []};
			exploitHacker pushBack [(name player), serverTime];
			publicVariable "exploitHacker";

		};
		case "Posición de policía": {
			[player,"Tienes en tu GPS la pos de civiles y policias obtenidas satelitalmente ... se refrescara cada 2 minutos por 16 minutos.", 
			"Hacker","pop_portatil"] call ica_fnc_axeMsg;
			0 spawn {

				uisleep (60 * 16);

				life_markers = false;
				{
					deleteMarkerLocal str _x;
				} forEach PlayerMarkers;
			};
			0 spawn ica_fnc_markersHacker;
		};
		case "Posición de civiles": {
			[player,"Tienes en tu GPS la pos de civiles y policias obtenidas satelitalmente ... se refrescara cada 2 minutos por 16 minutos.", 
			"Hacker","pop_portatil"] call ica_fnc_axeMsg;
			0 spawn {

				uisleep (60 * 16);

				life_markers = false;
				{
					deleteMarkerLocal str _x;
				} forEach PlayerMarkers;
			};
			0 spawn ica_fnc_markersHacker;
		};
		case "Posición de archivos secretos": {
			0 spawn {
				hint "Recibida la posición de los documentos secretos.";

				_str = format ["Posición: \n%1", mapGridPosition itemDocumentos];
				titleText [_str, "PLAIN", 2];
				sleep 20;
				_str = format ["Posición: \n%1", mapGridPosition itemDocumentos];
				titleText [_str, "PLAIN", 2];
			};
		};
		case "Clave del banco central": {
			[player, ["formula"]] call ica_fnc_varToServer; waitUntil {recibido};
			["formula"] call ica_fnc_roboBanco;
		};
		case "DDoS": {
			{DDoS = true; publicVariable "DDoS"; sleep (60 * 20); DDoS = nil; publicVariable "DDoS"} remoteExec ["BIS_fnc_spawn", 2];
			atacanteDDoS = name player;
		};
		case "Rastrear último DDoS": {
			pop_din = pop_din - 4000;
			["-7.500 €"] call ica_fnc_infolog;
			
			0 spawn {
				titleText [format ["El último atacante ha sido %1", atacanteDDoS], "PLAIN"];
				sleep 20;
				titleText [format ["El último atacante ha sido %1", atacanteDDoS], "PLAIN"];
			};
		};
	};
	datos = []; publicVariableServer "datos"; // borro variable
};
