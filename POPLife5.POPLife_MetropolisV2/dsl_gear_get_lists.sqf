_backpacks = [];
_uniforms = [];
_vests = [];
_hats = []; 
_handWeaponsCfg = [];
_RiflesCfg = [];
_machinegunsCfg = [];
_LaunchersCfg = [];
_opticsCfg = [];
_muzzleCfg = [];
_accCfg = [];
_glasses = []; 
_heads = []; 

// Backpacks
_count =  count (configFile >> "CfgVehicles");
for "_x" from 0 to (_count-1) do
{
  _item=((configFile >> "CfgVehicles") select _x);
  if (isClass _item) then
  {
    if (getnumber (_item >> "scope") == 2) then  
    {
      if (gettext (_item >> "vehicleClass") == "Backpacks") then  
      {
        _backpacks = _backpacks + [configname _item]
};};};};


// CfgWeapons stuff, most gear/weapons
_count =  count (configFile >> "CfgWeapons");
for "_x" from 0 to (_count-1) do
{
  _item=((configFile >> "CfgWeapons") select _x);
  if (isClass _item) then
  {
    if (getnumber (_item >> "scope") == 2) then  // public
    {
	  if (isClass (_item >> "ItemInfo")) then {
	  
		_infoType = (getnumber (_item >> "ItemInfo" >> "Type"));
		
		switch (_infoType) do
		{
			case 201: {_opticsCfg = _opticsCfg + [configName _item];}; 
			case 101: {_muzzleCfg = _muzzleCfg + [configName _item];};
			case 301: {_accCfg = _accCfg + [configName _item];}; 
			case 605: {_hats = _hats + [configName _item];}; 
			case 801: {_uniforms = _uniforms + [configName _item];}; 
			case 701: {_vests = _vests + [configName _item];}; 
		}; 
	  };
	  
      if (count(getarray (_item >> "magazines")) !=0 ) then  //WeaponHardMounted
      {
        _type = getnumber (_item >> "type");
        if (_type == 2) then  //WeaponSlotHandGun
        {
          _handWeaponsCfg = _handWeaponsCfg + [configName _item];
        }
        else
        {
          if (_type == 1) then  //WeaponSlotPrimary
          {
            _RiflesCfg = _RiflesCfg + [configName _item];
          }
          else
          {
            if (_type == 1+4) then  //WeaponSlotPrimary + WeaponSlotSecondary
            {
              _machinegunsCfg = _machinegunsCfg + [configName _item];
            }
            else
            {
              if (_type == 4) then  //WeaponSlotSecondary
              {
                _LaunchersCfg = _LaunchersCfg + [configName _item];
              };
            };
          };
        };
      };
    };
  };
};

// Glasses
_count =  count (configFile >> "CfgGlasses");
for "_x" from 0 to (_count-1) do
{
	_item=((configFile >> "CfgGlasses") select _x);
	if (isClass _item) then
	{
		if (getnumber (_item >> "scope") == 2) then  // public
		{_glasses = _glasses + [configName _item];};
	};
};

