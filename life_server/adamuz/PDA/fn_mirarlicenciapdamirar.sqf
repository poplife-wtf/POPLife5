/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

private["_licenses","_detenido","_policia"];

_detenido = _this select 0;
_policia = _this select 1;

if (_detenido != player) exitWith {};

_licenses = [];
{
	if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ") then
	{
		_licenses pushBack ([_x select 0] call life_fnc_varToStr);
	};
} foreach life_licenses;

if(count _licenses == 0) then 
{
	_licenses pushBack "Sin Licencias";
};
[_licenses, _policia] remoteExec ["ica_fnc_mirarlicenciapdadevolver", _policia];
