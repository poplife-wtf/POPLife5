
/*
por: Icaruk
	call ica_fnc_limitadorDeArmas
	player addmagazines ["CUP_30Rnd_9x19_EVO", 3]; player addweapon "r3f_mp5a5";
	player addmagazines ["RH_16Rnd_9x19_cz", 3]; player addweapon "RH_cz75";

*/

if (playerside isEqualto west) exitWith {puedoDisparar = true; };

//agregado hombre de hierro
_fortaleza = "sup" call ica_fnc_expToLevel;

if ((player getVariable "brazos" >= 60 ) and _fortaleza < 5 ) exitWith {
	puedoDisparar = nil;
	hint "Tienes los brazos rotos, no puedes aguantar un arma";
};


/*_listaTier1 = ["hgun_Pistol_heavy_01_F","hgun_ACPC2_F","CUP_hgun_Colt1911","hgun_007_Colt1911","CUP_hgun_Compact","CUP_hgun_Glock17","hgun_Rook40_F","CUP_hgun_M9","CUP_hgun_Makarov","CUP_hgun_PB6P9","hgun_007_SW_M10","hgun_007_SW_M10_gold","hgun_007_SW_M10_special","hgun_Pistol_heavy_02_F","CUP_hgun_TaurusTracker455","CUP_hgun_TaurusTracker455_gold","hgun_007_W_PPK","CUP_hgun_SA61",
"RH_m9","RH_m9c","RH_kimber","RH_kimber_nw","RH_7Rnd_45cal_m1911","R3F_PAMAS","hgun_007_SW_M10","RH_python","RH_gemtech9","RH_g18","RH_vp70","RH_tec9","RH_mak","RH_mp412","RH_cz75","RH_sw659","RH_usp","RH_mak","RH_uspm","RH_m9","RH_m9c","RH_tt33",
"RH_mk2","RH_p226","RH_p226s","RH_mateba","RH_python","RH_mp412","RH_bull","RH_bullb","RH_fnp45","RH_fnp45t","RH_fn57","RH_fn57_g","RH_fn57_t","RH_gsh18",
"hgun_Pistol_heavy_01_F","hgun_ACPC2_F","hgun_P07_F","hgun_Rook40_F","hgun_Pistol_heavy_02_F","RH_ttracker","RH_Deagleg","RH_vz61","RH_bull"];*/

/*_listaTier2 = ["CUP_hgun_BallisticShield_Armed","CUP_hgun_MicroUzi","CUP_smg_MP5A5","hgun_PDW2000_F","CUP_srifle_VSSVintorez","CUP_arifle_AKS74U","CUP_smg_bizon","CUP_smg_EVO","SMG_02_F","arifle_SDAR_F","CUP_srifle_VSSVintorez","CUP_arifle_CZ805_A2","arifle_Katiba_C_F","arifle_MXC_Black_F","CUP_sgun_M1014","CUP_sgun_Saiga12K","CUP_srifle_CZ550","CUP_srifle_M40A3","CUP_arifle_M4A1_black","CUP_arifle_Mk16_STD","CUP_arifle_FNFAL","CUP_arifle_M16A4_Base","CUP_launch_RPG7V","CUP_arifle_AK47","CUP_arifle_AKM","CUP_srifle_Mk12SPR","CUP_arifle_G36C","CUP_hgun_BallisticShield_Armed","CUP_arifle_G36A","CUP_arifle_G36K",
"rh_muzi","r3f_mp5a5","C1987_mp7","c1987_mp7_ucp","cl987_mp7","c1987_mp7_folded2","c1987_mp7_nwu","ag_mp9_peq","ag_mp9_wcam","pop_thomson","hlc_smg_mp510","rh_sbr9","hlc_rifle_ak12","hlc_rifle_aek971worn","rh_m4_ris_m","r3f_famas_surb_hg","r3f_famas_g2","rh_hk416c","rh_hk416s","rh_m4m","rh_m4sbr","rh_m4sbr_b","rh_m4sbr_g","rh_m4_moe","rh_m4_des","rh_m4_tg","rh_m4_wdl","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_aku12","r3f_hk416m_hg_des","rh_m16a4","rh_m4"];*/

_listatier1 = ["hgun_pistol_heavy_01_f","hgun_acpc2_f","cup_hgun_colt1911","hgun_007_colt1911","cup_hgun_compact","cup_hgun_glock17","hgun_rook40_f","cup_hgun_m9","cup_hgun_makarov","cup_hgun_pb6p9","hgun_007_sw_m10","hgun_007_sw_m10_gold","hgun_007_sw_m10_special","hgun_pistol_heavy_02_f","cup_hgun_taurustracker455","cup_hgun_taurustracker455_gold","hgun_007_w_ppk","cup_hgun_sa61",
"rh_m9","rh_m9c","rh_kimber","rh_kimber_nw","rh_7rnd_45cal_m1911","r3f_pamas","hgun_007_sw_m10","rh_python","rh_gemtech9","rh_g18","rh_vp70","rh_tec9","rh_mak","rh_mp412","rh_cz75","rh_sw659","rh_usp","rh_mak","rh_uspm","rh_m9","rh_m9c","rh_tt33",
"rh_mk2","rh_p226","rh_p226s","rh_mateba","rh_python","rh_mp412","rh_bull","rh_bullb","rh_fnp45","rh_fnp45t","rh_fn57","rh_fn57_g","rh_fn57_t","rh_gsh18",
"hgun_pistol_heavy_01_f","hgun_acpc2_f","hgun_p07_f","hgun_rook40_f","hgun_pistol_heavy_02_f","rh_ttracker","rh_deagleg","rh_vz61","rh_bull"];

