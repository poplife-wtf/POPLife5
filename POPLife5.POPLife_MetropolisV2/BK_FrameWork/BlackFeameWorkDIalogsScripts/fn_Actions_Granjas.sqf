
// ***********************************************************
// by AxE
// Q mola un mogollón
// ***********************************************************

private["_curTarget","_unit","_CtrlDLG","_ButText","_ButTopTip","_ButAction","_ButEnable","_ButIcon","_MakeButon","_Condition"];

_curTarget = param[0];

life_action_inUse = true;
if(isNil {_curTarget}) exitWith {};
if(isNull _curTarget) exitWith {};

_curTarget = cursorObject;
_granjaOwner = _curTarget getVariable ["house_owner",nil];

_MakeButon = [];

BK_DialogOpen = true;
_CtrlDLG = 30101;
_ok = createDialog "FullActionsAll";
life_pInact_curTarget = _curTarget;


if (isNil "_granjaOwner") then {

	_ButText = "Comprar Granja";
	_ButTopTip = "Adquieres esta granja para que cualquier trabajo aqui te genere dinero.";
	_ButAction = " [""comprar"","""",life_pInact_curTarget] spawn ica_fnc_granjas";
	_ButIcon = "MenuIcoCas_CasaLicencia";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	
	_ButText = "Solicitar Empleo";
	_ButTopTip = "Solicitas formalmente empleo en esta granja ... se te pagara bien y tu trabajo aumentara las ganancias al propietario.";
	_ButAction = " [""menu"",""abrir""] spawn ica_fnc_granjas";
	_ButIcon = "MenuIcoCas_CasaLicencia";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

} else {

	if ((_granjaOwner select 0) isEqualTo getPlayerUID player) then {
	
		
		_ButText = "Trabajar tu Granja";
		_ButTopTip = "Realiza trabajos necesarios en tu granja para mejorar su nivel y generar asi más ganancias.";
		_ButAction = " [""menudueno"",""abrir""] spawn ica_fnc_granjas";
		_ButIcon = "MenuIcoCas_CasaLicencia";
		_ButEnable = true;
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
		
	
	}else{

		_ButText = "Solicitar Empleo";
		_ButTopTip = "Solicitas formalmente empleo en esta granja ... se te pagara bien y tu trabajo aumentara las ganancias al propietario.";
		_ButAction = " [""menu"",""abrir""] spawn ica_fnc_granjas";
		_ButIcon = "MenuIcoCas_CasaLicencia";
		_ButEnable = true;
		_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	
	};



};

[_CtrlDLG, _MakeButon] call bk_fnc_ActionMenuCreate;