/*
    File: fn_initgranjas.sqf
    Author: Bryan "Tonic" Boardwine
	Mod By AxE para POPV ... aptos.
	
    Description:
    Initalizes house setup when player joins the server.
*/
private ["_queryResult","_query","_count"];
_count = (["SELECT COUNT(*) FROM granjas WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
    _query = format ["SELECT granjas.id, granjas.pid, granjas.pos, players.name FROM houses INNER JOIN players WHERE granjas.owned='1' AND granjas.pid = players.pid LIMIT %1,10",_x];
    _queryResult = [_query,2,true] call DB_fnc_asyncCall;
    if (count _queryResult isEqualTo 0) exitWith {};
    {
        _pos = call compile format ["%1",_x select 2];
        _granja = nearestObject [_pos, "House"];
		_granja setVariable ["house_owner",[_x select 1,_x select 3],true];
		_granja setVariable ["granja_id",_x select 0,true];
		
		
	} forEach _queryResult;
};
