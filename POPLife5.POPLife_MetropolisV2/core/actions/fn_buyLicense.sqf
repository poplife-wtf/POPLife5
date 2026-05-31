#include "..\..\script_macros.hpp"
/*
    File: fn_buyLicense.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when purchasing a license. May need to be revised.
*/
private ["_type","_varName","_displayName","_sideFlag","_price"];
_type = _this select 3;

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_varName = LICENSE_VARNAME(_type,_sideFlag);

if (pop_din < _price) exitWith {hint format ["El carnet de %2 cuesta %1 €, no tienes suficiente dinero",[_price] call life_fnc_numberText,localize _displayName];};
pop_din = pop_din - _price;

[0] call SOCK_fnc_updatePartial;

titleText[format ["Compraste tu Carnet de %2 por %1 €",[_price] call life_fnc_numberText,localize _displayName],"PLAIN"];
missionNamespace setVariable [_varName,true];

[2] call SOCK_fnc_updatePartial;
