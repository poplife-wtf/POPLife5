/*
	File: fn_pop_cannabis_i.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	pop_cannabis_i is bad, mmkay?
*/


if ((["pop_cannabis_i"] call ica_fnc_tengo) < 1) exitWith {};
["pop_cannabis_i"] call ica_fnc_item;

player setVariable ["drogado",true,true];
life_drug_level = life_drug_level + 0.05;
if (life_drug_level > 1) then { life_drug_level = 1; };
systemChat "..::: Esta si que esta bueeenaa ! :::..";
titleText [format ["<t color='#5ad212' size='1.5'>..::: Esta si que esta bueeenaa :::..</t><br/><img image='%1' size='1.50'/>",["pop_cannabis_i"] call ica_fnc_classToPic], "PLAIN", -1, true, true];
if (random 100 < 25) then {
	[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal
};
[] call life_fnc_hudUpdate;
["pop_cannabis_i"] call ica_fnc_drugUsed;

if (!life_smoking) then
{
	life_smoking = true;
	[player] remoteExec ["ica_fnc_pegarHumo",0];
	sleep 300;
	life_smoking = false;
};