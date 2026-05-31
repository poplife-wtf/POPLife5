#include <macro.h>
/* ---------- 

A tomar por culo el Tonic este de los cojones!!
	
	AxE Is On Top

	Totalmente hecho por AxE para Pop4.
	El que me lo robe le mando los abogados en moto.

Desc: actualizo info en clientes y server(db) sin petar ... info de organizaciones... chungo muy chungo ..

------------- */
private["_gang_id","_gang_owner","_gang_bank","_gang_members","_force"];
_gang_id = [_this,0,-1] call BIS_fnc_param;
_gang_owner = [_this,1,"-1"] call BIS_fnc_param;
_gang_bank = [_this,2,-1] call BIS_fnc_param;
_gang_members = [_this,3,[],[[]]] call BIS_fnc_param;
_force = [_this,5,false,[false]] call BIS_fnc_param;
_gang_zona = [_this,4,-1] call BIS_fnc_param;
if(_gang_id == -1) exitWith {};
if(!isServer)then {
    if(playerSide != civilian) exitWith {};
    if(life_gangid != _gang_id) exitWith {};
    if(_gang_owner != "-1") then {
        life_gangowner = _gang_owner;
    };
    if(_gang_bank != -1) then {
        life_gangbank = _gang_bank;
    };
	if(_gang_zona != -1) then {
        life_gangzona = _gang_zona;
    };
    if(EQUAL(_gang_members,[])) then { } else {
        life_gangmembers = _gang_members;
        {
            _uid = _x select 0;
            if (_uid isEqualTo (getPlayerUID player)) then {
                life_gangrank = _x select 2;
            };
        }foreach life_gangmembers;
    };
} else {

    if(_gang_owner != "-1") then {
        _query = format["gangOwnerUpdate:%1:%2",_gang_owner,_gang_id];
		diag_log "################# AxE DEBUG Gangs #######################";
		diag_log format["# updateGangInfo # _gang_owner = %1 _gang_id = %2",_gang_owner,_gang_id];		
    	waitUntil{!DB_Async_Active};
    	[_query,1] call DB_fnc_asyncCall;
    };
    if(_gang_bank != -1) then {
    if (!isNil {syncbanco}) then {} else {
    [] spawn {
        syncbanco = true;
        sleep 30;
        syncbanco = nil;
    };	
        _query = format["gangBankInfoUpdate:%1:%2",[_gang_bank] call DB_fnc_numberSafe,_gang_id];
		diag_log "################# AxE DEBUG Gangs #######################";
		diag_log format["# updateGangInfo # _gang_bank = %1 y %2",_gang_bank,[_gang_bank] call DB_fnc_numberSafe];			
    	waitUntil{!DB_Async_Active};
    	[_query,1] call DB_fnc_asyncCall;
		};
    };
    if(EQUAL(_gang_members,[])) then { } else {
        _query = format["gangMembersUpdate:%1:%2",[_gang_members] call DB_fnc_mresArray,_gang_id];
		diag_log "################# AxE DEBUG Gangs #######################";
		diag_log format["# updateGangInfo # _gang_Members _query = %1 and %2 y con mresArray = %3",_query,_gang_members,[_gang_members] call DB_fnc_mresArray];
    	waitUntil{!DB_Async_Active};
    	[_query,1] call DB_fnc_asyncCall;
    };
	if !(isNil {_gang_zona}) then {
		if(_gang_zona != -1) then {
        _query = format["gangZonaUpdate:%1:%2",[_gang_zona] call DB_fnc_numberSafe,_gang_id];
		diag_log "################# AxE DEBUG Gangs #######################";
		diag_log format["# updateGangInfo # _gang_zona = %1",_gang_zona];			
    	waitUntil{!DB_Async_Active};
    	[_query,1] call DB_fnc_asyncCall;
		};
	};
};