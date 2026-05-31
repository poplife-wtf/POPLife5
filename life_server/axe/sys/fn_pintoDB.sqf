
/*
ica_fnc_pintoDB

*/

params [
    ["_vid", -1],
    ["_color", "nada"]
];
_color = str(_color);

_query = format ["UPDATE vehicles SET colorido='%1' WHERE id='%2'",_color,_vid];
//diag_log format ["------------> Db pinto %1, query %2",_color,_query];

sleep 1;
[_query,1] call DB_fnc_asyncCall;
