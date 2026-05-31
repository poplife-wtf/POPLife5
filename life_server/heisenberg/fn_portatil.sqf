/*
por: Heisenberg White para plataoplomo.wtf

*/

_param = param [0,"inicio"];

if (_param isEqualTo "server") exitWith {
	hackerOcupado = true;
	publicVariable "hackerOcupado";
	sleep 60;
	hackerOcupado = nil;
	publicVariable "hackerOcupado";
};


if (_param isEqualto "inicio") exitwith {



	disableserialization;

	createdialog "pcpopi";
	((uinamespace getvariable "pcpopi") displayctrl 1002) ctrlsettext (format ["%1", name player]);

};


if (_param isEqualto "deepweb") exitwith {

	if (!isNil {hackerOcupado}) exitWith {
		hint "La deep Web esta muy colapsada ahora mismo pruebe en 1 minuto";	
	};
	
	["server"] remoteexecCall ["ica_fnc_hacker",2];

_pase = ctrltext ((uinamespace getvariable "deepwebhw") displayctrl 2506);
if (_pase isEqualto (HW getvariable ["nombre","Heisenberg White"])) then {closedialog 0;createdialog "pcpopdwnocturno";["relleno"] call ica_fnc_portatil;} else {hint "Login Incorrecto"};


};

if (_param isEqualto "relleno") exitwith {

	_ui = uiNamespace getVariable "dw";
	_lista = _ui displayCtrl 2508;

	lbClear _lista;

	_elem = ["Dinero", "Posición de policía", "Posición de civiles", "Posición de archivos secretos", "DDoS", "Rastrear último DDoS","CMD Banco General"];
	_idx = 0;
	while {_idx < count _elem} do {
		_lista lbAdd (_elem select _idx);
		_lista lbSetData [_idx, (_elem select _idx)];
		_idx = _idx + 1;
	};

};


if (_param == "verifica") exitWith {
	_entrada = parseNumber (_this select 1);
	_elegido = _this select 2;

	closeDialog 0;

	[player, ["datos"]] call ica_fnc_varToServer; waitUntil {recibido};

	//if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
	
	_numero = parseNumber (datos select 1);

	if (_elegido == "") exitWith {hint "No has elegido nada, no creo que quieras hacer un donativo"; };
	if ((_elegido == "DDoS") AND (pop_din < 4000)) exitWith {hint "Necesito 4000€ para lo que quieres"};

	switch (_elegido) do {
		case "Dinero": {
			if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
			if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
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
			if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
			if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
			hint "Recibiendo la posición de la policía cada 2 minutos durante 14 minutos.";

			[] spawn {
				_a = 0;
				while {true} do {
					if (_a >= 7) exitWith {hint "Has dejado de recibir la posición de la policía."};
					[WEST] call _revela;
					sleep (60 * 2);
					_a = _a + 1;
				};
			};
		};
		case "Posición de civiles": {
			if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
			if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
			hint "Recibiendo la posición de los civiles cada 2 minutos durante 16 minutos.";

			[_revela] spawn {
				_revela = _this select 0;
				_a = 0;
				while {true} do {
					if (_a >= 8) exitWith {hint "Has dejado de recibir la posición de los civiles."};
					[CIVILIAN] call _revela;
					sleep (60 * 2);
					_a = _a + 1;
				};
			};
		};
		case "Posición de archivos secretos": {
			if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
			if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
			0 spawn {
				hint "Recibida la posición de los documentos secretos.";

				_str = format ["Posición: \n%1", mapGridPosition itemDocumentos];
				titleText [_str, "PLAIN", 2];
				sleep 20;
				_str = format ["Posición: \n%1", mapGridPosition itemDocumentos];
				titleText [_str, "PLAIN", 2];
			};
		};
		/*
		case "Clave del banco central": {
			if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
			if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
			[player, ["formula"]] call ica_fnc_varToServer; waitUntil {recibido};
			["formula"] call ica_fnc_roboBanco;
		};*/
		case "DDoS": {
			if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
			if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
			{DDoS = true; publicVariable "DDoS"; sleep (60 * 20); DDoS = nil; publicVariable "DDoS"} remoteexec ["BIS_fnc_spawn",2];
			atacanteDDoS = name player;
		};
		case "Rastrear último DDoS": {
			if ((count datos) == 0) exitWith {hint "Alguien se te ha adelantado, pero la información de las antenas se suele compilar cada 20 minutos"; };
			if (_entrada != _numero) exitWith {hint "Ese código no es válido, no intentes engañarme."; };
			pop_din = pop_din - 4000;
			["-7.500 €"] call ica_fnc_infolog;
			
			0 spawn {
				titleText [format ["El último atacante ha sido %1", atacanteDDoS], "PLAIN"];
				sleep 20;
				titleText [format ["El último atacante ha sido %1", atacanteDDoS], "PLAIN"];
			};
		};
		case "CMD Banco General": {
		createdialog "pcpophackhw";
		};
	};
	datos = []; publicVariableServer "datos"; // borro variable
};
