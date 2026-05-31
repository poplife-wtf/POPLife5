/*
    File: fn_gangDisbanded.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies members that the gang has been disbanded.
*/
private "_group";
_group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {}; //Fail horn please.
if (!isNull (findDisplay 2620)) then {closeDialog 2620};

hint localize "STR_GNOTF_DisbandWarn_2";
[player] joinSilent (createGroup civilian);

if (units _group isEqualTo []) then {
    deleteGroup _group;
};


life_gangmembers = [];
life_gangid = -1;
life_gangowner = "-1";
life_gangname = "";
life_gangbank = 0;
life_gangrank = 0;
life_in_gang = false;
life_ganggroup = ObjNull;
life_gangzona = 0;
closeDialog 0;