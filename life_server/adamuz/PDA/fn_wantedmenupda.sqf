#include <macro.h>
/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

private["_display","_list","_name","_crimes","_bounty","_units"];

if !(isnil "ocupado") exitwith {Hint "Solo puedes identificar a una persona a la vez"};
if (isnull (findDisplay 777)) exitWith {};

disableSerialization;
ocupado = true;
_display = findDisplay 777;
_list = _display displayCtrl 3022;
_listdelitos = _display displayCtrl 3023;
lbClear _list;
lbClear _listdelitos;
_units = [];

[3, "Conexion con Base de Datos policial en curso"] spawn ica_fnc_barrita; 
sleep 3;

if (isnull (findDisplay 777)) exitWith {};

if(__GETC__(life_coplevel) == 0 && side player != WEST) then
{
	ctrlShow[3025,false];
};
ocupado = nil;
//[[player],"ica_fnc_wantedfetchpda",false,false] call life_fnc_MP;
[player] remoteExec ["ica_fnc_wantedfetchpda",2];