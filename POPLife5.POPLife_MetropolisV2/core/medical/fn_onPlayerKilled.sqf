#include "..\..\script_macros.hpp"
/*
        File: fn_onPlayerKilled.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        When the player dies collect various information about that player
        and pull up the death dialog / camera functionality.
*/
profileNamespace setVariable ["rutome", 60 * 2];
private ["_unit", "_killer", "_tmpCash"];
_unit	= [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_killer = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
disableSerialization;
_tmpCash = pop_din;
_killer setvariable ["muertes",(_this select 1 getvariable ["muertes",0]) + 1,true ];
[3] call SOCK_fnc_updatePartial;
pop_din = 0;
life_deadPosition = (getPos player);
[0] call SOCK_fnc_updatePartial;

// FuRixX
if (!isNil "_killer") then {
	if (player != _killer) then {
		systemChat format ["%1 ha asesinado a %2", name _killer, name player];
	} else {
		systemChat format ["%1 se ha matado", name player];
	};
};


[] spawn
{
	while {(vehicle player) != player} do {
		player action ["Eject", (vehicle player)];
	};
};

// ica
//[player] spawn ica_fnc_initMed;

// Set some vars
_unit setVariable ["Revive",false,true];
_unit setVariable ["name",profileName,true]; //Set my name so they can say my name.
_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["steam64id",(getPlayerUID player),true]; //Set the UID.


if (!isNull _killer) then	{
	life_killer = _killer;
		if (_killer != player) then {
			systemChat format ["Has sido dado de baja por el usuario con ID: %1 ",getPlayerUID _killer];
			//hint format ["Has sido dado de baja por el usuario con ID: %1 ",getPlayerUID _killer];	
		};
};

// Killed by cop stuff...
if (side _killer isEqualTo west && !(playerSide isEqualTo west)) then {
    life_copRecieve = _killer;
    //Did I rob the federal reserve?
    if (!life_use_atm && {_tmpCash > 0}) then {
        //[format [localize "STR_Cop_RobberDead",[_tmpCash] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        pop_din = _tmpCash;
    };
};

if ( (count terroristasEA) > 1) then {
	if ((_killer in terroristasEA) && !(player in terroristasEA) ) then {
	victimasEA = victimasEA + 1;publicVariable "victimasEA"; 
	systemChat "Has caido victima del Terror ...";
	};
};

if (!isNull _killer && {!(_killer isEqualTo _unit)} && {!(side _killer isEqualTo west)} && {alive _killer}) then {
    if (vehicle _killer isKindOf "LandVehicle") then {
        if (life_HC_isActive) then {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187V"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

    } else {
        if (life_HC_isActive) then {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };

        if (!local _killer) then {
            [3] remoteExecCall ["life_fnc_removeLicenses",_killer];
        };
    };
};

if !(BOMBATERMINADA) then {
	if (_unit in terroristasELN) then {
		_docs =  "Land_File1_F" createVehicle position _victima;
		[_docs, [".:: Inspeccionar Evidencia ::.", {
			_docsact = _this select 0; 
			player playmove "AinvPknlMstpSlayWrflDnon"; 
			sleep 1;
			_codigo = CODIGO;
			_posbomba = posbomba;	
			_pista1 = format ["Encuentras una nota poco  légible ... alcanzas a ver tres números ... %1-%2-%3-x ... para que será ",_codigo select 0, _codigo select 1, _codigo select 2];
			_pista2 = format ["Encuentras una nota que dice ... Camarada, en caso de que nos den el dinero este es el código %1-%2-%3-%4 ... para que será",_codigo select 0, _codigo select 1, _codigo select 2, _codigo select 3];	
			_pista3 = format ["Encuentras un mapa con una X en las coordenadas %1",_posbomba];
			_pista4 = format ["Encuentras un mapa con una X en las coordenadas %1",_posbomba];	
			_pistas=[_pista1,_pista2,_pista3,_pista4] call BIS_fnc_selectRandom;
			player playMove "AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown";
			hint format["Evidencia: %1", _pistas];
			deleteVehicle _docsact;
		},nil,6,true,true,"","!BOMBATERMINADA"]] remoteExec ["addAction", 0,true];
	};
};

life_save_gear = [player] call life_fnc_fetchDeadGear;


if (!isNull _killer && (_killer != _unit) && (side _unit isEqualTo WEST)) then {
	[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
};


pop_din = _tmpCash;

pop_din = 0;
if (playerSide == WEST) then {} else {
pop_atmdin = pop_atmdin - (pop_atmdin*0.01); //Rosen: te quita % de tu dinero al morir
};

[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC",RSERV];

// ica
profileNamespace setVariable ["hearb",100];
profileNamespace setVariable ["fois",100];
[] call life_fnc_hudUpdate; //Get our HUD updated.
0 spawn ica_fnc_nigromante;

