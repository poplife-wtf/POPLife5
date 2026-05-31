	
	//BI AxEE

_param = _this select 0;
	
if (_param isEqualTo "cobrar") exitWith {
	_vendido = false;
	_tengo1 = ["Fapret_Oro"] call ica_fnc_tengo;
	if !(_tengo1 isEqualTo 0) then {
	["Fapret_Oro", _tengo1 *-1] call ica_fnc_item;
	_din = _tengo1 * (300 + (round random 50));
	pop_din = pop_din + _din;
	[format ["-%1 Oro", _tengo1]] call ica_fnc_infolog;
	[format ["+ %1€", _din]] call ica_fnc_infolog;
	_vendido = true;
	};
	_tengo2 = ["Fapret_Plata"] call ica_fnc_tengo;
	if !(_tengo2 isEqualTo 0) then {
	["Fapret_Plata", _tengo2 *-1] call ica_fnc_item;
	_din = _tengo2 * (200 + (round random 50));
	pop_din = pop_din + _din;
	[format ["-%1 Oro", _tengo2]] call ica_fnc_infolog;
	[format ["+ %1€", _din]] call ica_fnc_infolog;
	_vendido = true;	
	};
	_tengo3 = ["Fapret_Cobre"] call ica_fnc_tengo;
	if !(_tengo3 isEqualTo 0) then {	
	["Fapret_Cobre", _tengo3 *-1] call ica_fnc_item;
	_din = _tengo3 * (100 + (round random 50));
	pop_din = pop_din + _din;
	[format ["-%1 Oro", _tengo3]] call ica_fnc_infolog;
	[format ["+ %1€", _din]] call ica_fnc_infolog;	
	_vendido = true;	
	};
	[
	player,
	format ["Bien hecho %1m, Gracias por estas reliquias las subastare a muy buen precio",name player], 
	"Reliquias Antiguas",
	"Fapret_Oro"
	] call ica_fnc_axeMsg;
	if !(_vendido) exitWith {
	
	[
	player,
	"No tienes ... vamos ni la culpa ... Solo compro tesoros y reliquias", 
	"Reliquias Antiguas",
	"Fapret_Oro"
	] call ica_fnc_axeMsg;
		
	};
};