#include <macro.h>
/*
Tienda de la mafia
by: Icaruk

	["menu"] call ica_fnc_tiendaMafia;
	AxE: Modificado para controlar inventario.
	Rellenada por Von Maxwell

*/

_param = _this select 0;
_tiendaLVL0 = [
	["Si no eres de la familia, no eres bienvenido", 0]
];

_tiendaStock = [
	["Lo siento, no tengo más existencia de armas espera un poco.", 0]
];


_tiendaLVL1 = [
	["----> Tienda LVL 1 <----",0],	
	["-- Armas Blancas --", 0],
	["", 0],
	["KA_axe", 2000 * Desc],
	["KA_axe_blade",500 * Desc],
	["KA_machete", 2000 * Desc],
	["KA_machete_blade",500 * Desc],
	["KA_dagger", 2000 * Desc],
	["KA_dagger_blade",500 * Desc],
	["KA_knife", 2000 * Desc],
	["KA_knife_blade", 500 * Desc],
	["", 0]
];

_tiendaLVL2 = [
	["----> Tienda LVL 2 <----",0],	
	["-- Pistolas Semi-Automaticas --", 0],
	["--- Desert Eagle ---", 0],
	["RH_deagle", 35000 * Desc],
	["RH_deagleg", 35000 * Desc],
	["RH_deagles", 35000 * Desc],
	["RH_deaglem", 35000 * Desc],
	["RH_7Rnd_50_AE", 1200 * Desc],
	["- Accesorios Desert Eagle Moderna -", 0],
	["RH_demz", 1200 * Desc],
	["optic_Yorris", 4200 * Desc],
	["-- CZ 75 --", 0],
	["RH_cz75", 15000 * Desc],
	["RH_16Rnd_9x19_cz", 200 * Desc],
	//["RH_gemtech9", 10000 * Desc],
	["RH_A26", 200 * Desc],
	["-- USP --", 0],
	["RH_usp", 15000 * Desc],
	["RH_12Rnd_45cal_usp", 200 * Desc],
	["-- Accesorios USP --", 0],
	["RH_aacusp", 50 * Desc],
	//["RH_gemtech45", 50 * Desc],
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
	["RH_7Rnd_45cal_m1911", 50 * Desc],
	["-- Accesorios Kimber --", 0],
	["RH_gemtech45", 2000 * Desc],
	["RH_osprey", 2000 * Desc],
	["RH_x300", 2000 * Desc],
	["RH_m6x", 2000 * Desc],
	["RH_x2", 2000 * Desc],
	["-- USP Match --", 0],
	["RH_uspm", 15000 * Desc],
	["RH_16Rnd_40cal_usp", 200 * Desc],
	["--- Accesorios USPM ---", 0],
	//["RH_matchsd", 2000 * Desc],
	["--- M9 ---", 0],
	["RH_m9", 15000 * Desc],
	["RH_m9c", 15000 * Desc],
	["RH_15Rnd_9x19_M9", 200 * Desc],
	["--- Accesorios M9 ---", 0],
	["RH_m9qd", 2000 * Desc],
	["--- VZ61 ---", 0],
	["RH_vz61", 17000 * Desc],
	["RH_20Rnd_32cal_vz61", 500 * Desc],
	["--- Glock 17 ---", 0],
	["RH_g17", 15000 * Desc],
	["RH_17Rnd_9x19_g17", 300 * Desc],
	["--- Accesorios Glock 17 ---", 0],
//	["RH_gemtech9", 2000 * Desc],
	["RH_x300", 2000 * Desc],
	["RH_m6x", 2000 * Desc],
	["RH_x2", 2000 * Desc],
	["--- TT 33 ---", 0],
	["RH_tt33", 15000 * Desc],
	["RH_8Rnd_762_tt33", 500 * Desc],
	["--- MK2 ---", 0],
	["RH_mk2", 15000 * Desc],
	["RH_10Rnd_22LR_mk2", 500 * Desc],
	["--- P226 ---", 0],
	["RH_p226", 15000 * Desc],
	["RH_p226s", 15000 * Desc],
	["RH_15Rnd_9x19_SIG", 300 * Desc],
	["--- Accesorios P226 ---", 0],
//	["RH_suppr9", 2000 * Desc],
	["RH_x300", 2000 * Desc],
	["RH_m6x", 2000 * Desc],
	["RH_x2", 2000 * Desc],
	["--- Glock 19 ---", 0],
	["RH_g19", 15000 * Desc],
	["RH_g19t", 15000 * Desc],
	["RH_17Rnd_9x19_g17", 500 * Desc],
	["--- Accesorios Glock 19 ---", 0],
//	["RH_gemtech9", 2000 * Desc],
	["RH_x300", 2000 * Desc],
	["RH_m6x", 2000 * Desc],
	["RH_x2", 2000 * Desc],
	["--- VP 70 ---", 0],
	["RH_vp70", 15000 * Desc],
	["RH_18Rnd_9x19_VP", 500 * Desc],
	["--- Accesorios VP70 ---", 0],
	["RH_vp70stock", 2000 * Desc],
	["--- Mateba ---", 0],
	["RH_mateba", 15000 * Desc],
	["RH_6Rnd_44_Mag", 500 * Desc],
	["--- Python ---", 0],
	["RH_python", 15000 * Desc],
	["RH_mp412", 15000 * Desc],
	["RH_6Rnd_357_Mag", 500 * Desc],
	["--- BULL ---", 0],
	["RH_bull", 15000 * Desc],
	["RH_bullb", 15000 * Desc],
	["RH_6Rnd_454_Mag", 500 * Desc],
	["--- Taurus Tracker ---", 0],
	["RH_ttracker", 25000 * Desc],
	["RH_ttracker_g", 25000 * Desc],
	["RH_6Rnd_45ACP_Mag", 1200 * Desc],
	["--- FNP 45 ---", 0],
	["RH_fnp45", 15000 * Desc],
	["RH_fnp45t", 15000 * Desc],
	["RH_15Rnd_45cal_fnp", 500 * Desc],
	["--- Accesorios FNP 45 ---", 0],
	//["RH_gemtech45", 2000 * Desc],
	["RH_osprey", 2000 * Desc],
	["RH_docter", 2000 * Desc],
	["optic_MRD", 2000 * Desc],
	["RH_x2", 2000 * Desc],
	["RH_m6x", 2000 * Desc],
	["RH_x300", 2000 * Desc],
	["--- FN 57 ---", 0],
	["RH_fn57", 15000 * Desc],
	["RH_fn57_g", 15000 * Desc],
	["RH_fn57_t", 15000 * Desc],
	["RH_20Rnd_57x28_FN", 500 * Desc],
	["--- Accesorios FNP 45 ---", 0],
	["RH_sfn57", 2000 * Desc],
	["RH_x2", 2000 * Desc],
	["RH_m6x", 2000 * Desc],
	["RH_x300", 2000 * Desc],
	["", 0]
];

