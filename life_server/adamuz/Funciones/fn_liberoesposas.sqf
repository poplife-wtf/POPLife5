/*
	Adamuz Systems
	Forzar Esposas para liberarte si tienes gazuas
*/

_param = _this select 0;

if (_param isEqualTo "menu") exitwith
{
	private["_CtrlDLG","_ButText","_ButTopTip","_ButAction","_ButEnable","_ButIcon","_MakeButon"];

	_MakeButon = [];

	BK_DialogOpen = true;
	_CtrlDLG = 30101;
	_ok = createDialog "FullActionsAll";

	_ButText = "Intentar Ganzuar Esposas";
	_ButTopTip = "Intenta ganzuar tus esposas y liberarte pero cuidado, te pueden pillar!";
	_ButAction = "player setvariable ['liberoesposas', true, true]; ['ganzuo'] spawn ica_fnc_liberoesposas; ['menu', 0.96, 'esposas'] spawn ica_fnc_ganzua;";
	_ButIcon = "MenuIco_Liberar";
	if((["pop_ganzua"] call ica_fnc_tengo) > 0) then {
		_ButEnable = true;
	} else {
		_ButEnable = false;
	};
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	[_CtrlDLG, _MakeButon] call bk_fnc_ActionMenuCreate;
};

if (_param isEqualTo "ganzuo") exitWith {
	while {player getvariable ["liberoesposas", false] && dialog} do
	{
		_random = round random 100;
		if (_random >= 95) then {[[player, "handcuffs"], "life_fnc_say3D",true,false,false] call BIS_fnc_MP;};
		sleep 5;
	};
};
