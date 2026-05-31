#include "..\..\script_macros.hpp"
/*
    File: fn_placeContainer.sqf
    Author: NiiRoZz
    Credits: BoGuu
	Por AxE.

    Description:
    Check container if are in house and if house are owner of player and if all this conditions are true add container in database
*/
private ["_container","_isFloating","_type","_house","_houseCfg","_message","_isPlaced"];
params [
        ["_container",objNull,[objNull]],
        ["_isFloating",true,[true]]
];

if (isNull cosaSimple) then {
cosaSimple = _container;
};
_uid = getPlayerUID player;
_arrNear = nearestObjects [player, ["House"], 20];
_house = ObjNull;
_arrCasas = listaCasas + apartamentos;

{
	if (typeof _x in _arrCasas) exitWith {_house = _x;};
} foreach _arrNear;

if (isNull _house) then { hint "Ninguna casa o apartamento valido cercana. Intenta a moverte un poco."; };
if ((typeOf _house) isEqualTo "land_POP_Mansion_4" && !(player getVariable ["uso_casa",false])) exitWith {hint "no tienes autorizacion para usar a la casa de mafia"};

_aptoNo = apartamentoNo;

switch (true) do {
    case (typeOf cosaSimple isEqualTo "pop_armario1_box"): {_type = "pop_armario1_inv"};
    case (typeOf cosaSimple isEqualTo "pop_armario2_box") : {_type = "pop_armario2_inv"};
	case (typeOf cosaSimple isEqualTo "pop_nevera_box") : {_type = "pop_nevera_inv"};
	case (typeOf cosaSimple isEqualTo "pop_mesa_tv_box") : {_type = "pop_mesa_tv_inv"};
	case (typeOf cosaSimple isEqualTo "pop_sofa") : {_type = "pop_sofa_inv"};
    default {_type = ""};
};

_message = 0;
_isPlaced = false;
if (!isNull _house) then {
    _message = 1;
    if (([player] call life_fnc_playerInBuilding) && {([cosaSimple] call life_fnc_playerInBuilding)}) then {
        _message = 2;
        if ((_house in life_vehicles) && !(isNil {_house getVariable "house_owner"})) then {
            _message = 3;
            if (!_isFloating) then {
                _message = 4;
				if (_aptoNo isEqualTo 0) then {
					cosaSimples = _house getVariable ["containers",[]];
				}else{
					cosaSimples = _house getVariable [format ["%1cosaSimples",_aptoNo],[]];
				};
                _houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
                if (_houseCfg isEqualTo []) exitWith {};
                if (count cosaSimples < (_houseCfg select 1) OR _house isEqualTo casaDeMafia) then {
                    _isPlaced = true;
					
					cosaSimplePos = getPosATL cosaSimple;
					_className = typeOf cosaSimple;
					_dir = [vectorDir cosaSimple, vectorUp cosaSimple];
					
                    if (life_HC_isActive) then {
                        [_uid,cosaSimplePos,_aptoNo,_className,_dir] remoteExec ["HC_fnc_addContainer",HC_Life];
                    } else {
                        [_uid,cosaSimplePos,_aptoNo,_className,_dir] remoteExec ["TON_fnc_addContainer",RSERV];
                    };
                    cosaSimple setVariable ["Trunk",[[],0],true];
                    cosaSimple setVariable ["container_owner",[_uid],true];
                    cosaSimples pushBack cosaSimple;
					if (_aptoNo isEqualTo 0) then {
						_house setVariable ["containers",cosaSimples,true];
					}else{
						_house setVariable [format ["%1cosaSimples",_aptoNo],cosaSimples,true];
					};
                };
            };
        };
    };
};

if (_isPlaced) exitWith {};

deleteVehicle cosaSimple;
[true,_type,1] call life_fnc_handleInv;

if (_message isEqualTo 0 || _message isEqualTo 1) then {
    hint localize "STR_HousecosaSimple_House_Near";
};
if (_message isEqualTo 2) then {
    hint localize "STR_HousecosaSimple_House_Near_Owner";
};
if (_message isEqualTo 3) then {
    hint localize "STR_HousecosaSimple_Floating";
};
if (_message isEqualTo 4) then {
    hint localize "STR_ISTR_Box_HouseFull";
};