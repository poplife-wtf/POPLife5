/*
Minijuegos para sistema de Granjas PoP Life v5 By AxE && Heisenberg www.plataoplomo.wtf
Minigames for farm system PoP Life v5 By AxE && Heisenberg www.plataoplomo.wtf

Syntax :
["pollo"] 	spawn 	ica_fnc_minijuegos;
["pollo1"] 	spawn 	ica_fnc_minijuegos;
["malah"] 	spawn 	ica_fnc_minijuegos;


*/

_param = _this select 0;
closedialog 0;

if (isNull granjaActual) then {

granjaActual = nearestObjects [player,listaGranjas, 10] select 0;

};


if !(uniform player in uniformesGranja) exitWith {
	[player,
	"No pareces estar vestido para el trabajo de campo ... mas bien para mesero o que se yo..", 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;
};

if (_param isEqualTo "pollo") then {

	player addAction ["Atrapar pollo", {
	pollop = false;
	deletevehicle pollo;
	granjaActual setVariable ["granjalvl",(granjaActual getVariable ["granjalvl",0]) + 2,true];
	pollo setVariable ["persistent",false,true];

	pop_din = pop_din + 5;
	["exp",3] call ica_fnc_arrayexp;
	[format ["+ %1euro", 5]] call ica_fnc_infolog;	
	
	},nil,6,true,true,"","(player distance pollo) < 0.6 && (stance player) isEqualTo 'PRONE' && alive pollo "];
	
	pollo = createAgent ["Cock_white_F", getPos player, [], 5, "CAN_COLLIDE"];
	pollo setVariable ["BIS_fnc_animalBehaviour_disable", true];
	pollop = true;
	pollo setVariable ["persistent",true,true];
	pollo spawn {
	sleep 60;
	deletevehicle _this;
	};
	while {alive pollo} do {
		pollo moveTo [(position pollo select 0), (position pollo select 1), position pollo select 2];
		pollo setpos [(position pollo select 0) + 0.1, (position pollo select 1) + 0.1, (position pollo select 2) + 0.1];
		if ((random 100) < 10) then {pollo setpos [(position pollo select 0) - 1, (position pollo select 1) - 4, (position pollo select 2)]};
		if ((random 100) < 50) then { pollo setdir (random 365)};
		pollo playMove "Cock_Run";
		if !(pollop) exitWith {};
		sleep 1;
	};
	
	
};


if (_param isEqualTo "pollo1") then {
	if (player getvariable ["trabajoactivo",false]) exitwith {[player,"Ya tienes un trabajo activo", "Granjas de Metropolis","Cock_white_F"] call ica_fnc_axeMsg};
	private["_numero","_aactual","_aactualc","_pollomuerto","_pollo","_pollos"];
	_aactual = handgunWeapon player;
	_aactualc = handgunItems player;
	player removeweapon (handgunweapon player);
	player addweapon "KA_axe";
	player addMagazine "KA_axe_blade";
	player addHandgunItem "KA_axe_blade";
	[player,"Todos tus pollos se han escapado, ahora la forma mas facil de atraparlos es cenarlos esta noche asi que venga toma este hacha y apunta al cuello para que no sufran.", "Granjas de Metropolis","pop_trigo_plan"] call ica_fnc_axeMsg;
	sleep 5;

	numero = floor random[6,9,13];
	pollomuerto = 0;
	_pollos = [];
	player setvariable ["trabajoactivo",true,true];
	_pollos spawn {sleep 190;player setvariable ["trabajoactivo",false,true];{deletevehicle _x} forEach _this};
	for "_i" from 1 to numero do {
		_pollo = createAgent ["Cock_white_F", [(position player select 0) + random[-15,10,15], (position player select 1) + random[-15,10,15], position player select 2], [], 5, "CAN_COLLIDE"];
		_pollo playMove "Cock_Run";
		_pollos pushback _pollo;
		_pollo addEventHandler ["killed", "pollomuerto = pollomuerto + 1;hint format ['Has Matado %1 de %2 pollos asesinados',pollomuerto,numero];if (pollomuerto == numero) then {
		granjaActual setVariable ['granjalvl',(granjaActual getVariable ['granjalvl',0]) + 10,true];
		[player,'Ya has matado a todos los pollos, vuelve pronto pronto porque se suelen escapar mas', 'Granjas de Metropolis','Cock_white_F'] call ica_fnc_axeMsg;
		_page =  round (random [200,210,250]);
		pop_din = pop_din + _page;
		['exp',3] call ica_fnc_arrayexp;
		[format ['+ %1€', _page]] call ica_fnc_infolog;
		player removeweapon 'KA_axe';
		player addweapon _aactual;
		player removeMagazine 'KA_axe_blade';
		{player addHandgunItem _x} forEach _aactualc;
		numero = nil;
		pollomuerto = nil;
		{deletevehicle _x} forEach _pollos;_pollos = nil;
		player setvariable ['trabajoactivo',false,true];
		};
		"];
	};
};


if (_param isEqualTo "malah") then {
		if (player getvariable ["trabajoactivo",false]) exitwith {[player,"Ya tienes un trabajo activo", "Granjas de Metropolis","Cock_white_F"] call ica_fnc_axeMsg;};
		[player,"Tienes que quitar todas estas malas hierbas que se han formado en la zona", "Granjas de Metropolis","pop_trigo_plan"] call ica_fnc_axeMsg;
		sleep 2;
		puntos = 0;
		puntosfin = floor random[8,12,16];
		plantas = [];
		0 spawn {sleep 190;player setvariable ["trabajoactivo",false,true]};
		player setvariable ["trabajoactivo",true,true];
	for "_i" from 1 to 17 do {
		_planta = "pop_trigo_plan" createvehiclelocal [(position player select 0) + random(15), (position player select 1) + random(15), position player select 2];
		plantas pushback _planta;
		[
			_planta, 
			"Quitar mala hierba", 
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
			"_this distance _target < 3;(stance _caller) isEqualTo 'CROUCH'","_caller distance _target < 3;(stance _caller) isEqualTo 'CROUCH'", 
			{hint "Arrancando malas hierbas"}, 
			{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"}, 
			{deletevehicle (_this select 0);hint "Ya has arrancando esta planta.";puntos = puntos + 1;hint format ["Has arrancado %1 de %2",puntos,puntosfin]; if (puntos >= puntosfin) then {cutText ["Despues de Varias horas de trabajo!","BLACK Out",0];player setvariable ["trabajoactivo",false,true];sleep 3;cutText ["","BLACK in",0]; {deletevehicle _x} forEach plantas;plantas = nil;hint "Por Fin he acabado el trabajo";granjaActual setVariable ['granjalvl',(granjaActual getVariable ['granjalvl',0]) + 5,true];
			_page =  round (random [150,160,170]);
			pop_din = pop_din + _page;
			["exp",3] call ica_fnc_arrayexp;
			[format ["+ %1euro", _page]] call ica_fnc_infolog;
			puntos = nil;
			}}, 
			{hint "Te falta arracancar el tallo"}, 
			[], 
			(floor random[2,3,4]), 
			0, 
			true, 
			false 
		] call BIS_fnc_holdActionAdd;
	};
};

if (_param isEqualTo "manzanas") then {


_matas = round (random [6,8,12]);
_arrMatas = [];

for "_i" from 1 to _matas do {

_pos = getPosWorld player;  _posX = (_pos select 0) + round (random [6,8,10]); _posY = (_pos select 1) + round (random [6,8,10]); _pos set [0,_posX]; _pos set [1,_posY];
_planta = createSimpleObject ["a3\plants_f\bush\b_neriumo2s_f.p3d",_pos];
_arrMatas pushback _planta;

};

_arrMatas spawn {
	sleep 60;
	{deletevehicle _x;sleep 5} forEach _this;
};

granjaActual setVariable ['granjalvl',(granjaActual getVariable ['granjalvl',0]) + 2,true];

};


if (_param isEqualTo "animales") then {

_animalRandom = ["Sheep_random_F","Goat_random_F"] call BIS_fnc_selectRandom;
_intentos = round (random [2,3,6]);

_animal = createAgent [_animalRandom,position player,[],0,"FORM"];
_animal setDir (random 360);

_clase = typeof _animal;
if (_clase isEqualTo "Sheep_random_F") then {

accionAnimalesGranja = player addAction ["Retirar Lana",{
	private ["_animal","_intentos"];
	_animal = _this select 3 select 0;
	_intentos = _this select 3 select 1;
	
	while {_intentos > 0} do {
	player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic";
	waituntil {!(animationstate player isEqualTo "ainvpknlmstpsnonwnondnon_ainvpknlmstpsnonwnondnon_medic")};
	_intentos = _intentos - 1;
	
		if (_intentos isEqualto 0) then {
		
			if (_animal distance player > 2) then {
				hint "la obeja se va, la obeja se fue, la obeja se escapa de tuuu vida... ";
				player removeAction accionAnimalesGranja;
				_animal spawn {sleep round (random [60,70,80]); deletevehicle _this};
			}else{
				granjaActual setVariable ['granjalvl',(granjaActual getVariable ['granjalvl',0]) + 2,true];
				player removeAction accionAnimalesGranja;
				player addItemToBackpack "pop_lana";
				hint "Has obtenido algo de lana, puedes llevarla al procesado de tela en diablos y una vez hecho tendrás tela, dinero o mejoras para tu granja";
				_animal spawn {sleep round (random [60,70,80]); deletevehicle _this};
			};
		};
	
	};
	
},[_animal,_intentos],1.5,true,true,"","!(position player nearObjects [""Sheep_random_F"",1.8] isEqualto [])"]; 
	
}else{

accionAnimalesGranja = player addAction ["Ordeñar Cabra",{
	private ["_animal","_intentos"];
	_animal = _this select 3 select 0;
	_intentos = _this select 3 select 1;
	
	while {_intentos > 0} do {
	player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic";
	waituntil {!(animationstate player isEqualTo "ainvpknlmstpsnonwnondnon_ainvpknlmstpsnonwnondnon_medic")};
	_intentos = _intentos - 1;
	
		if (_intentos isEqualto 0) then {
		
			if (_animal distance player > 2) then {
				hint "he he ... le has apretao mucho las tetas y se ha ido ... intentalo de nuevo ";
				player removeAction accionAnimalesGranja;
				_animal spawn {sleep round (random [60,70,80]); deletevehicle _this};			
			}else{
				granjaActual setVariable ['granjalvl',(granjaActual getVariable ['granjalvl',0]) + 2,true];
				player removeAction accionAnimalesGranja;
				player addItemTobackpack "pop_leche_cabra";
				hint "Has obtenido algo de leche de cabra, puedes usarla para hacer poderosas bebidas que te daran mucho comfort o venderlas para mejorar tu granja";
				_animal spawn {sleep round (random [60,70,80]); deletevehicle _this};
			};
		};
	
	};
	
},[_animal,_intentos],1.5,true,true,"","!(position player nearObjects [""Goat_random_F"",1.8] isEqualto [])"]; 

};


};