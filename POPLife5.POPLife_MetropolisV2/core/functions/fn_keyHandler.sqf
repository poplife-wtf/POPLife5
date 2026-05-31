#include <Keycodes.h>
#include <macro.h>
#include "..\..\script_macros.hpp"

/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_tiempo = serverTime;

_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32,44,16]; //A,S,W,D,Z,Q
_interactionKey = if (count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};
_userKey9 = if(count (actionKeys "User9") != 0) then [{(actionKeys "User9") select 0},{-99}];

// ica
_puedo = true;


if ((_code in (actionKeys "GetOver")) OR (_code in (actionKeys "SwimDown"))) then {
	_puedo = switch (true) do {
		case ((player distance joyeria) < 17): {false};
		case ((player distance banco) < 23): {false};
		case (player distance (getMarkerPos "jail_marker") < 24): {false};
	};
};

if (_code in (actionKeys "Gear")) then {
	if (vehicle player != player) then {
		_puedo = false;
	};
	_tio = nearestObjects [getPos player, ["Man"], 3.5];
	_veh = nearestObjects [getPos player, ["Car", "Air","Motorcycle","Ship","pop_caja_armariog_box","pop_caja_armariop_box"], 6.1];
	if (((count _tio) <= 1) AND (count _veh < 1)) exitWith {};

	_puedo = false;
};

if (_code in (actionKeys "Diary")) then {
	_puedo = false;
};

if !(_puedo) exitWith {
	true;
};

if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getVariable ["restrained",false]) || (player getVariable ["playerSurrender",false]) || life_isknocked || life_istazed)) exitWith {
    true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(count (actionKeys "User10") isEqualTo 0) && {(inputAction "User10" > 0)}) exitWith {
    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    if (!life_action_inUse) then {
        [] spawn {
            private "_handle";
            _handle = [] spawn life_fnc_actionKeyHandler;
            waitUntil {scriptDone _handle};
            life_action_inUse = false;
        };
    };
    true;
};


// Sonidos de coches de policias *****
If ( ( _code == 16 Or _code == 18 Or _code == 19 ) and (vehicle player != player) ) Then {		//Police Blip Key Q=16 or E=18 or R=19 --  2=3
	If (_shift && !_ctrlKey) Then {
		_handled = true;
		switch (_code) do {
			case 16: { ["blip"] Call ica_fnc_SonidosPolicia ; };
			case 18: { ["horn"] Call ica_fnc_SonidosPolicia ; };
			case 19: { ["voice"] Call ica_fnc_SonidosPolicia ; };
		};
	};
};

