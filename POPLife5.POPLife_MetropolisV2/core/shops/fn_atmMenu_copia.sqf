
if (!isNil {DDoS}) exitWith 
{
	["hack"] call ica_fnc_cajeroMenus;
};
if ((isNil {pop_din}) OR (isNil {pop_atmdin})) exitWith {["errorica", FALSE, TRUE] call BIS_fnc_endMission;};

if(!life_use_atm) exitWith {
	hint localize "STR_Shop_ATMRobbed";
};

if (!isNil {profileNamespace getVariable "dineroBloqueado"}) exitWith {
	hint "Hace poco que has cometido un crimen, sería algo sospechoso utilizar tu cuenta bancaria tan pronto. También puedes blanquear el dinero.";
};

disableSerialization;
player setvariable ["esperandocajero", false];

if (!isnull (findDisplay 1997)) exitWith {}; 

createDialog "Life_atm_management";

[0] call ica_fnc_cajeroMenus;


