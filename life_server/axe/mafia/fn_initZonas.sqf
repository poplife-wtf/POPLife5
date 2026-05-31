#include <macro.h>
/*
	AxE Is On Top

	Totalmente hecho por AxE para Pop4.
	El que me lo robe le mando los abogados en moto.

*/

    _banderas = [];
    _palabra = "zona_";

    for "_x" from 1 to 12 do {
        _banderas pushBack (call compile format ["%1%2", _palabra, _x]);
    };
        {
		_zonastring = format ["%1",_x];
		_codigostring = _zonastring select [5,2]; //ojo no se puede poner más de 12 porque me bota 0 con parsenumber y 1 con call compile.
		_codigo = call compile _codigostring;
		_x setVariable["inCapture",false,true];
        _x setVariable["codigo",_codigo,true];
		_x setVariable["gang_id",-1,true];
		_x setVariable["atacable",false,true];
		[_x, [".:: Reclamar esta Zona ::. 20k", {[_this select 0] call ica_fnc_capturaZona},nil,1.5,true,true,"","_target getVariable ""codigo"" != life_gangzona"]] remoteExec ["addAction", 0,true];
		[_x, [".:: Abandonar esta Zona ::. ", {[_this select 0] call ica_fnc_abandonarZona},nil,1.5,true,true,"","_target getVariable ""codigo"" == life_gangzona"]] remoteExec ["addAction", 0,true];
		[_x, [".:: Atacar esta Zona ::. ", {[_this select 0] call ica_fnc_atacarZona},nil,1.5,true,true,"","_target getVariable ""codigo"" != life_gangzona"]] remoteExec ["addAction", 0,true];		
		[_x, [".:: Liberar esta Zona ::. ", {[_this select 0] call ica_fnc_liberarZona},nil,1.5,true,true,"","license_civ_alcalde && (npc_presidente getVariable [""decreto"",0]) == 4"]] remoteExec ["addAction", 0,true];
		[_x, [".:: Expropiar esta Zona ::. ", {[_this select 0] call ica_fnc_atacarZona},nil,1.5,true,true,"","detective"]] remoteExec ["addAction", 0,true];
		[_x, [".:: Investigar esta Zona ::. ", {[] call ica_fnc_investiga},nil,1.5,true,true,"","detective"]] remoteExec ["addAction", 0,true];
		
		} forEach _banderas;

sleep (3 + random 2);
 
_queryx = "SELECT id, zona FROM gangs WHERE zona>0";
_queryResultx = [_queryx,2] call DB_fnc_asyncCall;

if (_queryResultx isEqualTo []) exitwith {};

_filas = call compile format["%1",_queryResultx];

_filas = [_filas];

diag_log "------------- Inicio Control de Zonas -------------";
diag_log format["Zonas SQL: %1",_queryResultx];
diag_log format["Resultado: %1",_filas];
diag_log "----------------------AxEisOnTop-------------------";

{
_zona = call compile (format ["zona_%1",(_x select 1)]);
_zona setVariable["gang_id",(_x select 0),true];

} forEach _filas;
