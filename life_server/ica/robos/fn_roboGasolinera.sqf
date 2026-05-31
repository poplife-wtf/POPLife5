
/*
Robo de gasolinera por Icaruk
	se invoca con:
		["init"] spawn ica_fnc_roboGasolinera // para robar
		["pregunto"] spawn ica_fnc_roboGasolinera // para preguntar
*/

_param = _this select 0;

if (_param isEqualTo "init") exitWith {

	private ["_t", "_cagada"];

	if (side player == WEST) exitWith {hint "Puto policía corrupto, ¡se lo voy a decir a todo el mundo!"}; // eres poli
	if ((primaryWeapon player == "") AND (handgunWeapon player == "")) exitWith {hint "¿Qué quieres tú? ¡Parguela!"}; // eres tonto
	_count = player ammo handgunWeapon player;
	if (_count < 6) exitWith {hint "Con eso me amenazas ? es de juguete estoy seguro ... tira chinches no, almenos ponle balas.?"};
	if (!isNil {manolo getVariable "jodido"}) exitWith {hint "A Manolo ya le han jodido hace poco"}; // existe la var, te esperas
	if (({side _x == WEST} count playableUnits < 3) AND !(call ica_fnc_editando)) exitWith {hint "Tienen que estar al menos 3 policias conectados, sino, no es divertido."};
	
	_next = HW getVariable ["robosPeque",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo menor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosPeque",(time + (15 * 60)),true];
	
	if (isNil {manolo getVariable "jodido"}) then { // no existe la var, la pongo
		manolo setVariable ["jodido", true, true];
	};

	  if (("baj" call ica_fnc_expToLevel) < 2) exitWith {
            titleText["No sabes robar...", "PLAIN"];
		};

	titleText ["No dejes de apuntar a Manolo para que no avise a la policía", "PLAIN", 0.5];
	player reveal manolo;
	sleep 3;

	_t = 90;
	_tqAvisa = round (random [20,30,40]);
	while {true} do {
		if (cursortarget != Manolo) exitWith {_cagada = true};
		if ((player distance Manolo) > 4) exitWith {_cagada = true};
		if ((primaryWeapon player == "") AND (handgunWeapon player == "")) exitWith {_cagada = true};
		if (_t <= _tqAvisa) then {[10, "Aviso", [1,0,0], 1.5, "Están atracando la gasolinera de Manolo", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];};
		if (_t <= 0) exitWith {};
		[Manolo, "alarmcar"] remoteExec ["life_fnc_say3D",0];
		sleep 2;
		_t = _t - 2;
		hintSilent format ["Manolo necesita %1 segundos más para abrir la caja", _t];
	};

	if ((floor random 99) < 5) exitWith {
		player setDamage 1;
		[10, "Se le ha ido la cabeza...", [1,0,0], 1.5, format ["...Manolo ha matado a %1 y se ha meado en su cara.", name player], [1,1,1], 1] remoteExec ["ica_fnc_anuncio", 0];		
	
	};
	
	if (!isNil {_cagada}) then {
		hint format ["¡La has cagado! \nLa policía está en camino."];
		[10, "Aviso", [1,0,0], 1.5, "Están atracando la gasolinera de Manolo", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];

		0 spawn {
			sleep 60;
			manolo setVariable ["jodido", nil, true];
		};
	} else {


_polisOn= {side _x == WEST} count playableUnits;
_pasta= _polisOn * 1000;
 pop_din = pop_din + 1500 + round random 1000 + _pasta;

		["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;

		//damos exp
		_exp = 5;
		 ["exp",_exp] call ica_fnc_arrayexp;

		hint format ["Has robado %1€, puto amo", _din];
		[10, "Aviso", [1,0,0], 1.5, "Están atracando la gasolinera de Manolo", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];
		//[[getPlayerUID player,profileName,"211"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
				if (life_HC_isActive) then {
					[getPlayerUID player,profileName,"211"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
				} else {
					[getPlayerUID player,profileName,"211"] remoteExecCall ["life_fnc_wantedAdd",2];
				};		
		manolo setVariable ["jodido", name player, true];
	
		0 spawn {
			sleep (60 * 15);
			manolo setVariable ["jodido", nil, true];
		};
	};
	
	[manolo, ["PROTEGER ZONA - SEGURIDAD PRIVADA",{["protegerZonaSeguridadPrivada",manolo] spawn ica_fnc_seguridadPrivada;}]] remoteExec ["addAction",0,true];
};

if (_param isEqualTo "pregunto") exitWith {
	_asd = manolo getVariable "jodido";
	_EMSon = {side _x == WEST} count playableUnits;

	if (side player == CIVILIAN) exitWith {hint "Sólo un miembro oficial puede analizar la zona"};
	if (side player == WEST AND _EMSon >= 3) exitWith {hint "Sólo un miembro oficial puede analizar la zona"};
	[4, "Analizando la zona......"] spawn ica_fnc_barrita;
	sleep 4;

	if (isNil {_asd}) exitWith {hint "No hay rastro de nada"};
	if (typeName _asd == "BOOL") exitWith {hint "No hay rastro de nada"};

	hint format ["Los análisis han dado positivo: \n\nSe han encontrado fibras, sangre o fluídos de un tal %1.", manolo getVariable "jodido"];
};



