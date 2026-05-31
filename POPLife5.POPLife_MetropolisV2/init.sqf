/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;

if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
	call compile preprocessFileLineNumbers "dsl_gear_get_lists.sqf";
};
[] execVM "KRON_Strings.sqf";

StartProgress = true;
[] execVM "furix\initFuRixX.sqf";
