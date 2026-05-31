
/*
por: Icaruk
	["comprobador"] spawn ica_fnc_roboNuclear
*/


_param = _this select 0;

if (_param isEqualTo "comprobador") exitWith {

	while {true} do {
		if ((["pop_uranio"] call ica_fnc_tengo >= 1) OR (["pop_uranio", true] call ica_fnc_tengo >= 1) OR (!isNil {radiactividad})) then { // loop largo buscando uranio o radiactividad
			
			while {true} do { // loop corto hasta que deje de tener el item
				//if (isNil {radiactividad}) exitWith {};
				if (!alive player) exitWith {};
				
				if ((["pop_uranio"] call ica_fnc_tengo >= 1) OR (["pop_uranio", true] call ica_fnc_tengo >= 1)) then { // si tengo item sumo radiactividad
					if (isNil {radiactividad}) then {radiactividad = 0}; // si no existe, la creo
					radiactividad = radiactividad + 1;
				} else { // si no lo tengo, resto radiactividad
					radiactividad = radiactividad - 1;
				};
				if (radiactividad < 0) then {radiactividad = nil}; // limitador
				if (radiactividad > 15) then {radiactividad = 15};
				if (isNil {radiactividad}) exitWith {}; // salgo de este loop
				
				if !(["pop_uranio"] call ica_fnc_tengo >= 1) exitWith {}; // salgo de este loop porque ya no tengo ítem
				
				if (radiactividad >= 6) then {
					 [] spawn {
						_colorInv = ppEffectCreate ["ColorInversion", 11];
						_colorInv ppEffectEnable true;
						_colorInv ppEffectAdjust [0.1,0,0];
						_colorInv ppEffectCommit 2;
						sleep 16;
						
						ppEffectDestroy _colorInv;
					 }; 			
				};
				if (radiactividad >= 14) then {
					 [] spawn {
						_filmGr = ppEffectCreate ["FilmGrain", 12];
						_filmGr ppEffectEnable true;
						_filmGr ppEffectAdjust  [0.5, 1.5, 2, 0, 1];
						_filmGr ppEffectCommit 2;
						sleep 16;
						
						ppEffectDestroy _filmGr;
					 }; 			
				};	
				if (radiactividad >= 15) then { // si estoy muy jodido, me muero
					 player setDamage 1;
					//hint "muerto";
					radiactividad = nil;
				};
				
				[] spawn {
					private ["_blur"];
					
					if (isNil {radiactividad}) exitWith {};
					_n = radiactividad / 8;
					_t = 4;
					
					_blur = ppEffectCreate ["DynamicBlur", 10];
					_blur ppEffectEnable true;
					_blur ppEffectAdjust [_n];
					
					_blur ppEffectCommit _t;
					sleep _t;
					_blur ppEffectAdjust [_n * 0.8];
					_blur ppEffectCommit _t;
					sleep _t;
					_blur ppEffectAdjust [_n * 0.6];
					_blur ppEffectCommit _t;
					sleep _t;
					_blur ppEffectAdjust [_n * 0.4];
					_blur ppEffectCommit _t;
					sleep _t;
					_blur ppEffectAdjust [_n * 0.2];
					_blur ppEffectCommit _t;
					sleep _t;
					ppEffectDestroy _blur;
				};
				sleep 10;
			};
		};
		sleep 20;
	};
};

