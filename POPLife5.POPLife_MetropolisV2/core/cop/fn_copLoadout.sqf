/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//player forceAddUniform "GC2_Pop";
player forceAddUniform "Cadete_Pop";


player addBackpack "mochila_pequena";
player addWeapon "CSW_M26C";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";
player addMagazine "CSW_Taser_Probe_Mag";


/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

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

[] call life_fnc_saveGear;