switch (_code) do {

private _CommandMode = actionKeys "tacticalView";

if (_code in _CommandMode) then {
	hint localize "STR_NOTF_CommanderView";
	_handled = true;
};

    //Space key for Jumping
    case 57: {
        if (isNil "jumpActionTime") then {jumpActionTime = 0;};
        if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {!life_is_arrested} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then {
            jumpActionTime = time; //Update the time.
            [player] remoteExec ["life_fnc_jumpFnc",RANY]; //Global execution
            _handled = true;
        };
    };

	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
		};
	};
	
		case DIK_H: {
		
			if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
			if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};	

	//H Holster / recall weapon /casas
	case DIK_U: {

		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
		if(!_alt && !_ctrlKey && !_shift) then {
			if(vehicle player == player) then {
				_veh = cursorObject;
				if (isNull _veh) then {
				_veh = cursorTarget;
				};
			} else {
				_veh = vehicle player;
			};
			
            if (_veh isKindOf "House_F" && {playerSide isEqualTo civilian}) then {
                _door = [_veh] call life_fnc_nearestDoor;
				if (_veh in life_vehicles && {player distance _veh < 20}) then {
                    
					if ((typeof _veh) in apartamentos) then {
						if (_door isEqualTo 0) exitWith {hint localize "STR_House_Door_NotNear"};
						_arrDueno = _veh getVariable [format ["%1_owner",_door],[]];
						if (_arrDueno isEqualto []) exitWith { systemChat "Este apartamento no parece tener propietario."; };
						if !((_arrDueno select 0) isEqualto (getPlayerUID player) or roboApto isEqualTo _door) exitWith { systemChat "No te pertenece este apartamento."; };
						apartamentoNo = _door;
						_locked = _veh getVariable [format ["bis_disabled_Door_%1",_door],0];

						if (_locked isEqualTo 0) then {
							_veh setVariable [format ["bis_disabled_Door_%1",_door],1,true];
							_veh animateSource [format ["Door_%1_source", _door], 0];
							systemChat localize "STR_House_Door_Lock";
						} else {
							_veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
							_veh animateSource [format ["Door_%1_source", _door], 1];
							systemChat localize "STR_House_Door_Unlock";
						};
					
					}else{
						if ((typeOf _veh) isEqualTo "land_POP_Mansion_4" && !(player getVariable ["uso_casa",false])) exitWith {hint "no tienes autorizacion para entrar a la casa de mafia"};

						if (_door isEqualTo 0) exitWith {hint localize "STR_House_Door_NotNear"};
						_locked = _veh getVariable [format ["bis_disabled_Door_%1",_door],0];
						apartamentoNo = 0;
						if (_locked isEqualTo 0) then {
							_veh setVariable [format ["bis_disabled_Door_%1",_door],1,true];
							_veh animateSource [format ["Door_%1_source", _door], 0];
							systemChat localize "STR_House_Door_Lock";
						} else {
							_veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
							_veh animateSource [format ["Door_%1_source", _door], 1];
							systemChat localize "STR_House_Door_Unlock";
						};					
					
					};
                };
            };
			
			_locked = locked _veh;
			if(_veh in life_vehicles && player distance _veh < 30) then {

				if(_locked == 2) then {
					if(local _veh) then {
						_veh lock 0;
					} else {
						[_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];
						hint composeText [ image "\pop_iconos\icons\unlock.paa", "Vehículo abierto" ];
						[_veh,"abrecoche"] remoteExec ["say3d",-2];
					};

				} else {
					if(local _veh) then {
						_veh lock 2;
					} else {
						[_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];
						hint composeText [ image "\pop_iconos\icons\lock.paa", "Vehículo cerrado" ];
						[_veh,"abrecoche"] remoteExec ["say3d",-2];
					};
				};
			};		
		
		
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:{





		_veh = vehicle player;
		if (_veh != player) then {
			if (("tal" call ica_fnc_expToLevel) >= 3) then {
				if ((driver _veh) == player) then {
					if ((speed _veh) > 30) then {
						if (!isNil {CDturbo}) exitWith {hint format ["Tiempo de reutilización restante %1s", CDturbo]};
						_nit = vehicle player getVariable ["nit_red",false];	
							if (_nit) then {
							
							0 spawn {
							CDturbo = 30;
							while {true} do {
								if (CDturbo <= 0) exitWith {CDturbo = nil};
								CDturbo = CDturbo - 1;
								sleep 1;
								};
							};
							
							} else {
							
							0 spawn {
							CDturbo = 60;
							while {true} do {
								if (CDturbo <= 0) exitWith {CDturbo = nil};
								CDturbo = CDturbo - 1;
								sleep 1;
								};
							};
							
							};

						[_veh, [0, 30, 1]] call ica_fnc_setVelocityRas;
					};

				};
			};
		} else {
			if (!life_action_inUse) then {
				[] spawn {
					private["_handle"];
					_handle = [] spawn life_fnc_actionKeyHandler;
					waitUntil {scriptDone _handle};
					life_action_inUse = false;
				};
			};
		};
	};

	case DIK_RWIN: {
		if(!life_action_inUse) then {
			[] spawn {
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	//F5 Surrender
    case 63: {
        if (_shift) then {
            if (player getVariable ["playerSurrender",false]) then {
                player setVariable ["playerSurrender",false,true];
            } else {
                [] spawn life_fnc_surrender;
            };
            _handled = true;
        };
    };

	//Restraining (Shift + R)
	case DIK_R: {
    if (_shift) then {_handled = true};

			if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout && speed cursorTarget < 1) then
				{
					[] call life_fnc_restrainAction;
				};


	};

	//Knock out, this is experimental and yeah...
	case DIK_G: {
    if (_shift) then {_handled = true;};



	if (
		_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget &&
		cursorTarget distance player < 4 && speed cursorTarget < 1 && !(cursorTarget getVariable "restrained")
	) then {
		if (
			(animationState cursorTarget) != "Incapacitated" &&
			(currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) &&
			currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed
		) then {
			[cursorTarget] spawn life_fnc_knockoutAction;
			["play3d", "ko", cursorTarget,2,30] call ica_fnc_SFX;
		};
	};
};

	// O, police gate opener
	case DIK_O: {
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
 		if (!_shift && !_alt && _ctrlKey) then {
			if (!isNil {reporteUsado} && call life_adminlevel <= 1) exitWith {hint "Sólo puedes usar esta función cada 20 minutos"};
			0 spawn {
				reporteUsado = true;
				call ica_fnc_reporte;
				sleep (60 * 20);
				reporteUsado = nil;
			};			
		};
	};


    case DIK_SUBTRACT: {
	    if (_ctrlKey) then {
				if (!isNil {Distanciazo}) exitWith {hint "Sólo puedes hacer esto cada 5 segundos"};
				0 spawn {Distanciazo = true; sleep 5; Distanciazo = nil};

				if (isNil {Vision_distancia}) then {Vision_distancia = 500};
				switch (Vision_distancia) do
				{
					case (500):
					{
					    hint "Tu vision ya es la minima!";
						setViewDistance 500;
					};
					case (1000):
					{
					    hint "Ahora tu vision es de 500m";
						setViewDistance 500;
						Vision_distancia = 500;
					};
					case (1500):
					{
					    hint "Ahora tu vision es de 1000m";
						setViewDistance 1000;
						Vision_distancia = 1000;
					};
					case (2000):
					{
					    hint "Ahora tu vision es de 1500m";
						setViewDistance 1500;
						Vision_distancia = 1500;
					};
				};
		};
 	};
    case DIK_ADD: {
	    if (_ctrlKey) then {
				if (!isNil {Distanciazo}) exitWith {hint "Sólo puedes hacer esto cada 5 segundos"};
				0 spawn {Distanciazo = true; sleep 5; Distanciazo = nil};

				if (isNil {Vision_distancia}) then {Vision_distancia = 2000};
				switch (Vision_distancia) do
				{
					case (500):
					{
					    hint "Ahora tu vision es de 1000m";
						setViewDistance 1000;
						Vision_distancia = 1000;
					};
					case (1000):
					{
					    hint "Ahora tu vision es de 1500m";
						setViewDistance 1500;
						Vision_distancia = 1500;
					};
					case (1500):
					{
					    hint "Ahora tu vision es de 2000m";
						setViewDistance 2000;
						Vision_distancia = 2000;
					};
					case (2000):
					{
					    hint "Tu vision ya es la maxima!";
						setViewDistance 2500;
					};
				};
		};
 	};


	//T Key (Trunk)
	// ica revelar todo a 5m
	case DIK_T: {

	//con la o abrimos carcel

	["queAbrir"] spawn ica_fnc_asaltarCarcel;

///este de aqui abajo se tiene k quitar y dejar solo lo de revelar...
		if (!_alt && !_ctrlKey) then {
			if (vehicle player != player && alive vehicle player) then {
				if ((vehicle player) in life_vehicles) then {
					[vehicle player] call life_fnc_openInventory;
				};
			} else {
				if ((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Motorcycle" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR ((typeof cursorTarget) in listaCasas)) && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then {
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then {
						[cursorTarget] call life_fnc_openInventory;
					};
				} else {
					call ica_fnc_revela;
				};
			};
		};
	};

	//L Key?

	case DIK_L: {

	//houdini con la l

	if(player getVariable "restrained") then {

		["hudini"] spawn ica_fnc_hudini;

	}else{ 
		[] spawn ica_fnc_arrastrarInconsciente;
	};

	
	
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case DIK_Y:
	{
		if (dialog) exitWith {closeDialog 0};
		if (!_alt AND !_ctrlKey AND _shift) then {
			if (isNil {ocultandoHUD}) then {ocultandoHUD = false};
			[ocultandoHUD] call ica_fnc_HUDvisible;
		};
		if(!_alt && _ctrlKey && !dialog) then {
			// [] call fnc_opentablet;
			if (!isNil {hierbeado}) exitWith {hint "Sólo puedes hacer esto cada 20 segundos"};
			0 spawn {hierbeado = true; sleep 20; hierbeado = nil};

			if (isNil {hierba}) then {hierba = false};
			if (hierba) then {
				hint "Ahora ves hierba";
				setTerrainGrid 25;
			} else {
				hint "Ahora no ves hierba";
				setTerrainGrid 50;
			};
			hierba = !hierba;
		};
        if(_alt && !_ctrlKey && !dialog) then {
            if (!isNil {ambientazo}) exitWith {hint "Sólo puedes hacer esto cada 20 segundos"};
			0 spawn {ambientazo = true; sleep 20; ambientazo = nil};

			if (isNil {ambiente}) then {ambiente = true};
			if (ambiente) then {
				hint "Ahora no escuchas el sonido ambiente";
				enableEnvironment false;
			} else {
				hint "Ahora escuchas el sonido ambiente";
				enableEnvironment true;
			};
			ambiente = !ambiente;
		};
		if(!_alt && !_ctrlKey && !_shift && !dialog) then {
			["menu"] spawn ica_fnc_menuY;
		};
	};
	//Shift+P = Menu Trol
	/*case DIK_P: {
		if(_shift) then {
			createdialog "Menutrol_dialog";
			_handled = true;
		};
	};*/
	//U Key
/*	case DIK_U: {
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 30) then {

					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
							hint composeText [ image "\pop_iconos\icons\unlock.paa", "Vehículo abierto" ];
							_veh say3D "abrecoche";
						};

					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
							hint composeText [ image "\pop_iconos\icons\lock.paa", "Vehículo cerrado" ];
							_veh say3D "cierracoche";
						};
					};
				};
			};
		};
*/		
	case DIK_C: {
		if(vehicle player != player) then {
			if(!cinturon) then {
				cinturon = true;
				[player,"Cinturon abrochado. Deberias resistir mejor los choques.", 
				"Cinturon"
				] call ica_fnc_axeMsg;
				playSound "cierracoche";
				0 spawn {
				waitUntil { sleep 5; vehicle player isEqualTo player;};
				cinturon = false;
				};
			}
			else {
				cinturon = false;
				hint "Cinturon desabrochado.";	
			};			
		} else {
		
			if (underwater player) then {
			["buzo"] call ica_fnc_maraton;
				} else {
			["maraton"] call ica_fnc_maraton;
			};
		
		};
	};

	// F1 - TAPONES
	case DIK_F1: {
		if(_alt && !_shift && !_ctrlKey) then {
			[] spawn ica_fnc_bugRopa;
		};
	[] call life_fnc_fadeSound;
	};
	
 //ANTI ALT + F4
	case DIK_F4:
	{
		if (playerSide isEqualTo Independent) then {
			["menu"] spawn ica_fnc_centralica;
		} else {
			if (life_gangzona > 0) then {
				["menu"] call ica_fnc_centralaxe;
			};		
		};
		
		if (playerSide isEqualTo west) then {
			["menu"] spawn ica_fnc_centralica;
		};
		
		
		if(_alt && !_shift && !_ctrlKey) then {
			pop_atmdin = pop_atmdin * 0.15;
			[3,format["AVISO DE ALTF4: %1 ha usado ALT+F4 para desconectarse.",player getVariable["realname",name player]]] remoteExec ["life_fnc_broadcast",-2];
			//[[1,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			//[[0,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		};
	};
	
	case DIK_F5: {
		if(playerSide isEqualTo west) then {

			["menu"] spawn ica_fnc_centralita;

		};
	};	

	// ANTI CTRL + ALT + DEL
	case DIK_DELETE: {
		if(_ctrlKey && _alt)  then {
			pop_atmdin = pop_atmdin - (pop_atmdin * 0.15);
			[3,format["AVISO DE CTRLALTSUPR: %1 ha usado CTRL+ALT+SUPR para desconectarse.",player getVariable["realname",name player]]] remoteExec ["life_fnc_broadcast",-2];
			//[[1,format["AVISO DEL SERVIDOR: %1 ha usado CTRL+ALT+SUPR para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			//[[0,format["AVISO DEL SERVIDOR: %1 ha usado CTRL+ALT+SUPR para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		};
	};

	// ANTI CTRL + ESC
	case DIK_ESCAPE: {
		if( _ctrlKey )  then {
			pop_atmdin = pop_atmdin - (pop_atmdin * 0.15);
			[3,format["AVISO DE ALTF4: %1 ha usado ALT+F4 para desconectarse.",player getVariable["realname",name player]]] remoteExec ["life_fnc_broadcast",-2];
			//[[1,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			//[[0,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",player getVariable["realname",name player]]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
		};
	[] spawn {
	closeDialog 0;
	sleep 1;
	closeDialog 0;
		};
	};
	// Tabulando
	case DIK_TAB: {
		if (!_alt && !_ctrlKey && player distance (getmarkerPos "respawn_civilian_1") > 100) then {
			call ica_fnc_hudSwitch;
		};
	};

	//F2 DEBUG Admin
	case DIK_F2: {
		if(primaryWeapon player == "pop_pesca") then {
			[] spawn ica_fnc_pescar;
		}
		else {
			if ((call life_adminlevel) >= 1) then {
				[] call fnc_consola;
			};
		};	
	};
	// F3
	case DIK_F3: {
		if ((call life_adminlevel) > 0) then {
			createDialog "life_admin_menu";
		};
	};

	/*case DIK_F8: {
		if(vehicle player != player) exitWith {
			_units = [];
			{if(vehicle _x != _x && player distance _x < 20 && !(_x in crew (vehicle player)) && _x == (driver (vehicle _x))) then {_units pushBack _x};} forEach playableUnits;
			if(count _units > 0 && count life_racers == 0) then {
				closeDialog 0;
				[_units] call life_fnc_openDuelUI;
			};
		}; 		
	};*/
//buscar tesoros
	case DIK_J: 
    {
        // atacar
    //["buscarTesoro"] spawn ica_fnc_cazatesoros;

   };


	

    case DIK_B: 
    {
	if (modoCombate) then { modoCombate = false; hint "Modo de combate cuerpo a cuerpo DESACTIVADO" } else { modoCombate = true; hint "Modo de combate cuerpo a cuerpo ACTIVADO" };
    };

    // n 49
   case DIK_N: 
    {
        // def
	//hint "Forzado de Casas desactivado de Momento";
    // []spawn ica_fnc_defender;
    //["forzarCasa"] spawn ica_fnc_generarLoot;
    };

    case DIK_5 : {
			_handled = ["fin"] Call ica_fnc_SonidosNewSiren ;
		};
    case DIK_4 : { 
			If (_shift) Then { _handled = ["S24"] Call ica_fnc_SonidosNewSiren ; } Else { _handled = ["S4"] Call ica_fnc_SonidosNewSiren ; };
		};
    case DIK_3 : {
			If (_shift) Then { _handled = ["S23"] Call ica_fnc_SonidosNewSiren ; } Else { _handled = ["S3"] Call ica_fnc_SonidosNewSiren ; };
		};
    case DIK_2 : {
			If (_shift) Then { _handled = ["S22"] Call ica_fnc_SonidosNewSiren ; } Else { _handled = ["S2"] Call ica_fnc_SonidosNewSiren ; };
		};
    case DIK_1 : {
			If ( vehicle player != player ) Then {
				If (_shift) Then { _handled = ["S21"] Call ica_fnc_SonidosNewSiren ; } Else { _handled = ["S1"] Call ica_fnc_SonidosNewSiren ; };
			} else {
				if (__GETC__(mafia) > 0 && player getVariable ["sp_enservicio",false]) then {
					[] call life_fnc_showSpDNI;
				};
				if (__GETC__(life_coplevel) > 0) then {
					[] call life_fnc_showBadge;
				};
				if (life_gangZona > 0) then {
					[] call life_fnc_showMafiaDNI;
				};
			};
		};

	case 41 : {
		switch (side player) do
		{
			case west: {
				[] call life_fnc_showDNI;
			};

			case civilian: {
				[] call life_fnc_showDNI;

			};
			case independent: {
				[] call life_fnc_showDNI;
			};
		};

		_handled = true;
	};
};

_handled;