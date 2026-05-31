/*
	File: fn_showBadge.sqf
	Author: Akryllax
	Mod by AxE para SP.
*/
disableSerialization;
private["_dniAlias", "_dniGang"];

_dniAlias = [_this, 0, "", [""]] call BIS_fnc_param;

If ( !isNil "_dniGang") Then {
	titleRsc ["SEGPRIVADA_dialog", "PLAIN DOWN", 1, true];
	_d = uiNamespace getVariable ['SEGPRIVADA_dialog', displayNull];
	(_d displayCtrl 656729) ctrlSetText (_dniAlias);
};
