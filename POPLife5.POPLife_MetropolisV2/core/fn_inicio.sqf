#include <macro.h>
#include "..\script_macros.hpp"

switch (playerSide) do {

    // Policias
    case west: {

		if ((FETCH_CONST(life_coplevel) isEqualTo 0) && (FETCH_CONST(life_adminlevel) isEqualTo 0)) then {
			["NotWhitelisted",false,true] call BIS_fnc_endMission;
			sleep 35;
		};

		player setVariable ["copLevel",1,true];
		player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];
		//_handle = [] spawn life_fnc_copLoadout;
        //waitUntil {scriptDone _handle};
		["init"] spawn ica_fnc_tiendaPoli;
	};

	// Civiles
	case civilian: {

		if (life_is_arrested) then {
			noSpawn = true;
            life_is_arrested = false;
            [player,true] spawn life_fnc_jail;
		};
	
			_pescazonas = ["Pesca_1"];
			{
				_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
				_zone setTriggerArea[50,50,0,false];
				_zone setTriggerActivation["CIV","PRESENT",true];
				_zone setTriggerStatements["(vehicle player != player) && ((vehicle player) in thislist)","vehPesca = (vehicle player); LIFE_Action_Fishing = vehPesca addAction [""Pescar"",{[""ini""] spawn ica_fnc_pesca}, []]", "vehPesca removeAction LIFE_Action_Fishing"];
			} foreach _pescazonas;
		player setVariable ["uso_casa",true,true];
	};

	// Médicos
	case independent: {

		if ((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
			["Notwhitelisted",false,true] call BIS_fnc_endMission;
			sleep 35;
		};
		//_handle = [] spawn life_fnc_MedicLoadout;
        //waitUntil {scriptDone _handle};
		player setVariable ["copLevel",1,true];
		
	};


};

private ["_value"];

_value = parseNumber(ctrlText 9922);
if (_value < 0) exitWith {};
if (_value > 999999) exitWith {};
waitUntil {!(isNull (findDisplay 46))};
if (isNil {noSpawn}) then {
	[] call life_fnc_spawnMenu;
	waitUntil {!isNull (findDisplay 38500)};
	waitUntil {isNull (findDisplay 38500)};
};
player addRating 9999999;