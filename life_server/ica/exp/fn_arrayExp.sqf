
/*
por: Icaruk

	experiencia = [1234,12,1000,0,0,0,0,0,0,0,0,0,0,0]

	["exp", 10] call ica_fnc_arrayExp;
	["reset"] call ica_fnc_arrayExp;
	["resetgratis"] call ica_fnc_arrayExp; // sólo SP y niveles
*/

_param = _this select 0;

if (_param isEqualTo "reset") exitWith {
	if (pop_din < 15000) exitWith {hint "Esto tiene un precio, 15.000€ en concreto."};
	pop_din = pop_din - 15000;
	["-150.000 €"] call ica_fnc_infolog;
	["Has olvidado todo lo que sabes..."] call ica_fnc_masuno;
	
	experiencia = [100, 1, (experiencia select 2), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 
	[22] call SOCK_fnc_updatePartial;
};

if (_param isEqualTo "resetgratis") exitWith {
	experiencia = [experiencia select 0, [] call ica_fnc_expTolevel, experiencia select 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 
	[22] call SOCK_fnc_updatePartial;	
	["Todos tus SP han sido devueltos."] call ica_fnc_masuno;
};

if (_param isEqualTo "resetpuntos") exitWith {
	if (pop_din < 200000) exitWith {hint "Esto tiene un precio, 200.000€ en concreto."};
	pop_din = pop_din - 200000;
	["-200.000 €"] call ica_fnc_infolog;
	experiencia = [experiencia select 0, [] call ica_fnc_expTolevel, experiencia select 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; 
	[22] call SOCK_fnc_updatePartial;	
	["Todos tus SP han sido devueltos."] call ica_fnc_masuno;
};

_n = round (_this select 1);

private ["_idx"];
_idx = switch (_param) do {
	case "exp": {0};
	case "sp": {1};
	case "ene": {2};
	

	     case "tl": {3};
	     case "ti": {4};
		case "cra": {5};
		case "med":{6};
		
		case "sup": {7};
		case "com": {8};
		case "tal": {9};
		case "baj": {10};
		case "cri": {11};
		case "ter": {12};
	
	case "reset": {true};
	case "resetsp": {false};
};
//_n = abs _n;
_finalExp = (experiencia select _idx) + _n;

if (_finalExp < 0) then {_finalExp = 0};

_antNiv = [] call ica_fnc_expTolevel;
experiencia set [_idx, _finalExp];

if (_param == "exp") then {
	[format ["EXP +%1", _n]] call ica_fnc_infolog;
};

if (([] call ica_fnc_expTolevel) > _antNiv) then {
	_n = ([] call ica_fnc_expTolevel) - _antNiv;
	
	[format [", +%1 Nivel", _n]] call ica_fnc_infolog;
	[format ["¡Has alcanzado el nivel %1!", [] call ica_fnc_expTolevel]] call ica_fnc_masuno;
	["play", "bk_lvlUp", player] call ica_fnc_SFX;
	["sp", _n] call ica_fnc_arrayExp;
};

if (count experiencia < 1) then {
//[format[" ---> pongo exp en perfil exparr82 %1",experiencia], player] call ica_fnc_axeLog;
experiencia = profileNamespace getVariable ["a6614x6614307e",[]];
};

if ((_param != "exp") AND (_param != "sp") AND (_param != "ene")) then { // sólo si aprendo habilidad guardo
		[format[" ---> Param # _param = %1",_param], player] call ica_fnc_axeLog;
		//diag_log format["# Param # _param = %1", _param];
	[22] call SOCK_fnc_updatePartial;
};

