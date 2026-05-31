/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine editado para pop.
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};
 //no al meta
//titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player playMoveNow "Incapacitated";
disableuserinput true;

//quick cegado
//variable cegado
player setVariable["cegado", true ,true];
 
//efecto camara al jugador
[[], "ica_fnc_cegado", player , false] call BIS_fnc_MP;

player setUnconscious true;
_time = 15;
while {_time > 0} do {

sleep 1;
_time = _time -1;

};
player setUnconscious false;
player switchMove "FXStandDip";

player setVariable["robbed",FALSE,TRUE];

//quick cegado
//variable cegado
player setVariable["cegado", false ,true];
 
//efecto camara al jugador
[[], "ica_fnc_cegado", player, false] call BIS_fnc_MP;
player setVariable ["tf_unable_to_use_radio", false];
disableuserinput false;