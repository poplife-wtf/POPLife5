/*
By Heisenberg
Se invoca con:
				["robo"] spawn ica_fnc_robo
				["termino"] spawn ica_fnc_robo
				

*/

_param = _this select 0;
mesaDeMeta = _this select 1;

if (_param isEqualto "robo") exitwith {
	if (HW getvariable ["robo",false]) exitwith {[player,"La sucursal bancaria ya no tiene lo que tenemos, parece que alguien se lo ha llevado.","Sucursal Bancaria RiverSide"] call ica_fnc_axeMsg;};
	if (side player == WEST) exitWith {hint "Puto policía corrupto, ¡Como no te vayas cagando leches se lo digo a todo el mundo!"}; //Eres policia y no puedes robar.
	if (currentWeapon player == "") exitWith {hint "¡¿Que quieres ENMAYAO?!"}; // Sin arma no puedes robar.
	if ({side _x == WEST} count playableUnits < 3) exitWith {hint "No será divertido"};
	if ((count (units group player)) < 3) exitWith {[player,"No tienes suficientes huevos entre todo tu grupo para atracar esto","Sucursal Bancaria"] call ica_fnc_axeMsg};
	
	_next = HW getVariable ["robosPeque",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo menor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosPeque",(time + (15 * 60)),true];	
	
	HW setvariable ["robo",true,true];
	[mostrador,["Intentar abrir caja fuerte", {["termino"] spawn ica_fnc_robo;mostrador remoteExec ["removeallactions",0]},nil,6,true,true,"","true"]] remoteExec ["addAction",group player,false];
	
	titleText ["Si dejas de apuntar al señor del Mostrador, avisara a la policia. ¡Ten cuidado!", "PLAIN", 0.5];
	sleep 1;
	[player,"Tu compañero tiene que forzar la caja fuerte. Cada vez que suene el perno tienes que darle a forzar","Cerrajero"] call ica_fnc_axeMsg;
	sleep 3;
	
	_cagada = false;
	while {true} do {
		if (cursortarget != NPC_SUCURSALBANCARIA) exitWith {_cagada = true};
		if ((player distance NPC_SUCURSALBANCARIA) > 5) exitWith {_cagada = true};
		if ((currentWeapon player == "")) exitWith {_cagada = true};
		if (HW getvariable "paso2") exitWith {hint "Corred insensatos";/* Añadir dar dinero*/};
		if (_cagada) exitWith {[1,format ["Sucursal bancaria de RiverSide esta siendo robada : %1!",mapgridposition NPC_SUCURSALBANCARIA]] remoteExec ["life_fnc_broadcast",west]};
	};
	
};


if (_param isEqualto "termino") exitwith {
		HW setvariable ["juegopernos",true,true];
		HW setvariable ["pernos",0,false];
		pernos = 5;
		_accion = player addAction ["<t color='#FF0000'>Forzar</t>", {if (HW getvariable ["sonido",false]) then {HW setvariable ["pernos",(HW getvariable "pernos")+ 1,false];hint format ["LLevas %1 pernos de %2 pernos totales",(HW getvariable "pernos"),pernos]} else {HW setvariable ["pernos",(HW getvariable "pernos") - 1];hint format ["LLevas %1 pernos de %2 pernos totales",(HW getvariable "pernos"),pernos]}}];
		[] spawn {sleep 100;if (HW getvariable ["juegopernos",false]) then {hint "Has tardado mucho en abrir la caja, le gente de la zona ha llamado a la policia. En 60 segundos la caja sera imposible de abrir.";[1,format ["Estan Intentando conseguir codigos para banco Coordenadas : %1!",mapgridposition NPC_SUCURSALBANCARIA]] remoteExec ["life_fnc_broadcast",west]; sleep 60; ["rstrobo"] spawn ica_fnc_robo}};
		while {HW getvariable "juegopernos"} do {
			if ((floor random(100)) < (floor random(15))) then {HW setvariable ["sonido",true,false];[mostrador,"sonido"] remoteExec ["life_fnc_say3d",0,false];sleep 0.6;HW setvariable ["sonido",false,false]};
			if ((HW getvariable "pernos") isEqualto pernos) exitwith {HW setvariable ["paso2",true,true];removeallactions player;[mostrador,"caja"] remoteExec ["life_fnc_say3d",0,false];removeAllActions mostrador;HW setvariable ["juegopernos",false,true];["rstrobo"] spawn ica_fnc_robo;["premiorobo"] spawn ica_fnc_robo};
			sleep 0.5;
		};
		
};

if (_param isEqualto "rstrobo") exitWith {
removeallactions player;
removeallactions mostrador;

sleep 120;
pernos = nil;
HW setvariable ["juegopernos",	nil,	true];
HW setvariable ["pernos",	nil,	true];
HW setvariable ["sonido",	nil,	true];
HW setvariable ["paso2"	,	nil,	true];
HW setvariable ["robo",		false	,true];



};

if (_param isEqualto "premiorobo") exitWith {

codigo = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);

codigo1 pushback codigo;
publicvariable "codigo1";
mostrador setvariable ["codigo",codigo,true];
mostrador addAction ["<t color='#FF0000'>Coger Papel con el codigo</t>", {[mostrador getvariable "codigo"] call ica_fnc_creacodigo;mostrador removeaction (_this select 2);mostrador setvariable ["codigo",nil,true]}];



};

