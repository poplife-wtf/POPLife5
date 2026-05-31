#include "..\..\script_macros.hpp"
/*
    File: fn_requestReceived.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called by the server saying that we have a response so let's
    sort through the information, validate it and if all valid
    set the client up.
*/
private _count = count _this;
life_session_tries = life_session_tries + 1;
if (life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if (life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

/*0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;*/

//Error handling and junk..
if (isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (_this isEqualType "") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (count _this isEqualTo 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if ((_this select 0) isEqualTo "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (!(getPlayerUID player isEqualTo (_this select 0))) exitWith {[] call SOCK_fnc_dataQuery;};


//Parse basic player information.
pop_din = parseNumber (_this select 2);
pop_atmdin = parseNumber (_this select 3);
CONST(life_adminlevel,(_this select 4));
CONST(Life_donator,(_this select 5));

//Loop through licenses
if (count (_this select 6) > 0) then {
    {missionNamespace setVariable [(_x select 0),(_x select 1)];} forEach (_this select 6);
};

//Parse side specific information.
switch (playerSide) do {
    case west: {
        CONST(life_coplevel,(_this select 7));
        CONST(life_medicLevel,0);
        life_blacklisted = _this select 9;
		
		if(count (_this select 12) > 1) then {
			experiencia = _this select 12;
		} else {
			experiencia = profileNamespace getVariable ["a6614x6614307e",[100,1,0,0,0,0,0,0,0,0,0,0,0,0]];
		};
		
        if (LIFE_SETTINGS(getNumber,"save_playerStats") isEqualTo 1) then {
            life_hunger = ((_this select 10) select 0);
            life_thirst = ((_this select 10) select 1);
            player setDamage ((_this select 10) select 2);
        };
    };

    case civilian: {
        life_is_arrested = _this select 7;
        CONST(life_coplevel, 0);
        CONST(life_medicLevel, 0);
		CONST(mafia,_this select 14);
		CONST(terrorista,_this select 15);
		CONST(segurata,_this select 16);
		
		if(count (_this select 13) > 1) then {
			experiencia = _this select 13;
		} else {
			experiencia = profileNamespace getVariable ["a6614x6614307e",[100,1,0,0,0,0,0,0,0,0,0,0,0,0]];
		};

		
        life_houses = _this select (_count - 3);
            life_hunger = ((_this select 9) select 0);
            life_thirst = ((_this select 9) select 1);
            player setDamage ((_this select 9) select 2);

        //Position
        //if (LIFE_SETTINGS(getNumber,"save_civilian_position") isEqualTo 1) then {
            life_is_alive = _this select 10;
            life_civ_position = _this select 11;
            if (life_is_alive) then {
                if !(count life_civ_position isEqualTo 3) then {diag_log format ["[requestReceived] Bad position received. Data: %1",life_civ_position];life_is_alive =false;};
                //if (life_civ_position distance (getMarkerPos "respawn_civilian") < 200) then {life_is_alive = false;};
            };
        //}; lulwat
		_clasesCasas = listaCasas + listaGarajes + listaGranjas + apartamentos;
        {
			_position = call compile format ["%1",_x select 0];
            _houses = nearestObjects [_position, _clasesCasas, 20];
            if (_houses isEqualto []) then {}else{
			_house = _houses select 0;
			life_vehicles pushBack _house;
			};
			
        } forEach life_houses;

		life_in_gang = false;
		life_gangid = -1;
		life_gangowner = -1;
		life_gangname = "";
		life_gangbank = 0;
		life_gangrank = 0;
		life_gangmembers = [];
		life_gangMaxMembers = 0;
		life_gangAlias = "";
		life_gangzona = 0;
		life_gangCasa = [];
		
        life_gangData = _this select (_count - 2);
        if !(count life_gangData isEqualTo 0) then {
			life_in_gang = true;
			life_gangid = life_gangData select 0;
			life_gangowner = life_gangData select 1;
			life_gangname = life_gangData select 2;
			life_gangMaxMembers = life_gangData select 3;
			life_gangbank = life_gangData select 4;
			life_gangmembers = life_gangData select 5;
			life_gangzona = life_gangData select 6;			
			life_gangCasa = life_gangData select 7;	
			{
	            _uid = _x select 0;
	            if (_uid isEqualTo (getPlayerUID player)) then {
	                life_gangrank = _x select 2;
					life_gangAlias = _x select 1;
	            };
	        }foreach life_gangmembers;
			0 spawn life_fnc_initGang
		};
		
        [] spawn life_fnc_initHouses;
    };

    case independent: {
        CONST(life_medicLevel,(_this select 7));
		if(count (_this select 11) > 0) then {
			experiencia = _this select 11;
		} else {
			experiencia = profileNamespace getVariable ["a6614x6614307e",[100,1,0,0,0,0,0,0,0,0,0,0,0,0]];
		};

        CONST(life_coplevel,0);
        if (LIFE_SETTINGS(getNumber,"save_playerStats") isEqualTo 1) then {
            life_hunger = ((_this select 9) select 0);
            life_thirst = ((_this select 9) select 1);
            player setDamage ((_this select 9) select 2);
        };
    };
};

life_gear = _this select 8;
[true] call life_fnc_loadGear;

if (count (_this select (_count - 1)) > 0) then {
    {life_vehicles pushBack _x;} forEach (_this select (_count - 1));
};

life_session_completed = true;
