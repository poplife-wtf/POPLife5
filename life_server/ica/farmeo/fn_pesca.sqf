
/*
Script de pesca por Icaruk
Si quieres usarlo, pide permiso en adri-rk@hotmail.com

	["ini"] spawn ica_fnc_pesca;
	
*/

_param = _this select 0;
_cuerdas = (ropes (vehicle player));
_pez = "pop_pez_obj";
_tiburon = "pop_tiburon_obj";
_listaBarcos = ["Mattaust_Fisher"];

if (_param isEqualTo "ini") exitWith {
	if ((player distance (getMarkerPos "pesca_1")) > 85) exitWith {hint "No estás en la zona de pesca"};
	if !((typeOf (vehicle player)) isEqualTo "POP_pesca_f") exitWith {hint "No tienes un barco pesquero"; };

	createDialog "pesca";
	_rnd1 = round ((random 40) - 20);
	_rnd2 = round ((random 40) - 20);
	
	if (count (ropes (vehicle player)) != 0) exitWith {
		ropeDestroy (_cuerdas select 0);
		hint "El hilo tenía un nudo, pero lo has soltado y el barco está listo para usar otro.";
	};

	titleText ["Usa la rueda del ratón para tirar del hilo", "PLAIN DOWN", 0.6];

	tibu = false;
	if (license_civ_pescador) then {
		if ((random 100) <= 40) then {tibu = true};
	};
	if (tibu) then {
		pez = _tiburon createVehicleLocal [(getPos player select 0) + 20, (getPos player select 1) + _rnd2, (getPos player select 2)];
		pez setvariable ["persistent", true, true];;
	} else {
		pez = _pez createVehicleLocal [(getPos player select 0) + 20, (getPos player select 1) + _rnd2, (getPos player select 2)];
		pez setvariable ["persistent", true, true];
	};
	ropeCreate [vehicle player, "attach", pez, [0,3,3], 20];
	
	giros = 0;
	while {!isNil {abierto}} do {
		_antiguo = giros;
		if (_antiguo == giros) then {giros = 0};
		pez setVelocity [round (random 1), round (random 1), 2];
		sleep 1;
	};
};

if (_param isEqualTo "tira") exitWith {
	giros = giros + 1;
	
	if (count _cuerdas != 0) then {
		ropeUnwind [(ropes (vehicle player) select 0), 2, -1.2, true]; // obj, vel, hasta, relativo (b)
		hint format ["Metros de hilo: %1. \nTensión del hilo: %2.", round (ropeLength (ropes (vehicle player) select 0)), giros];
	};
	
	if (((ropeLength (_cuerdas select 0)) <= 6) AND (giros >= 5)) exitWith { // demasiado rápido
		hint "Se ha roto el hilo";
		closeDialog 0;
		ropeDestroy (_cuerdas select 0);
		deleteVehicle pez;
	};
	
	if ((ropeLength (_cuerdas select 0)) <= 0.5)  exitWith {
		closeDialog 0;
		ropeDestroy (_cuerdas select 0);
		deleteVehicle pez;
		
		_pes = "pes" call ica_fnc_expToLevel;
		if (_pes >= 2) then {
			if ((random 100) <= 33) then {_doble = true};
		};
		_doble = false; 
		if (_doble) then {
			["pop_pez", 8] call ica_fnc_item;
			hint "¡Bien habia x4 peces!";
		} else {
			["pop_pez",4] call ica_fnc_item;
			hint "¡Bien, captura!";
		};

		if (tibu) then {
			["pop_tiburon"] call ica_fnc_item;
			hint "¡Has encontrado un tiburón!";
		};
	};
};

