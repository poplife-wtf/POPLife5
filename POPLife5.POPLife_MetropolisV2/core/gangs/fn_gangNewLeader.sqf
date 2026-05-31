#include "..\..\script_macros.hpp"
#include <macro.h>
/*
    File: fn_gangNewLeader.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Something about being a quitter.
*/
private ["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format ["%1",CONTROL_DATA(2621)];

_unitID = getPlayerUID _unit;
_unitRank = _unit getVariable ["mafia_rango",1];
_rango = player getVariable ["mafia_rango",1];
life_gangmembers = group player getVariable ["gang_members",[]];

if (isNull _unit) exitWith {}; //Bad unit?
if (_unit == player) exitWith {hint localize "STR_GNOTF_TransferSelf"};

if (_rango < 3) exitWith {hint "No tienes el respeto suficiente en tu organización para alterar los rangos."};
if(_unitID == getPlayerUID player) exitWith {hint "amigo ... no pudes cambiarte el rango a ti mismo, las cosas no funcionan asi."};

if (_rango == 5 && _unitRank == 4) then {
	_action = [
		format["%1 esta solo un peldaño por debajo de ti, si le asciendes tomara el control total de la organización ... estas seguro?",name _unit],
		localize "STR_Gang_Transfer",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
	] call BIS_fnc_guiMessage;
	
	if(_action) then {
		if(EQUAL(_unitID,"")) exitWith {hint "Bad UID?"};
		if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"}; 
		life_gangowner = _unitID;
		{
			if (SEL(_x,0) == _unitID) then {
				_x set [2,_unitRank + 1];
				life_gangmembers set [_foreachindex, _x];
			};
			if (SEL(_x,0) == steamid) then {
				_x set [2,4];
				life_gangmembers set [_foreachindex, _x];
			};
		} foreach life_gangmembers;

		group player setVariable ["gang_owner",_unitID,true];
		group player setVariable ["gang_members",life_gangmembers,true];
		_unit setVariable ["mafia_rango",5,true];
		group player selectLeader _unit;
		
		if (life_HC_isActive) then {
			[3,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
			[4,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
		} else {
			[3,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
			[4,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
		};
		
		if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};

	} else {
		hint "Las movidas con los rangos de la organización han sido canceladas.";
	};
} else {
	if (_rango > _unitRank) then {
		{
			if (SEL(_x,0) ==_unitID) then {
				_x set [2,(_unitRank + 1)];
				life_gangmembers set [_foreachindex, _x];
			};
		} foreach life_gangmembers;
		if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};    		
		group player setVariable ["gang_members",life_gangmembers,true];
		_unit setVariable ["mafia_rango",_unitRank + 1,true];
		
		if (life_HC_isActive) then {
			[3,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
			[4,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
		} else {
			[3,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
			[4,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
		};
    	hint format["Has promovido %1 al rango %2.",name _unit, _unitRank + 1];
	} else {
	    hint "No puedes promover a alguien a tu rango o a un rango mayor que el tuyo.";  
	};
};


[] call life_fnc_gangMenu;
