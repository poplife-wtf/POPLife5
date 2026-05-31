
/*
by: Icaruk

	["menu"] call ica_fnc_tiendaPolicia;

*/

_param = _this select 0;

_tiendaLVL0 = [
	["No estoy autorizado a suministrarte equipamiento Policial", 0]
];

_tiendaLVL1 = [
	["---------------- TRANSITO ----------------",0],
	
	["----- Señales -----", 0], 
	["pop_tetrapodo_i",50], 
	["pop_tetrapodo_x3_i",50], 
	["pop_tetrapodo_x5_i",50], 
	["pop_tetrapodo_x7_i",50], 
	["pop_electroflare_i",50], 
	["pop_banda_i",50], 	
	["pop_senal_alcoholemiagc_i",50], 
	["pop_senal_control_policia_i",50], 
	["pop_senal_izquierda_i",50], 
	["pop_senal_derecha_i",50], 
	["pop_senal_stop_i",50], 
	["pop_senal_estrechamiento_i",50], 
	["pop_tetrapodo_i",50], 
	["pop_senal_velocidad20_i",50], 
	["pop_senal_velocidad40_i",50], 
	["pop_bandaclavos_i",50], 
	
	["---------------- ROPA ----------------",0],
	
	["----- Equipamiento Buzo-----", 0], 
	["V_RebreatherB",50], 
	["U_B_Wetsuit",50], 
	["G_B_Diving",50], 
	 
	["----- Mochilas-----", 0], 
	["mochila_mediana",100], 
	["TAC_BP_Butt_B2M",100], 
	["TRYK_B_Medbag_BK",100], 
	 
	["----- Uniformes-----", 0], 
	["GC",100], 
	["CNP",100], 
	["GC2",100], 
	["CNP2",100], 
	["ATGC",100], 
	["ATGC2",100], 
	["ATGC3",100], 
	["GC6",100], 
	["CNP6",100], 
	["CNP3",100], 
	["CNP5",100], 
	["GC5",100], 
	["GC3",100], 
	["GC4",100], 
	["CNP4",100],
	["U_B_HeliPilotCoveralls",100],
	["GEO",20],
	["U_bombsuit",1000],
	["U_B_Wetsuit",20], 
	  
	["----- Chalecos-----", 0], 
	 
	["pop_chaleco_gcivil_1",100], 
	["pop_chaleco_nacional_1",100], 
	["GC_CHALECO",100], 
	["CNP_CHALECO",100], 
	["pop_chaleco_tela_atgc",100], 
	["pop_chaleco_tela_cnp",100], 
	["pop_chaleco_tela_gc",100], 
	["pop_chaleco_pocient2",100], 
	["CNP_CHALECO2",100], 
	["pop_chaleco_gcreflectante",100], 
	["GEO_CHALECO",100], 
	["UEI_CHALECO",100], 
	["V_RebreatherB",100], 
	["cest_belt",100], 
	 
	["----- Gorras y Boinas-----", 0], 
	  
	 ["GORRA_GC",100], 
	 ["GORRA_CNP",100], 
	 ["POP_tricornio",100], 
	 ["BOINA_GC",100], 
	 ["BOINA_CNP",100], 
	 ["BOINA_GC3",100], 
	 ["BOINA_CNP3",100], 
	 ["CASCO_CNP",100], 
	 ["CASCO_GC",100], 
	 ["BOINA_GC4",100], 
	 ["BOINA_CNP4",100], 
	 ["BOINA_CNP2",100], 
	 ["BOINA_GC2",100], 
	 ["H_Beret_Colonel",100], 
	 ["H_Beret_02",100], 
	 ["H_PilotHelmetHeli_B",100], 
	 ["H_Bombsuit_Helmet",500], 
	 ["kio_skl_msk_can",100], 
	 ["Masque_forceAlpha",100], 
	 ["Kio_Spinning_Hat",100], 
	 ["TRYK_UA_CAP2R",100], 
	 ["rds_Woodlander_cap4",100], 
	 ["Afghan_05Hat",100], 
	 ["ALE_H_NewEra_Superman",100], 
	 ["pop_gorra_adidaswoman",100], 
	 ["pop_mascara",100], 
	 ["Masque_Lincoln",100], 
	 ["EF_FHcap_BK",100], 
	 ["TRYK_H_PASGT_BLK",100], 
	 ["TAC_K6O",100], 
	 ["TAC_SF10H",100], 
	 
	["----- Gafas y barbas-----", 0], 
	 
	["G_Balaclava_blk",20], 
	["G_B_Diving",20], 
	["G_Aviator",20], 
	["G_Sport_Blackyellow",20], 
	["G_Combat",20], 
	["G_Spectacles",20], 
	["EF_RG1",20], 
	["TRYK_Beard_BK",20], 
	["TRYK_Beard_BL",20], 
	["TRYK_Beard_BW",20], 
	["TRYK_SBeard_BW",20], 
	["SFG_Tac_moustacheD",20], 
	["G_Balaclava_combat",20], 
	["TRYK_kio_balaclavas",20], 
	["TRYK_kio_balaclava_BLK",20], 
	["TRYK_kio_balaclavas",20], 
	["TRYK_kio_balaclava_ESS",20], 
	["murshun_cigs_cig0",20], 
	["murshun_cigs_cig1",20], 
	["murshun_cigs_cig2",20], 
	["murshun_cigs_cig4",20], 
	["TRYK_SBeard_BK5",20], 
	["TRYK_SBeard_BK6",20], 
	["TAC_SF10",20], 
	 
	["----- Solo para UDEV-----", 0], 
	 
	 
	 ["kio_skl_msk_can",30], 
	 ["Masque_forceAlpha",30], 
	 ["Kio_Spinning_Hat",30], 
	 ["TRYK_UA_CAP2R",30], 
	 ["rds_Woodlander_cap4",30], 
	 ["Afghan_05Hat",30], 
	 ["pop_mexicano",30], 
	 ["pop_cowboy_brown",30], 
	 ["ALE_H_NewEra_Superman",30], 
	 ["pop_gorra_adidaswoman",30], 
	 ["pop_mascara",30], 
	 ["Masque_Lincoln",30], 
	 ["EF_FHcap_BK",30], 
	 ["TRYK_H_PASGT_BLK",30], 
	 ["U_B_Wetsuit",30], 
	 ["A3L_CivShirtDiamond",30], 
	 ["POP_CHAW_2",30], 
	 ["TRYK_SUITS_BLK_F",30], 
	 ["woman4",30], 
	 ["rds_uniform_Woodlander4",30], 
	 ["EF_FEM_4_2SG2",30], 
	 ["A3LCivPoloGreenBlack",30], 
	 ["EF_FEM_3_5BP",30], 
	 ["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",30], 
	 ["rds_uniform_Profiteer1",30], 
	 ["A3L_CivShirtVans",30], 
	 ["POP_CHAW_P",30], 
	 ["POP_CHAW_P1",30], 
	 ["rds_uniform_Villager3",30], 
	 ["TRYK_SUITS_BLK_F",30], 
	 ["TRYK_T_BLK_PAD",30], 
	 ["U_ALR_Priest",30], 
	 ["A3L_CivShirtRelationships",30],
	 
	["---------------- ARMAMENTO ----------------",0],
 
    ["----- Armas por Rango -----", 0], 
    ["pop_porra_h",50], 
    ["Binocular",50], 
    ["acc_flashlight",50], 
    ["RH_X300",50], 
    ["arifle_SDAR_F", 1250], 
    ["20Rnd_556x45_UW_mag", 100], 
 
    ["----- Linterna potente -----", 0], 
 
    ["KA_TL_122_flashlight", 100], 
 
    ["----- Armas Reglamentarias -----", 0], 
   
    ["CSW_M26C",50], 
    ["pop_piruli",50], 
    ["RH_cz75",200], 
    ["RH_m9",200], 
    ["RH_g19",200], 
    ["RH_fn57",200], 
    ["RH_usp",200], 
    ["RH_p226",200], 
    ["RH_fnp45",200], 
    ["RH_uspm",200], 
    ["CSW_FN57",200], 
    ["CSW_FN57_Ballistic_Shield",250], 
    ["RH_tt33",200], 
    ["RH_bull",200], 
    ["RH_mak",200], 
    ["RH_python",200],
 
   ["----- Cargadores de Pistolas -----", 0], 
     
    ["CSW_Taser_Probe_Mag",100], 
    ["RH_15Rnd_9x19_M9",100], 
    ["RH_16Rnd_9x19_CZ",100], 
    ["RH_17Rnd_9x19_g17", 100], 
    ["RH_20Rnd_57x28_FN",100], 
    ["RH_12Rnd_45cal_usp",100], 
    ["RH_15Rnd_9x19_SIG",100], 
    ["RH_15Rnd_45cal_fnp", 100], 
    ["RH_16Rnd_40cal_usp",100], 
    ["RH_6Rnd_454_Mag",100], 
    ["RH_8Rnd_762_tt33",100], 
    ["RH_6Rnd_454_Mag",100], 
    ["RH_8Rnd_9x18_Mak",100], 
    ["RH_6Rnd_357_Mag",100],    
 
    ["----- Rango 2 -----", 0], 
 
    ["RH_m1911",1000], 
    ["RH_7Rnd_45cal_m1911",100], 
 
    ["hlc_smg_mp5a3", 1250], 
    ["optic_Holosight_smg",50],  
    ["hlc_30Rnd_9x19_B_MP5",100], 
 
    ["----- Rango 3 -----", 0], 
 
    ["RH_sw659", 200], 
    ["RH_14Rnd_9x19_sw",100], 
  
    ["KA_MP7_Rifle_Black_40Rnd", 2500], 
    [ "optic_Hamr",1000], 
    [ "optic_Yorris",1000], 
    [ "KA_40Rnd_46x30_FMJ",1000], 
    ["KA_MP7_Flashlight_single",1000], 
   
 
    ["SMG_03_TR_khaki",5000], 
    ["optic_Holosight_smg_blk_F",1000], 
    ["50Rnd_570x28_SMG_03",20], 
    
   
    ["hlc_rifle_G36C", 10000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    [ "hlc_30rnd_556x45_EPR_G36",1000], 
 
   ["----- Rango 5 -----", 0], 
 
    ["KA_UMP45_P", 7500], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["KA_25Rnd_45ACP_High_Presure_Mag",30], 
    ["KA_UMP45_Silencer",50], 
    ["KA_UMP45_Flashlight_single",50],  
 
    ["hlc_smg_mp510", 7500], 
    ["hlc_30Rnd_10mm_JHP_MP5",30], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
 
     
    ["hlc_rifle_G36KV", 10000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["hlc_30rnd_556x45_EPR_G36",30], 
 
    ["hlc_rifle_G36KA1KSK", 10000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["hlc_30rnd_556x45_EPR_G36",30], 
 
 
 
   ["----- Armas para GEO/UEI/SOLO PARA GEO/UEI -----", 0], 
 
    ["SMG_01_F", 8000], 
    ["30Rnd_45ACP_Mag_SMG_01_Tracer_Red",30], 
    ["optic_Holosight",1000], 
    ["muzzle_snds_acp",1000], 
     
 

    ["hlc_smg_mp5sd5", 8000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["hlc_30Rnd_9x19_B_MP5",100], 
     
 
    ["hlc_rifle_g36KTac", 8000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["optic_DMS",1000], 
    ["hlc_30rnd_556x45_EPR_G36",30], 
    ["hlc_muzzle_556NATO_KAC",1000], 
  
    ["hlc_rifle_CQBR", 8000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["optic_DMS",1000], 
    ["hlc_30rnd_556x45_EPR",30], 
    ["bipod_02_F_blk",1000], 
    ["acc_flashlight",1000], 
    ["hlc_muzzle_556NATO_KAC",1000], 
 
 
    ["hlc_rifle_M4", 10000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["optic_DMS",1000], 
    ["hlc_30rnd_556x45_EPR",30], 
    ["bipod_03_F_blk",1000],  
    ["hlc_muzzle_556NATO_KAC",1000], 
    ["acc_flashlight",1000], 
 
    ["hlc_rifle_RU556",10000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["optic_DMS",1000], 
    ["hlc_30rnd_556x45_EPR",30], 
    ["hlc_muzzle_556NATO_KAC",1000], 
    ["optic_Yorris",1000], 
    ["optic_DMS",1000], 
    
   
    ["KA_SG_550", 10000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["optic_DMS",1000], 
    ["KA_SIG_Silencer",1000], 
    ["KA_SIG_30rnd_Mk318_SOST_mag",30], 
    ["bipod_03_F_blk",1000], 
 
    ["hlc_rifle_samr2", 10000], 
    ["optic_Hamr",1000], 
    ["optic_Yorris",1000], 
    ["optic_DMS",1000], 
    ["optic_LRPS",1000], 
    ["hlc_muzzle_556NATO_KAC",1000], 
    ["hlc_30rnd_556x45_EPR",30], 
    ["bipod_03_F_blk",1000], 
    ["acc_flashlight",1000], 
 
    ["srifle_LRR_F", 11000], 
    ["optic_LRPS",1000], 
    ["7Rnd_408_Mag",20], 
     
 
    ["hlc_rifle_awmagnum_BL", 11000],
    ["hlc_rifle_awcovert_BL", 11000],
    ["hlc_5rnd_300WM_FMJ_AWM", 20], 
    ["optic_LRPS", 1000], 
    ["bipod_03_F_blk",1000], 
   
    ["CSW_FN57_Ballistic_Shield", 1000], 
    ["CSW_FN57_Barska", 1000], 
    ["CSW_FN57_Shield",1000], 
    ["CSW_20Rnd_57x28_SS190",100], 
    ["CSW_FN57_silencer2", 50], 
    ["CSW_FN57_flashlight_normal_1",50], 
 
     
    ["HLC_Rifle_G36KSKAG36", 10000], 
    ["hlc_30rnd_556x45_SOST_G36", 30], 
    ["hlc_30rnd_556x45_EPR_G36", 30], 
    ["hlc_muzzle_556NATO_KAC",1000], 
    ["UGL_FlareCIR_F", 1000],  
    
    [" ---- Humos y bengalas----", 0], 
 
    ["SmokeShell", 20],
    ["UGL_FlareRed_F", 30], 
    ["UGL_FlareGreen_F", 30], 
    ["UGL_FlareWhite_F",30], 
    ["1Rnd_SmokeYellow_Grenade_shell",20], 
    ["1Rnd_SmokeGreen_Grenade_shell",20], 
    ["1Rnd_SmokeRed_Grenade_shell",20], 
      
    [" ---- Silenciador P90/MP7----", 0], 
 
    ["muzzle_snds_570",1000], 
    ["KA_MP7_Silencer",1000], 
  
     [" ---- Miras Geo----", 0], 
 
    ["optic_Holosight", 1000], 
    ["optic_Yorris", 1000], 
    ["optic_Hamr",1000], 
    ["optic_MRCO", 1000], 
    ["optic_Aco",1000], 
    ["optic_Arco", 1000], 
    ["optic_DMS",1000], 
    ["optic_SOSl", 1000], 
    ["optic_KHS_old",1000], 
    ["optic_LRPS", 1000], 
    ["optic_LRPS_tna_F", 1000], 
 
 
    ["----- Pistolon del comisario -----", 0], 
    
    ["RH_bull",250], 
    ["RH_6Rnd_454_Mag",100]
];

_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaPoli";
	_ui = uiNameSpace getVariable "tiendaPoli";
	//ctrlSetText [5005, "\pop_iconos\paa\tiendaPolicia.paa"];
	_lista = (_ui displayCtrl 5007);
	_nivel = call life_coplevel;

	if (side player != WEST) then {
	_arrayTienda append _tiendaLVL0;
	};

	if (side player == WEST) then {
		_arrayTienda append _tiendaLVL1;
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
		["compro", cosa, precio] call ica_fnc_tiendaPolicia;
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
		if (_cosa == "srifle_LRR_F") exitWith {espesada = true; }; //Fix para que puedan comprar el francotirador srifle_LRR_F
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
		[_veh,1] remoteExec ["life_fnc_colorVehicle",0];
		[_veh] call life_fnc_clearVehicleAmmo;
		[_veh,"trunk_in_use",false,true] remoteExec ["TON_fnc_setObjVar",2];
		[_veh,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExec ["TON_fnc_setObjVar",2];
		_veh disableTIEquipment true;
		_veh allowDamage true;

		life_vehicles pushBack _veh;
		[[getPlayerUID player,playerSide, _veh, 1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;
		[[(getPlayerUID player),playerSide, _veh, 0],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
		[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently
		closeDialog 0;
		hint format ["Has comprado %1 por %2€", _cosa, _precio];
	} else {
		if (!isNil {espesada}) then 
		{
			//Fix para que puedan comprar el francotirador srifle_LRR_F
			espesada = nil;
			player addweapon _cosa;
			hint format ["Has comprado %1 por %2€\n\nEl arma es muy pesada... Pero Adamuz Systems te ayuda y te la pone en la espalda ;)", _cosa, _precio];
		} else {
			[_cosa] call ica_fnc_item;
		};
	};
};

