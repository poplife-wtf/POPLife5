/* 
AxE's  ban hammer !
[objeto] call ica_fnc_axeBan;
*/

_ratilla = _this select 0;
if (isNull _ratilla) exitWith {}; // WaTuFuk ?

["Baneado"] call ica_fnc_axeLog;

[[_ratilla],{"acceso2017p0pl1f3" serverCommand format ["#exec ban %1",name (_this select 0)];}] remoteExec ["BIS_fnc_spawn",2];