_tiendaLVL3 = [
	["----> Tienda LVL 3 <----",0],	
	["--- Glock 18 ---", 0],
	["RH_g18", 25000 * Desc],
	["RH_33Rnd_9x19_g18", 2200 * Desc],
	["RH_19Rnd_9x19_g18", 300 * Desc],
	["--- Accesorios Glock 18 ---", 0],
	["RH_gemtech9", 9000 * Desc],
	["RH_x300", 200 * Desc],
	["RH_m6x", 200 * Desc],
	["RH_x2", 200 * Desc],
	["--- Tec 9 ---", 0],
	["RH_tec9", 20000 * Desc],
	["RH_32Rnd_9x19_tec", 200 * Desc],
	["--- Accesorios Tec-9 ---", 0],
	["RH_tecsd", 9000 * Desc],
	["--- GSH - 18 ---", 0],
	["RH_gsh18", 20000 * Desc],
	["RH_18Rnd_9x19_gsh", 200 * Desc],
	["", 0]
	
];

_tiendaLVL4 = [
	["----> Tienda LVL 4 <----",0],	
	["-- Subfusiles LVL 1 --", 0],
	["-- Micro - Uzi --", 0],
	["RH_muzi", 60000],
	["RH_30Rnd_9x19_UZI", 200 * Desc],
	["-- Accesorios MicroUzi --", 0],
	//["RH_muzisd", 200],
	["-- Vector  --", 0],
	["SMG_01_F", 60000],
	["30Rnd_45ACP_Mag_SMG_01", 200 * Desc],
	["-- Accesorios Vector --", 0],
	["optic_Holosight_smg", 200],
	//["muzzle_snds_acp", 15000],
	["optic_Aco_smg", 200],
	["-- UMP 9 MM --", 0],
	["KA_UMP9", 60000],
	["KA_30Rnd_9x19_FMJ_Mag", 200 * Desc],
	["KA_30Rnd_9x19_JHP_Mag", 200 * Desc],
	["KA_30Rnd_9x19_Subsonic_Mag", 200 * Desc],
	["-- MP5s --", 0],
	["hlc_smg_mp5a2", 60000 * Desc],
	["hlc_smg_mp5a3", 60000 * Desc],
	["hlc_smg_mp5a4", 60000 * Desc],
	["hlc_smg_mp5k_PDW", 60000 * Desc],
	["hlc_smg_MP5N", 60000 * Desc],
	["hlc_30Rnd_9x19_SD_MP5", 600 * Desc],
	["hlc_30Rnd_9x19_GD_MP5", 600 * Desc],
	["hlc_30Rnd_9x19_B_MP5", 600 * Desc],
	["-- Accesorios MP5s --", 0],
	//["hlc_muzzle_Agendasix", 15000 * Desc],
	["hlc_acc_Surefiregrip", 200 * Desc],
	["acc_flashlight",200 * Desc],
	["",0]
];



