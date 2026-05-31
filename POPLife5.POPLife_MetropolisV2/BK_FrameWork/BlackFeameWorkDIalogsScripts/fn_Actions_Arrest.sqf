
// ***********************************************************
// by Blakord
// Arrest player script
// ***********************************************************

private["_unit","_CtrlDLG","_ButText","_ButTopTip","_ButAction","_ButEnable","_ButIcon","_MakeButon","_Condition"];

_unit = param[0];
_Condition = param[1];
if( !isPlayer _unit ) exitWith { };	
if(isNull _unit) exitWith {};
life_pInact_curTarget = _unit;
_MakeButon = [];

BK_DialogOpen = true;
_CtrlDLG = 30101;
_ok = createDialog "FullActionsAll";
If ( _Condition  isEqualTo  "cop" ) Then {

	if((_unit getVariable["Escorting",false])) then {
		_ButText = "Dejar de Mover";
		_ButTopTip = "Dejar de mover al detenido";
		_ButAction = " [life_pInact_curTarget] call life_fnc_stopEscorting ";
	} else {
		_ButText = "Mover detenido";
		_ButTopTip = "Mover al detenido a otra parte";
		_ButAction = " [life_pInact_curTarget] call life_fnc_escortAction ";
	};
	_ButIcon = "MenuIco_CopMover";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Quitar esposas";
	_ButTopTip = "Quitar esposas y liberar al detenido";
	_ButAction = " [life_pInact_curTarget] call life_fnc_unrestrain ";
	_ButIcon = "MenuIco_Liberar";
	if((["pop_llaves"] call ica_fnc_tengo) > 0) then {
		_ButEnable = true;
	} else {
		_ButEnable = false;
	};
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Subir en vehiculo";
	_ButTopTip = "Subir al detenido en un vehiculo cercano";
	_ButAction = " [life_pInact_curTarget] call life_fnc_putInCar ";
	_ButIcon = "MenuIco_CopSubirEnVeh";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Cachear detenido";
	_ButTopTip = "Cachear al detenido a ver que lleva";
	_ButAction = " [life_pInact_curTarget] spawn ica_fnc_cacheo ";
	_ButIcon = "MenuIco_CopCachear";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Quitar armas";
	_ButTopTip = "Quitar armas que lleve el detenido";
	_ButAction = " [life_pInact_curTarget] spawn life_fnc_removeWeaponAction ";
	_ButIcon = "MenuIco_CopConfiscarArmas";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Quitar dinero";
	_ButTopTip = "Quitar el dinero que lleve el detenido";
	_ButAction = " [player] remoteExec [""life_fnc_robPerson"",life_pInact_curTarget]";
	_ButIcon = "MenuIco_CopConfiscarDinero";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Multar";
	_ButTopTip = "Poner una multa al detenido";
	_ButAction = "[life_pInact_curTarget] spawn life_fnc_ticketAction ";
	_ButIcon = "MenuIco_CopMultar";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Licencias";
	_ButTopTip = "Comprobar licencias del detenido";
	_ButAction = " [player] remoteExec [""life_fnc_licenseCheck"",life_pInact_curTarget]";
	_ButIcon = "MenuIco_CopLicencias";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Buscar Documentos";
	_ButTopTip = "Busca algun documento al sujeto que tienes esposado";
	_ButAction = "hint 'Buscar Documentos'";
	_ButIcon = "";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	
	_ButText = "Quitar GPS";
	_ButTopTip = "Quita el GPS al sujeto que tienes esposado";
	_ButAction = "hint 'Quitar Gps'";
	_ButIcon = "";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	
	_ButText = "Enviar a la carcel";
	_ButTopTip = "Enviar detenido a la carcel para pagar por sus delitos";
	_ButAction = "[life_pInact_curTarget] spawn fnc_arrestmenu;";
	_ButIcon = "MenuIco_CopEnviarCarcel";
	if(!((player distance (getMarkerPos "cop_spawn_5") < 50))) then {
		_ButEnable = false;
	} else {
		_ButEnable = true;
	};
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

} else {
	if((_unit getVariable["Escorting",false])) then {
		_ButText = "Dejar de Mover";
		_ButTopTip = "Dejar de mover al rehen";
		_ButAction = " [life_pInact_curTarget] call life_fnc_stopEscorting ";
	} else {
		_ButText = "Mover detenido";
		_ButTopTip = "Mover al rehen a otra parte";
		_ButAction = " [life_pInact_curTarget] call life_fnc_escortAction ";
	};
	_ButIcon = "MenuIco_Mover";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Quitar esposas";
	_ButTopTip = "Quitar esposas y liberar al rehen";
	_ButAction = " [life_pInact_curTarget] call life_fnc_unrestrain ";
	_ButIcon = "MenuIco_Liberar";
	if((["pop_llaves"] call ica_fnc_tengo) > 0) then {
		_ButEnable = true;
	} else {
		_ButEnable = true;
	};
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;

	_ButText = "Subir en vehiculo";
	_ButTopTip = "Subir al rehen en un vehiculo cercano";
	_ButAction = " [life_pInact_curTarget] call life_fnc_putInCar ";
	_ButIcon = "MenuIco_SubirEnVeh";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
		
	_ButText = "Dar Paliza";
	_ButTopTip = "Da una paliza al sujeto que tienes esposado";
	_ButAction = "
		_victima = cursortarget;
		_animPegar = ['stree_boxing_4','stree_boxing_5'] call BIS_fnc_selectRandom;
		[[player,_animPegar],'life_fnc_animSync',nil,false] call life_fnc_MP;

		['recibo',_victima] remoteExec ['ica_fnc_atacar', _victima];
	";
	_ButIcon = "MenuIco_CopConfiscarArmas";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	
	_ButText = "Quitar GPS";
	_ButTopTip = "Quita el GPS al sujeto que tienes esposado";
	_ButAction = "cursortarget unassignitem 'itemgps'; cursortarget removeitem 'itemgps'";
	_ButIcon = "MenuIco_CopCachear";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	
	_ButText = "Registrar";
	_ButTopTip = "Registra al sujeto que tienes esposado";
	_ButAction = " [cursortarget] spawn ica_fnc_cacheo ";
	_ButIcon = "MenuIco_CopCachear";
	_ButEnable = true;
	_MakeButon = [_MakeButon,_ButText,_ButTopTip,_ButAction,_ButIcon,_ButEnable] call bk_fnc_ActionMenuAdd;
	
};
[_CtrlDLG, _MakeButon] call bk_fnc_ActionMenuCreate;



