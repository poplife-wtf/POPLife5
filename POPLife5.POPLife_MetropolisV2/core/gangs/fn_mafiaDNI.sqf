/*
	File: fn_showBadge.sqf
	Author: Akryllax
	Mod by AxE para Mafias.
*/
disableSerialization;
private["_dniAlias", "_dniGang"];

_dniAlias = [_this, 0, "", [""]] call BIS_fnc_param;
_dniGang = [_this, 1, "", [""]] call BIS_fnc_param;

If ( !isNil "_dniGang") Then {
	titleRsc ["CHAPAS_dialog", "PLAIN DOWN", 1, true];
	_d = uiNamespace getVariable ['CHAPAS_dialog', displayNull];
	(_d displayCtrl 656723) ctrlSetText (_dniAlias);
	(_d displayCtrl 656724) ctrlSetText (_dniGang);
};