_tiendaLVL5 = [
	["----> Tienda LVL 5 <----",0],	
	["-- Subfusiles LVL 2 --", 0],
	["-- MP5 10 MM --", 0],
	["hlc_smg_mp510", 60000 * Desc],
	["hlc_30Rnd_10mm_B_MP5", 600 * Desc],
	["hlc_30Rnd_10mm_JHP_MP5", 600 * Desc],
	["-- Accesorios MP5 10 MM --", 0],
	["hlc_muzzle_Agendasix10mm", 25000 * Desc],
//	["muzzle_snds_acp", 15000],
	["acc_flashlight", 200 * Desc],
	["-- UMP 40 MM --", 0],
	["KA_UMP40", 60000],
	["KA_30Rnd_40SW_FMJ_Mag", 600 * Desc],
	["KA_30Rnd_40SW_JHP_Mag", 600 * Desc],
	["-- Accesorios UMP --", 0],
	["KA_UMP45_Flashligh", 200],
//	["KA_UMP40_Silencer", 15000],
	["-- MP5 9 MM silenciada --", 0],
	["hlc_smg_mp5sd5", 70000 * Desc],
	["hlc_smg_mp5sd6", 70000 * Desc],
	["hlc_30Rnd_9x19_SD_MP5", 600],
	["hlc_30Rnd_9x19_GD_MP5", 600],
	["hlc_30Rnd_9x19_B_MP5", 600],
	["",0]
];



