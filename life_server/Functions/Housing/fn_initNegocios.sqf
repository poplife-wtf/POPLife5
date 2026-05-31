/*
    File: fn_initgranjas.sqf
    Author: Bryan "Tonic" Boardwine
	Mod By AxE para POPV ... aptos.
	
    Description:
    Initalizes house setup when player joins the server.
*/
private ["_queryResult","_query","_count","_negocios","_tiendasArr"];
_arrTemp = [];
_tiendasArr = ["POP_npc_vendedor","POP_NPC_Terrorista","POP_NPC_tiendaderopa","POP_NPC_chino","POP_npc_dexter","POP_npc_man1","POP_npc_mujer","POP_npc_gordocabron","POP_NPC_tendero","POP_npc_camionero","POP_npc_granjero","POP_npc_vendedor","POP_npc_mafioso3"];
_arrObj = [];
{
	_arrObj = _arrObj + (allMissionObjects _x);
	sleep 0.2;

} forEach _tiendasArr;

{

[_x, [".:: Ver este Negocio ::.", {["tienda_vacia",_this select 0] call ica_fnc_negocios},nil,6,true,true,"","(_target getVariable [""owner"",[""""]]) select 0 != (getPlayerUID player)"]] remoteExec ["addAction", 0,true];
[_x, [".:: Administrar este Negocio ::.", {["tienda",_this select 0] call ica_fnc_negocios},nil,6,true,true,"","(_target getVariable [""owner"",[""""]]) select 0 isEqualTo (getPlayerUID player)"]] remoteExec ["addAction", 0,true];
[_x, [".:: Robar este Negocio ::.", {["robar",_this select 0] call ica_fnc_robarNegocio},nil,6,true,true,"","true"]] remoteExec ["addAction", 0,true];

} forEach _arrObj;

_count = (["SELECT COUNT(*) FROM negocios WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
    _query = format ["SELECT negocios.id, negocios.pid, negocios.pos, players.name, negocios.classname FROM negocios INNER JOIN players WHERE negocios.owned='1' AND negocios.pid = players.pid LIMIT %1,10",_x];
    _queryResult = [_query,2,true] call DB_fnc_asyncCall;
    if (count _queryResult isEqualTo 0) exitWith {};
    {
        _pos = call compile format ["%1",_x select 2];
        _negocios = nearestObject [_pos, format ["%1",_x select 4]];
		_negocios setVariable ["owner",[_x select 1,_x select 3],true];
		_negocios setVariable ["negocio_id",_x select 0,true];
		
		
	} forEach _queryResult;
};
