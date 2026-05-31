#include "..\..\script_macros.hpp"
/*
    File: fn_lockHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Unlocks / locks the house.
*/
private ["_house"];
_house = param [0,objNull,[objNull]];
if (isNull _house || !(_house isKindOf "House_F")) exitWith {};

if (typeof _house in apartamentos ) then {
_state = _house getVariable [format ["%1_locked",apartamentoNo],true];
	if (_state) then {
		_house setVariable [format ["%1_locked",apartamentoNo],false,true];
		titleText[localize "STR_House_StorageUnlock","PLAIN"];
	} else {
		_house setVariable [format ["%1_locked",apartamentoNo],true,true];
		titleText[localize "STR_House_StorageLock","PLAIN"];
	};
}else{
_state = _house getVariable ["locked",true];
	if (_state) then {
		_house setVariable ["locked",false,true];
		titleText[localize "STR_House_StorageUnlock","PLAIN"];
	} else {
		_house setVariable ["locked",true,true];
		titleText[localize "STR_House_StorageLock","PLAIN"];
	};
};