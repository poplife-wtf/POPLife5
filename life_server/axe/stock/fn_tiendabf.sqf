#include <macro.h>
/*
Tienda BF
by: Icaruk 
Rellenada por Juan :D

	["menu"] call ica_fnc_tiendaterrorista;
*/
if (playerSide == WEST) exitWith {hint "Sr agente ... yo solo vendo patatas ... nada mas y no tengo ... nada de nada ... nada" };

_param = _this select 0;


_tiendaStock = [
	["Lo siento, no tengo más existencia de armas espera un poco.", 0]
];


_tiendaLVL1= [
	["----- Chalecos y Mochilas ----", 0],
	["B_Parachute", 1000 * Desc], 
	["TAC_V_Sheriff_BA_TB3", 1000 * Desc], 
	["TAC_V_Sheriff_BA_TBL7", 1000 * Desc],
	["B_Parachute", 1000 * Desc],
    ["pop_chaleco_cmd_cmd_1", 500 * Desc], 
	["pop_chaleco_cmd_cmd_2", 500 * Desc], 
	["pop_chaleco_cmd_cmd_3", 500 * Desc], 
	["pop_chaleco_cmd_cmd_20", 500 * Desc], 
	["pop_chaleco_cmd_cmd_33", 500 * Desc], 
	["pop_chaleco_cmd_cmd_50", 500 * Desc], 
	["B_AssaultPack_blk", 500 * Desc],
	["B_AssaultPack_cbr", 500 * Desc],
	["TAC_PBDFG2C_B_1", 1500 * Desc],
	["mochila_pequena", 350 * Desc], 
	["", 0]
];


_tiendaLVL2 = [ 
	["-- Pistolas SemiAutomaticas --", 0],
	["hgun_Pistol_heavy_01_F", 14000 * Desc],
	["11Rnd_45ACP_Mag", 60],
	["hgun_ACPC2_F", 14000 * Desc],
	["9Rnd_45ACP_Mag", 60],
	["hgun_007_Colt1911", 14000 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["hgun_007_SW_M10", 14000 * Desc],
	["hgun_007_SW_M10_gold", 14000 * Desc],
	["hgun_007_SW_M10_special", 14000 * Desc],
	["hgun_Pistol_heavy_02_F", 14000 * Desc],
	["6Rnd_45ACP_Cylinder", 60],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_fnp45", 14000 * Desc],
	["RH_gemtech45", 600],
	["RH_M6X", 600],
	["RH_docter", 600],
	["RH_15Rnd_45cal_fnp", 60],
	["hgun_007_W_PPK", 14000],
	["8Rnd_765x17_Mag", 600], 
	["muzzle_snds_007_ppk", 1500],
	["", 0]

];


_tiendaLVL3 = [ 
	["RH_cz75", 15000 * Desc],
	["RH_16Rnd_9x19_cz", 200 * Desc],
	["RH_A26", 200 * Desc],
	["-- USP --", 0],
	["RH_usp", 15000 * Desc],
	["RH_12Rnd_45cal_usp", 200 * Desc],
	["-- Accesorios USP --", 0],
	["RH_aacusp", 50 * Desc],
	["RH_osprey", 50 * Desc],
	["RH_fhusp", 50 * Desc],
	["RH_x2", 50 * Desc],
	["RH_m6x", 50 * Desc],
	["RH_x300", 50 * Desc],
	["-- MAKAROV --", 0],
	["RH_mak", 15000 * Desc],
	["RH_8Rnd_9x18_Mak", 50 * Desc],
	["-- Accesorios MAKAROV --", 0],
	["RH_pmsd", 2000 * Desc],
	["RH_pmir", 2000 * Desc],
	["-- M1911 / Kimber --", 0],
	["RH_m1911", 15000 * Desc],
	["RH_kimber",15000 * Desc],
	["RH_kimber_nw",15000 * Desc],
	["RH_7Rnd_45cal_m1911", 50 * Desc]
];


_arrayTienda = [];
_arrayTiendaCompra = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaBf";
	_ui = uiNameSpace getVariable "tiendaBf";
	 //ctrlSetText [5005, "\pop_iconos\paa\bfondos.paa"];
	_lista = (_ui displayCtrl 5007);
	_nivel = "baj" call ica_fnc_expToLevel;
//_bd = call terrorista;
	_stockdist = tienda_bf getVariable "stock";
	
	if (_stockdist == 0)    then { _arrayTienda append _tiendaStock };		
	if (_nivel >= 5) then { _arrayTienda append _tiendaLVL1 };
	if ((_nivel >= 7) and (_stockdist >= 1)) then { _arrayTienda append _tiendaLVL2 };
	if ((_nivel >= 8) and (_stockdist >= 1)) then { _arrayTienda append _tiendaLVL3 };	

	private ["_nom", "_pre"];
	_idx = 0;
	while {_idx < (count _arrayTienda)} do {

		// Hallo su nombre visual
		_nom = [_arrayTienda select _idx select 0] call ica_fnc_classToName;
		_pic = [_arrayTienda select _idx select 0] call ica_fnc_classToPic;

		// Hallo su precio
		_precio = (_arrayTienda select _idx select 1); // pillo el precio
		if (_precio != 0) then { // si es 0, es un espaciador
			_pre = format ["(%1€)", ([_precio, 3] call ica_fnc_numToStr)];
		} else {_pre = ""; };

		// Creo cada elemento de la lista
		_lista lbAdd format ["%1 %2", _nom, _pre];
		_lista lbSetPicture [_idx, _pic];
		_lista lbSetData [_idx, (_arrayTienda select _idx select 0)];
		_lista lbSetValue [_idx, (_arrayTienda select _idx select 1)];
		if ((_arrayTienda select _idx select 1) == 0) then { // si es separador le cambio de color
			_lista lbSetColor [_idx, [0, 0.6, 0, 1]];
		};

		_idx = _idx + 1;
	};


	// _lista lbSetCurSel 0;
};

