/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

private["_ret","_list","_detenido","_jailedUnits"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_detenido = _this select 1;
if(isNull _ret) exitWith {};
_retObj = _ret;
_ret = owner _ret;
_jailedUnits = [];
{
	if ((_x distance (getMarkerPos "jail_marker")) < 120) then {
		_jailedUnits pushBack getPlayerUID _x;
	}
} count playableUnits;

_list = [];
{
	_uid = _x select 1;
	if([_uid] call life_fnc_isUIDActive) then
	{
		if(!(_uid in _jailedUnits)) then {
			_list pushBack _x;
		};
	};
} foreach life_wanted_list;
//[[_list, _detenido],"ica_fnc_wantedlistpdaindividual",_ret,false] call life_fnc_MP;
[_list,_detenido] remoteExec ["ica_fnc_wantedlistpdaindividual",_retObj];