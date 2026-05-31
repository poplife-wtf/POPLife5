#include <macro.h>
/* ---------- 

A tomar por culo el Tonic este de los cojones!!
Hecho por : AxE
Para: PopLife 4

Desc: Degrada el rango del jugador en su organización.

------------- */
private["_unit","_unitID","_members","_action","_index","_unitRank"];
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format ["%1",CONTROL_DATA(2621)];

_unitID = getPlayerUID _unit;
_unitRank = _unit getVariable ["mafia_rango",1];
life_gangrank = player getVariable ["mafia_rango",1];
life_gangmembers = group player getVariable ["gang_members",[]];

if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};
if (life_gangrank < 3) exitWith {hint "No tienes el respeto para lidiar con temas de la organización"};
if (_unitRank < 2) exitWith {hint "No puedes degradar a alguno con igual o menor rango a ti!";};
if(_unitID == getPlayerUID player) exitWith {hint "Que intentas amigo ? no te puedes bajar de rango a ti mismo"};

if (life_gangrank > _unitRank) then {
	{
		if (SEL(_x,0) == _unitID) then {
			_x set [2,_unitRank - 1];
			life_gangmembers set [_foreachindex, _x];
		};
	} foreach life_gangmembers;
		_unit setVariable ["mafia_rango",_unitRank - 1,true];
		group player setVariable ["gang_members",life_gangmembers,true];
		
		if (life_HC_isActive) then {
			[3,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
			[4,group player] remoteExec ["HC_fnc_updateGang",HC_Life]; //Update the database.
		} else {
			[3,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
			[4,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
		};
	
	hint format["Has degradado a %1 al rango %2.",name _unit, _unitRank - 1];
} else {
    hint "No puedes degradar a alguien con más o igual rango que tu!";  
};
[] call life_fnc_gangMenu;