#include "script_macros.hpp"
#include <macro.h>
/*
    File: initPlayerLocal.sqf
    Author:

    Description:
    Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
    [] call compile preprocessFileLineNumbers "\life_hc\initHC.sqf";
}; //This is a headless client.
[true] spawn ica_fnc_vistaBonita;
#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

BIS_fnc_endMission = compileFinal "";
endDeath = compileFinal "";

waitUntil{!isNil "FuRixX_fnc_InitCore"};
[] spawn FuRixX_fnc_InitCore;

//init_FuRixX = [] execVM "core\init.sqf";

votando = false;

//FuRixX - Mejor lo quito que es un rollazo
//waitUntil { scriptDone init_FuRixX };
//[] execVM "furix\Entrada\funciones\fn_mainMenuCtrl.sqf";