_tiendaLVL6 = [ // subfusiles nivel 2
	["----> Tienda LVL 6 <----",0],	
	["-- Subfusiles LVL 3 --", 0],
	["-- P90 Cañon largo --", 0],
	["SMG_03C_TR_black", 60000 * Desc],
	["SMG_03C_TR_camo", 60000 * Desc],
	["SMG_03C_TR_hex", 60000],
	["SMG_03C_TR_khaki", 60000],
	["-- P90 Cañon Corto --", 0],
	["SMG_03_TR_black", 60000 * Desc],
	["SMG_03_TR_camo", 60000 * Desc],
	["SMG_03_TR_hex", 60000],
	["SMG_03_TR_khaki", 60000],
	["50Rnd_570x28_SMG_03", 600],
	["-- MP7 --", 0],
	["KA_MP7_Pistol_Black_20Rnd", 60000 * Desc],
	["KA_MP7_Pistol_Green_20Rnd", 60000 * Desc],
	["KA_20Rnd_46x30_FMJ", 600],
	["KA_20Rnd_46x30_AP", 600],
	["KA_20Rnd_46x30_APT", 600],
	["KA_20Rnd_46x30_Subsonic", 600],
	["-- MP7 40 Balas --", 0],
	["KA_MP7_Pistol_Black_40Rnd", 60000 * Desc],
	["KA_MP7_Pistol_Green_40Rnd", 60000 * Desc],
	["KA_40Rnd_46x30_FMJ", 600],
	["KA_40Rnd_46x30_AP", 600],
	["KA_40Rnd_46x30_APT", 600],
	["KA_40Rnd_46x30_Subsonic", 600],
	["-- Accesorios Mp7 --", 0],
	//["KA_MP7_Silencer", 15000],
	["KA_MP7_Flashlight_single", 200],
	["KA_MP7_Flashlight", 200],
	["KA_MP7_Laser_IR", 200],
	["KA_MP7_Laser_IR_single", 200],
	["", 0]
];


_tiendaLVL7 = [
	["----> Tienda LVL 7 <----",0],	
	["-- fusiles --", 0],
	["-- AKS  --", 0],
	["hlc_rifle_ak74", 80000 * Desc],
	["hlc_rifle_ak74_dirty", 80000 * Desc],
	["hlc_rifle_aks74", 80000 * Desc],
	["hlc_rifle_aks74u", 80000 * Desc],
	["hlc_30Rnd_545x39_B_AK", 1000 * Desc],
	["hlc_30Rnd_545x39_EP_AK", 1000 * Desc],
	["-- Mirillas --", 0],
	["-- MIRAS DE PUNTO ROJO --", 0],
	["optic_Aco", 200],
	["optic_Aco", 200],
	["optic_Aco_grn", 200],
	["optic_Aco_smg", 200],
	["optic_Aco_smg_grn", 200],
	["optic_Holosight_smg", 200],
	["optic_Holosight_smg_blk_F", 200],
	["optic_Holosight", 200],
	["optic_Holosight_khk_F", 200],
	["optic_Holosight_blk_F", 200],
	["optic_MRD", 200],
	["optic_Yorris", 200],
	["hlc_optic_kobra", 200],
	["", 0],
	["-- MIRAS DE AUMENTO --", 0],
	["optic_AMS_snd",10000],
	["optic_AMS_khk",10000],
	["optic_AMS",10000],
	["optic_Arco",1000],
	["optic_Arco_ghex_F",1000],
	["optic_Arco_blk_F",1000],
	["optic_DMS",10000],
	["optic_DMS_ghex_F",10000],
	["optic_ERCO_snd_F",1000],
	["optic_ERCO_khk_F",1000],
	["optic_ERCO_blk_F",1000],
	["optic_KHS_hex",10000],
	["optic_KHS_blk",10000],
	["optic_KHS_tan",10000],
	["optic_KHS_old",10000],
	["optic_LRPS_ghex_F",10000],
	["optic_LRPS_tan_F",10000],
	["optic_SOS",10000],
	["optic_SOS_khk_F",10000],
	["Item_optic_LRPS",10000],
	["optic_MRCO",10000],
	["optic_Harm",10000],
	["optic_Harm_khk_F",1000],
	["HLC_Optic_PSO1",10000],
	["HLC_Optic_1p29",10000],
	["", 0]
];



