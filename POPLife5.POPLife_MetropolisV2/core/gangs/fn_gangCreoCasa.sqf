#include "..\..\script_macros.hpp"
#include <macro.h>
/*

By AxE
handleo conversión de casa a casa de mafia.

*/

_casa = _this select 0;

if !(life_in_gang) exitWith { };
if (isNull _casa) exitWith { hint "Casa no obtenida" };
if (life_gangrank < 5) exitWith {};
if !(life_gangCasa isEqualto []) exitWith {hint "al parecer tu mafia ya tiene casa de mafia."};

_pos = getPos _casa;
_group = group player;
life_gangCasa = _pos;
_group setVariable ["gang_casa",life_gangCasa,true];




if (life_HC_isActive) then {
	[5,_group] remoteExecCall ["HC_fnc_updateGang",HC_Life];
} else {
	[5,_group] remoteExecCall ["TON_fnc_updateGang",2];
};