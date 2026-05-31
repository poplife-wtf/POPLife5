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
	["-------- Armas Blancas -------", 0],
	["", 0],
	["MeleeKatana", 2000 * Desc],
	["MeleeHammer2", 2000 * Desc],
	["MeleeCrowbar", 2000 * Desc],
	["MeleeClub", 2000 * Desc],
	["", 0],
	["--------- Vehículos ----------", 0],
 	["Mercedes_Pullman_negra", 55000 * Desc],
	["pop_lincoln_negro", 30000 * Desc],
	["POP_jeep_blinde_negro", 30000 * Desc],
	["POP_jeep_blinde_negro_mate", 30000 * Desc],
	["", 0]
];

_tiendaLVL2 = [
	["------- Trajes y Ropa --------", 0],
	["CUP_U_C_Citizen_04", 500 * Desc], //Ropa civil
	["CUP_U_C_Citizen_01", 500 * Desc], //Ropa civil
	["CUP_U_C_Profiteer_02", 500 * Desc], //Ropa civil
	["CUP_U_C_Profiteer_03", 500 * Desc], //Ropa civil
	["POP_CHAW_3", 500 * Desc], //Ropa formal
	["POP_CHAW_1", 500 * Desc], //Ropa formal
	["KAEL_SUITS_BR_F12", 500 * Desc], //Ropa formal
	["KAEL_SUITS_BR_F22", 500 * Desc], //Ropa formal
	["KAEL_SUITS_BR_F26", 500 * Desc], //Ropa formal
	["KAEL_SUITS_BR_F16", 500 * Desc], //Ropa formal
	["KAEL_SUITS_BLK_F", 500 * Desc], //Ropa formal
	["KAEL_SUITS_BR_F5", 500 * Desc], //Ropa formal
	["KAEL_SUITS_BR_F14", 500 * Desc], //Ropa formal
	["TRYK_U_denim_hood_mc", 500 * Desc], //Ropa camuflada
	["TRYK_U_pad_hood_tan", 500 * Desc], //Ropa camuflada
	["TRYK_U_B_PCUHs", 500 * Desc], //Ropa camuflada
	["TRYK_U_B_OD_OD_R_CombatUniform", 500 * Desc], //TRYK Verde
	["TRYK_U_B_BLK", 500 * Desc], //TRYK Negro
	["TRYK_U_B_BLKBLK_CombatUniform", 500 * Desc], //TRYK Negro
	["CUP_U_O_RUS_Gorka_Green", 500 * Desc],
	["A3LJumperCIDBlack", 500 * Desc],
	["A3LJumperCIDDigi", 500 * Desc],
	["A3LJumperCIDGreen", 500 * Desc],
	["A3LJumperUKBlack", 500 * Desc],
	["terminator2", 650 * Desc],
	
	["", 0],
	["---------- Mascaras y sombreros ----------", 0],
	["H_Hat_grey", 500 * Desc],
 	["mgsr_eyepatch_goggles", 500 * Desc], 
	["G_Balaclava_oli", 500 * Desc], 
	["G_Balaclava_blk", 500 * Desc],
	["TRYK_kio_balaclavas", 500 * Desc],
	["TRYK_kio_balaclava_BLK_ear", 500 * Desc],
	["TRYK_headset_Glasses", 500 * Desc],
	["Bt_glasses", 500 * Desc],
	["CUP_H_PMC_Cap_Back_EP_Grey", 500 * Desc],
	["TRYK_H_woolhat", 500 * Desc],
 	["kio_skl_msk_fran", 500 * Desc], 
	["kio_skl_msk_frost", 500 * Desc], 
	["kio_skl_msk_GOW", 500 * Desc], 
	["kio_skl_msk_german", 500 * Desc], 
	["kio_skl_msk_grey", 500 * Desc], 
	["kio_skl_msk_irish", 500 * Desc],
	["kio_skl_msk_o", 500 * Desc], 	
	["kio_skl_msk_pun", 500 * Desc], 	
	["kio_skl_msk_weed", 500 * Desc], 	
	["Masque_Dallas", 500 * Desc], 
	["Masque_Chains", 500 * Desc], 
	["Masque_Wolfv2", 500 * Desc], 
	["Masque_Incendiaire", 500 * Desc], 
	["Masque_forceAlpha", 500 * Desc], 
	["Masque_Hockey", 500 * Desc], 
	["Masque_Metalhead", 500 * Desc], 
	["POP_Tophat", 500 * Desc], 	
	["A3L_BergenMurica", 500 * Desc], 
	["BHD_Protec_helmet3", 500 * Desc], 
	["BHD_Protec_helmet2", 500 * Desc], 	
	["BHD_Protec_helmet", 500 * Desc],
	["TRYK_ESS_CAP", 500 * Desc],
	["TRYK_R_CAP_BLK", 500 * Desc],
	["TRYK_R_CAP_OD_US", 500 * Desc],
	["TRYK_H_TACEARMUFF_H", 500 * Desc],
	["kio_vfv_mask", 500 * Desc],
	["", 0]
];

