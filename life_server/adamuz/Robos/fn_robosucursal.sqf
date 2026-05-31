ada_msgbonico_robos =
{
	private ["_texto"];
	_texto = _this select 0;
	hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>SUCURSAL</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>%1</t> <br/><br/>", _texto];
};

ada_msgbonico_banquero =
{
	private ["_texto"];
	_texto = _this select 0;
	hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>BANQUERO</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>%1</t> <br/><br/>", _texto];
};

private ["_tiempo","_robo","_banco","_param","_count","_vars","_random","_tiempoespera","_sucursal", "_obj"];
_param = param [0, "error"];
_robo = param [1, objNull];

if (_param isequalto "error") exitwith {};

if (_param isequalto "taparventanas") exitwith {
	_banco = nearestObjects [player, ["Land_Bank_DED_House_01_F"], 25]; 
	_banquero = nearestObjects [player, ["POP_NPC_Mafioso"], 25]; 
	if ((count _banco isEqualTo 0) OR (count _banquero isEqualTo 0)) exitwith {};
	_banco = _banco select 0;
	_banquero = _banquero select 0;
	_obj = "plp_ctp_PalletWoodLight";
	if (player distance _banco > 25) exitwith {};
	_cnt = ["pop_madera"] call ica_fnc_tengo;
	if !(_cnt > 0) exitWith {};
	if (_banquero getvariable ["barricadas", 0] >= 3) exitwith {["No se pueden colocar mas barricadas"] call ada_msgbonico_robos;};
	_maderas = (nearestObjects [_banco, [_obj], 30]);
	
	if (count _maderas IsEqualTo 0) exitwith {	
		_banquero setvariable ["barricadas", (player getvariable ["barricadas", 0]) + 1, true];
		player removeitem "pop_madera";
		[5, "Colocando barricada..."] spawn ica_fnc_barrita;  
		[player,"CL3_anim_RepairCrouch"] remoteExec ["life_fnc_animSync",0];
		[player, "reparar"] remoteExec ["life_fnc_say3D",0];
		sleep 5;  
		player switchMove "";
		["Barricada colocada"] call ada_msgbonico_robos;			
		
		_barricada = createVehicle [_obj, _banco modelToWorld [10,5,-2.4], [], 0, "CAN_COLLIDE"]; 
		_barricada setVectorDirAndUp [[1,-0.20,100],[0,0,1]]; 
		_barricada enablesimulation false;  
				
		[_barricada, ["Romper barricada",{[_this select 0] spawn {  
			if (player distance (_this select 0) > 3) exitwith {hint "Estas muy lejos para romper esta barricada..."};  
			if (vehicle player == player) then {
				removeallactions (_this select 0);
				rompiendo = true;				
				[5, "Rompiendo barricada..."] spawn ica_fnc_barrita;  
				player playMove "CL3_anim_RepairCrouch";  
				[player,"CL3_anim_RepairCrouch"] remoteExec ["life_fnc_animSync",-2];  
				[_this select 0, "reparar"] remoteExec ["life_fnc_say3D",0];  
				sleep 5;  
				player switchMove "";  
				[_this select 0, "accidente"] remoteExec ["life_fnc_say3D",0];  
				sleep 1.5;  
				deletevehicle (_this select 0);  
				rompiendo = nil;
			} else {hint "Debes estar de pie para hacer eso..."};  
		 }}]] remoteExec ["addAction", -2];
	};
	if (count _maderas IsEqualTo 1) exitwith {
		_banquero setvariable ["barricadas", (player getvariable ["barricadas", 0]) + 1, true];
		player removeitem "pop_madera";
		[5, "Colocando barricada..."] spawn ica_fnc_barrita;  
		player playMove "CL3_anim_RepairCrouch";  
		[player,"CL3_anim_RepairCrouch"] remoteExec ["life_fnc_animSync",0];
		[player, "reparar"] remoteExec ["life_fnc_say3D",0];
		sleep 5;  
		player switchMove "";
		["Barricada colocada"] call ada_msgbonico_robos;
		
		_barricada = createVehicle [_obj, _banco modelToWorld [6.75,19.25,-2.4], [], 0, "CAN_COLLIDE"]; 
		_barricada setVectorDirAndUp [[-0.05,-0.20,100],[0,0,1]];
		_barricada enablesimulation false;
		
		[_barricada, ["Romper barricada",{[_this select 0] spawn {  
			if (player distance (_this select 0) > 3) exitwith {hint "Estas muy lejos para romper esta barricada..."};  
			if (vehicle player == player) then {  
				removeallactions (_this select 0);
				rompiendo = true;
				[5, "Rompiendo barricada..."] spawn ica_fnc_barrita;  
				player playMove "CL3_anim_RepairCrouch";  
				[player,"CL3_anim_RepairCrouch"] remoteExec ["life_fnc_animSync",0];
				[player, "reparar"] remoteExec ["life_fnc_say3D",0];
				sleep 5;  
				player switchMove "";  
				[_this select 0, "accidente"] remoteExec ["life_fnc_say3D",0];
				sleep 1.5;  
				deletevehicle (_this select 0);  
				rompiendo = nil;
			} else {hint "Debes estar de pie para hacer eso..."};  
		 }}]] remoteExec ["addAction", -2];
	};
	if (count _maderas IsEqualTo 2) exitwith {
		_banquero setvariable ["barricadas", (player getvariable ["barricadas", 0]) + 1, true];
		player removeitem "pop_madera";
		[5, "Colocando barricada..."] spawn ica_fnc_barrita;  
		player playMove "CL3_anim_RepairCrouch";  
		[player,"CL3_anim_RepairCrouch"] remoteExec ["life_fnc_animSync",0];
		[player, "reparar"] remoteExec ["life_fnc_say3D",0];
		sleep 5;  
		player switchMove "";
		["Barricada colocada"] call ada_msgbonico_robos;
		
		_barricada = createVehicle [_obj, _banco modelToWorld [-6.15,10.4,-2.0], [], 0, "CAN_COLLIDE"]; 
		_barricada setVectorDirAndUp [[1,-0.20,100],[0,0,1]]; 
		_barricada enablesimulation false;  
		
		[_barricada, ["Romper barricada",{[_this select 0] spawn {  
			if (player distance (_this select 0) > 3) exitwith {hint "Estas muy lejos para romper esta barricada..."};  
			if !(isNil "rompiendo") exitwith {hint "Ya estas rompiendo una barricada"};  
			if (vehicle player == player) then { 
				removeallactions (_this select 0);
				rompiendo = true;
				[5, "Rompiendo barricada..."] spawn ica_fnc_barrita;  
				player playMove "CL3_anim_RepairCrouch";  
				[player,"CL3_anim_RepairCrouch"] remoteExec ["life_fnc_animSync",0];
				[player, "reparar"] remoteExec ["life_fnc_say3D",0]; 
				sleep 5;  
				player switchMove "";  
				[_this select 0, "accidente"] remoteExec ["life_fnc_say3D",0]; 
				sleep 1.5;  
				deletevehicle (_this select 0);  
				rompiendo = nil;
			} else {hint "Debes estar de pie para hacer eso..."};  
		 }}]] remoteExec ["addAction", -2];
	};
	
	if (count _maderas > 2) exitwith {_texto = "No puedes poner mas barricadas. No queda sitio para ninguna mas..."; [_texto] call ada_msgbonico_robos;};
};

