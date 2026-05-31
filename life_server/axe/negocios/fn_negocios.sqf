
/*

Sistema de Negocios para ser todos unos empresarios

By AxE para POPV.

ya tengo la cabeza caliente ...

*/


params [
		["_menu", ""],
		["_negocio", ObjNull]
	];

if (_menu isEqualTo "init") exitWith {

[NPC_MERCANCIAS, [".:: Comprar Mercancia ::.", {["cmercancia"] call ica_fnc_negocios},nil,6,true,true,"","true"]] remoteExec ["addAction", 0,true];
[NPC_MERCANCIAS2, [".:: Comprar Mercancia ::.", {["cmercancia"] call ica_fnc_negocios},nil,6,true,true,"","true"]] remoteExec ["addAction", 0,true];

};


if (_menu isEqualTo "cmercancia") exitWith {

	if(isNull objectParent player) exitWith {
	[player,"Debes montarte en tu coche o camion para empezar.", 
	"Transportadora de Metropolis"] call ica_fnc_axeMsg;	
	};

	_maxCarga = getNumber (configFile >> "CfgVehicles" >> (typeof vehicle player) >> "maximumLoad");
	_cargaU = getNumber (configFile >> "CfgMagazines" >> "pop_mercancia_fragil" >> "mass");
	
	_agrego = _maxCarga / _cargaU;	
	
	_din = _agrego * (round (random [15,17,20]));

		
	_accion = [
		format ["Estas apunto de comprar %2 cajas de mercancia que es lo maximo que cabe en tu coche para tu negocio valdra %1€ y dotara a tu negocio de mercancia que mejorara sus ventas, aceptas ?",_din,_agrego],
		"Negocios de Metropolis ::. ",
		"Si",
		"No"
	] call BIS_fnc_guiMessage;
	waituntil {!isNil "_accion"};

	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Compra Cancelada...","PLAIN"];};
		
	
	
	_n = 8 + floor(random 2);
	[_n, "Cargando Mercancia..."] call ica_fnc_barrita;
	sleep _n;


	player setVariable ["cMercancia",true,true];
	
	vehicle player addItemCargoGlobal ["pop_mercancia_fragil", _agrego];

	if (pop_din < _din) exitWith {titleText["No tienes suficiente dinero para comprar la mercancia.", "PLAIN"]};
	pop_din = pop_din - _din;
	
	[format ["- %1€",_din]] call ica_fnc_infolog;
	
	[player,
	format ["Hola %1, Aqui tienes unas buenas mercancias chinas, perfectas para tu negocio, estan ya en tu coche",name player], 
	"Negocios de Metropolis"
	] call ica_fnc_axeMsg;	



};


if (isNull _negocio) then {

_negocios = nearestObjects [player,tiendasArr, 20];
	if (_negocios isEqualTo []) then {
	_negocio = ObjNull;
	}else{
	_negocio = _negocios select 0;
	};

};

