/*
	File: fn_civLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the civs out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};


_uni = selectRandom ["A3L_CivShirtVans","A3LCloudShirt","A3LPikaShirt","A3LTigerShirt","Tren_mcam","POP_Simpson","POP_Logo1","POP_Mano","POP_Mario","POP_Estoytoloko","POP_Lecuesta","POP_Paridas","POP_Google","POP_Fracasado","POP_Pena","POP_Sirena","POP_Torito","POP_Padre","POP_Chorizo","POP_Open","POP_Vivir","POP_Heinena","POP_Apilas","POP_Metro","POP_RM","POP_Valen","POP_OV"];
player forceAddUniform _uni;


{
	player addItem _x;
	player assignItem _x;
} forEach ["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"];

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

/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