// Faces
_count =  count (configFile >> "CfgFaces" >> "Man_A3");
for "_x" from 0 to (_count-1) do
{
	_item=((configFile >> "CfgFaces" >> "Man_A3") select _x);
	if (isClass _item) then {_heads = _heads + [configName _item];};
};

		dsl_BackpackTypes = [""] + ["mochila_mediana","TAC_BP_Butt_B2M"];
		dsl_UniformTypes = [""] + ["GC","CNP","GC2","CNP2","ATGC","ATGC2","ATGC3","GC6","CNP6","CNP3","CNP5","GC5","GC3","GC4","CNP4","U_B_HeliPilotCoveralls","GEO","U_bombsuit","U_B_Wetsuit","A3L_CivShirtDiamond","POP_CHAW_2","TRYK_SUITS_BLK_F","woman4","rds_uniform_Woodlander4","EF_FEM_4_2SG2","A3LCivPoloGreenBlack","EF_FEM_3_5BP","TRYK_U_B_BLKOCP_R_CombatUniformTshirt","rds_uniform_Profiteer1","A3L_CivShirtVans","POP_CHAW_P","POP_CHAW_P1"];
		dsl_VestTypes = [""] + ["pop_cinturon","pop_cinturon","pop_chaleco_gcivil_1","pop_chaleco_nacional_1","GC_CHALECO","CNP_CHALECO","pop_chaleco_tela_atgc","pop_chaleco_tela_cnp","pop_chaleco_tela_gc","pop_chaleco_pocient2","CNP_CHALECO2","pop_chaleco_gcreflectante","GEO_CHALECO","UEI_CHALECO","V_RebreatherB","cest_belt"];
		dsl_HatTypes = [""] + ["GORRA_GC","GORRA_CNP","POP_tricornio","BOINA_GC","BOINA_CNP","BOINA_GC3","BOINA_CNP3","CASCO_CNP","CASCO_GC","BOINA_GC4","BOINA_CNP4","BOINA_CNP2","BOINA_GC2","H_Beret_Colonel","H_Beret_02","H_PilotHelmetHeli_B","H_Bombsuit_Helmet","kio_skl_msk_can","Masque_forceAlpha","Kio_Spinning_Hat","TRYK_UA_CAP2R","rds_Woodlander_cap4","Afghan_05Hat","ALE_H_NewEra_Superman","pop_gorra_adidaswoman","pop_mascara","Masque_Lincoln","EF_FHcap_BK","TRYK_H_PASGT_BLK","TAC_SF10H", "TAC_K6O","TAC_K6C"];
		dsl_Glasses = [""] + ["murshun_cigs_cig0","murshun_cigs_cig4","G_Aviator","G_Sport_Blackyellow","G_Combat","G_Spectacles","EF_RG1","TRYK_Beard_BK","TRYK_Beard_BL","TRYK_Beard_BW","TRYK_SBeard_BW","TRYK_kio_balaclavas","TRYK_kio_balaclava_BLK", "TRYK_kio_balaclavas",  "TRYK_kio_balaclava_ESS","G_B_Diving"];
		dsl_WeaponListPistols = [""] + ["CSW_M26C","pop_piruli","RH_cz75","RH_m9","RH_g19","RH_fn57","RH_usp","RH_p226","RH_fnp45","RH_uspm","CSW_FN57_Ballistic_Shield","RH_tt33","RH_bull","RH_mak","RH_python"];
		dsl_WeaponListPrimaries = [""] + ["hlc_smg_mp5a3","KA_MP7_Rifle_Black_20Rnd","SMG_03_TR_khaki","hlc_rifle_G36C","KA_UMP45_P","hlc_smg_mp510","SMG_01_F","hlc_smg_mp5sd5","hlc_rifle_G36KV","hlc_rifle_G36KA1KSK","hlc_rifle_g36KTac","KA_SG_550","srifle_LRR_F","hlc_5rnd_300WM_FMJ_AWM","arifle_SDAR_F"];
		dsl_CurrentOpticTypes = [""] + _opticsCfg;
		dsl_Launchers = [""] + _LaunchersCfg; 
		dsl_WeaponAccessoryTypes = [""] + _accCfg;
		dsl_Heads = [""] + ["GORRA_CNP","GORRA_GC"];
		Dsl_Accesorios = ["Binocular","KA_TL_122_flashlight","optic_Holosight_smg_blk_F","optic_Holosight_smg","optic_Hamr","optic_Yorris","optic_DMS","optic_Holosight","optic_LRPS","optic_LRPS","acc_flashlight","KA_MP7_Flashlight_single","KA_UMP45_Flashlight_single","RH_X300","RH_M6X","CSW_FN57_flashlight_glare_2","muzzle_snds_acp","hlc_muzzle_556NATO_KAC","KA_SIG_Silencer","muzzle_snds_570","bipod_03_F_blk","CSW_FN57_silencer2","bipod_03_F_blk","CSW_Taser_Probe_Mag","RH_15Rnd_9x19_M9","RH_16Rnd_9x19_CZ","RH_17Rnd_9x19_g17","RH_20Rnd_57x28_FN","RH_12Rnd_45cal_usp","RH_15Rnd_9x19_SIG","RH_15Rnd_45cal_fnp","RH_16Rnd_40cal_usp","RH_8Rnd_762_tt33","RH_6Rnd_454_Mag","RH_8Rnd_9x18_Mak","RH_6Rnd_357_Mag","hlc_30Rnd_9x19_B_MP5","hlc_30rnd_556x45_EPR_G36","KA_20Rnd_46x30_FMJ","50Rnd_570x28_SMG_03","hlc_30Rnd_10mm_JHP_MP5","KA_25Rnd_45ACP_High_Presure_Mag","hlc_30rnd_556x45_EPR_G36","30Rnd_45ACP_Mag_SMG_01_Tracer_Red","hlc_30Rnd_9x19_B_MP5","20Rnd_556x45_UW_mag","7Rnd_408_Mag","ACE_M84","CSW_FN57_Barska","CSW_FN57_Shield","CSW_20Rnd_57x28_SS190","ACE_SpraypaintRed","SmokeShell"]