_tiendaLVL3 = [ // chalecos
 
	["----- Chalecos y Mochilas ----", 0],
 	["pop_chaleco_cmd_cmd_14", 500 * Desc], //POP
	["pop_chaleco_cmd_cmd_31", 500 * Desc], //POP
	["pop_chaleco_cmd_cmd_47", 500 * Desc], //POP
	["pop_chaleco_cmd_cmd_62", 500 * Desc], //POP
	["pop_chaleco_cmd_cmd_70", 500 * Desc], //POP
	["pop_chaleco_cmd_cmd_61", 500 * Desc], //POP
	["B_Parachute", 1000 * Desc], //Paracaidas
	["TRYK_V_ArmorVest_Delta", 800 * Desc], //POP
	["Specter_RAV", 800 * Desc], //POP
	["S_VHO_LV_OD2", 800 * Desc], //POP
	["TAC_V_Sheriff_BA_TB3", 800 * Desc], //POP
	["TAC_V_Sheriff_BA_TBL7", 800 * Desc], //POP
	["TAC_V_tacv1_BK", 800 * Desc], //POP
	["TAC_V_tacv1EP_BK", 800 * Desc], //POP
	["CUP_V_B_LHDVest_Blue", 500 * Desc], //CUP
	["CUP_V_B_LHDVest_Brown", 500 * Desc],//CUP 
	["CUP_V_B_LHDVest_Green", 500 * Desc], //CUP
	["CUP_V_B_LHDVest_Red", 500 * Desc], //CUP
	["CUP_V_B_LHDVest_Violet", 500 * Desc], //CUP
	["CUP_V_B_LHDVest_White", 500 * Desc], //CUP
	["CUP_V_B_LHDVest_Yellow", 500 * Desc], //CUP
	["B_AssaultPack_blk", 500 * Desc], //POP Mochila
	["B_AssaultPack_cbr", 500 * Desc], //POP Mochila
	["mochila_pequena", 350 * Desc], //POP Mochila
	["", 0]
];

