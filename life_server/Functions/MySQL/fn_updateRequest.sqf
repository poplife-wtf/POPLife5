/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/
private ["_uid","_side","_cash","_bank","_licenses","_gear","_stats","_name","_alive","_position","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_stats = [_this,7,[100,100],[[]]] call BIS_fnc_param;
_alive = [_this,9,false,[true]] call BIS_fnc_param;
_position = [_this,10,[],[[]]] call BIS_fnc_param;
_exp = [_this,11,[],[[]]] call BIS_fnc_param;
_expx = [];
//Get to those error checks.
if ((_uid isEqualTo "") || (_name isEqualTo "")) exitWith {};
if (typename _exp != "ARRAY" OR count _exp < 14 OR _exp select 0 isEqualto 0) exitWith {};
//diag_log format ["antes de mresARray %1 , %2 , %3, %4, %5       -------: ",_exp, _this select 9,_side,count _exp,typename _exp];

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_stats = [_stats] call DB_fnc_mresArray;
_exp = [_exp] call DB_fnc_mresArray;
//diag_log format ["despues de mresarray %1 , %2 , %3, %4, %5       -------: ",_exp, _this select 9,_side,count _exp,typename _exp];
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
_position = if (_side isEqualTo civilian) then {[_position] call DB_fnc_mresArray} else {[]};

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
    _bool = [(_licenses select _i) select 1] call DB_fnc_bool;
    _licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

//PLAYTIME
_playtime = [_uid] call TON_fnc_getPlayTime;
_playtime_update = [];
{
    if ((_x select 0) isEqualTo _uid) exitWith
    {
        _playtime_update pushBack [_x select 1];
    };
} forEach TON_fnc_playtime_values_request;
_playtime_update = (_playtime_update select 0) select 0;
switch (_side) do {
    case west: {_playtime_update set[0,_playtime];};
    case civilian: {_playtime_update set[2,_playtime];};
    case independent: {_playtime_update set[1,_playtime];};
};
_playtime_update = [_playtime_update] call DB_fnc_mresArray;

if !(_side isEqualTo civilian) then {
//diag_log format ["antes de mresARray %1 , %2 , %3, %4, %5       -------: ",_expx, _this select 9,_side,count _expx,typename _expx];
//if (count _expx < 1) exitWith {};
_expx =  _this select 9;
if (typename _expx != "ARRAY" OR count _expx < 14 OR _expx select 0 isEqualto 0) exitWith {};

_expx = [_expx] call DB_fnc_mresArray;
//diag_log format ["%1 , %2 , %3,        ------- this: ",_expx, _this select 9,_side];
};

switch (_side) do {
    case west: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', cop_stats='%6', playtime='%7', experiencia='%9' WHERE pid='%8'",_name,_cash,_bank,_gear,_licenses,_stats,_playtime_update,_uid,_expx];};
    case civilian: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%5', arrested='%6', civ_stats='%7', civ_alive='%8', civ_position='%9', playtime='%10', experiencia='%12' WHERE pid='%11'",_name,_cash,_bank,_licenses,_gear,[_this select 8] call DB_fnc_bool,_stats,[_alive] call DB_fnc_bool,_position,_playtime_update,_uid,_exp];};
    case independent: {_query = format ["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%5', med_stats='%6', playtime='%7', experiencia='%9' WHERE pid='%8'",_name,_cash,_bank,_licenses,_gear,_stats,_playtime_update,_uid,_expx];};
};

//diag_log format [" 22222222 === %1 , %2 , %3, query ::::  %4          ------- ",_expx, _this select 9,_side, _query];
_queryResult = [_query,1] call DB_fnc_asyncCall;
