#include <macro.h>
/*
AxE Is On Top 

Bandas cobran extorsion por compras y vendas en su zona controlada.

*/

private["_valor","_organizacion"];
_valor = _this select 0;
_valor = _valor * 1.5;
_organizacion = _this select 1;
if ((count units _organizacion) < 5) exitWith {}; //Solo cobran extornsion cuando hay más de dos miembros conectados ... sino quien la cobra ?
if(_valor < 0) exitWith {};
if(_organizacion == grpPlayer) exitWith{}; //las compras de los mismos miembros no sirven para la extorsion.
if(!([str(_valor)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};

_gFund = _organizacion getVariable ["gang_bank",0];
_gId = _organizacion getVariable "gang_id";
_gFund = _gFund + _valor;
_gfund = ceil _gfund;
if (_gFund > 10000) then {_gFund = 10000};
_organizacion setVariable ["gang_bank",_gFund,true];
if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};
[[_gId,"-1",_gFund,[],-1],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
