
/* 
AxE's  ban hammer !
[str log, objeto, str adicional] call ica_fnc_axeLog;


params [["_log",""],["_ratilla",objNull],["_adicional",""]];

if (isNil "_log") exitWith {}; // WaTuFuk ?

if (isNull _ratilla) then { _ratilla = player }; 

_sentencia = format ["Log: %1 Player: %2 ",_log,name _ratilla];

if (isNil "_adicional") then {_sentencia = format ["Log: %1 Player: %2 ",_log,name _ratilla]} else {_sentencia = format ["Log: %1 Player: %2 Info Adicional: %3",_log,name _ratilla,_adicional]};

[[_sentencia],{
_logpasado = _this select 0;
diag_log "----------------------------- AxE Logging System ------------------------------------";
diag_log "----->";
diag_log _logpasado;
diag_log "<-----";
diag_log "-------------------------------------------------------------------------------------";
}] remoteExec ["BIS_fnc_spawn",2];
*/ 

//Desactivado