/*
	File: fn_showBadge.sqf
	Author: Akryllax
	Desc: Local see badge.
*/
disableSerialization;
private["_player", "_badgeNumber"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_dniNumber = [_this, 1, "", [""]] call BIS_fnc_param;

If ( side _player == civilian OR side _player == west ) Then {
	titleRsc ["DNI_dialog", "PLAIN DOWN", 1, true];
	_d = uiNamespace getVariable ['DNI_dialog', displayNull];
	(_d displayCtrl 656721) ctrlSetText (_player getVariable["realname", "ERROR"]);
	(_d displayCtrl 656722) ctrlSetText (format["%1", _dniNumber]);
};
If ( side _player == independent ) Then {
	titleRsc ["EMSDNI_dialog", "PLAIN DOWN", 1, true];
	_d = uiNamespace getVariable ['EMSDNI_dialog', displayNull];
	(_d displayCtrl 656821) ctrlSetText (_player getVariable["realname", "ERROR"]);
	(_d displayCtrl 656822) ctrlSetText (format["%1", _dniNumber]);
};