_tiendaLVL8 = [ 
	["----> Tienda LVL 8 <----",0],	
	["----------- Fusiles de asalto -----------", 0],
	["-- AKS 5.45 MM --",0],
 	["hlc_rifle_aek971", 80000],
	["hlc_rifle_aku12", 80000],
	["hlc_rifle_ak74m", 80000],
	["-- AKS 7.62 MM --",0],
 	["hlc_rifle_ak47", 80000], 
	["hlc_rifle_akm", 80000],
	["hlc_rifle_ak12", 80000],
	["hlc_rifle_RK62", 80000],
	["hlc_rifle_slr107u", 80000],
	["hlc_rifle_honeybadger", 80000],
	["hlc_rifle_honeybase", 80000],
	["hlc_30Rnd_762x39_b_ak", 1000],
	["-- ARs 5.56 MM --",0],
 	["hlc_rifle_RU556", 80000], 
	["hlc_rifle_RU5562", 80000],
	["hlc_rifle_Colt727", 80000],
	["hlc_rifle_bcmjack", 80000],
	["hlc_rifle_SAMR", 80000],
	["hlc_rifle_cqbr", 80000],
	["hlc_rifle_m4", 80000],
	["hlc_30rnd_556x45_EPR", 1000],
	["hlc_30rnd_556x45_SOST", 1000],
	["hlc_30rnd_556x45_SPR", 1000],
	["", 0]
];


_tiendaLVL9 = [ // Rifles
	["----> Tienda LVL 9 <----",0],	
	["-- Silenciadores AKs --",0],	
 	["hlc_muzzle_545SUP_AK", 10000],
	["hlc_muzzle_762SUP_AK", 10000],
	["-- Silenciadores ARs --",0],
	["hlc_muzzle_556NATO_KAC", 10000],
	["hlc_muzzle_300blk_KAC", 10000]
];


_tiendaLVL10 = [ // fusiles de asalto
	["---- Fusiles de asalto ----", 0],
	["-- BushMaster / Dissipator --",0],
 	["hlc_rifle_Bushmaster300", 80000],
 	["hlc_rifle_vendimus", 80000],
	["29rnd_300BLK_STANAG", 1500],
	["29rnd_300BLK_STANAG_S", 1500],
	["----- Rifles Precision ------",0],
	["-- AWMs / AWPs --", 0],
 	["hlc_rifle_awcovert", 100000],
 	["hlc_rifle_awcovert_BL", 100000], 
 	["hlc_rifle_awcovert_FDE", 100000],
 	["hlc_rifle_awmagnum", 100000],
 	["hlc_rifle_awmagnum_BL", 100000], 
 	["hlc_rifle_awmagnum_FDE", 100000],
 	["hlc_rifle_awMagnum_FDE_ghillie", 125000],
 	["hlc_rifle_awMagnum_BL_ghillie", 125000],
 	["hlc_rifle_awMagnum_OD_ghillie", 125000],
	["hlc_5rnd_300WM_FMJ_AWM", 1500],
	["hlc_5rnd_300WM_AP_AWM", 1500],
	["hlc_5rnd_300WM_BTSP_AWM", 1500],
	["hlc_5rnd_300WM_mk248_AWM", 1500],
	["hlc_5rnd_300WM_SBT_AWM", 1500],
	["----- M320 ------", 0],
 	["srifle_LRR_LRPS_F", 150000],
	["7Rnd_408_Mag", 2000],
	["", 0]
];

//[[],[],["CSW_FN57","CSW_FN57_silencer1","CSW_FN57_flashlight_glare_1","optic_ACO_grn",["CSW_20Rnd_57x28_SS190",20],[],""],["POP_CHAW3_D",[]],["TAC_PBDFG2_B_1",[["CSW_20Rnd_57x28_SS190",2,20]]],["mochila_grande",[["pop_kiwi",1,1]]],"","",[],["ItemMap","","","ItemCompass","tf_microdagr",""]]

