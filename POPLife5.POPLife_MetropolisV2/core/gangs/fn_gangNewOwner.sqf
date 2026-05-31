#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	Modify by AxE.
	Description:
	Something about being a quitter.
*/
private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

_ctrl = (findDisplay 2620) displayCtrl 2621; 
_we = _ctrl lbData (lbCurSel _ctrl);
_arrayID = call compile _we;
_unitID = _arrayID select 0;
if(_unitID == getPlayerUID player) exitWith {hint localize "STR_GNOTF_TransferSelf"};

_action = [
	format[localize "STR_GNOTF_TransferMSG",_arrayID select 1],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {

	if(_unitID == "") exitWith {hint "Bad UID?"}; //Unlikely?
		if(EQUAL(_unitID,"")) exitWith {hint "Bad UID?"};
		life_gangowner = _unitID;
			grpPlayer setVariable["gang_owner",_unitID,true];
		{
			if (SEL(_x,0) == _unitID) then {
				_x set [2,5];
				life_gangmembers set [_foreachindex, _x];
			};
			if (SEL(_x,0) == steamid) then {
				_x set [2,4];
				life_gangmembers set [_foreachindex, _x];
			};
		} foreach life_gangmembers;
		if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};
		[[life_gangid,life_gangowner,-1,life_gangmembers,-1],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
	
    	hint format["Has nombrado a %1 el nuevo Capo de la Organización.",_unit select 1];
} else {
	hint "Las movidas con los rangos de la organización han sido canceladas.";
};
[] call life_fnc_gangMenu;