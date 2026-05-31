#include "..\..\script_macros.hpp"
/*
    File: fn_wireTransfer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initiates the wire-transfer
*/
params [
    ["_value",0,[0]],
    ["_from","",[""]]
];

if (_value isEqualTo 0 || _from isEqualTo "" || _from isEqualTo profileName) exitWith {}; //No
pop_atmdin = pop_atmdin + _value;
[1] call SOCK_fnc_updatePartial;
//hint format [localize "STR_ATM_WireTransfer",_from,[_value] call life_fnc_numberText];
hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>%1 te ha transferido %2€ a tu cuenta bancaria.</t>", _from,[_value] call life_fnc_numberText];      