if (_param isequalto "robar") exitwith {
	if (isNull _robo) exitwith {};
	if !({side _x == WEST} count playableUnits > 5) exitWith {_texto = "Tienen que haber como minimo 5 policias"; [_texto] call ada_msgbonico_robos;};
	if (side player == WEST OR side player == INDEPENDENT) exitwith {_texto = "Eres un corrupto? A ver si te voy a tener que enseñar yo a hacer las cosas bien..."; [_texto] call ada_msgbonico_robos;};
	if (_robo getVariable ["robando", false]) exitWith {_texto = "Esta sucursal esta siendo robada! Ayuda a tu compañero!"; [_texto] call ada_msgbonico_robos;};
	if (_robo getVariable ["robado", false]) exitWith {_texto = "Ya han dado un palo en esta sucursal hace poco..."; [_texto] call ada_msgbonico_robos;};
	_next = HW getVariable ["robosPeque",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo menor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosPeque",(time + (15 * 60)),true];
	if ((primaryWeapon player == "") AND (handgunWeapon player == "")) exitWith {_texto = "Me vas a amenazar con las manos? Voy a tener que llamar a la policia al final..."; [_texto] call ada_msgbonico_robos;};
	if (("baj" call ica_fnc_expToLevel) < 2) exitWith {titleText["No sabes robar...", "PLAIN"];};
	_count = player ammo handgunWeapon player;
	if (_count < 6) exitWith {_texto = "Me va a apuntar con eso? Quizas te lo tengas que pensar 2 veces antes de hacer lo que intentas jajaja. Me vas a hacer llamar a la policia?"; [_texto] call ada_msgbonico_banquero;};	
	
	_banquero = nearestObjects [player, ["POP_NPC_Mafioso"], 25]; 
	_robo setVariable["robando", true, true]; 
	_robo setVariable["robado", true, true];
	
	_nombresucursal = ["Metropolis", [metrop1, metrop2, metrop3], metropcaja, metropmando];	
	
	_tiempo = 60 * (3 + random 3);
	_tiempoformat = (60 * (3 + random 3)) / 60;
	
	_texto = format ["Estas amenazando al banquero. Si dejas de amenazarlo, avisará a la policia. Si le gritas y le amenazas bien a lo mejor te abre la puerta y todo... Tienes alrededor de %1 minutos para encontrar los codigos o que el banquero te abra la puerta antes de que suene la alarma!", round _tiempoformat];
	[_texto] call ada_msgbonico_robos;
	_banco = nearestObjects [player, ["Land_Bank_DED_House_01_F"], 200] select 0; 
	
	robos_bloqueados = true;
	publicvariable "robos_bloqueados";
	
	{
		[_x, ["Buscar codigos en el ordenador", {			
			0 spawn {
				_quehay = nearestObjects [player, ["Land_Laptop_unfolded_F"], 5];
				if (count _quehay isEqualTo 0) exitWith {_texto = "Estas muy lejos. No llegas al teclado. Acercate mas..."; [_texto] call ada_msgbonico_robos;};
				_portatil = _quehay select 0; 
				if (player distance _portatil > 3) exitwith {_texto = "Estas muy lejos. No llegas al teclado. Acercate mas..."; [_texto] call ada_msgbonico_robos;};
				if !(isnil "buscandocodigo") exitWith {_texto = "No eres MrRobot no puedes buscar codigos en 2 ordenadores a la vez..."; [_texto] call ada_msgbonico_robos;};
				buscandocodigo = true;
				_randomtmp = round (random 120);
				[_randomtmp, "Buscando codigos... No te alejes"] spawn ica_fnc_barrita;
				sleep _randomtmp;
				_random = round (random 10);
				
				if (_random > 8 AND !(_portatil getvariable ["codigo", false])) then {
					if (player distance _portatil > 5) exitWith {["Te has alejado mucho del portatil y no has podido ver el codigo que ha salido..."] call ada_msgbonico_robos;};
					_texto = "ACCESO PERMITIDO<br/>Abriendo puertas y activando protocolo de seguridad...";
					[_texto] call ada_msgbonico_robos;
					_portatil setvariable ["codigo", true, true];
				} else {
					if (player distance _portatil > 2) exitWith {["Te has alejado mucho del portatil y no has podido ver el codigo que ha salido..."] call ada_msgbonico_robos;};
					_texto = "No has encontrado nada. Intentalo otra vez o quizas tengas suerte probando en otro ordenador...";
					[_texto] call ada_msgbonico_robos;
				};
				buscandocodigo = nil;
			};			
		}]] remoteExec ["addAction", -2];
	} foreach (_nombresucursal select 1);
	
	_aviso = false;
	while {true} do
	{
		_tiempo = _tiempo - 1;
		if (_tiempo isEqualTo 0) exitwith {_aviso = true};
		if (cursortarget != _robo) exitWith {_aviso = true};
		if ((player distance _robo) > 5) exitWith {_aviso = true};
		if ((primaryWeapon player isEqualTo "") AND (handgunWeapon player isEqualTo "")) exitWith {_aviso = true};
		_codigowow = false;
		{
			if (_x getVariable ["codigo", false]) exitwith {_codigowow = true;};
		} foreach (_nombresucursal select 1);
		if (_codigowow) exitwith {_aviso = false};
		sleep 1;
	};	
	
	{
		_x remoteExec ["removeallactions", -2];
	} foreach (_nombresucursal select 1);
	
	if (_aviso) then {
		_texto = "He llamado a la policia!! Vienen de camino cabrones!! Ahora esas puertas no se abren hasta que el cierre de seguridad retardado de 3 minutos se desactive!!";
		[_texto] call ada_msgbonico_banquero;
		
		[10, "Aviso", [1,0,0], 1.5, format ["Están atracando la sucursal de %1", _nombresucursal select 0], [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];
		[_robo, "alarmb",3] remoteExec ["life_fnc_say3D", -2]; 
		[_banco, "Door_8_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_open.sqf";
		sleep 180;
		[_banco, "Door_6_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_open.sqf";
		[_banco, "Door_9_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_open.sqf";
		_texto = "Ya se han abierto las puertas... Podeis cogerlo todo que no miro...";
		[_texto] call ada_msgbonico_banquero;
	} else {
		_texto = "Ya estan abiertas las puertas!! No me mateis!! Ya solo quedan las que tienen una apertura retrasada de 3 minutos... La alarma puede sonar en cualquier momento...";
		[_texto] call ada_msgbonico_banquero;
		[_banco, "Door_8_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_open.sqf";
		
		_tiempoespera = 60 + round (random 60);
		sleep _tiempoespera;
		[10, "Aviso", [1,0,0], 1.5, format ["Se ha detectado actividad sospechosa en la sucursal de %1. Seria bueno ir a hechar un vistazo...", _nombresucursal select 0], [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];

		_timepoalarm = (180 - _tiempoespera);
		_randomtime = round (random _tiempoespera);
		
		while {_timepoalarm > 0} do{
			_timepoalarm = _timepoalarm - 1;
			if (_timepoalarm isEqualTo _randomtime) then {[_robo, "alarmb",3] remoteExec ["life_fnc_say3D", -2]};
			sleep 1;
		};
		
		[_banco, "Door_6_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_open.sqf";
		[_banco, "Door_9_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_open.sqf";
		_texto = "Ya se han abierto las puertas... Podeis cogerlo todo que no miro... La alarma salta sola al detectar que se abren esas puertas por seguridad, yo no he hecho nada!! Lo juro!!";
		[10, "Aviso", [1,0,0], 1.5, format ["Están atracando la sucursal de %1", _nombresucursal select 0], [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST, false, false];
		[_texto] call ada_msgbonico_banquero;
	};
	[metropcaja, ["Robar caja fuerte",{if (count (nearestObjects [metropcaja, ["MAN"], 4]) > 1) exitwith {["Solo puede haber 1 en la camara de la caja fuerte"] call ada_msgbonico_robos}; if (cursortarget != metropcaja OR player distance metropcaja > 2) exitwith {["Acercate mas a la caja fuerte"] call ada_msgbonico_robos;}; metropcaja remoteExec ["removeallactions", -2];  titleText["Ya tienes el dinero!! Adamuz te recomienda correr XD", "PLAIN"]; _polisOn = {side _x isEqualTo WEST} count playableUnits; _aumento = (_polisOn * 1000); pop_din = pop_din + (20000 + _aumento); ["envio", player, 50, 60*10] call ica_fnc_bloqueoDinero;}]] remoteExec ["addAction", -2];
	
	{
		_x remoteExec ["removeallactions", -2];
	} foreach (_nombresucursal select 1);

	[getPlayerUID player,profileName,"211"] remoteExec ["life_fnc_wantedAdd", (group player)]; 
	
	[_banco, _nombresucursal, _robo, _banquero] spawn {
		_sucursal = _this select 0;
		_vars = _this select 1;
		_robo = _this select 2;
		sleep 300;
		robos_bloqueados = nil;
		publicvariable "robos_bloqueados";
		_robo setVariable["robando", false, true];
		sleep 600;
		_robo setVariable["robado", false, true];
		{
			_x setvariable ["codigo", nil];
			removeallactions _x;
		} foreach (_vars select 1);
		
		[_sucursal, "Door_8_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_close.sqf";
		[_sucursal, "Door_6_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_close.sqf";
		[_sucursal, "Door_9_rot"] execVM "\CatalinaObjects\DED_House_01\scripts\DoorNoHandle_close.sqf";
		
		metropcaja remoteExec ["removeallactions", -2];
		
		(_this select 3) setvariable ["barricadas", nil, true];
		
	};
	
	_robo setVariable["robando", false, true];
};