if (isNull _negocio) exitWith {

	[player,
	"No estas cerca a ningun Negocio, acercate mas a alguno.", 
	"Negocios de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;

};



if (_menu isEqualTo "tienda") exitWith {


	closedialog 0;
	uisleep 0.5;
	disableserialization;	
	createdialog "tienda";
	_negocioDialog = uiNamespace getVariable "tienda"; 
	_lvl = _negocio getVariable ["tiendalvl",0];
	_pago = ((_lvl / 100) * 2500) + 1500;
	_proxPago = _negocio getVariable ["paga",9999999];
	_falta = ceil ((time - _proxPago) / 60);
	if (_falta < 1) then {_falta = 0};
	(_negocioDialog displayCtrl 1206) ctrlSetText format ["Ganancias %1",_pago];
	(_negocioDialog displayCtrl 1207) ctrlSetText format ["%1 minutos para cobrar", _falta];
	

};


if (_menu isEqualTo "tienda_vacia") exitWith {


	closedialog 0; 
	uisleep 0.5;
	disableserialization;	
	createdialog "tienda_vacia";
	_negociovDialog = uiNamespace getVariable "tienda_vacia"; 
	_lvl = _negocio getVariable ["tiendalvl",0];
	_pago = ((_lvl / 100) * 2500) + 1500;

	(_negociovDialog displayCtrl 1204) ctrlSetText format ["Ganancias %1",_pago];
	

};




if (_menu isEqualTo "cobrar") exitWith {

closedialog 0;

_paga = _negocio getVariable ["paga",9999999];

if (_paga > time) exitWith {
	[player,
	"Patron pero si ya se ha llevao too el efetivo sennor pobfabo", 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;	
};
_negocio setVariable ["paga",(time + (15 * 60)),true];
_lvl = _negocio getVariable ["negociolvl",0];
if (_lvl > 100) then {
_lvl = 100;
};

_pago = ((_lvl / 100) * 2500) + 1800;
_exp = round (random [2,4,6]);

pop_din = pop_din + _pago;
["exp",_exp] call ica_fnc_arrayexp;

[format ["+ %1€",_pago]] call ica_fnc_infolog;
[format ["+ %1 exp",_exp]] call ica_fnc_infolog;

	[player,
	format ["Patron don %1, Aqui tiene las ganancias adquiridas por su negocio ... un fiel reflejo de todo su esfuerzo y el de sus empleados",name player], 
	"Negocios de Metropolis",
	"Intel_File2_F"
	] call ica_fnc_axeMsg;	
	sleep 0.5;
	



};


if (_menu isEqualTo "mercancia") exitWith {

	closedialog 0;
	if !(player getVariable ["cMercancia",false]) then {
	[player,
	format ["Patron don %1, Para mejorar nuestras ventas puede ir a la zona de descarga en el muelle de victoria peek y ahi traerno ma medcancia de la buena de la china esa ",name player], 
	"Negocios de Metropolis",
	"Intel_File2_F"
	] call ica_fnc_axeMsg;		
	};
	
	_coches = nearestObjects [player, ["Car"], 100];
	_coche = _coches select 0;
	
	if (isNull _coche) exitwith {
	[player,"Patron pero q coche trajo la merca ? no veo ninguno.", 
	"Transportadora de Metropolis"] call ica_fnc_axeMsg;	
	};
	
	if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno por favor"};
	
	_cargo = itemCargo _coche + weaponCargo _coche + magazineCargo _coche;
	if (isNil "_cargo") then {_cargo = [];};
	_tengo = {"pop_mercancia_fragil" == _x} count _cargo;
	
	if (_tengo < 1) exitWith {hint "no tienes mercancias chinas"};
	_n = 8 + floor(random 2);
	[_n, "Descargando Mercancia..."] call ica_fnc_barrita;
	sleep _n;
	
	clearMagazineCargoGlobal vehicle player;
	clearItemCargoGlobal vehicle player;
	
	player setVariable ["cMercancia",false,true];
	_lvl = _negocio getVariable ["negociolvl",0];
	if (_lvl > 100) then { 
		_lvl = 100;
	};
	_negocio setVariable ["negociolvl",_lvl + _tengo, true];
	
	[player,
	format ["Patron don %1, gracias por las mercancias para la tienda con el nuevo stock venderemos mucho mas",name player], 
	"Negocios de Metropolis",
	"Intel_File2_F"
	] call ica_fnc_axeMsg;	



};


if (_menu isEqualTo "comprar") exitWith {
closedialog 0;
_tieneDueno = _negocio getVariable ["owner",nil];
if !(isNil "_tieneDueno") exitWith {hint "este negocio ya tiene patron senor"};
if (isNull _negocio) exitWith {};

if (!license_civ_home) exitWith {hint localize "STR_House_License"};

_action = ["Deseas comprar este negocio por 125000€ ?",
    "Compra de Negocio","Comprar Negocio","Cancelar"
] call BIS_fnc_guiMessage;

_uid = getPlayerUID player;

if (_action) then {

    if (pop_atmdin < 125000) exitWith {hint format [localize "STR_House_NotEnough"]};
    pop_atmdin = pop_atmdin - 125000;
    [1] call SOCK_fnc_updatePartial;
	
    if (life_HC_isActive) then {
        [_negocio,_uid] remoteExec ["HC_fnc_addNegocio",HC_Life];
    } else {
        [_negocio,_uid] remoteExec ["ica_fnc_addNegocio",2];
    };

	_miarray = [_uid,profileName];
	
    _negocio setVariable ["owner",_miarray,true];
	_negocio setVariable ["negociolvl",0,true];

    life_vehicles pushBack _negocio;
    life_houses pushBack [str(getPosATL _negocio),[]];
	
    _marker = createMarkerLocal [format ["negocio_%1",round random(1343)],getPosATL _negocio];
    _marker setMarkerTextLocal "Tu Negocio";
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTypeLocal "loc_Lighthouse";
	
	[player,
	format ["Felicitaciones %1, eres el feliz propietario de este negocio.",name player], 
	"Inversiones Metropolis",
	"Intel_File2_F"
	] call ica_fnc_axeMsg;	
	
};




};