if (_param isEqualTo "bomba") exitWith {


    if !({side _x isEqualTo WEST} count playableUnits > 5) exitWith {hint "No puedes explotar un c4 aqui sin 6 funcionarios conectados, provocaria el fin del mundo ..."};
	
	_next = HW getVariable ["robosGrandes",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo mayor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	
	HW setVariable ["robosGrandes",(time + (40 * 60)),true];
		
	if ((player distance cosaNuclear) > 4) exitWith {hint "Tu brazo no es tan largo."};
	
	if ((["pop_c4"] call ica_fnc_tengo) isEqualTo 0) exitWith {hint "Muy bien, has llegado. Ahora sólo te falta la bomba C4-OP."};
	["pop_c4", -1] call ica_fnc_item;
	["- C4-OP"] call ica_fnc_infolog;
	
	if (cosaNuclear getVariable "bomba") exitWith {hint "Ya hay una bomba colocada, será mejor que te alejes."};
	cosaNuclear setVariable ["bomba", true, true];
	cosaNuclear2 setVariable ["uranio", true, true]; // se cambia a false más tarde para que no se pueda recoger más uranio
	{sleep (60 * 120); cosaNuclear setVariable ["bomba", false, true]} remoteExec ["BIS_fnc_spawn", 2];
	
	_itemBomba = "pop_c4_obj" createVehicle (getMarkerPos "");
	_itemBomba attachTo [cosaNuclear, [0,0,0.5]];
	
	_temporizador = 300;
	[10, "Aviso", [1,0,0], 1.5, "Las alarmas de la central nuclear han saltado y el guarda no responde, sospechamos que algo malo está pasando.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];
	
	while {true} do {
		if (_temporizador <= 0) exitWith {hint "Boom";};
		_temporizador = _temporizador - 1;
		hint format ["Explosión en %1 segundos.", _temporizador];
		
		sleep 1;
	};
	
	_bomba = "M_Mo_82mm_AT_LG" createVehicle (getPos cosaNuclear);
	deleteVehicle _itemBomba;
	sleep 0.2;
	[cosaNuclear, true] call ica_fnc_ocultame;
	[cosaNuclear2, false] call ica_fnc_ocultame;
	
	//sonido nucelar NUCELAR
	[cosaNuclear, "nuclear_alarm"] remoteExec ["life_fnc_say3D",0];
	
	["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;
	
	
};

if (_param isEqualTo "extraer") exitWith {
	//if (isNil {uranioTest}) exitWith {hint "Esto está deshabilitado temporalmente"}; // QUITAR CUANDO SE ARREGLE
	
	if ((player distance cosaNuclear2) > 4) exitWith {hint "Acércate más."};
		if ((count (nearestObjects [getPos cosaNuclear2, ["Man"], 5])) > 1) exitWith {
		hint "Es demasiado peligroso que haya tanta gente por aquí cerca, este material es muy delicado. Sí, he dicho delicado.";
	};	
	
	if !(cosaNuclear2 getVariable "uranio") exitWith {hint "Está vacío"}; // ya se ha cogido
	cosaNuclear2 setVariable ["uranio", false, true];
	hint "Mientras tengas uranio, sufrirás los efectos de la radiactividad, hasta morir.";
	["pop_uranio"] call ica_fnc_item;
	["+ 1 Uranio"] call ica_fnc_infolog;
	sleep 10;
	hint "Autodestruccion activada para seguridad.";
	deleteVehicle cosaNuclear;
	deleteVehicle cosaNuclear2;
};

if (_param isEqualTo "enriquecer") exitWith {
	_tio = _this select 1;
	
	if ((player distance _tio) > 5) exitWith {
		hint "Teniendo en cuenta la distancia entre nosotros... debes de saber que no envío uranio 235 por correo, lo siento.";
	};	
	
	if !(["pop_uranio"] call ica_fnc_tengo > 0) exitWith {hint "No tienes uranio, así que me resultas bastante inútil."};
	if !(pop_din >= 10000) exitWith {hint "¡Poder puedo! Pero no siempre querer es poder,  ¿sabes? todo tiene un precio, en este caso serían unos 10.000€"};
	pop_din = pop_din - 10000;
	["- 40.000€"] call ica_fnc_infolog;
	
	hint "Con mis movimientos rápidos y precisos, esto me llevará unos 30 segundos, no te alejes !!";
	sleep 20;
	hint "Ya está casi...";
	sleep 10;
	hint "¡Ya está! He aumentado la proporción del isótopo U235 que me has traído del 0.71% al 3,4%... ¡y casi sin moverme! Ten cuidado que esto es muy peligroso. No se lo vayas a vender a algún loco...";
	
	if ((player distance _tio) > 5) exitWith {
		hint "Ya te dije que no enviaba nada por correo. Ah, por cierto, no se aceptan devoluciones.";
	};
	
	if (["pop_uranio"] call ica_fnc_tengo isEqualTo 0) exitWith {hint "A mí no me engañas"};
	["pop_uranio", -1] call ica_fnc_item;
	["pop_u235"] call ica_fnc_item;
	["- 1 Uranio"] call ica_fnc_infolog;
	["+ 1 U235"] call ica_fnc_infolog;
};

if (_param isEqualTo "vender") exitWith {
	_tio = _this select 1;
	
	if ((player distance _tio) > 5) exitWith {
		hint "No poder hacer business con usted si estar lejos.";
	};	

	if (["pop_u235"] call ica_fnc_tengo isEqualTo 0) exitWith {hint "*acento árabe* Hola, yo comprar u235, ¿tener tu?"};
	["pop_u235", -1] call ica_fnc_item;
	
	_din = 120000 + round (random 30000);
	hint "*acento árabe* Placer hacer business con usted";
	pop_din = pop_din + _din;
		
	["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;
};