_arrayTienda = [];
_arrayTiendaCompra = [];
if (_param  isEqualTo  "menu") exitWith {
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_nivel = "cri" call ica_fnc_expToLevel;
//	_bd = call mafia;
	_stockdis = zona_1 getVariable "stock";
	
	if (_nivel  isEqualTo  0) then { _arrayTienda append _tiendaLVL0 };
	if (_stockdis  isEqualTo  0) then { _arrayTienda append _tiendaStock };	
	if (_nivel >= 1) then { _arrayTienda append _tiendaLVL1 };
	if (_nivel >= 2) then { _arrayTienda append _tiendaLVL2 };
	if (_nivel >= 3) then { _arrayTienda append _tiendaLVL3 };
	if (_nivel >= 6 and _stockdis > 0) then { _arrayTienda append _tiendaLVL4 };
	if (_nivel >= 7 and _stockdis > 0) then { _arrayTienda append _tiendaLVL5; _arrayTienda append _tiendaLVL6; _arrayTienda append _tiendaLVL7; _arrayTienda append _tiendaLVL8; _arrayTienda append _tiendaLVL9; _arrayTienda append _tiendaLVL10 };

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
		if ((_arrayTienda select _idx select 1)  isEqualTo  0) then { // si es separador le cambio de color
			_lista lbSetColor [_idx, [0, 0.6, 0, 1]];
		};

		_idx = _idx + 1;
	};


	// _lista lbSetCurSel 0;
};

if (_param  isEqualTo  "actualiza") exitWith {
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call ica_fnc_tiendaMafia;
	';
};

//////////////
if (_param  isEqualTo  "compro") then {
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


if (_param  isEqualTo  "compro") exitWith {
	_esArma = 0;
	_cosa = _this select 1;
	_precio = _this select 2;
	_stock = zona_1 getVariable "stock";
	_nuevoStock = 0;	
	if (_precio > pop_din) exitWith {hint "No tienes suficiente dinero."; };
	_arrayTiendaCompra append _tiendaLVL4;
	_arrayTiendaCompra append _tiendaLVL5;
	_arrayTiendaCompra append _tiendaLVL6;
	_arrayTiendaCompra append _tiendaLVL7;
	_arrayTiendaCompra append _tiendaLVL8;
	_arrayTiendaCompra append _tiendaLVL9;
	_arrayTiendaCompra append _tiendaLVL10;
	
	_index = 0;
	while {_index < (count _arrayTiendaCompra)} do {
		_nomx = (_arrayTiendaCompra select _index) select 0;
		_precx = (_arrayTiendaCompra select _index) select 1;
		if(_cosa  isEqualTo  _nomx && _precx > 0) then { _esArma = 1};
		_index = _index + 1;
	};
	
	// AxE: Si es un arma quito resto stock y aviso.
	if (_esArma > 0.5 ) then { // si es arma
	if (_stock < 1) exitWith {hint "No me quedan mercancías, te gustaría traerme ?"; };
	_nuevoStock = _stock - 1;
	zona_1 setVariable ["stock", _nuevoStock, true];
	};

	pop_din = pop_din - _precio;
			
	_organizacion = cursorTarget getVariable["controlado_por",grpNull];
	if(!isNull _organizacion) then 
	{ 
	[(round (_precio * 0.01)),_organizacion] call life_fnc_gangExtorsion;  
	};
	

	if (getNumber (configFile >> "CfgVehicles" >> _cosa >> "maxspeed") > 0) then {
		private "_mrk";
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3", "mrkmafia4", "mrkmafia5"] call ica_fnc_masCercano;

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
		_veh setVariable ["matricula", [] call ica_fnc_creaMatricula, true];

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
	_stockshow = zona_1 getVariable "stock";
	if (_esArma > 0.5) then {	// si es arma
		if ((zona_1 getVariable "stock") < 1) then {
		_dialog = findDisplay -1;
		_ctrl = _dialog displayCtrl 5006;
		_ctrl ctrlShow false;
		};
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Inventario de Armas</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has comprado: %2 por %3€ <br/>Existencia actual de Armamento: %4 </t>",_pic,_nom,_precio,_stockshow];
	} else {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Inventario de Mafia</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has comprado: %2 por %3€ <br/>Existencia actual: Suficiente</t>",_pic,_nom,_precio];
	};
	[format ["- %1€", _precio]] call ica_fnc_infolog;
};