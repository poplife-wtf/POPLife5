#include "..\..\script_macros.hpp"
/*
    File: fn_actionKeyHandler.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master action key handler, handles requests for picking up various items and
    interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private ["_curObject","_isWater","_CrateModelNames","_crate","_fish","_animal","_whatIsIt","_handle"];
_curObject = cursorObject;
_curTarget = cursorObject;
if (life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if (life_interrupted) exitWith {life_interrupted = false;};
_isWater = surfaceIsWater (visiblePositionASL player);


if ((typeof _curTarget) in listaGranjas  && {player distance _curTarget < 10} && playerSide isEqualTo civilian) exitWith {
	[_curTarget] call bk_fnc_Actions_Granjas;
};

if (isNull _curTarget) then {
	_zonasPlantables = ["TPHacido1", "TPHacido2", "TPHacido3", "TPHbasico1",
	"TPHbasico2", "TPHbasico3", "TPHneutro1", "TPHneutro2", "TPHneutro3"];
	if ((([_zonasPlantables call ica_fnc_masCercano] call ica_fnc_getPos) distance player) < 30) then {
		call ica_fnc_agricultura;
	};
	
	_granjas = nearestObjects [player,listaGranjas, 70];
	if (count _granjas > 0) then {
	_granja = _granjas select 0;
	_Dueno = (_granja getVariable ["house_owner",[]]) select 0;
		if (_Dueno isEqualTo getPlayerUID player) then {
			
				if (surfaceType position player isEqualTo "#huerta") then {
				call ica_fnc_agricultura
				};
			};
			
	};

};


_listabusca = [];
_listabusca append listacasas;
_listabusca append listaGarajes;
_listabusca append apartamentos;

if (player getVariable ["restrained", false] && !(player getvariable ["inconsciente",false])) exitwith {
	["menu"] spawn ica_fnc_liberoesposas;
};
if ((typeof _curTarget) in _listabusca  && {player distance _curTarget < 12}) exitWith {
	closeDialog 0;
	[_curTarget] call bk_fnc_Actions_House;
};

if (dialog) exitWith {}; //Don't bother when a dialog is open.
if !(isNull objectParent player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
    sleep 60;
    life_action_inUse = false;
};


if (stance player isEqualTo "CROUCH") then {
		_poli = [
		"POP_tetrapodo",
		"POP_tetrapodo_x3",
		"POP_tetrapodo_x5",
		"POP_tetrapodo_x7",
		"POP_electroflare",
		"POP_banda",
		"POP_senal_alcoholemiagc",
		"POP_senal_control_policia",
		"POP_senal_izquierda",
		"POP_senal_derecha",
		"POP_senal_stop",
		"POP_senal_estrechamiento",
		"POP_senal_velocidad20",
		"POP_senal_velocidad40",
		"Land_PortableLight_single_F",
		"Land_PortableLight_double_F",
		"POP_BandaClavos",
		"pop_electroflare"
	];
	
	_cercaniap = nearestObjects [player, _poli, 3];
    if !(isNull (_cercaniap select 0)) then {
		_curtarget = _cercaniap select 0;
		if(isNil "_curtarget") exitWith {};
		titleText["Recogiendo...","PLAIN"];
		sleep 0.5;
		_micur = format["%1_i", typeOf _curtarget];

		titleText["Recogiendo...","PLAIN"];
		player playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
		sleep 1.3;
		if ([_micur] call ica_fnc_item) then {
		deleteVehicle _curtarget;
		} else {
		titleText["No tienes espacio en el inventario...","PLAIN"];			
		};		


	};

	_cercaniaM = nearestObjects [player,clasesMuebles, 3];
    if !(isNull (_cercaniaM select 0)) then {
	_mueble = _cercaniaM select 0;
	[_mueble] call life_fnc_removeContainer;
	};
		
	

};

	if ((getmodelInfo _curTarget) select 0 in arrArboles) then {
	
	if (!isNil {cogiManzana}) exitWith {hint "tan rapido cansa ... las manzanas estan alto..." };
    [] spawn {
        cogiManzana = true;
        sleep 10;		
        cogiManzana = nil;
    };
		player playmove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		if (random 100 > 70) then {
			_manzana = ["pop_apple3","pop_apple","pop_apple1","pop_apple2"] call BIS_fnc_selectRandom;
			if ([_manzana, 1] call ica_fnc_item) then {
				["+1 Manzana"] call ica_fnc_infolog;
			};
		};
	};

_curTarget = cursorTarget;

	// If target is a player then check if we can use the cop menu.
    if (isPlayer _curTarget && _curTarget isKindOf "Man") then {
		if ((_curTarget getVariable ["restrained", false]) && {!(player getVariable ["restrained", false])} && playerSide == west) then
			{
				[_curTarget, "cop"] call bk_fnc_Actions_Arrest;
			};
		if ((_curTarget getVariable ["restrained", false]) && {!(player getVariable ["restrained", false])} && playerSide == civilian) exitWith
			{
				[_curTarget, "civ"] call bk_fnc_Actions_Arrest;
			};
    } else {
		// OK, it wasn't a player so what is it?
		private ["_isVehicle", "_money"];
		_isVehicle = if ((_curTarget isKindOf "landVehicle")OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
		_money = "Land_Money_F";

		// It's a vehicle! open the vehicle interaction key!
		if (_isVehicle) then {
				if (!dialog) then {
					if (playerSide == west && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget, "cop"] call bk_fnc_Actions_Vehicles;
					};
					if (playerSide == civilian && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget, "civ"] call bk_fnc_Actions_Vehicles;
					};
					if (playerSide == independent && player distance _curTarget < (((boundingBox _curTarget select 1)select 0) + 2)) then {
						[_curTarget, "med"] call bk_fnc_Actions_Vehicles;
					};
				};
		} else {
			// It wasn't a misc item so is it money?
			if ((typeOf _curTarget) == _money && {!(_curTarget getVariable ["inUse", false])}) then {
				//extra cheek by quic
				if ((count (nearestObjects [player, ["man"], 5]))>1) exitwith {hint "Hay demasiada gente para recoger el dinero"};
				private ["_handle"];
				_curTarget setVariable ["inUse", TRUE, TRUE];
				_handle = [_curTarget] spawn life_fnc_pickupMoney;
				waitUntil {scriptDone _handle};

				//extra borrado by quick
				deleteVehicle _curTarget;
				

			};
		};
    };