_tiendaLVL4 = [ // pistolas semiautomaticas
 
	["-- Pistolas SemiAutomaticas --", 0],
	["RH_m9qd", 800 * Desc],
	["RH_m9", 7000 * Desc],
	["RH_m9c", 7000 * Desc],
	["RH_15Rnd_9x19_M9", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_kimber", 7000 * Desc],
	["RH_kimber_nw", 7000 * Desc],
	["RH_7Rnd_45cal_m1911", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hgun_007_SW_M10", 7000 * Desc],
	["6Rnd_45ACP_Cylinder", 60 * Desc],
	["", 0],
	["RH_python", 7000 * Desc],
	["RH_6Rnd_357_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_gemtech9", 8000 * Desc],
	["RH_g17", 7000 * Desc],
	["RH_17Rnd_9x19_g17", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_g18", 7000 * Desc],
	["RH_19Rnd_9x19_g18", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_vp70", 7000 * Desc],
	["RH_18Rnd_9x19_VP", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_tec9", 7000 * Desc],
	["RH_32Rnd_9x19_tec", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_mak", 7000 * Desc],
	["RH_8Rnd_9x18_Mak", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_mp412", 7000 * Desc],
	["RH_6Rnd_357_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_cz75", 7000 * Desc],
	["RH_16Rnd_9x19_cz", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_sw659", 7000 * Desc],
	["RH_14Rnd_9x19_sw", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_usp", 7000 * Desc],
	["RH_12Rnd_45cal_usp", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_mak", 7000 * Desc],
	["RH_8Rnd_9x18_Mak", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_uspm", 7000 * Desc],
	["RH_16Rnd_40cal_usp", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_m9", 7000 * Desc],
	["RH_m9c", 7000 * Desc],
	["RH_15Rnd_9x19_M9", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_tt33", 7000 * Desc],
	["RH_8Rnd_762_tt33", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_mk2", 7000 * Desc],
	["RH_10Rnd_22LR_mk2", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_p226", 7000 * Desc],
	["RH_p226s", 7000 * Desc],
	["RH_15Rnd_9x19_SIG", 60 * Desc],
	["RH_mateba", 7000 * Desc],
	["RH_6Rnd_44_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_python", 7000 * Desc],
	["RH_mp412", 7000 * Desc],
	["RH_6Rnd_357_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_bull", 7000 * Desc],
	["RH_bullb", 7000 * Desc],
	["RH_6Rnd_454_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_fnp45", 7000 * Desc],
	["RH_fnp45t", 7000 * Desc],
	["RH_15Rnd_45cal_fnp", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_fn57", 7000 * Desc],
	["RH_fn57_g", 7000 * Desc],
	["RH_fn57_t", 7000 * Desc],
	["RH_20Rnd_57x28_FN", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_gsh18", 7000 * Desc],
	["RH_18Rnd_9x19_gsh", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hgun_Pistol_heavy_01_F", 7000 * Desc],
	["11Rnd_45ACP_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["R3F_PAMAS", 7000 * Desc],
	["R3F_15Rnd_9x19_PAMAS", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hgun_ACPC2_F", 7000 * Desc],
	["9Rnd_45ACP_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hgun_P07_F", 7000 * Desc],
	["hgun_Rook40_F", 7000 * Desc],
	["16Rnd_9x21_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hgun_Pistol_heavy_02_F", 7000 * Desc],
	["6Rnd_45ACP_Cylinder", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_ttracker", 7000 * Desc],
	["RH_6Rnd_45ACP_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_Deagleg", 7000 * Desc],
	["RH_Deagles", 7000 * Desc],
	["RH_Deaglem", 7000 * Desc],
	["RH_deagle", 7000 * Desc],
	["RH_7Rnd_50_AE", 60 * Desc],
	["RH_demz", 2500 * Desc],
	["RH_Deflash", 2500 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_vz61",7000 * Desc],
	["RH_20Rnd_32cal_vz61",60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["RH_bull", 7000 * Desc],
	["RH_6Rnd_454_Mag", 60 * Desc],
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
 	["hgun_Pistol_heavy_01_F", 7000 * Desc], //Arma 4-five .45
	["11Rnd_45ACP_Mag", 60 * Desc], //Municion 4-five .45
	["hgun_ACPC2_F", 7000 * Desc], //Arma ACP-C2
	["9Rnd_45ACP_Mag", 60 * Desc], //Municion ACP-C2
	["CUP_hgun_Colt1911", 7000 * Desc], //Arma M1911
	["hgun_007_Colt1911", 7000 * Desc], //Arma Colt 1911
	["CUP_7Rnd_45ACP_1911", 60 * Desc], //Municion M1911
	["muzzle_snds_acp", 8000 * Desc], //Accesorio Armas Varias
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["CUP_hgun_Compact",7000 * Desc], //Arma CZ75 Compact
	["CUP_10Rnd_9x19_Compact",60 * Desc], //Municion CZ75
	["CUP_hgun_Glock17",7000 * Desc], //Arma Glock17
	["CUP_17Rnd_9x19_glock17",60 * Desc], //Municion Glock17
	["hgun_Rook40_F", 7000 * Desc], //Arma Rook-40
	["16Rnd_9x21_Mag", 60 * Desc], //Municion Rook-40
	["muzzle_snds_L",8000 * Desc], //Accesorio Glock17
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["CUP_hgun_M9", 7000 * Desc], //Arma M9
	["CUP_15Rnd_9x19_M9", 60 * Desc], //Municion M9
	["CUP_muzzle_snds_M9", 8000 * Desc], //Accesorio
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["CUP_hgun_Makarov", 7000 * Desc], //Arma Makarov PM
	["CUP_hgun_PB6P9", 7000 * Desc], //Arma PB 6P9
	["CUP_8Rnd_9x18_Makarov_M", 60 * Desc], //Municion PB 6P9
	["CUP_muzzle_PB6P9", 8000 * Desc], //Accesorio
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["hgun_007_SW_M10", 7000 * Desc], //Arma Revolver M10
	["hgun_007_SW_M10_gold", 7000 * Desc], //Arma Revolver M10 Oro
	["hgun_007_SW_M10_special", 7000 * Desc], //Arma Revolver M10 Especial
	["hgun_Pistol_heavy_02_F", 7000 * Desc], //Arma Zubr .45
	["6Rnd_45ACP_Cylinder", 60 * Desc], //Municion Zubr .45
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["CUP_hgun_TaurusTracker455", 7000 * Desc], //Arma Revolver Taurus 455
	["CUP_hgun_TaurusTracker455_gold", 7000 * Desc], //Arma Revolver Taurus 455 Oro
	["CUP_6Rnd_45ACP_M", 60 * Desc], //Municion Taurus 455	
	["", 0],
	["---- Pistolas Automaticas ----", 0],
 	["CUP_hgun_SA61", 8500 * Desc], //Arma Sa61
	["CUP_20Rnd_B_765x17_Ball_M", 60 * Desc], //Municion Sa61
	["", 0]
];

_tiendaLVL5 = [ // subfusiles nivel 1
 
	["----- Subfusiles Nivel 1 -----", 0],
 	["RH_muzi", 15000 * Desc], //Arma MicroUZI
	["RH_30Rnd_9x19_UZI", 60 * Desc], //Municion MicroUZI
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["hlc_smg_mp5k", 15000 * Desc], //Arma HK MP5K
	["hlc_smg_mp5k_PDW", 17000 * Desc], //Arma HK MP5A3
	["hlc_smg_mp5a3", 17000 * Desc], //Arma HK MP5A3
	["hlc_30Rnd_9x19_B_MP5", 60 * Desc], //Municion MP5
	["iansky_rds", 1200 * Desc], //Addon Visor Corto
	["hlc_muzzle_Tundra", 1200 * Desc], //Addon Silenciador HK MP5K
	["", 0]
];

_tiendaLVL6 = [ // subfusiles nivel 2
 
	["----- Subfusiles Nivel 2 -----", 0],
	["KA_MP7_Pistol_Black_20Rnd", 15000 * Desc], //Arma MP7
	["KA_MP7_Pistol_Green_20Rnd", 15000 * Desc], //Arma MP7
	["KA_20Rnd_46x30_FMJ", 60 * Desc], //Municion MP7
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["KA_MP7_Rifle_Black_40Rnd", 17000 * Desc], //Arma MP7
	["KA_MP7_Rifle_Green_40Rnd", 17000 * Desc], //Arma MP7
	["KA_40Rnd_46x30_FMJ", 60 * Desc], //Municion MP7
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_smg_mp510", 17000 * Desc], //Arma HK MP5/10
	["hlc_30Rnd_10mm_B_MP5", 60 * Desc], //Municion HK MP5/10
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["SMG_03C_hex", 17000 * Desc], //Arma ADR-97
	["50Rnd_570x28_SMG_03", 60 * Desc], //Municion ADR-97
	["", 0]
];

_tiendaLVL7 = [ // Carabinas
 
	["--------- Carabinas ----------", 0],
 	["R3F_Famas_surb_HG", 18000 * Desc], //Arma FAMAS C HG
	["R3F_30Rnd_556x45_FAMAS", 60 * Desc], //Municion FAMAS C HG
	["R3F_EOTECH", 1500 * Desc], //Visor EOTECH FAMAS
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_RU5562", 18000 * Desc], //Arma AR15 Magpul Carabine
	["hlc_30rnd_556x45_EPR", 60 * Desc], //Municion AR15 Magpul Carabine
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_RU556", 18000 * Desc], //Arma AR15 Sanitised Carabine
	["hlc_30rnd_556x45_EPR", 60 * Desc], //Municion AR15 Sanitised Carabine
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_Colt727", 18000 * Desc], //Arma Colt Carabine
	["30Rnd_556x45_Stanag", 60 * Desc], //Municion Colt Carabine
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_M4", 18000 * Desc], //Arma Colt M4 Carabine
	["hlc_30rnd_556x45_EPR", 60 * Desc], //Municion Colt M4 Carabine
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_aku12", 18000 * Desc], //Arma AKU12
	["hlc_30Rnd_545x39_B_AK", 60 * Desc], //Municion Arma AKU12
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["kio_l85a2", 18000 * Desc], //Arma L85A2
	["30rnd_556_magazine", 60 * Desc], //Municion Arma L85A2
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_aks74u_MTK", 18000 * Desc], //Arma AKS75U
	["hlc_30Rnd_545x39_B_AK", 60 * Desc], //Municion Arma AKS74U
	["", 0]
];

_tiendaLVL8 = [ // Escopetas
 
	["--------- Escopetas ----------", 0],
 	["CUP_sgun_M1014", 18000 * Desc], //Arma M1014
	["CUP_8Rnd_B_Beneli_74Slug", 60 * Desc], //Municion M1014 
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["CUP_sgun_Saiga12K", 18000 * Desc], //Arma Saiga12
	["CUP_8Rnd_B_Saiga12_74Slug_M", 60 * Desc], //Municion Saiga12 
	["", 0]
];

_tiendaLVL9 = [ // Fusiles de asalto
 
	["----------- Fusiles de asalto -----------", 0],
 	["hlc_rifle_hk53", 20000 * Desc], //Arma HK53
	["hlc_30rnd_556x45_b_HK33", 60 * Desc], //Municion HK53
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["kio_l85a2_pink", 20000 * Desc], //Arma L85A2 Pink
	["30rnd_556_magazine", 60 * Desc], //Municion L85A2 Pink
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["R3F_HK416M", 20000 * Desc], //Arma HK416M
	["R3F_30Rnd_556x45_HK416", 60 * Desc], //Municion HK416M
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["R3F_HK416M_HG", 20000 * Desc], //Arma HK416MHG
	["R3F_30Rnd_556x45_HK416", 60 * Desc], //Municion HK416MHG
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_bcmjack", 20000 * Desc], //Arma M4A1 Jack Carabine
	["hlc_30rnd_556x45_EPR", 60 * Desc], //Municion M4A1 Jack Carabine
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_ak12", 20000 * Desc], //Arma AK12
	["hlc_30Rnd_545x39_B_AK", 60 * Desc], //Municion AK12
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_ak74m_MTK", 20000 * Desc], //Arma AK74M
	["hlc_30Rnd_545x39_B_AK", 60 * Desc], //Municion AK74M
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_ak74_MTK", 20000 * Desc], //Arma AK74
	["hlc_30Rnd_545x39_B_AK", 60 * Desc], //Municion AK74
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["kio_l85a2_ris", 20000 * Desc], //Arma L85A2 RIS
	["30rnd_556_magazine", 60 * Desc], //Municion L85A2 RIS
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["hlc_rifle_g3a3v", 22000 * Desc], //Arma G3A3V
	["hlc_rifle_g3a3ris", 22000 * Desc], //Arma G3A3RIS
	["hlc_rifle_g3ka4", 22000 * Desc], //Arma G3KA4
	["hlc_20rnd_762x51_b_G3", 60 * Desc], //Municion G3
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],
	["SG553_CQB", 20000 * Desc], //Arma SG553
	["30Rnd_56x45_GP90", 60 * Desc], //Municion SG553
	["optic_Aco", 1200 * Desc], //Visor corto
	["iansky_cmore", 1200 * Desc], //Visor corto
	["", 0]
];

_tiendaLVL10 = [ // Rifles
 
	["----- Rifles ------", 0],
 	["hlc_rifle_vendimus", 25000 * Desc], //Arma AR15 .300 Dissipator
	["29rnd_300BLK_STANAG", 60 * Desc], //Municion AR15 .300 Dissipator	
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],    
	["hlc_rifle_samr2", 25000 * Desc], //Arma RRA LAR-15
	["hlc_rifle_SAMR", 25000 * Desc], //Arma RRA LAR-15
	["hlc_30rnd_556x45_EPR", 60 * Desc], //Municion RRA LAR-15
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["hlc_rifle_psg1", 30000 * Desc], //Arma HK PSG1
	["hlc_rifle_PSG1A1_RIS", 25000 * Desc], //Arma HK PSG1RIS
	["hlc_20rnd_762x51_b_G3", 60 * Desc], //Municion PSG1
	["~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0],	
	["iansky_specterdrkf_2D", 5000 * Desc], //Visor de media distancia
	["iansky_nfbeast", 8000 * Desc], //Visor de larga distancia
	["hlc_muzzle_snds_HK33", 3000 * Desc], //Silenciador 5.56mm
	["hlc_muzzle_300blk_KAC", 3000 * Desc], //Silenciador .300
	["CUP_bipod_Harris_1A2_L", 3000 * Desc], //Bipode Khaki
	["bipod_02_F_blk", 3000 * Desc], //Bipode Negro	
	["", 0]
];


_arrayTienda = [];
_arrayTiendaCompra = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_nivel = "cri" call ica_fnc_expToLevel;
//	_bd = call mafia;
	_stockdis = zona_1 getVariable "stock";
	
	if (_nivel == 0) then { _arrayTienda append _tiendaLVL0 };
	if (_stockdis == 0) then { _arrayTienda append _tiendaStock };	
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
		if ((_arrayTienda select _idx select 1) == 0) then { // si es separador le cambio de color
			_lista lbSetColor [_idx, [0, 0.6, 0, 1]];
		};

		_idx = _idx + 1;
	};


	// _lista lbSetCurSel 0;
};

if (_param isEqualTo "actualiza") exitWith {
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
		if(_cosa == _nomx) then { _esArma = 1};
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
	[(round (_precio * 0.10)),_organizacion] call life_fnc_gangExtorsion;  
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
	_stockshow = zona_1 getVariable "stock";
	if (_esArma > 0.5) then {	// si es arma
		if ((zona_1 getVariable "stock") < 1) then {
		_dialog = findDisplay -1;
		_ctrl = _dialog displayCtrl 5006;
		_ctrl ctrlShow false;
		};
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Inventario de Armas</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has comprado: %2 por %3€ <br/>Existencia actual de Armamento: %4 </t>",_pic,_nom,_precio,_stockshow];
	} else {
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Inventario de Bajos Fondos</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has comprado: %2 por %3€ <br/>Existencia actual: Suficiente</t>",_pic,_nom,_precio];
	};
	[format ["- %1€", _precio]] call ica_fnc_infolog;
};