if (_param isEqualto "robo1") exitwith {
		if (HW getvariable ["robo1",false]) exitwith {[player,"La sucursal bancaria ya no tiene lo que tenemos, parece que alguien se lo ha llevado.","Sucursal Bancaria RiverSide"] call ica_fnc_axeMsg;};
		if ({side _x == WEST} count playableUnits < 6) exitWith {hint "Sin maderos esto no sirve para nada. ¿Si un policia me dice papeles y yo le digo tijeras? ¿Gano la Partida?"};
		if ((count (units group player)) < 8) exitWith {[player,"No tienes suficientes huevos entre todo tu grupo para atracar esto","General Bancario"] call ica_fnc_axeMsg};
	_next = HW getVariable ["robosPeque",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo menor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosPeque",(time + (15 * 60)),true];
		
		HW setvariable ["robo1",true,true];
		
		c1 = "plp_ct_cartonLightFlat" createvehicle [4868.68,3031.99,0];
		[c1, ["<t color='#FF0000'>Coger Tarjeta Encryptada</t>", {player additem "pop_tarjeta_s";deletevehicle (_this select 0)},nil,6,true,true,"","true"]] remoteExec ["addAction",0,c1];
		
		c2 = "plp_ct_cartonLightFlat" createvehicle [4842.39,2994.49,0];
		[c2, ["<t color='#FF0000'>Coger Tarjeta Encryptada</t>", {player additem "pop_tarjeta_s";deletevehicle (_this select 0)},nil,6,true,true,"","true"]] remoteExec ["addAction",0,c2];
		
		c3 = "plp_ct_cartonLightFlat" createvehicle [4840.23,3024.23,0];
		[c3, ["<t color='#FF0000'>Coger Tarjeta Encryptada</t>", {player additem "pop_tarjeta_s";deletevehicle (_this select 0)},nil,6,true,true,"","true"]] remoteExec ["addAction",0,c3];
		
		c4 = "plp_ct_cartonLightFlat" createvehicle [4900.53,3087.19,0];
		[c4, ["<t color='#FF0000'>Coger Tarjeta Encryptada</t>", {player additem "pop_tarjeta_s";deletevehicle (_this select 0)},nil,6,true,true,"","true"]] remoteExec ["addAction",0,c4];
		
		c5 = "plp_ct_cartonLightFlat" createvehicle [4924.29,3096.65,0];
		[c5, ["<t color='#FF0000'>Coger Tarjeta Encryptada</t>", {player additem "pop_tarjeta_s";deletevehicle (_this select 0)},nil,6,true,true,"","true"]] remoteExec ["addAction",0,c5];
		
		
		{
		[pc1,"Meter tarjeta encrytada y sacar informacion en Portatil 1","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","_this distance _target < 3","((['pop_tarjeta_s'] call ica_fnc_tengo) > 0)",{[pc1,"keyboard"] remoteExec ["life_fnc_say3d",0,false]},{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"},{Roboportatiles setvariable ["tarjeta1",true,true];player removeitem "pop_tarjeta_s"}, {},[],(floor random[5,8,12]),0,true,false] call BIS_fnc_holdActionAdd;
		[pc2,"Meter tarjeta encrytada y sacar informacion en Portatil 2","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","_this distance _target < 3","((['pop_tarjeta_s'] call ica_fnc_tengo) > 0)",{[pc2,"keyboard"] remoteExec ["life_fnc_say3d",0,false]},{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"},{Roboportatiles setvariable ["tarjeta2",true,true];player removeitem "pop_tarjeta_s"}, {},[],(floor random[5,8,12]),0,true,false] call BIS_fnc_holdActionAdd;
		[pc3,"Meter tarjeta encrytada y sacar informacion en Portatil 3","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","_this distance _target < 3","((['pop_tarjeta_s'] call ica_fnc_tengo) > 0)",{[pc3,"keyboard"] remoteExec ["life_fnc_say3d",0,false]},{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"},{Roboportatiles setvariable ["tarjeta3",true,true];player removeitem "pop_tarjeta_s"}, {},[],(floor random[5,8,12]),0,true,false] call BIS_fnc_holdActionAdd;
		[pc4,"Meter tarjeta encrytada y sacar informacion en Portatil 4","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","_this distance _target < 3","((['pop_tarjeta_s'] call ica_fnc_tengo) > 0)",{[pc4,"keyboard"] remoteExec ["life_fnc_say3d",0,false]},{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"},{Roboportatiles setvariable ["tarjeta4",true,true];player removeitem "pop_tarjeta_s"}, {},[],(floor random[5,8,12]),0,true,false] call BIS_fnc_holdActionAdd;
		[pc5,"Meter tarjeta encrytada y sacar informacion en Portatil 5","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa","_this distance _target < 3","((['pop_tarjeta_s'] call ica_fnc_tengo) > 0)",{[pc5,"keyboard"] remoteExec ["life_fnc_say3d",0,false]},{player playMoveNow "AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"},{Roboportatiles setvariable ["tarjeta5",true,true];player removeitem "pop_tarjeta_s"}, {},[],(floor random[5,8,12]),0,true,false] call BIS_fnc_holdActionAdd;
		} remoteExec ["BIS_FNC_Spawn",0,true];
		
		[player,"El General de la sucursal bancaria ha tirado todas las cajas con las tarjetas por el balcon. Por suerte se le ha caido un papel con la informacion de los portatiles donde hay que meterlas.", "Robo General Bancario","pop_tarjeta_s"] call ica_fnc_axeMsg;
		sleep 5;
		[player,format [
			"
			<t color='#ff0000'>Posicion PC1 </t><t color='#0000FF'> --> </t><t color='#21B001'>%1</t>
			<t color='#ff0000'>Posicion PC2 </t><t color='#0000FF'> --> </t><t color='#21B001'>%2</t> 
			<t color='#ff0000'>Posicion PC3 </t><t color='#0000FF'> --> </t><t color='#21B001'>%3</t> 
			<t color='#ff0000'>Posicion PC4 </t><t color='#0000FF'> --> </t><t color='#21B001'>%4</t> 
			<t color='#ff0000'>Posicion PC5 </t><t color='#0000FF'> --> </t><t color='#21B001'>%5</t> 
			",(mapgridposition pc1),(mapgridposition pc2),(mapgridposition pc3),(mapgridposition pc4),(mapgridposition pc5)],"Posicion Portatiles","pop_portatil"] call ica_fnc_axeMsg;

			
		sleep 10;
		[player,"No lo hemos visto a tiempo, el mafioso le ha dado a autodestruir, toda la informacion se perdera si no la extraemos antes","Contra-reloj"] call ica_fnc_axeMsg;
		sleep 2;
		titleText ["Si dejas de apuntar al General del banco o Te alejas de el avisara a la policia ¡Ten cuidado!", "PLAIN", 1];
		[] spawn {
				_cuenta = 600;
				_cagada = false;
				while {true} do {
					_cuenta = _cuenta - 1;
					if (cursortarget != Roboportatiles) exitWith {_cagada = true};
					if ((player distance Roboportatiles) > 5) exitWith {_cagada = true};
					if ((currentWeapon player == "")) exitWith {_cagada = true};
					if (_cuenta == 10) then {[Roboportatiles,"countdown"] remoteExec ["life_fnc_say3d",0,false]};
					if (_cuenta == 0) exitwith {if !(isNil {Roboportatiles getVariable "tarjeta1"}) then {if !(isNil {Roboportatiles getVariable "tarjeta2"}) then {if !(isNil {Roboportatiles getVariable "tarjeta3"}) then {if !( isNil {Roboportatiles getVariable "tarjeta4"}) then {if !(isNil {Roboportatiles getVariable "tarjeta5"}) exitWith {0 spawn {sleep 5;0 spawn completo};hint "Parte - 1 Acabado"}} else {hint "La policia esta de camino"}} else {hint "La policia esta de camino"}} else {hint "La policia esta de camino"}} else {hint "La policia esta de camino"};};
					hintSilent format ["En %1 todos los portatiles deben de tener la informacion extraida",[_cuenta,"MM:SS"] call bis_fnc_secondstostring];
					if (_cagada) exitWith {[1,format ["Estan robando la informacion de los portatiles %1!",mapgridposition Roboportatiles]] remoteExec ["life_fnc_broadcast",west];[player,"La policia esta de camino","Cagada"] call ica_fnc_axeMsg;};
					sleep 1;
					};
				};
		
	
	completo = {
		_cuenta = 60;
		codigo = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
		_cagada = false;
		[1,format ["Informacion anonima : Dicen que estan atracando a un hombre en un tejado  Coor :  %1!",mapgridposition Roboportatiles]] remoteExec ["life_fnc_broadcast",west];
		while {True} do {
			_cuenta = _cuenta - 1;
			if (_cuenta == 0) exitwith {codigo2 pushback codigo; publicvariable "codigo2";["rstrobo1"] spawn ica_fnc_robo;player addAction ["<t color='#FF0000'>Coger Papel con el codigo</t>", {[codigo] call ica_fnc_creacodigo;player removeaction (_this select 2);codigo = nil}];};
			hint format ["Faltan %1 segundos para que tengamos acceso al codigo!",_cuenta];
			if ((player distance Roboportatiles) > 20) exitwith {_cagada = true};
			if (_cagada) exitwith {[player,"Mierda, dicen por la _radio que estan atracando a una persona en nuestra posicion. Hay que irse!","Cagada"] call ica_fnc_axeMsg;[1,format ["Estan robando la informacion de los portatiles %1!",mapgridposition Roboportatiles]] remoteExec ["life_fnc_broadcast",west]};
			sleep 1;
		};
	};



};

if (_param isEqualto "rstrobo1") exitWith {
sleep 1500;

{deletevehicle _x} foreach [c1,c2,c3,c4,c5];

HW setvariable ["robo1",false,true];

removeallactions pc1;
removeallactions pc2;
removeallactions pc3;
removeallactions pc4;
removeallactions pc5;

Roboportatiles setvariable ["tarjeta1",true,true];
Roboportatiles setvariable ["tarjeta2",true,true];
Roboportatiles setvariable ["tarjeta3",true,true];
Roboportatiles setvariable ["tarjeta4",true,true];
Roboportatiles setvariable ["tarjeta5",true,true];



};

if (_param isEqualto "meta") exitwith {


	if (mesaDeMeta getvariable ["meta",false]) exitwith {[player,"Alguien ya esta cocinando aqui.","Metanfetamina"] call ica_fnc_axeMsg;};

	
	mesaDeMeta setvariable ["meta",true,true];

	

	mesaDeMeta setvariable ["juego",true,true];
	mesaDeMeta setvariable ["sonido",true,true];
	mesaDeMeta setvariable ["cosametida",false,true];
	

	0 spawn {
	sleep 1600;
	[mesaDeMeta] remoteexec ["ica_fnc_resetrobo",2];
	};
	
	mesaDeMeta setvariable ["correcto",0,true];
	 
	[
	mesaDeMeta,
	"Meter Sosa Caustica",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 3",
	"_this distance _target < 3",
	{},
	{player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"},
	{mesaDeMeta = _this select 0; if ((["pop_sosa"] call ica_fnc_tengo) > 0 ) then {mesaDeMeta setvariable ["correcto",1,true];mesaDeMeta setvariable ["cosametida",true,true];[player,"Has metido Sosa Caustica","Droga","Pop_sosa"] call ica_fnc_axeMsg;player removeitem "pop_sosa"} else {hint "No tienes sosa Caustica"}},
	{},
	[],
	(floor random[2,4,6]),
	0,
	false,
	false
	] call BIS_fnc_holdActionAdd;

	
	[
	mesaDeMeta,
	"Meter Hidrogeno Cloridrico",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 3",
	"_this distance _target < 3",
	{},
	{player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"},
	{mesaDeMeta = _this select 0;  if ((["pop_hci"] call ica_fnc_tengo) > 0 ) then {mesaDeMeta setvariable ["correcto",2,true];mesaDeMeta setvariable ["cosametida",true,true];[player,"Has metido Hidrogeno Cloridrico","Droga","pop_hci"] call ica_fnc_axeMsg;player removeitem "pop_hci"} else {hint "No tienes Hidrogeno Cloridrico"}},
	{},
	[],
	(floor random[2,4,6]),
	0,
	false,
	false
	] call BIS_fnc_holdActionAdd;
	
	
	
	[
	mesaDeMeta,
	"Meter Acido Muriatico",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 3",
	"_this distance _target < 3",
	{},
	{player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"},
	{mesaDeMeta = _this select 0;  if ((["pop_muriatico"] call ica_fnc_tengo) > 0 ) then {mesaDeMeta setvariable ["correcto",3,true];mesaDeMeta setvariable ["cosametida",true,true];[player,"Has metido Acido Muriatico","Droga","pop_muriatico"] call ica_fnc_axeMsg;player removeitem "pop_muriatico"} else {hint "No tienes Acido Muriatico"}},
	{},
	[],
	(floor random[2,4,6]),
	0,
	false,
	false
	] call BIS_fnc_holdActionAdd;	
	
	
	[
	mesaDeMeta,
	"Meter Neodimio de Meitnerio",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 3",
	"_this distance _target < 3",
	{},
	{player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"},
	{mesaDeMeta = _this select 0; if ((["pop_neodimio"] call ica_fnc_tengo) > 0 ) then {mesaDeMeta setvariable ["correcto",4,true];mesaDeMeta setvariable ["cosametida",true,true];[player,"Has Neodimio de Meitnerio","Droga","pop_neodimio"] call ica_fnc_axeMsg;player removeitem "pop_neodimio"} else {hint "No tienes  Neodimio de Meitnerio"}},
	{},
	[],
	(floor random[2,4,6]),
	0,
	false,
	false
	] call BIS_fnc_holdActionAdd;
	
	[mesaDeMeta] remoteexec ["ica_fnc_resetrobo",2];
	
	_bueno = {
	mesaDeMeta = _this select 0;
	[mesaDeMeta,"compacte"] remoteExec ["life_fnc_say3d",0,false];
	mesaDeMeta setvariable ["correcto",0,true];
	};
	
	_malo = {
		mesaDeMeta = _this select 0;
		mesaDeMeta setvariable ["sonido",false,true];
		mesaDeMeta setvariable ["correcto",0,true];
		
		[mesaDeMeta,"silvidoexplo"] remoteExec ["life_fnc_say3d",0,false];
		sleep 3;
	
	
	
		_objecto = "plp_ctf_BarrelYellow" createvehicle getposatl mesaDeMeta;
		_objecto setdamage 1;
		_humo05 = "#particlesource" createVehicle getposatl mesaDeMeta; 
		_humo05 setParticleClass "ObjectDestructionSmokeSmallx"; 
		_humo055 = "#particlesource" createVehicle getposatl mesaDeMeta; 
		_humo055 setParticleClass "ObjectDestructionSmoke2x";
		_fuego110 = "#particlesource" createVehicle getposatl mesaDeMeta; 
		_fuego110 setParticleClass "ObjectDestructionFire1Smallx"; 
		_fuego110 setParticleFire [0,0,0];
		sleep 10;
		deletevehicle _objecto;
		sleep 60;
		_objecto = "plp_ctf_BarrelYellow" createvehicle getposatl mesaDeMeta;
		_objecto setdamage 1;
		sleep 30;
		deletevehicle _objecto;
		sleep 20;
		deletevehicle _objecto;
		deletevehicle _humo05;
		deletevehicle _humo055;
		deletevehicle _fuego110;
		mesaDeMeta setvariable ["sonido",true,true];
		call _ambiente;
		mesaDeMeta setvariable ["cosametida",false,true];
	};
	
	mesaDeMeta setvariable ["cuenta",2,true];
	mesaDeMeta setvariable ["array",["Sosa Caustica","Hidrogeno Clorhidrico","Acido Muriatico","Neodimio de Meitnerio"],true];
	_ambiente = {mesaDeMeta = _this select 0; while {mesaDeMeta getvariable "sonido"} do {[mesaDeMeta,"ambiente"] remoteExec ["life_fnc_say3d",0,false];sleep 6}};
	[mesaDeMeta] spawn _ambiente;
	while {mesaDeMeta getvariable "juego"} do {
		
		_rdm = selectRandom (mesaDeMeta getvariable "array");
		
		mesaDeMeta setvariable ["array",((mesaDeMeta getvariable "array") - [_rdm]),true];
		
		sleep 7;
		
		_cosa = switch (_rdm) do {
			case "Sosa Caustica": {			["pop_sosa","afirmochicos","sosa",1]};
			case "Hidrogeno Clorhidrico": {	["pop_hci","confirmamoses","hidrogeno",2]};
			case "Acido Muriatico": {		["pop_muriatico","99","acido",3]};
			case "Neodimio de Meitnerio": {	["pop_neodimio","ajamsivale","neodimio",4]};
			default {};
		};
		
		mesaDeMeta setvariable ["cosa",_cosa,true];
		
		_random = (floor random(5));
		
		 switch (_random) do {
		case 1: {if (!( mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,"aquipone"] remoteExec ["life_fnc_say3d",0,false];sleep 5;if (!(mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,(mesaDeMeta getvariable "cosa") select 1] remoteExec ["life_fnc_say3d",0,false]};}};
		case 2: {if (!( mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,"noestoyseguro"] remoteExec ["life_fnc_say3d",0,false]};sleep 10;if (!(mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,(mesaDeMeta getvariable "cosa") select 1] remoteExec ["life_fnc_say3d",0,false]};};
		case 3: {if (!( mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,"valeacido"] remoteExec ["life_fnc_say3d",0,false];sleep 3;[mesaDeMeta,"cuidado"] remoteExec ["life_fnc_say3d",0,false]};sleep 10;if (!(mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,(mesaDeMeta getvariable "cosa") select 1] remoteExec ["life_fnc_say3d",0,false]};};
		case 4: {if (!( mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,"77"] remoteExec ["life_fnc_say3d",0,false]}; sleep 10; if (!(mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,"88"] remoteExec ["life_fnc_say3d",0,false]};sleep 15;if (!(mesaDeMeta getvariable "cosametida")) then {[mesaDeMeta,(mesaDeMeta getvariable "cosa") select 1] remoteExec ["life_fnc_say3d",0,false]};};
		default {sleep 10;[mesaDeMeta,(mesaDeMeta getvariable "cosa") select 1] remoteExec ["life_fnc_say3d",0,false]};
		};
		
		
		waitUntil {sleep 1;((mesaDeMeta getvariable "correcto") != 0)};
		if ((random(100)) < 25) then {format ["%1",(selectrandom ["SmokeShellBlue","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellGreen","SmokeShellYellow"])] createvehicle (getPos mesaDeMeta)};
		
		if ((mesaDeMeta getvariable "correcto") isEqualto ((mesaDeMeta getvariable "cosa") select 3)) then {[mesaDeMeta] spawn _bueno;sleep (random[2,3,4]);mesaDeMeta setvariable ["cosametida",false,true];} else {[mesaDeMeta] spawn _malo};

		
		
		
		if ((count (mesaDeMeta getvariable "array")) == 0) then {mesaDeMeta setvariable ["cuenta",((mesaDeMeta getvariable "cuenta") - 1),true];_decir = switch (mesaDeMeta getvariable "cuenta") do {case 2: {"procesos2"};case 1: {"procesos1"};};[mesaDeMeta,_decir] remoteExec ["life_fnc_say3d",0,false];mesaDeMeta setvariable ["array",["Sosa Caustica","Hidrogeno Clorhidrico","Acido Muriatico","Neodimio de Meitnerio"],true];};
		if ((mesaDeMeta getvariable "cuenta") == 0) exitwith {
		
		mesaDeMeta setvariable ["cuenta",nil,true];
		mesaDeMeta setvariable ["juego",nil,true]; 	
		mesaDeMeta setvariable ["sonido",nil,true];  	
		mesaDeMeta setvariable ["cosametida",nil,true];
		mesaDeMeta setvariable ["correcto",nil,true]; 	
		mesaDeMeta setvariable ["array",nil,true];
		mesaDeMeta setvariable ["cosa",nil,true];
		mesaDeMeta setvariable ["sonido",nil,true];
		mesaDeMeta setvariable ["meta",false,true];
		
		["rmeta",mesaDeMeta] spawn ica_fnc_robo
		};
	};

   };

if (_param isEqualto "rmeta") exitWith {

accionRecogeMeta = player addAction [
    "<img  
        size='1'  
        color='#FF0000'  
        shadow='1'  
        image='\a3\ui_f\data\gui\cfg\hints\Take_ca.paa' 
    /> 
 <t size='1' color='#FF0000'>Recoger Metanfetamina</t>
<img  
        size='1'  
        color='#FF0000'  
        shadow='2'  
        image='\a3\ui_f\data\gui\cfg\hints\Take_ca.paa' 
    /> 
 ", 
    {
if (["pop_meta_b",20] call ica_fnc_item) then {["pop_meta_b",20] call ica_fnc_item;player removeaction accionRecogeMeta;} else {[player,"No tienes suficiente espacio","Metanfetamina","pop_meta_b"] call ica_fnc_axeMsg};
    }
];



[mesaDeMeta,"hemosacabado"] remoteExec ["life_fnc_say3d",0,false];



mesaDeMeta setvariable ["cuenta",nil,true];
mesaDeMeta setvariable ["juego",nil,true]; 	
mesaDeMeta setvariable ["sonido",nil,true];  	
mesaDeMeta setvariable ["cosametida",nil,true];
mesaDeMeta setvariable ["correcto",nil,true]; 	
mesaDeMeta setvariable ["array",nil,true];
mesaDeMeta setvariable ["cosa",nil,true];
mesaDeMeta setvariable ["sonido",nil,true];

removeallactions mesaDeMeta;



sleep 200;

mesaDeMeta setvariable ["meta",false,true];

[mesaDeMeta, ["<img  
        size='1'  
        color='#FF0000'  
        shadow='1'  
        image='\a3\Modules_F_Curator\Data\portraitLightning_ca.paa' 
    /> 
 <t size='1' color='#FF0000'>Cocinar Metanfetamina</t>
<img  
        size='1'  
        color='#FF0000'  
        shadow='2'  
        image='\a3\Modules_F_Curator\Data\portraitLightning_ca.paa' 
    /> 
 ", {["meta",_this select 0] spawn ica_fnc_robo},nil,6,true,true,"","true"]] remoteExec ["addAction",0,false];



};


if (_param isEqualto "vender") exitWith {

if ((["pop_meta_b"] call ica_fnc_tengo) < 20) exitwith {[player,"No tienes lo que hay que tener. Necesitas mas Metanfetamina","Metanfetamina","pop_meta_b"] call ica_fnc_axeMsg};


_codigo = ([((random 89999999999999999999) + 10000000000000000000), 20] call BIS_fnc_numberText);
[_codigo] call ica_fnc_creacodigo;
codigo3 pushback _codigo;
publicvariable "codigo3";

["pop_meta_b",20] call ica_fnc_item;

};


if (_param isEqualto "bgrande") exitWith {
if ((count (units group player)) < 8) exitWith {[player,"No tienes suficientes huevos entre todo tu grupo para atracar esto","Banco General de Metropolis"] call ica_fnc_axeMsg};

if ({side _x == WEST} count playableUnits < 11) exitWith {hint "No será divertido"};

if ((daytime < 21)) exitWith {[player,"Con tanta gente , ¿Vas a poner esto aqui? ¿De verdad?","Bomba","SatchelCharge_Remote_Ammo"] call ica_fnc_axeMsg};

if ((["pop_c4"] call ica_fnc_tengo) < 0 ) exitWith {[player,"No tienes suficientes bombas para reventar esta puerta","Bambi","SatchelCharge_Remote_Ammo"] call ica_fnc_axeMsg};

if (((player distance [5030.3,4936.6,2.04825]) > 3) AND (((player distance [5029.27,4900.38,0.287689]) > 3))) exitWith {[player, "Debes de acercarte un poco mas", "Fallo"] call ica_fnc_axeMsg;};

	_next = HW getVariable ["robosGrandes",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo mayor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosGrandes",(time + (40 * 60)),true];

_objecto_1 = "SatchelCharge_Remote_Ammo" createVehicle position player;
_objecto = "SatchelCharge_Remote_Ammo" createVehicle position player;

_banco = (nearestObjects [player, ["Land_pop_banco2"], 200]) select 0;

_puerta = 0;
if ((player distance [5029.27,4900.38,0.287689]) < 3) then {
_puerta = 1;
_objecto setVectorDirAndUp [[0,1,17],[0,0,1]];
_objecto setpos [5028.73,4902.60,2.798462];
_objecto_1 setpos [5029.93,4902.60,2.798462];
_objecto_1 setVectorDirAndUp [[0,1,17],[0,0,1]];
};

if ((player distance [5030.3,4936.6,2.04825]) < 3) then {
_puerta = 2;
_objecto setpos [5031.0,4935.70,3.2701599];
_objecto setVectorDirAndUp [[1,1,17],[3,14,1]];
_objecto_1 setpos [5029.3,4935.7,3.97017];
_objecto_1 setVectorDirAndUp [[1,1,17],[3,14,1]];
};

_tiempo = 120;
while {true} do {
if (_tiempo == 0) exitWith {_cosa ="DemoCharge_Remote_Ammo_Scripted" createVehicle (getpos _objecto);_cosa setdamage 1;deletevehicle _objecto;deletevehicle _objecto_1};
_tiempo = _tiempo - 1;
hint format ["Explosion en :  %1",_tiempo];
sleep 1;
};
if (_puerta == 1) then {_banco animate ["Door_8",1,true];_banco animate ["Door_7",1,true];_banco animate ["Door_6",1,true];_banco animate ["Door_5",1,true];} else {_banco animate ["Door_4",1,true];_banco animate ["Door_3",1,true];_banco animate ["Door_2",1,true];_banco animate ["Door_1",1,true];}


};

if (_param isEqualto "portatil") exitWith {
	if ({side _x == WEST} count playableUnits < 11) exitWith {hint "No será divertido"};
	if ((player distance [5036.98,4915.25,6.81464]) < 30) exitWith {[player,"...","FAIL","pop_portatil"] call ica_fnc_axeMsg};

	
	if ((player distance [5036.98,4915.25,6.81464]) < 2) exitWith {if ((ctrltext 3003) in codigo1) then {codigo1 = codigo1 - [(ctrltext 3003)];publicvariable "codigo1";hint "El codigo es correcto";closedialog 0; _s = random[30,40,60];[_s,"Accediendo al sistema informatico..."] spawn ica_fnc_barrita;sleep _s;((nearestObjects [player, ["Land_pop_banco2"], 200]) select 0) animate ["Door_15",1]} else {hint "El codigo no es correcto"} };
	if ((player distance [5036.92,4913.43,0.773224]) < 2) exitWith {if ((ctrltext 3003) in codigo2) then {codigo2 = codigo2 - [(ctrltext 3003)];publicvariable "codigo2";hint "El codigo es correcto";closedialog 0;_s = random[30,40,60];[_s,"Accediendo al sistema informatico..."] spawn ica_fnc_barrita;sleep _s;((nearestObjects [player, ["Land_pop_banco2"], 200]) select 0) animate ["Door_18",1]} else {hint "El codigo no es correcto"} };
	if ((player distance [5033.77,4910.15,0.774475]) < 2) exitWith {if ((ctrltext 3003) in codigo3) then {codigo3 = codigo3 - [(ctrltext 3003)];publicvariable "codigo3";hint "El codigo es correcto";closedialog 0;sleep 3; hint "Bienvenido Señor PKE ,Como ya sabes la apertura de la caja fuerte tiene un retraso de 8 minutos, ademas hemos avisado a la policia para que ningun listo venga ahora a atracar. Un saludo";[1,"El director de banco PKE esta intentando abrir la caja fuerte del banco. Porfavor envien una patrulla a revisar"] remoteExec ["life_fnc_broadcast",west];sleep (60*8);((nearestObjects [player, ["Land_pop_banco2"], 200]) select 0) animate ["Door_vault",1];sleep 10;["rstgranrobo"] spawn ica_fnc_robo} else {hint "El codigo no es correcto"} };
	
};

if (_param isEqualto "rstgranrobo") exitWith {

_round = random[900000,925000,950000];
_policia = ({side _x == WEST} count playableUnits);

_dinero = _round + (_policia * 8500);

bancodinero addAction ["<t color='#FF0000'>Coger dinero del banco</t>", {pop_din = pop_din + _dinero;[format ["+ %1 €", _dinero]] call ica_fnc_infolog;}];
["exp",20] remoteExecCall ["ica_fnc_arrayexp",group player];
sleep 1600;





_banco = (nearestObjects [[5036.98,4915.25,6.81464], ["Land_pop_banco2"], 200]) select 0;
_banco animate ["Door_15",0];
_banco animate ["Door_18",0];
_banco animate ["Door_vault",0];


_banco animate ["Door_8",0,true];
_banco animate ["Door_7",0,true];
_banco animate ["Door_6",0,true];
_banco animate ["Door_5",0,true];
_banco animate ["Door_4",0,true];
_banco animate ["Door_3",0,true];
_banco animate ["Door_2",0,true];
_banco animate ["Door_1",0,true];


};
