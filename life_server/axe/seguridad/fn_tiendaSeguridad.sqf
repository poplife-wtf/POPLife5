
/*
by: AxE

	["menu"] call tienda_seguridad;
	

*/

_param = _this select 0;

_tiendaLVL0 = [
	["No estoy autorizado a suministrarte equipamiento de Seguridad", 0]
];

If !( player getVariable ["sp_enservicio",false]) exitWith { hint "No estoy autorizado a suministrarte equipamiento Privativo de empresas de Seguridad"; };

_tiendaComun = [
	["----- Equipamiento Básico -----", 0],
	["pop_porra_h",50],
	["Taser_26",50],
	["26_cartridge",5],
	["Binocular",50],
	["pop_linterna",50],
	["", 0],
	["", 0],
	["----- Señalización -----", 0],
	["pop_tetrapodo_i",10],
	["Pop_piruli", 100],
	//["NVGoggles",6000],	
	["", 0],
	["----- Gafas y esas cosas -----", 0],
	["G_Shades_Black",50],
	["G_Shades_Blue",50],
	["G_Sport_Blackred",50],
	["G_Sport_Checkered",50],
	["G_Sport_Blackyellow",50],
	["G_Sport_BlackWhite",50],
	["G_Aviator",50],
	["G_Squares",50],
	["G_Lowprofile",50],
	["G_Combat",50],
	["G_Diving",50],
	["", 0]
];

_tiendaLVL1 = [
	["-----> Recluta <-----", 0],
	["----- Pistolas -----", 0],
	["RH_uspm", 2000],
	["RH_16Rnd_40cal_usp", 100],
	["RH_matchsd", 1000],
	["", 0]
];
_tiendaLVL2 = [
	["-----> Agente <-----", 0],
	["----- Pistolas -----", 0],
	["RH_vp70", 2000],
	["RH_18Rnd_9x19_VP", 100],
	["RH_vp70stock", 1000],
	["", 0], 	
	["----- Escopetas -----", 0],
	["CUP_sgun_M1014", 2000],
	["CUP_8Rnd_B_Beneli_74Slug", 100],
	["optic_Aco_smg", 500],
	["", 0]
];
_tiendaLVL3 = [
	["-----> Mando <-----", 0],
	["----- Escopeta -----", 0],
	["R3F_M4S90", 5000],
	["R3F_7Rnd_M4S90", 100],
	["acc_flashlight", 1000],
	["optic_Aco_smg", 1000],
	["", 0]
];


_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaPoli";
	_ui = uiNameSpace getVariable "tiendaPoli";
	ctrlSetText [5005, "\pop_skins\data\tiendaSP.paa"];
	_lista = (_ui displayCtrl 5007);
	_nivel = call mafia;

	if (_nivel >= 1) then {
		_arrayTienda append _tiendaComun;
	};

	switch (_nivel) do {
		case 0: {
			_arrayTienda append _tiendaLVL0;
		};
		case 1: {
			_arrayTienda append _tiendaLVL1;
		};
		case 2: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
		};
		case 3: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
		};
};

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
	_ui = uiNameSpace getVariable "tiendaPoli";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call ica_fnc_tiendaSeguridad;
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
	_cosa = _this select 1;
	_precio = _this select 2;

	if (_precio > pop_din) exitWith {hint "No hay nada gratis."; };
	if !(isClass (configFile >> "CfgVehicles" >> _cosa)) then { // si no es veh, pregunta si te cabe en el inventario
		if !(player canAdd _cosa ) exitWith {hint "No tienes suficiente espacio"; fuera = true; };
	};
	if (!isNil {fuera}) exitWith {fuera = nil};

	pop_din = pop_din - _precio;
	if (isNil {pop_din}) then {pop_din = 0};

	if (isClass (configFile >> "CfgVehicles" >> _cosa)) then {
		private "_mrk"; // ¿qué marcador tengo más cerca?
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3"] call ica_fnc_masCercano;

		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil "_veh"};
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

		life_vehicles pushBack _veh;
		[[getPlayerUID player,playerSide, _veh, 1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;
		[[(getPlayerUID player),playerSide, _veh, 0],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
		[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently
		closeDialog 0;
		hint format ["Has comprado %1 por %2€", _cosa, _precio];
	} else {
		[_cosa] call ica_fnc_item;
	};
};

