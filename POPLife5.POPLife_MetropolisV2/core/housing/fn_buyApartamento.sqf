#include "..\..\script_macros.hpp"
/*
    File: fn_buyApartamento.sqf
    By: AxE

    Description:
    Compra un apartamento... oka ? oka ??? solo lo hace popv ... no intentes cosas... me necesitas a mi y mi polla para q esto funcione.
*/
private ["_housex","_uid","_action","_houseCfg"];
_housex = param [0,objNull,[objNull]];
_uid = getPlayerUID player;

_door = [_housex] call life_fnc_nearestDoor;
if (_door isEqualTo 0) exitWith {hint "Debes acercarte a la puerta del apartamento que desees comprar."};

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
	_log = format ["BuyApto linea 17 - _door : %1, tipo door: %2 --- %3",_door,typename _door,str(_housex)];
	[_log] call ica_fnc_axeLog;
};


if (isNull _housex) exitWith {};
if (!(_housex isKindOf "House_F")) exitWith {};

if (!license_civ_home) exitWith {hint localize "STR_House_License"};
if (count life_houses >= (LIFE_SETTINGS(getNumber,"house_limit"))) exitWith {hint format [localize "STR_House_Max_House",LIFE_SETTINGS(getNumber,"house_limit")]};
closeDialog 0;

_houseCfg = [(typeOf _housex)] call life_fnc_houseConfig;
if (count _houseCfg isEqualTo 0) exitWith {};

_action = [
    format [localize "STR_House_BuyMSG",
    [(_houseCfg select 0)] call life_fnc_numberText,
    (_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    if (pop_atmdin < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
    pop_atmdin = pop_atmdin - (_houseCfg select 0);
    [1] call SOCK_fnc_updatePartial;
	
	_housePosx = getPosATL _housex;
	
    if (life_HC_isActive) then {
        [_uid,_housePosx,_door] remoteExec ["HC_fnc_addHouse",HC_Life];
    } else {
        [_uid,_housePosx,_door] remoteExec ["TON_fnc_addHouse",RSERV];
    };

    //if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
        if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
            advanced_log = format [localize "STR_DL_AL_boughtHouse_BEF",[(_houseCfg select 0)] call life_fnc_numberText,[pop_atmdin] call life_fnc_numberText,[pop_din] call life_fnc_numberText];
        } else {
            advanced_log = format [localize "STR_DL_AL_boughtHouse",profileName,(getPlayerUID player),[(_houseCfg select 0)] call life_fnc_numberText,[pop_atmdin] call life_fnc_numberText,[pop_din] call life_fnc_numberText];
        };
        publicVariableServer "advanced_log";
    //};


	_miarray = [_uid,profileName];
	_arrayownersactual = _housex getVariable ["house_owner",[]];
	_arrayownersactual = _arrayownersactual pushback _miarray;
	
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
	_log = format ["BuyApto linea 59 - _arrayac : %1, codigo setv: %2",_arrayownersactual, format ["%1_contenedores",_door]];
	[_log] call ica_fnc_axeLog;
};	
	
    _housex setVariable ["house_owner",_arrayownersactual,true];
    _housex setVariable [ format ["%1_owner",_door],_miarray,true];
    _housex setVariable [ format ["%1_contenedores",_door],[],true];
    _housex setVariable [ format ["%1_uid",_door],floor(random 99999),true];
	//_housex setVariable ["uid",floor(random 99999),true]; lulwat

    life_vehicles pushBack _housex;
    life_houses pushBack [str(getPosATL _housex),[]];
    _marker = createMarkerLocal [format ["house_%1",(_housex getVariable "uid")],getPosATL _housex];
    _houseName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _housex), "displayName");
    _marker setMarkerTextLocal _houseName;
    _marker setMarkerColorLocal "ColorGreen";
    _marker setMarkerTypeLocal "loc_Lighthouse";

	_housex setVariable [format ["bis_disabled_Door_%1",_door],1,true];
	
};