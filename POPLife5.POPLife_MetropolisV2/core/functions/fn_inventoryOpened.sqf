/*
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;


if(_container getVariable ["abierto",false]) exitWith {
	hint "Este contenedor esta abierto por otra persona, espera a que lo cierre.";
	[] spawn {
	waitUntil {!isNull (findDisplay 602)};
	closeDialog 0;
	sleep 1;
	titleText ["Inventario Bloqueado, abrelo varias veces para desbloquear", "PLAIN"];
	waitUntil {!isNull (findDisplay 602)};
	closeDialog 0;
		};
};

if (typeof _container isEqualTo "C_Van_01_fuel_F") then {
	hint "Este contenedor esta prohibido.";
	[] spawn {
	waitUntil {!isNull (findDisplay 602)};
	closeDialog 0;
	sleep 1;
	titleText ["Inventario Bloqueado, abrelo varias veces para desbloquear", "PLAIN"];
	waitUntil {!isNull (findDisplay 602)};
	closeDialog 0;
		};
};

if (typeof _container != "POP_cajasilo_obj") then {
_container setVariable ["abierto",true,true];
};

[] spawn {
if (isNull objectParent player) exitWith {};
if (axe_checodupeo) exitWith {};
axe_checodupeo = true;

[] spawn {
	waitUntil {isNull objectParent player};
	if (axe_cargadupeo isEqualTo 0) exitWith {}; 
	if (axe_cargadupeo != loadabs player) then {
	["AntiDupe Kick"] call ica_fnc_axeLog;
	[true] spawn ica_fnc_posicion;
	[[player],{hint format ["AntiDupe Kick: %1 Ha sido kickeado de manera preventiva por el sistema antidupeo",name (_this select 0)]}] remoteExec ["BIS_fnc_spawn",-2];
	[player] call ica_fnc_axeKick;
	} else {
	axe_cargadupeo = 0;
	axe_checodupeo = false;
	};
};

 while {!isNull objectParent player} do 
	{
	axe_cargadupeo = loadabs player;
	uisleep 0.1;
	};
	axe_checodupeo = false;
 
 };


if (!isNil {_container getVariable "bloqueado"}) exitWith {
_container setVariable ["abierto",false,true];
	[] spawn {
		_time = 8;
		while {_time > 0} do {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		_time - 1;
		};
	};
	hint "Lo intentas, pero no se abre";
};

if (((typeOf _container) == "POP_cajaDiamantes_obj") AND (isNil {puedoAbrir})) exitWith {
_container setVariable ["abierto",false,true];
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
		[10, "Abriendo..."] spawn ica_fnc_barrita;
		sleep 10;
		titleText ["Ya puedes abrir la caja", "PLAIN", 0.1];
		["envio", player, 30, 60*20] call ica_fnc_bloqueoDinero;
		puedoAbrir = true;
		sleep 3;
		puedoAbrir = nil;
	};
};


[] spawn {
	sleep 2;
	waitUntil {isNull (findDisplay 602)};
	[3] remoteExec ["SOCK_fnc_updatePartial", player];
};


_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1 && playerSide != west) then {
    hint localize "STR_MISC_Backpack";
    [] spawn {
        waitUntil {!isNull (findDisplay 602)};
        closeDialog 0;
    };
};

if((typeOf _container) in clasesMuebles) exitWith {
_clasesCasas = listaCasas + listaGarajes + listaGranjas + apartamentos;

	_houses = nearestObjects [(getPosATL _container), _clasesCasas, 20];
	if (_houses isEqualto []) then {}else{
	_house = _houses select 0; 
	if!(_house in life_vehicles) then {
	
		if (typeof _house in apartamentos) then {
		
			if (_house getVariable [format ["%1_locked",apartamentoNo],false]) then {
				hint localize "STR_House_ContainerDeny";
				[] spawn {
					waitUntil {!isNull (findDisplay 602)};
					closeDialog 0;
				};			
			};

		} else {
			if (_house getVariable ["locked",false]) then {
				hint localize "STR_House_ContainerDeny";
				[] spawn {
					waitUntil {!isNull (findDisplay 602)};
					closeDialog 0;
				};
			};		
		};
	
	
	};
 };
};


_listaCajasCoca = [cajacoca1, cajacoca2, cajacoca3,cajaopio16,cajaopio15,cajaopio12,cajaopio13,cajaopio5,cajaopio6];
if(_container in _listaCajasCoca) exitWith {
	if (((nearestObjects [_container, ["pop_contenedor"], 3] select 0) animationPhase "door1") == 0) then {
	_container setVariable ["abierto",false,true];
		hint "No puedes abrir la caja";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
	_container setVariable ["abierto",false,true];
		hint localize "STR_MISC_VehInventory";
		[] spawn {
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};



if(_container isKindOf "Man") exitWith {
	_container setVariable ["abierto",false,true];
	hint localize "STR_NOTF_NoLootingPerson";
	[] spawn {
	waitUntil {!isNull (findDisplay 602)};
	closeDialog 0;
	};
};