/*_listaTier2 = ["CUP_hgun_BallisticShield_Armed","CUP_hgun_MicroUzi","CUP_smg_MP5A5","hgun_PDW2000_F","CUP_srifle_VSSVintorez","CUP_arifle_AKS74U","CUP_smg_bizon","CUP_smg_EVO","SMG_02_F","arifle_SDAR_F","CUP_srifle_VSSVintorez","CUP_arifle_CZ805_A2","arifle_Katiba_C_F","arifle_MXC_Black_F","CUP_sgun_M1014","CUP_sgun_Saiga12K","CUP_srifle_CZ550","CUP_srifle_M40A3","CUP_arifle_M4A1_black","CUP_arifle_Mk16_STD","CUP_arifle_FNFAL","CUP_arifle_M16A4_Base","CUP_launch_RPG7V","CUP_arifle_AK47","CUP_arifle_AKM","CUP_srifle_Mk12SPR","CUP_arifle_G36C","CUP_hgun_BallisticShield_Armed","CUP_arifle_G36A","CUP_arifle_G36K",
"rh_muzi","r3f_mp5a5","C1987_mp7","c1987_mp7_ucp","cl987_mp7","c1987_mp7_folded2","c1987_mp7_nwu","ag_mp9_peq","ag_mp9_wcam","pop_thomson","hlc_smg_mp510","rh_sbr9","hlc_rifle_ak12","hlc_rifle_aek971worn","rh_m4_ris_m","r3f_famas_surb_hg","r3f_famas_g2","rh_hk416c","rh_hk416s","rh_m4m","rh_m4sbr","rh_m4sbr_b","rh_m4sbr_g","rh_m4_moe","rh_m4_des","rh_m4_tg","rh_m4_wdl","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_aku12","r3f_hk416m_hg_des","rh_m16a4","rh_m4"];*/

_listatier2 = ["cup_hgun_ballisticshield_armed","cup_hgun_microuzi","cup_smg_mp5a5","hgun_pdw2000_f","cup_srifle_vssvintorez","cup_arifle_aks74u","cup_smg_bizon","cup_smg_evo","smg_02_f","arifle_sdar_f","cup_srifle_vssvintorez","cup_arifle_cz805_a2","arifle_katiba_c_f","arifle_mxc_black_f","cup_sgun_m1014","cup_sgun_saiga12k","cup_srifle_cz550","cup_srifle_m40a3","cup_arifle_m4a1_black","cup_arifle_mk16_std","cup_arifle_fnfal","cup_arifle_m16a4_base","cup_launch_rpg7v","cup_arifle_ak47","cup_arifle_akm","cup_srifle_mk12spr","cup_arifle_g36c","cup_hgun_ballisticshield_armed","cup_arifle_g36a","cup_arifle_g36k",
"rh_muzi","r3f_mp5a5","c1987_mp7","c1987_mp7_ucp","cl987_mp7","c1987_mp7_folded2","c1987_mp7_nwu","ag_mp9_peq","ag_mp9_wcam","pop_thomson","hlc_smg_mp510","rh_sbr9","hlc_rifle_ak12","hlc_rifle_aek971worn","rh_m4_ris_m","r3f_famas_surb_hg","r3f_famas_g2","rh_hk416c","rh_hk416s","rh_m4m","rh_m4sbr","rh_m4sbr_b","rh_m4sbr_g","rh_m4_moe","rh_m4_des","rh_m4_tg","rh_m4_wdl","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_aku12","r3f_hk416m_hg_des","rh_m16a4","rh_m4"];

_arma = toLower (currentWeapon player);

//seguridad privada
_seguridadPrivada = player getVariable ["trabajo_seguridad_privada",false];


_lvl = "com" call ica_fnc_expToLevel;

puedoDisparar = true;
_switchOUT = true;
switch (_switchOUT) do {
	case (_arma in _listaTier1): {
	
		if (_lvl >= 2) exitWith{_switchOUT = false;};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;

	};
	case (_arma in _listaTier2): {

		if (_lvl >= 3) exitWith{_switchOUT = false;};
		hint "No sabes utilizar este tipo de arma, ¿qué intentas?.";
		puedoDisparar = nil;

		
	};
	
	case (_arma == "hgun_rook40_f"): {

if (_seguridadPrivada )exitWith{_switchOUT = false;};
	hint "No estas de servicio, solo la seguridad privada de servicio  puede utilizar esta arma...";
	puedoDisparar = nil;
		
	};


};

//veteranos recargan el arma automaticamente

if (("cri" call ica_fnc_expToLevel) > 7) exitWith {
    _ammo = player    ammo (currentWeapon player);
	if(_ammo < 1  )then{
		reload player;

	};       
};


_arma spawn {
	if (isNil {esperandoCambioDeArma}) then {
		esperandoCambioDeArma = true;
		waitUntil {sleep 1; currentWeapon player != _this};
		puedoDisparar = nil;
		esperandoCambioDeArma = nil;
	};
};


	