#include "..\..\script_macros.hpp"								  
/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
life_use_atm = TRUE;

profileNamespace setVariable ["hearb",100];
profileNamespace setVariable ["fois", 100];
life_action_inUse = false;
life_use_atm = true;
life_hunger = 100;
life_thirst = 100;

if (call life_adminlevel > 1) then {
//[player, true] remoteExec ["ica_fnc_ocultame",0];
};
				  
life_carryWeight = 0;
pop_din = 0; //Make sure we don't get our cash back.
life_respawned = false;
										   

life_sidechat = true;

player playMove "amovpercmstpsnonwnondnon";

life_deadPosition = [];
life_killer = ObjNull;


if(!isNil{life_corpse}) then {
	life_corpse setVariable["Revive",nil,TRUE];
	life_corpse setVariable["name",nil,TRUE];
	life_corpse setVariable["Reviving",nil,TRUE];
	life_corpse setvariable ["culpables", (player getVariable "culpables"), true];
};

0 spawn ica_fnc_tirador;

//Cleanup of weapon containers near the body & hide it.
if(!isNil{life_corpse} and !isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

//Load gear for a 'new life'
switch (playerSide) do {
	case west: {

		_arrBando = HW getVariable "centralica_p";
		if (isNil "centralica_enGrupo") then {
		}else{
		(_arrBando select centralica_enGrupo select 2) deleteAt ((_arrBando select centralica_enGrupo select 2) find player);
		};
		HW setVariable ["centralica_p",_arrBando,true];
		
		_handle = [] spawn life_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
	
		_arrBando = HW getVariable "centralica_m";
		if (isNil "centralica_enGrupo") then {
		}else{
		(_arrBando select centralica_enGrupo select 2) deleteAt ((_arrBando select centralica_enGrupo select 2) find player);
		};
		HW setVariable ["centralica_m",_arrBando,true];
	
		_handle = [] spawn life_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
	
	if (getunitloadout player select 9 select 4 == "tf_microdagr") then 
	{
		player unassignItem "tf_microdagr";
		player removeItem "tf_microdagr";
		
		player additem "itemwatch";
		player assignitem "itemwatch";
	};

	_radio = getunitloadout player select 9 select 2;
	if (_radio  != "") then 
	{
		player unassignItem _radio;
		player removeItem _radio;
	};
};

/*
//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
*/


if (!isNil "life_copRecieve") then {

    if (life_HC_isActive) then {
        [getPlayerUID player,player,life_copRecieve,true] remoteExecCall ["HC_fnc_wantedBounty",HC_Life];
    } else {
        [getPlayerUID player,player,life_copRecieve,true] remoteExecCall ["life_fnc_wantedBounty",RSERV];
    };

    life_copRecieve = nil;
};


[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate;


// ica
if (!isNil {mocap_player}) then {
	if (isNil {mocaperos}) then {mocaperos = []; publicVariable "mocaperos"; };

	mocaperos pushback (name player);
	publicVariable "mocaperos";

	_str = "Estás usando un addon ilegal (@MOCAP o @AGM), tienes 20 segundos para abandonar el juego o recibirás tu 'premio'. ";
	hint _str;
	systemChat _str;
	titleText [_str, "PLAIN", 3];
	sleep 20;
	player setVelocity [0, 0, 3000];
};

