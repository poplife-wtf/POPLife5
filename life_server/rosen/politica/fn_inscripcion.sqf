/*
	Creado por Rosen
*/

private["_nombre","_uid","_lista"];
if!(votacion) exitWith{hint "Las elecciones han terminado."};
closeDialog 9720;
hint "Procesando...";
_uid = getPlayerUID player;
_nombre = name player;
[] remoteExec ["ica_fnc_initCandidatos", 2]; 
sleep 2;
[player, ["lista_candidatos"]] spawn ica_fnc_varToServer;sleep 1;waitUntil {recibido};
if(_nombre in lista_candidatos) exitWith {closeDialog 9720;hint "Usted ya se ha inscrito para las elecciones o las elecciones han terminado."};
_query = format["INSERT INTO politica (id,nombre) values (%1,%2)", _uid, _nombre];
[_query,1,true] remoteExec ["DB_fnc_asyncCall", 2]; 
hint "Se ha inscrito correctamente en las elecciones.";