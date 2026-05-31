
/* 
By AxE

Robos y más Robos ... variados y divertidos ...
Ahora metemos a las mafias a vigilar los robos, en cambio de cobrar extorsion.

*/

_p = _this select 0;
_npc = _this select 1;
_clase = typeof _npc;
_grupo = _npc getVariable ["controlado_por",grpNull];

//Excepciones
if (_p isEqualTo "robar") then {

	_next = HW getVariable ["robosPeque",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo menor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosPeque",(time + (15 * 60)),true];
	

if (!isNull _grupo) then {
	[10, "Atacan en tu Zona un Negocio", [1,0,0], 1.5, _text, [1,1,1], 1] remoteExec ["ica_fnc_anuncio", _grupo];
	[1,_text] remoteExec ["life_fnc_broadcast",_grupo];	
	
	if (_grupo isEqualTo group player) exitwith {
		[player,
		format ["he ... pero que ... si yo te conozco ... tu eres %1m ... osea un dia me cobras por protección y al otro me robas ? como va la cosa...",name player], 
		"Atraco al Negocio",
		_clase] call ica_fnc_axeMsg;
	};

};


if ({side _x == WEST} count playableUnits < 3) exitWith {hint "Tienen que estar al menos 3 policias conectados, sino, no es divertido."};



if (side player == WEST) exitWith {hint "Puto policía corrupto, ¡se lo voy a decir a todo el mundo!"}; // eres poli
	if ((primaryWeapon player == "") AND (handgunWeapon player == "")) exitWith {
		[player,"Que quieres tu ??? Robar ? a mi ? con que ? una polla ! ahora te muestro la mía...", 
		"Atraco al Negocio",
		_clase] call ica_fnc_axeMsg;
	}; // eres tonto
	_count = player ammo handgunWeapon player;
	if (_count < 6) exitWith {
		[player,"Que quieres tu ??? Robarme ? a mi ? con que ? una polla ! ahora te muestro la mía...", 
		"Atraco al Negocio",
		_clase] call ica_fnc_axeMsg;
	};
	if (!isNil {_npc getVariable "jodido"}) exitWith {
		[player,"Hombre, entre lo que me cobran por protejerme y lo que recien me robaron ... tu si quieres miralo por ti mismo ... nada .. de nada .. no hay nada ... estoy mas pelado que la colita del niño dios", 
		"Atraco al Negocio",
		_clase] call ica_fnc_axeMsg;
	}; // existe la var, te esperas

	if (isNil {_npc getVariable "jodido"}) then { // no existe la var, la pongo
		_npc setVariable ["jodido", true, true];
	};

	  if (("baj" call ica_fnc_expToLevel) < 2) exitWith {
            titleText["No sabes robar...", "PLAIN"];
		};
	
	_posIni = getPos player;
	_pos = getPos _npc;
	_coord = mapGridPosition _pos;
	_msgpoli = format ["Están atracando un Negocio en coordenadas %1", _coord];
	
	_text = format ["Están atracando un Negocio en coordenadas %1", _coord];
	
	[10, "Aviso", [1,0,0], 1.5, _msgpoli , [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];
	
	if (life_HC_isActive) then {
		[getPlayerUID player,profileName,"211"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
	} else {
		[getPlayerUID player,profileName,"211"] remoteExecCall ["life_fnc_wantedAdd",2];
	};			
	
	_tiempoespera = 400 + (round (random 100));
	[_tiempoespera, "Espera mientras reunen tu dinero ..."] spawn ica_fnc_barrita;
	sleep _tiempoespera;
	
	if ((_posIni distance (getPos player)) > 50) exitWith {
	[player,"Te has ido antes de pillar la pasta merluzo !!.", 
	"Atraco al Negocio",
	_clase] call ica_fnc_axeMsg;
	};
	
	[player,"Esto es todo lo que tengo ... se lo juro no tengo más ... nada nada más.", 
	"Atraco al Negocio",
	_clase] call ica_fnc_axeMsg;
	
	_polisOn= {side _x == WEST} count playableUnits;
	_pasta= _polisOn * 200;
	pop_din = pop_din + 2500 + round random 1000 + _pasta;
	_npc setVariable ["negociolvl",0,true];

};