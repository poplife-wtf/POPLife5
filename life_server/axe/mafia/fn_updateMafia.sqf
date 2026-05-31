
/*

By AxE
you know what am saying.

*/


_grupo = group player;

if (isNil "_grupo") exitWith {};
if (isNull _grupo) exitWith {};

life_in_gang = true;
life_gangid = _grupo getVariable ["gang_id",-1];
life_gangname = _grupo getVariable ["gang_name","Mafia"];
life_gangbank = _grupo getVariable ["gang_bank",0];
life_gangrank = player getVariable ["mafia_rango",0];
life_gangmembers = _grupo getVariable ["gang_members",[]];
life_gangMaxMembers = _grupo getVariable ["gang_maxMembers",15];
life_gangzona = _grupo getVariable ["gang_zona",0];
player setVariable ["mafia",life_gangname,true];
