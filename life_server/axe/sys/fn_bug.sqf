
/* 
AxE's  bug hammer !
[str log, objeto, str adicional] call ica_fnc_bug;
*/

params [["_ratilla",objNull],["_adicional",""]];

if !(isNil "bugEnviado") exitWith {hint "debes esperar entre envios de bug"};

bugEnviado = true;
0 spawn {
sleep 30;
bugEnviado = nil;
};

disableSerialization;
_ui = uiNamespace getVariable "pcpopbughw";
_log = (_ui displayCtrl 3005);

if (isNil "_log") exitWith {hint "No has escrito nada"};

if (isNull _ratilla) then { _ratilla = player }; 

_sentencia = format ["Bug: %1 Player: %2 ",_log,name _ratilla];

if (isNil "_adicional") then {_sentencia = format ["Bug: %1 Player: %2 ",_log,name _ratilla]} else {_sentencia = format ["Bug: %1 Player: %2 Info Adicional: %3",_log,name _ratilla,_adicional]};

[[_sentencia],{
_logpasado = _this select 0;
diag_log "----------------------------- AxE Bugging System ------------------------------------";
diag_log "----->BUG";
diag_log _logpasado;
diag_log "<-----END";
diag_log "-------------------------------------------------------------------------------------";
}] remoteExec ["BIS_fnc_spawn",2];