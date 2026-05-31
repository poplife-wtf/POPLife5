#include "..\..\script_macros.hpp"
#include <macro.h>
/*

By AxE
Admin de casa de mafia.

*/

_p = _this select 0;

if (_p isEqualTo "quitar") exitWith {

_unit = call compile format ["%1",CONTROL_DATA(1500)];

_unit setVariable ["uso_casa",false,true];

hint format ["Se ha quitado acceso a la casa de mafia a %1 temporalmente",name _unit];

};

if (_p isEqualTo "menu") exitWith {
disableSerialization;
if (isNull (findDisplay 101001)) then {
    if (!(createDialog "mafia_casa")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};
_permiso = false;
_members = CONTROL(101001,1500);
_grpMembers = units group player;
lbClear _members;

{
	_permisox = "Sin Permiso";
	_permiso = _x getVariable ["uso_casa",false];
	_rango = _x getVariable ["mafia_rango",1];
	if (_permiso) then {
		_permisox = "con Permiso";
		} else {
		_permisox = "sin Permiso";
		};
	if( _rango isEqualTo 5) then {
		_members lbAdd format["Alias %1 (-%2-) - Capo",name _x,_rango];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	} else {
		_members lbAdd format["Alias %1 (-%2-) - %3 ",name _x,_rango,_permisox];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	};
} foreach _grpMembers;

_nMafia = CONTROL(101001,1003);
_bMafia = CONTROL(101001,1004);

_nMafia ctrlSetText life_gangName;
_bMafia ctrlSetText format ["%1€",(group player) getVariable ["gang_bank",0]];

};

if (_p isEqualTo "agregar") exitWith {

_unit = call compile format ["%1",CONTROL_DATA(1500)];

_unit setVariable ["uso_casa",true,true];

hint format ["Se ha restaurado acceso a la casa de mafia a %1",name _unit];

};