if (_param isEqualTo "actualiza") exitWith {
	_ui = uiNameSpace getVariable "tiendaBf";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call ica_fnc_tiendaBf;
	';
};

//////////////
if (_param isEqualTo "compro") then {
    if (isNil {autoclick}) then {
        autoclick = 0;
        [] spawn {sleep 1; autoclick = nil};
    };
    autoclick = autoclick + 1;
};
if !(isNil {autoclick}) then {
    _fuera = false;
    if (autoclick > 13) exitWith {
        player setDamage 1;
        _fuera = true;
    };
    if (_fuera) exitWith {};
};
////////////////

if (_param isEqualTo "compro") exitWith {
	_esArma = 0;
	_cosa = _this select 1;
	_precio = _this select 2;
	_stock = tienda_bf getVariable "stock";
	_nuevoStock = 0;	
	if (_precio > pop_din) exitWith {hint "No tienes suficiente dinero."; };

	_arrayTiendaCompra append _tiendaLVL2;
	_arrayTiendaCompra append _tiendaLVL3;

	_index = 0;
	while {_index < (count _arrayTiendaCompra)} do {
		_nomx = (_arrayTiendaCompra select _index) select 0;
		_precx = (_arrayTiendaCompra select _index) select 1;
		if(_cosa == _nomx && _precx > 0) then { _esArma = 1};
		_index = _index + 1;
	};
	
	// AxE: Si es un arma quito resto stock y aviso.
	if (_esArma > 0.5 ) then { // si es arma
	if (_stock <= 0) exitWith {hint "No me quedan mercancías, te gustaría traerme ?"; };
	_nuevoStock = _stock - 1;
	tienda_bf setVariable ["stock", _nuevoStock, true];
	};
	pop_din = pop_din - _precio;
			
	_organizacion = cursorTarget getVariable["controlado_por",grpNull];
	if(!isNull _organizacion) then 
	{ 
	[(round (_precio * 0.10)),_organizacion] call life_fnc_gangExtorsion;  
	};
	

	if (getNumber (configFile >> "CfgVehicles" >> _cosa >> "maxspeed") > 0) then {
		private "_mrk";
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3", "mrkmafia4"] call ica_fnc_masCercano;

		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil {_veh}};
		_veh allowDamage false;
		_veh lock 2;
		_veh setVectorUp (surfaceNormal (getMarkerPos _mrk));
		_veh setDir (markerDir _mrk);
		_veh setPos (getMarkerPos _mrk);
		[[_veh,1],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
		[_veh] call life_fnc_clearVehicleAmmo;
		[[_veh,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		[[_veh,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		_veh disableTIEquipment true;
		_veh allowDamage true;
		_veh setVariable ["matricula", call ica_fnc_creaMatricula, true];

		life_vehicles pushBack _veh;
		[[getPlayerUID player,playerSide, _veh, 1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;
		[[(getPlayerUID player),playerSide, _veh, 0],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
		[0] call SOCK_fnc_updatePartial;
		closeDialog 0;
	} else {
		[_cosa] call ica_fnc_item;
	};
	private ["_nom", "_pic", "_stockshow"];
	// Hallo su nombre visual
	_nom = [_cosa] call ica_fnc_classToName;
	_pic = [_cosa] call ica_fnc_classToPic;
	_stockshow = tienda_bf getVariable "stock";
	if (_esArma > 0.5) then { // si es arma
		if ((tienda_bf getVariable "stock") > 1) then {
		_dialog = findDisplay -1;
		_ctrl = _dialog displayCtrl 5006;
		_ctrl ctrlShow false;
		};
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Inventario de Armas</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has comprado: %2 por %3€ <br/>Existencia actual: %4 Armas</t>",_pic,_nom,_precio,_stockshow];
	} else {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Inventario de Bajos Fondos</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has comprado: %2 por %3€ <br/>Existencia actual: Suficiente</t>",_pic,_nom,_precio];
	};
	[format ["- %1€", _precio]] call ica_fnc_infolog;
};