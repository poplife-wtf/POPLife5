/* 
AxE's  kick hammer !
[objeto] call ica_fnc_axeKick;
*/

_ratilla = _this select 0;

if (isNull _ratilla) exitWith {}; // WaTuFuk ?

["Kickeado"] call ica_fnc_axeLog;

[[_ratilla],{"mecagoentuputamad4equickdemie4da" serverCommand format ["#kick %1",name (_this select 0)];}] remoteExec ["BIS_fnc_spawn",2];

