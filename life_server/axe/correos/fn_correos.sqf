
/*
Correos del Estado
by: AxE
	

*/

_param = _this select 0;

if (_param isEqualTo "init") exitWith { 

	[[NPC_AXE_CORREOS, ["Solicitar equipamento y coche oficial - Correos del Estado", {["solicito"] call ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS, ["Entregar equipamento y coche oficial - Correos del Estado", {["entrego"] call ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS, ["Recoger paquetes de correos - Correos del Estado", {["recoger"] call ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	[[NPC_AXE_CORREOS, ["Cobrar salario por ruta - Correos del Estado", {["cobrar"] call ica_fnc_correos}]],"addAction",true,true] call BIS_fnc_MP;
	
	paquetesCorreos = 6;

	while {true} do {
			if (paquetesCorreos > 19) then {
				paquetesCorreos = 20 
				};
		paquetesCorreos = paquetesCorreos + ceil(random 19);
		publicVariable "paquetesCorreos";
		
		sleep (60 * 10);
	};	

	
	
};



_class = "pop_correos";

if (_param isEqualTo "recoger") exitWith {

	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policía, acaparador!";};
	_trabajo = player getVariable ["trabajando_correos",0];
	if (_trabajo > 0) exitWith {hint "Ya te di correos antes ... debes cobrar por ellos antes de pedir más, las cuentas claras."};
	if (isNil {paquetesCorreos}) exitWith {hint "Al parecer no han llegado paquetes..."};
	
	_n = 10;
	
	if !(paquetesCorreos >= _n) exitWith {hint "No me queda ningún paquete para ti, vuelve más tarde."};
	if !(player canAdd [_class, _n]) exitWith {hint "No tienes suficiente espacio."};
	
	paquetesCorreos = paquetesCorreos - _n;
	publicVariable "paquetesCorreos";
	
	["pop_correos",_n] call ica_fnc_item;
	player setVariable ["trabajando_correos",1,true];
	player setVariable ["entregados_correos",0,true];	
	[format ["+ %1", [_class] call ica_fnc_classToName]] call ica_fnc_infolog;
	
	
	
	
		while {(player getVariable "trabajando_correos") == 1} do
		{
			if (!alive player) exitWith {};
			
			_listaventa = listaCasas + listaGarajes;
			if((typeof cursorTarget) in _listaventa) then {
			accionparadabuzon = player addAction ["Entregar paquete",{
			player removeAction accionparadabuzon;
			["entregaPaquete"] call ica_fnc_correos;
			}];
			waitUntil {!((typeof cursorTarget) in _listaventa)};
			player removeAction accionparadabuzon;
			};
		};	
};


if (_param isEqualTo "cobrar") exitWith {
	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policía, acaparador!";};
	if (!isNil {ocupado}) exitWith {hint "Estás ocupado."};
	0 spawn {
		ocupado = true;
		sleep 2;
		ocupado = nil;
	};
	_cobrotrabajo = player getVariable ["trabajando_correos",0];
	if (_cobrotrabajo < 1) exitWith {hint "trabaja primero no me seas tan vago"};
	_paquetes = ["pop_correos"] call ica_fnc_tengo;
	
	if (_paquetes > 0) exitWith {hint "Pero qué es esto? Aún tienes paquetes que entregar, venga y no me seas vago ve y entrega todo."};

	_entregadospaga = player getVariable "entregados_correos";
	if (isNil "_entregadospaga") exitWith {hint "Vienes a cobrar? pero si me acaba de llamar Lorenzo y no ha recibido su correo..."};
	if (_entregadospaga < 0.5) exitWith {hint "Amigo, tenías que poner el correo en las puertas de las casas, no?"};
	
	_din = (200 * _entregadospaga) + (round random 50);
	pop_din = pop_din + _din;
	if (_entregadospaga > 6) then {
	["exp",8] call ica_fnc_arrayexp;
	[format ["+ %1 de exp", 8]] call ica_fnc_infolog;
	};
	[format ["+ %1€", _din]] call ica_fnc_infolog;
	player setVariable ["trabajando_correos",0,true];
	_organizacion = cursorTarget getVariable["controlado_por",grpNull];
	if(!isNull _organizacion) then 
	{ 
	[(round (_din * 0.01)),_organizacion] call life_fnc_gangExtorsion;  
	};
		_lvl = cursorTarget getVariable ["negociolvl",0];
		_lvl = _lvl + 2;
		if (_lvl > 100) then {
		_lvl = 100;
		};
		cursorTarget setVariable ["negociolvl",_lvl, true];		
	hint format ["Gracias por tu trabajo!! \n\n Correos Reales del Estado te ha pagado: %1, recuerda que para obtener experiencia deberás entragar todos los paquetes.", _din];

};


if (_param isEqualTo "entregaPaquete") exitWith {

	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policía, acaparador!";};
	_paquetes = [_class] call ica_fnc_tengo;
	_cobrotrabajox = player getVariable ["trabajando_correos",0];
	if (_cobrotrabajox < 1) exitWith {hint "registrate primero en correos no me seas tan vago"};
	if !(vehicle player == player) exitWith {hint "Y como pretendes entregar el correo desde el coche ? mentalmente ?"};
	if (_paquetes == 0) exitWith {hint "No tienes ninguna caja de correos."};
	//if ((typeof vehicle player) != "pop_nemo_correos") exitWith {hint "Solo estas autorizado para entregar correos en un coche de correos."};
	_clase = typeof cursorTarget; 
	_buzon = (nearestObjects [player, [_clase], 7]) select 0;
	
	if ((player distance cursorTarget) > 10) exitWith {hint "debes acercarte mas a la puerta no crees ?"};
	
	_entregado = cursorTarget getVariable "correo_entregado";
	if (isNil "_entregado") then {_entregado = 0};
	if (_entregado > 0.5) exitWith {hint "El correo de esta casa ya fue entregado, busca otro buzón"};
	_recompensa = 0;
	
	[2, "Colocando el correo ..."] spawn ica_fnc_barrita;
	 player playActionNow "PutDown";
	
	cursorTarget setVariable ["correo_entregado",1,true];
	["pop_correos",-1] call ica_fnc_item; 
	[format ["- %1 %2", -1, ["pop_correos"] call ica_fnc_classToName]] call ica_fnc_infolog;	
	
	
		if ((floor random 100) < 10) then { 
	_regalo1 = [

		["pop_esposas", 1, 2],
		["pop_llaves", 1, 2],
		["pop_lingotehierro", 1, 2]
	] call BIS_fnc_selectRandom;
	
	_regalitoComun = _regalo1 select 0;
	_canComun = (_regalo1 select 1) + round random (_regalo1 select 2);
	
	[_regalitoComun, _canComun] call ica_fnc_item;
	[format ["+ %1 %2", _canComun, [_regalitoComun] call ica_fnc_classToName]] call ica_fnc_infolog;	
	
	hint format ["Este paquete de correo tenía: %1 %2 ... mejor te lo quedas pero shshsh \n\n", _canComun, _regalitoComun];

	_recompensa = 1;
	};
	
	if ((floor random 100) < 5) then {
	private ["_regalitoRaro", "_canRaro"];	
		_regalo2 = [
			// ["className", cantidadSegura, cantidadRandomAñadida],
			["pop_bisturi_item", 1, 0],
			["pop_nokia", 1, 0],
			["pop_componentes", 1, 0]
		] call BIS_fnc_selectRandom;
		
		_regalitoRaro = _regalo2 select 0;
		_canRaro = (_regalo2 select 1) + round random (_regalo2 select 2);
		
		[_regalitoRaro, _canRaro] call ica_fnc_item;
		[format ["+ %1 %2", _canRaro, [_regalitoRaro] call ica_fnc_classToName]] call ica_fnc_infolog;	
		
		hint format ["Hostias!! Este paquete de correo tenía: %1 %2 ... madre mía que me lo quedo ! \n\n", _canRaro, _regalitoRaro];
		_recompensa = 1;
	};
	
	if (_recompensa < 1) exitWith {
	sleep 2;
	_pentregados = player getVariable "entregados_correos";
	player setVariable ["entregados_correos",_pentregados + 1,true];
	["Correo entregado"] call ica_fnc_infolog;	
	};
};

if (_param isEqualTo "solicito") exitWith {
	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policía, acaparador!";};
    if (!license_civ_driver) exitwith {hint "No tienes carnet de conducir B, no puedes conducir este coche."};
    if (pop_din < 1500) exitwith {hint "La fianza del coche son 1500€"};
    pop_din = pop_din - 1500;
    _cochecorreo = "pop_nemo_correos" createvehicle position player;
    _cochecorreo setvariable ["propietario",name player,true];
    player setvariable ["uniforme",uniform player,true];
    player adduniform "correos_pop";
    hint "Todo listo capo, recoge los paquetes aquí mismo, cárgalos y ve a entregar todo a las puertas de las casas.";
};


if (_param isEqualTo "entrego") exitWith {
	if (playerSide == WEST)exitWith{hint "Ya tienes trabajo como policía, acaparador!";};
    if ((count (nearestObjects [player, ["man"], 6]))>1) exitwith {hint "De uno en uno, por favor."};
    _cochecorreo = nearestObject [player, "pop_nemo_correos"];
    if (isnil {_cochecorreo}) exitwith {hint "No veo cerca ningún coche de correos."};
    if ((player distance _cochecorreo)>5) exitwith {hint "Acerca el coche de correos."};
    _propietario = _cochecorreo getvariable "propietario";
    if (name player != _propietario) exitwith {hint "Este coche no está registrado a tu nombre."};
    deletevehicle _cochecorreo;
    _uniforme = player getvariable "uniforme";
    player adduniform _uniforme;
    pop_din = pop_din + 1500;
    hint "Todo listo, el coche está guardado en el garage, vuelve a por más trabajo cuando quieras.";
};