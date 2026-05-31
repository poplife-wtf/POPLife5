/*
Gran Robo al Casino de Metropolis
By AxE.


Mecanicas del robo.
 -1- Debes apostar y ganar más de 10 veces para desbloquear la accion soborno o amenaza a un npc random.*
 -2- Tienes dos opciones - Sobornas a un empleado o empiezas a amenazar a todos.*
 
 ---- 2.1 = Soborno ... le pagas a la tia random, te da un traje de mecanico y entras como pedro por tu casa... alguien con armas o el player dispara alarma y avisa a la poli. 
 -3- Vas abres las puertas sin despertar sospechas de los guardias ... no quedarte al frente de ellos mucho tiempo y pasar la requisa (no Tener armas o algo ilegal).
 -4- Robas la caja fuerte con un soplete que dura 2 minutos (avisa a la poli).
 -5- Te pasa la pasta y te pone un marker que puede ver la poli hasta que blanquees el dinero.
 -6- Blanqueas y uala la pasta es tuya.
 
 ---- 2.2 = Robo ... Activas accion random de amenazar en tia random, espera 5 segundos y empieza a comprobar que todos los NPC del casino tengan a alguien apuntandole, sino avisa a la poli.
 -3- Mientras todos los miembros del grupo apunten a los NPC (si alguno deja de apuntar avisa a la poli) matas a los guardias para que no disparen y empiezas a soldar con el soplete la puerta deseada.
 -4- Debes usar el soplete muchas veces con el mouse hasta que se abra y luego entras, haces lo mismo con la caja fuerte (este modo no te da la accion)
 -5- Luego de 8 a 10 minutos aprox soldando coges la pasta y ya estará la poli con la zona asegurada, si tienes rehenes negocias sino a tiros.
 -6- Aqui no se pone marquer en el que tiene la pasta y tampoco se le bloquea el dinero para pasarselo entre personas, si para meterlo al cajero.
 
*/



_param = _this select 0;
_p2 =  _this select 1;

if (_param isEqualTo "init") exitWith {

[[black_1, ["Jugar 21 Blackjack",{[] spawn life_fnc_blackjackInit;}]],"addAction",true,true] call BIS_fnc_MP;
[[black_2, ["Jugar 21 Blackjack",{[] spawn life_fnc_blackjackInit;}]],"addAction",true,true] call BIS_fnc_MP;
[[black_3, ["Jugar 21 Blackjack",{[] spawn life_fnc_blackjackInit;}]],"addAction",true,true] call BIS_fnc_MP;
[[ncasino1, ["Jugar 21 Blackjack",{[] spawn life_fnc_blackjackInit;}]],"addAction",true,true] call BIS_fnc_MP;

[[ncasino2, ["Jugar a la Ruleta Rusa",{[] spawn life_fnc_rouletteInit;}]],"addAction",true,true] call BIS_fnc_MP;
[[ruleta_1, ["Jugar a la Ruleta Rusa",{[] spawn life_fnc_rouletteInit;}]],"addAction",true,true] call BIS_fnc_MP;
[[ruleta_2, ["Jugar a la Ruleta Rusa",{[] spawn life_fnc_rouletteInit;}]],"addAction",true,true] call BIS_fnc_MP;
[[ruleta_3, ["Jugar a la Ruleta Rusa",{[] spawn life_fnc_rouletteInit;}]],"addAction",true,true] call BIS_fnc_MP;

_npc_incia = selectRandom [black_1,ruleta_2,black_3];
_npc_amenaza = selectRandom [ruleta_1,black_2,ruleta_3];

//player setVariable ["casino",(player getVariable ["casino",0]) + 1,true]; Esto es para sumar en la variable condicional.

[_npc_incia, ["Sobornar :. 20000€", {["modo_rol"] spawn ica_fnc_casino},nil,6,true,true,"","(player getVariable [""casino"",0]) > 10"]] remoteExec ["addAction", 0,true];
//[_npc_amenaza, ["Amenazar", {["modo_tiros"] spawn ica_fnc_casino},nil,6,true,true,"","(player getVariable [""casino"",0]) > 10"]] remoteExec ["addAction", 0,true];

//[caja_casino, ["Forzar Caja Fuerte", {["cajaf"] spawn ica_fnc_casino},nil,6,true,true,"","fase_casino >= 3"]] remoteExec ["addAction", 0,true];
[caja_casino, ["Ganzuar Caja Fuerte", {["menu", 0.96, "casino"] spawn ica_fnc_ganzua},nil,6,true,true,"","fase_casino >= 3"]] remoteExec ["addAction", 0,true];
[caja_casino, ["Restaurar Caja Fuerte", {["restaurar"] spawn ica_fnc_casino},nil,6,true,true,"","playerside == WEST"]] remoteExec ["addAction", 0,true];

//Fijo dinero inicial para robo.
caja_casino setVariable ["dinero",410000,true];

//puertacasino_1 animate ["GateDoor_3", -1.6];
puertacasino_2 animate ["GateDoor_3", 1];
puertacasino_1 animate ["GateDoor_3", 1];



//[[guardia_1,guardia_2], { guardia_1 = _this select 0; guardia_2 = _this select 1;}] remoteExec ["BIS_fnc_spawn",0,true];

};

