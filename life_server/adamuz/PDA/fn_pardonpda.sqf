/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

private["_display","_list","_uid"];
disableSerialization;

_display = uiNamespace getVariable 'dlgPDA'; 
_list = _display displayCtrl 3023;
_data = lbData[3022,(lbCurSel 3022)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};
_uid = _data select 1;

hint format["Has perdonado delitos a %1", _data select 0];
[] spawn ica_fnc_wantedmenupda;

[_uid] remoteExec ["life_fnc_wantedPardon",2];