/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the medic out with the default gear.
*/

private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "SAMUR_Pop";


player addBackpack "mochila_pequena";
//player forceaddUniform "EMTRM_uni";
//player addItem "FirstAidKit";
//player addItem "FirstAidKit";
//player addItem "FirstAidKit";
//player addItem "FirstAidKit";
//player addItem "FirstAidKit";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

if (getunitloadout player select 9 select 4 == "tf_microdagr") then 
{
	player unassignItem "tf_microdagr";
	player removeItem "tf_microdagr";

};

_radio = getunitloadout player select 9 select 2;
if (_radio  != "") then 
{
	player unassignItem _radio;
	player removeItem _radio;
};

[] call life_fnc_saveGear;