if (_param isEqualTo "modo_rol") exitWith {



		if (("cri" call ica_fnc_expToLevel) < 5) exitWith {
        titleText["No sabes robar...", "PLAIN"];
	};
	
	if !({side _x == WEST} count playableUnits >= 8) exitWith {hint "Tienen que estar al menos 8 policias conectados, sino, no es divertido."};
	if !(life_in_gang) exitWith {hint "No te encuentras en ninguna organizacion reconocida como para intentar hacer este robo."};
	if (life_gangrank < 4) exitWith {hint "Solo los lideres de la organizacion pueden iniciar un robo de estas proporciones."};
	if ((count units (group player)) < 5) exitWith {hint "No tienes suficientes miembros en tu organización ahora mismo como para intentar atracar la joyeria"};

	_next = HW getVariable ["robosGrandes",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo mayor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosGrandes",(time + (40 * 60)),true];	
	
	if (20000 > pop_din) exitWith {hint "No tienes el dinero necesario para Sobornar a esta paciente."};
	pop_din = pop_din - 20000;
	casino_fallido = false;
	

	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectCommit 5;
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [6];   
	Sleep 3;
	titleCut ["", "BLACK FADED", 999];
	[] Spawn {
	waitUntil{!(isNil "BIS_fnc_init")};

	titleText ["Gracias por la mermelada wapo ... espero que todo te salga muy bien.. mira te explico como va esto...","PLAIN DOWN"]; 
	titleFadeOut 9;
	sleep 6;

	titleText ["Hay camaras y guardias de seguridad además un sistema de alarmas conectadas a la policia.","PLAIN"];
	titleFadeOut 9;
	sleep 6;

	titleText ["Tendras que hacerte pasar por un tecnico de servicio e ingresar a las oficinas en el piso bajo, toma aqui tengo el uniforme que me dejo a guardar el ultimo tecnico.","PLAIN DOWN"];
	titleFadeOut 14;
	sleep 12;

	titleText ["Debes tener cuidado, que no te vean cambiandotelo, usa el asensor, los guardias te registraran y activaran la alarma en caso de encontrarte armas, ahora es el momento justo ! tienes 5 minutos","PLAIN"];
	titleFadeOut 11;
	sleep 9;

	titleText ["Una ves dentro tendras acceso a la caja fuerte .\n Alli tendras que romperla o quemarla con algo que se yo\n\n .  Pero ten cuidado ahi no se que alarmas o sensores puedan haber...\n\n Mucha suerte lindo y aqui tienes mi numero para cuando quieras celebrar el triunfo.","PLAIN"];
	titleFadeOut 16;
	sleep 14;

	[str ("Robo iniciado ..."), str("El Gran Casino"), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;
	fase_casino = 1;
	sleep 3;
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;  

	titleCut ["", "BLACK IN", 5];
	};
	
	player addItemToBackpack "CUP_U_C_Mechanic_03";
	["+1 Uniforme Tecnico"] call ica_fnc_infolog;
	
sleep round (random	4);
{robos_bloqueados = true; publicVariable "robos_bloqueados";sleep 1200;robos_bloqueados = nil; publicVariable "robos_bloqueados";} remoteExec ["BIS_fnc_spawn",2];
//Comprobaciones en tiempo ... 
_grupoIA = createGroup WEST;
guardia_1Handler = "I_Soldier_AAA_F" createUnit [ position puertacasino_1 , _grupoIA ,"guardia_1 = this;",0.8,"CAPTAIN"];
guardia_1 setPosATL [6971.17,4461.34,29.6932];
removeAllWeapons guardia_1;
removeallassigneditems guardia_1;
removeallcontainers guardia_1;
removeuniform guardia_1;
removevest guardia_1;
removebackpack guardia_1 ;
removeHeadgear guardia_1;
guardia_1   addBackPack "mochila_grande"; 
guardia_1 forceAddUniform "CUP_U_C_Policeman_01";
guardia_1 addHeadgear "CUP_H_C_Beret_01";
guardia_1 setFace "Chango";
guardia_1 doWatch [6963.79,4456.64,29.6712];
guardia_1 allowDamage false;


//Comprobamos si hay tios armados.
[] spawn {
_pos = getPosATL black_1;

    gcasino_armas = createTrigger ["EmptyDetector", _pos];
    gcasino_armas setTriggerArea [65, 65, 0, false];
    gcasino_armas setTriggerActivation ["CIV", "PRESENT", false];
    gcasino_armas setTriggerStatements ['currentWeapon player != "" OR primaryWeapon player != ""', '["alarma","1"] spawn ica_fnc_casino', ""];
	sleep 300;
	if (fase_casino < 2) exitWith {
	deletevehicle gcasino_armas;
	casino_fallido = true;
	};
};

//Comprobamos que no baje alguien sin el uniforme de tecnico puesto.
[] spawn {
_pos = getPosATL puertacasino_1;

    gcasino_uniforme = createTrigger ["EmptyDetector", _pos];
    gcasino_uniforme setTriggerArea [20, 20, 0, false];
    gcasino_uniforme setTriggerActivation ["CIV", "PRESENT", false];
    gcasino_uniforme setTriggerStatements ['!(player getVariable ["restrained",false]) && uniform player != "CUP_U_C_Mechanic_03"', '["alarma","2"] spawn ica_fnc_casino', ""];
	sleep 300;
	if (fase_casino < 2) exitWith {
	casino_fallido = true;
	deletevehicle gcasino_uniforme;
	};
};

waitUntil{player distance guardia_1 < 2 OR casino_fallido};

if (casino_fallido) exitWith {
	[str ("Robo Fallido .."), str("Has tardado mucho .."), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;
};
	
guardia_1 action ["salute", guardia_1];
fase_casino = 2;


// Empiezo requisa del guardia.

	titleText ["", "BLACK OUT", 0.5];
	sleep 0.6;
	titleText ["", "BLACK IN", 1.6];
	
	
	// empiezo rotación
	_idx = 0;
	_grados = 360;
	_altura = 31;
	_distCam = 1.5;	
	_tio = player;
	_t = 16;
	[_t, "Te estan chacheando ..."] spawn ica_fnc_barrita;	
		// coloco cam inicial
	_posCam = [(_tio getPos [_distCam, _grados]) select 0, (_tio getPos [_distCam, _grados]) select 1, _altura];
	camCasino = "camera" camCreate _posCam;
	camCasino camSetTarget [getPos _tio select 0, getPos _tio select 1, _altura];
	camCasino camCommit 0;
	
	showCinemaBorder false;
	camCasino cameraEffect ["INTERNAL", "BACK"];

	
	while {_t > 0} do {
		
		_grados = _grados - 90;
		_altura = _altura - 0.4;
		_posCam = [(_tio getPos [_distCam, _grados]) select 0, (_tio getPos [_distCam, _grados]) select 1, _altura];
		camCasino camsetPos _posCam;
		camCasino camSetTarget [getPosATL _tio select 0, getPosATL _tio select 1, _altura];
		camCasino camCommit 4;
		
		_t = _t - 4;
		
		sleep 4;
	};

	titleText ["", "BLACK OUT", 0.5];
	sleep 0.6;
	titleText ["", "BLACK IN", 1.6];
	
	camCasino cameraEffect ["terminate","back"];
	camDestroy camCasino;
	camCasino = nil;

guardia_1 action ["salute", guardia_1];

if (count (weapons player) >= 1) exitWith {

["guardia_1",player] spawn ica_fnc_casino;
["alarma","1"] spawn ica_fnc_casino;
fase_casino = 3;
[[], { fase_casino = 3;}] remoteExec ["BIS_fnc_spawn",(group player)];
[str ("Robo al Casino ..."), str("Te han descubierto, mata a todos y usa el soplete ..."),str("La policia viene en camino")] spawn BIS_fnc_infoText;

};

hint "GUARDIA: Todo en orden caballero, puede seguir.";

fase_casino = 3;
[[], { fase_casino = 3;}] remoteExec ["BIS_fnc_spawn",(group player)];
puertacasino_1 animate ["GateDoor_3", -1.6];
	
};	

if (_param isEqualTo "guardia_1") exitWith {

for "_i" from 1 to 6 do {guardia_1 addItemToBackpack "RH_7Rnd_50_AE";};
guardia_1 addWeapon "RH_Deaglem";

_quien= guardia_1;
_dispararA= _p2;
_weapon = currentWeapon _quien;
_dificultad = 0.2;
_cargadores = 6;
_disparos = 7 * _cargadores;

_ammo = "RH_7Rnd_50_AE";

Sleep 4;
guardia_1 allowDamage true;
for "_i" from 0 to _cargadores do {
	_quien lookAt _dispararA;

	Sleep 2;

	for "_i" from 0 to _disparos do {
	
			_quien lookAt _dispararA;
		sleep _dificultad;
		_quien  forceWeaponFire [ weaponState _quien select 1, weaponState _quien select 2];
		_quien setAmmo [_weapon, 7];

		_quien doFire _dispararA;

	};

};

};

if (_param isEqualTo "guardia_2") exitWith {

guardia_2Handler = "I_Soldier_AAA_F" createUnit [ position caja_casino , _grupoIA ,"guardia_2 = this;",0.8,"CAPTAIN"];
guardia_2 setPosATL [6982.53,4470.78,29.7463];
removeAllWeapons guardia_2;
removeallassigneditems guardia_2;
removeallcontainers guardia_2;
removeuniform guardia_2;
removevest guardia_2;
removebackpack guardia_2;
removeHeadgear guardia_2;
guardia_2 setFace "Chango";
guardia_2 doWatch caja_casino;
guardia_2 allowDamage false;
guardia_2 setUnitLoadOut [["R3F_M4S90","","","",["R3F_7Rnd_M4S90",7],[],""],[],[],["CUP_U_C_Policeman_01",[["R3F_7Rnd_M4S90",1,7]]],[],["mochila_grande",[["R3F_7Rnd_M4S90",10,7]]],"CUP_H_C_Policecap_01","G_EWK_Cigar2",[],["","","","","",""]];

[guardia2, ["Noquear !!", {guardia2 setDamage 1},nil,6,true,true,"","fase_casino >= 3"]] remoteExec ["addAction", 0,true];

sleep 1;

_quien= guardia_2;
_dispararA = _p2;
_weapon = currentWeapon _quien;
_dificultad = 0.2;
_cargadores = 6;
_disparos = 7 * _cargadores;

sleep 4;
guardia_2 allowDamage true;
for "_i" from 0 to _cargadores do {
	_quien lookAt _dispararA;

	sleep 2;

	for "_i" from 0 to _disparos do {
	
			_quien lookAt _dispararA;
		sleep _dificultad;
		_quien  forceWeaponFire [ weaponState _quien select 1, weaponState _quien select 2];
		_quien setAmmo [_weapon, 7];

		_quien doFire _dispararA;

	};

};

};



if (_param isEqualTo "cajaf") exitWith {

if (("baj" call ica_fnc_expToLevel) < 1) exitWith {
            titleText["No sabes forzar casas...", "PLAIN"];
};

//timer pegar
if (isNil "pegaCaja") then {

["guardia_2",player] spawn ica_fnc_casino;
["alarma","3"] spawn ica_fnc_casino;
	};
	
_launcherWeaponEquipada = currentWeapon player;
 if( _launcherWeaponEquipada!="MeleeCrowbar" ) exitWith{
  hint "Necesitas una palanca para forzar la caja."; 
};

pegaCaja = true;

_tiempoParaAbrir = round (random 205);

[_tiempoParaAbrir, "Forzando la caja fuerte del casino ..."] spawn ica_fnc_barrita;
sleep _tiempoParaAbrir;
pegaCaja = false;

};

if (_param isEqualTo "pegar") exitWith {


    if (!isNil {forzandoCaja}) exitWith {hint "Estoy cansado, tengo que esperar un poco..." };
    [] spawn {
        forzandoCaja = true;
        sleep 2;
        forzandoCaja = nil;
    };


if(player distance caja_casino > 2)exitWith{hint "Estás muy lejos para forzar la caja.";};

	_launcherWeaponEquipada = currentWeapon player;
	if( _launcherWeaponEquipada!="MeleeCrowbar" ) exitWith{
	hint "Necesitas una palanca para forzar la caja fuerte."; 
	};
	_anim = "GestureSwing";
	_sonidosPegar = ["pop_animaciones\sounds\Swing.wav","pop_animaciones\sounds\BaseBat1.wav"] call BIS_fnc_selectRandom;
	playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50];
	player playActionNow _anim;
	[player,"Sledge_swing"] remoteExec ["life_fnc_animSync",-2];
	_sonidosPegar = ["pop_animaciones\sounds\Swing.wav","pop_animaciones\sounds\BaseBat1.wav"] call BIS_fnc_selectRandom;
	playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50];
	caja_casino setVariable ["forzado",(caja_casino getVariable ["forzado",0]) + 1,true];
	if ((caja_casino getVariable ["forzado",0]) > (floor random [0,25,75])) then {
	["pagar"] spawn ica_fnc_casino;
	} else {
	hint "No has logrado forzarla, intentalo de nuevo.";
	};

};

if (_param isEqualTo "pagar") exitWith {

if (fase_casino < 3) exitWith {hint "ya has robado todo el dinero..."};
	pop_din = pop_din + (caja_casino getVariable ["dinero",210000]);
	["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;
	fase_casino = 0;
	//[[getPlayerUID player,profileName,"211"],"life_fnc_wantedAdd",(group player),false] call life_fnc_MP;
    if (life_HC_isActive) then {
        [getPlayerUID player,profileName,"211"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
    } else {
        [getPlayerUID player,profileName,"211"] remoteExecCall ["life_fnc_wantedAdd",2];
    };		
	caja_casino setVariable ["dinero",0,true];
	[str ("Robo Realizado ..."), str("Ahora escapa !"), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;

};


if (_param isEqualTo "restaurar") exitWith {
caja_casino setVariable ["dinero",0,true];

hint "Sistemas de seguridad restaurandose en aprox 10 segundos, toma una pequeña recompensa por tu ardua labor!";

sleep 10;

puertacasino_2 animate ["GateDoor_3", 1];
puertacasino_1 animate ["GateDoor_3", 1];

	pop_din = pop_din + 5000;
	["exp",8] call ica_fnc_arrayExp;
	[format ["+ %1€", 5000]] call ica_fnc_infolog;
	[format ["+ %1 de exp", 8]] call ica_fnc_infolog;
};


if (_param isEqualTo "alarma") exitWith {

_numero = _p2;
if (_numero == "1") exitWith {
["guardia_1",player] spawn ica_fnc_casino;
	[10, "Alarma", [1,0,0], 1.5, "Gente Armada Amenzando en Casino de Metropolis", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];
	puertacasino_2 animate ["GateDoor_3", 1];
	puertacasino_1 animate ["GateDoor_3", 1];
};

if (_numero == "2") exitWith {

["guardia_1",player] spawn ica_fnc_casino;

	[10, "Alarma", [1,0,0], 1.5, "Estan Robando el Casino de Metropolis", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];
	puertacasino_2 animate ["GateDoor_3", 1];
	puertacasino_1 animate ["GateDoor_3", 1];
};

if (_numero == "3") exitWith {

["guardia_1",player] spawn ica_fnc_casino;

	[10, "Alarma", [1,0,0], 1.5, "La caja fuerte del Casino de Metropolis esta siendo vulnerada.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];
	puertacasino_2 animate ["GateDoor_3", 1];
	puertacasino_1 animate ["GateDoor_3", 1];


};

};