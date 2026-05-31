
/*

Sistema de Granjas para farmear a lo Way 

By AxE para POPV.


"Land_mr_wooden_house03"

*/


params [
		["_menu", ""],
		["_tipo", ""],
		["_granja", ObjNull]
	];

if (isNull _granja) then {

_granjas = nearestObjects [player,listaGranjas, 20];
	if (_granjas isEqualTo []) then {
	_granja = ObjNull;
	}else{
	_granja = _granjas select 0;
	};

};

if (isNull _granja) exitWith {

	[player,
	"No estas cerca a ninguna Granja, acercate mas a alguna.", 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;

};

granjaActual = _granja;
	
if (_menu isEqualTo "menu") exitWith {

	if (_tipo == "abrir") exitWith {
	closedialog 0; 
	uisleep 0.2;
	disableserialization;
	trabajo_granja = "nada"; 
	createdialog "granjapop";
	_granjaDialog = uiNamespace getVariable "granjapop"; 
	
	if (((_granja getVariable ["house_owner",[""]]) select 0) isEqualTo (getPlayerUID player)) then {
			
			_lvl = _granja getVariable ["granjalvl",0];
			_pago = ((_lvl / 100) * 2500) + 5500;
			_proxPago = _granja getVariable ["paga",9999999];
			_falta = ceil ((time - _proxPago) / 60);
			if (_falta < 1) then {_falta = 0};
			(_granjaDialog displayCtrl 2405) ctrlSetText format ["Ganancias %1",_pago];
			(_granjaDialog displayCtrl 2406) ctrlSetText format ["Nivel %1",player getVariable ["granjalvl",0]];
			(_granjaDialog displayCtrl 2407) ctrlSetText format ["%1 minutos para cobrar", _falta];

		}else {

			(_granjaDialog displayCtrl 2405) ctrlSetText "Solo Propietario";
			(_granjaDialog displayCtrl 2406) ctrlSetText "Solo Propietario";
			(_granjaDialog displayCtrl 2407) ctrlSetText "00:00";
		
		};	
	

	};
	
	disableserialization;
	_granjaDialog = uiNamespace getVariable "granjapop"; 
	if (_tipo == "animales") exitwith {trabajo_granja = "animales";(_granjaDialog displayCtrl 2408) ctrlSetText "Animales";};
	if (_tipo == "manzanas") exitwith {trabajo_granja = "manzanas";(_granjaDialog displayCtrl 2408) ctrlSetText "Frutas y Verduras";};
	if (_tipo == "malah") exitwith {trabajo_granja = "malah";(_granjaDialog displayCtrl 2408) ctrlSetText "Hierbas";};
	if (_tipo == "pollo1") exitwith {trabajo_granja = "pollo1";(_granjaDialog displayCtrl 2408) ctrlSetText "Gallinas y Pollos";};
	if (_tipo == "pollo") exitwith {trabajo_granja = "pollo1";(_granjaDialog displayCtrl 2408) ctrlSetText "Gallinas y Pollos";};	

	if (_tipo == "aplicar") exitwith {[trabajo_granja] spawn ica_fnc_minijuegos};

};


if (_menu isEqualTo "menudueno") exitWith {


	if (_tipo == "abrir") exitWith {
	closedialog 0;
	uisleep 0.5;
	disableserialization;
	trabajo_granja = "nada"; 
	createdialog "granjapop";
	_granjaDialog = uiNamespace getVariable "granjapop"; 
	_lvl = _granja getVariable ["granjalvl",0];
	_pago = ((_lvl / 100) * 2500) + 1500;
	_proxPago = _granja getVariable ["paga",9999999];
	_falta = ceil ((_proxPago - time) / 60);
	if (_falta < 1) then {_falta = 0};
	(_granjaDialog displayCtrl 2405) ctrlSetText format ["Ganancias %1",_pago];
	(_granjaDialog displayCtrl 2406) ctrlSetText format ["Nivel %1",player getVariable ["granjalvl",0]];
	(_granjaDialog displayCtrl 2407) ctrlSetText format ["%1 minutos para cobrar", _falta ];
	
	};
	_granjaDialog = uiNamespace getVariable "granjapop"; 
	if (_tipo == "animales") exitwith {trabajo_granja = "animales";(_granjaDialog displayCtrl 2408) ctrlSetText "Animales";};
	if (_tipo == "frutas") exitwith {trabajo_granja = "manzanas";(_granjaDialog displayCtrl 2408) ctrlSetText "Frutas y Verduras";};
	if (_tipo == "hierbas") exitwith {trabajo_granja = "malah";(_granjaDialog displayCtrl 2408) ctrlSetText "Hierbas";};
	if (_tipo == "pollos") exitwith {trabajo_granja = "pollo1";(_granjaDialog displayCtrl 2408) ctrlSetText "Gallinas y Pollos";};

	if (_tipo == "aplicar") exitwith {closedialog 0; [trabajo_granja] call ica_fnc_minijuegos};

};


if (_menu isEqualTo "cobrar") exitWith {

if !(((_granja getVariable ["house_owner",nil]) select 0) isEqualTo getPlayerUID player) exitWith {
	
	[player,
	"Pero tu no ere e patron de esta granja ... que quieres que te pagen loco", 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;	

};

//if (loop_paga_granja) exitWith {"Ya has cobrado una vez, debes esperar un tiempo antes de cobrar de nuevo";};
_paga = _granja getVariable ["paga",9999999];

if (_paga > time) exitWith {
	[player,
	"Patron pero si ya se ha llevao too el efetivo sennor pobfabo", 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;	
};

_lvl = _granja getVariable ["granjalvl",0];
if (_lvl > 100) then {
_lvl = 100;
};

_granja setVariable ["granjalvl",0,true];
_granja setVariable ["paga",(time + (15 * 60)),true];

_pago = ((_lvl / 100) * 5500) + 2000;
_exp = round (random [2,4,6]);

pop_din = pop_din + _pago;
["exp",_exp] call ica_fnc_arrayexp;

[format ["+ %1€",_pago]] call ica_fnc_infolog;
[format ["+ %1 exp",_exp]] call ica_fnc_infolog;

	[player,
	format ["Patron don %1, Aqui tiene las ganancias adquiridas por la granja ... un fiel reflejo de todo su esfuerzo y el de sus empleados",name player], 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;	
	
	sleep 0.5;

};




if (_menu isEqualTo "comprar") exitWith {

if (isNull _granja) exitWith {};
_tieneDueno = _granja getVariable ["house_owner",nil];
if !(isNil "_tieneDueno") exitWith {hint "esta granja ya tiene patron senor"};

if (!license_civ_home) exitWith {hint localize "STR_House_License"};
/*if (count life_houses >= (LIFE_SETTINGS(getNumber,"house_limit"))) exitWith {hint format [localize "STR_House_Max_House",LIFE_SETTINGS(getNumber,"house_limit")]};
*/

_action = ["Deseas comprar esta granja por 125000€ ?",
    "Compra de Granja","Comprar Granja","Cancelar"
] call BIS_fnc_guiMessage;

_uid = getPlayerUID player;

if (_action) then {

    if (pop_atmdin < 125000) exitWith {hint format [localize "STR_House_NotEnough"]};
    pop_atmdin = pop_atmdin - 125000;
    [1] call SOCK_fnc_updatePartial;
	
    if (life_HC_isActive) then {
        [_granja,_uid] remoteExec ["HC_fnc_addGranja",HC_Life];
    } else {
        [_granja,_uid] remoteExec ["ica_fnc_addGranja",2];
    };

	_miarray = [_uid,profileName];
	
    _granja setVariable ["house_owner",_miarray,true];
	player setVariable ["granjalvl",0,true];

    life_vehicles pushBack _granja;
    life_houses pushBack [str(getPosATL _granja),[]];
	
    _marker = createMarkerLocal [format ["granja_%1",round random(1343)],getPosATL _granja];
    _marker setMarkerTextLocal "Tu Granja";
    _marker setMarkerColorLocal "ColorYellow";
    _marker setMarkerTypeLocal "loc_Lighthouse";
	
	[player,
	format ["Felicitaciones %1, eres el feliz propietario de esta granja.",name player], 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;	
	
};




};

