#include <macro.h>

/*
	File: fn_clothing_donator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	donators
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Tienda donadores"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
        if(__GETC__(life_donator) > 0) then
        {
			_ret set[count _ret,["POP_CHAW4_D1",nil,300]];
			_ret set[count _ret,["POP_CHAW4_D2",nil,300]];
			_ret set[count _ret,["POP_CHAW4_D3",nil,300]];
			_ret set[count _ret,["POP_CHAW4_D4",nil,300]];
			_ret set[count _ret,["POP_CHAW4_D5",nil,300]];
			_ret set[count _ret,["POP_CHAW4_D6",nil,300]];
			_ret set[count _ret,["POP_CHAW4_D7",nil,300]];
			_ret set[count _ret,["POP_CHAW4_D8",nil,300]];
			_ret set[count _ret,["POP_CHAW3_D5",nil,300]];
			_ret set[count _ret,["POP_CHAW3_D6",nil,300]];
			_ret set[count _ret,["POP_CHAW_0_D",nil,300]];
			_ret set[count _ret,["POP_CHAW_0_D1",nil,300]];
			_ret set[count _ret,["POP_CHAW_0_D1M",nil,300]];
			_ret set[count _ret,["POP_CHAW_0_D1M2",nil,300]];
			_ret set[count _ret,["POP_CHAW_0_D1M3",nil,300]];
			_ret set[count _ret,["POP_CHAW_1_D",nil,300]];
			_ret set[count _ret,["POP_CHAW3_D",nil,300]];
			_ret set[count _ret,["POP_CHAW3_D2",nil,300]];
			_ret set[count _ret,["POP_CHAW3_D3",nil,300]];
			_ret set[count _ret,["POP_CHAW3_D4",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["U_GirlSet3_uniform",nil,300]];
			_ret set[count _ret,["A3LHandShirt",nil,300]];
			_ret set[count _ret,["U_C_Polo_Mali",nil,300]];
			_ret set[count _ret,["A3LPikaShirt",nil,300]];
			_ret set[count _ret,["POP_Fracasado",nil,300]];
			_ret set[count _ret,["POP_Mano",nil,300]];
			_ret set[count _ret,["POP_Mario",nil,300]];
			_ret set[count _ret,["RastaCiv",nil,300]];
			_ret set[count _ret,["CUP_U_C_Rocker_01",nil,300]];
			_ret set[count _ret,["A3LTigerShirt",nil,300]];
			_ret set[count _ret,["POP_BC",nil,300]];
			_ret set[count _ret,["POP_OV",nil,300]];
			_ret set[count _ret,["POP_RM",nil,300]];
			_ret set[count _ret,["POP_Valen",nil,300]];
			_ret set[count _ret,["U_C_Polo_Toulouse",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F13",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F14",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F7",nil,300]];
			_ret set[count _ret,["EF_FEM_4",nil,300]];
			_ret set[count _ret,["EF_FEM_6",nil,300]];
			_ret set[count _ret,["POP_CHAW_0",nil,300]];
			_ret set[count _ret,["POP_CHAW_1",nil,300]];
			_ret set[count _ret,["POP_CHAW_2",nil,300]];
			_ret set[count _ret,["POP_CHAW_3",nil,300]];
			_ret set[count _ret,["POP_CHAW_4",nil,300]];
			_ret set[count _ret,["POP_CHAW_5",nil,300]];
			_ret set[count _ret,["EF_suit_1",nil,300]];
			_ret set[count _ret,["EF_suit_2",nil,300]];
			_ret set[count _ret,["EF_suit_3",nil,300]];
			_ret set[count _ret,["EF_suit_4",nil,300]];
			_ret set[count _ret,["EF_suit_5",nil,300]];
			_ret set[count _ret,["EF_suit_6",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BLK_F",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F3",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F4",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F5",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F6",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F7",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F8",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F9",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F10",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F11",nil,300]];
			_ret set[count _ret,["KAEL_SUITS_BR_F13",nil,300]];
			_ret set[count _ret,["TRYK_U_Bts_GRYGRY_PCUs",nil,300]];
			_ret set[count _ret,["TRYK_U_B_wh_OD_Rollup_CombatUniform",nil,300]];
			_ret set[count _ret,["TRYK_shirts_DENIM_BK",nil,300]];
			_ret set[count _ret,["TRYK_shirts_DENIM_od",nil,300]];
			_ret set[count _ret,["TRYK_shirts_DENIM_WH",nil,300]];
			_ret set[count _ret,["TRYK_shirts_DENIM_ylb_Sleeve",nil,300]];
			_ret set[count _ret,["TRYK_shirts_BLK_PAD_BLU3",nil,300]];
			_ret set[count _ret,["TRYK_shirts_BLK_PAD_RED2",nil,300]];
			_ret set[count _ret,["TRYK_shirts_OD_PAD_YEL",nil,300]];
			_ret set[count _ret,["TRYK_U_nohoodPcu_gry",nil,300]];
			_ret set[count _ret,["TRYK_T_BLK_PAD",nil,300]];
			_ret set[count _ret,["TRYK_T_OD_PAD",nil,300]];
			_ret set[count _ret,["TRYK_T_TAN_PAD",nil,300]];
			_ret set[count _ret,["TRYK_U_denim_hood_blk",nil,300]];
			_ret set[count _ret,["TRYK_T_camo_tan",nil,300]];
			_ret set[count _ret,["TRYK_U_B_BLK_T_BG_WH",nil,300]];
			_ret set[count _ret,["TRYK_U_B_BLK_T_BK",nil,300]];
			_ret set[count _ret,["TRYK_U_B_RED_T_BR",nil,300]];
			_ret set[count _ret,["TRYK_U_B_Denim_T_WH",nil,300]];
			_ret set[count _ret,["TRYK_U_B_Denim_T_BK",nil,300]];
			_ret set[count _ret,["U_BasicBodyICE123",nil,300]];
			_ret set[count _ret,["rds_uniform_Profiteer1",nil,300]];
			_ret set[count _ret,["rds_uniform_Profiteer2",nil,300]];
			_ret set[count _ret,["rds_uniform_Profiteer3",nil,300]];
			_ret set[count _ret,["rds_uniform_Profiteer4",nil,300]];
			_ret set[count _ret,["rds_uniform_citizen1",nil,300]];
			_ret set[count _ret,["rds_uniform_citizen2",nil,300]];
			_ret set[count _ret,["rds_uniform_citizen3",nil,300]];
			_ret set[count _ret,["rds_uniform_citizen4",nil,300]];
			_ret set[count _ret,["rds_uniform_Woodlander1",nil,300]];
			_ret set[count _ret,["rds_uniform_Woodlander2",nil,300]];
			_ret set[count _ret,["rds_uniform_Woodlander3",nil,300]];
			_ret set[count _ret,["rds_uniform_Woodlander4",nil,300]];
			_ret set[count _ret,["rds_uniform_Worker1",nil,300]];
			_ret set[count _ret,["rds_uniform_Worker2",nil,300]];
			_ret set[count _ret,["rds_uniform_Worker3",nil,300]];
			_ret set[count _ret,["rds_uniform_Worker4",nil,300]];
			_ret set[count _ret,["rds_uniform_Villager1",nil,300]];
			_ret set[count _ret,["rds_uniform_Villager2",nil,300]];
			_ret set[count _ret,["rds_uniform_Villager3",nil,300]];
			_ret set[count _ret,["rds_uniform_Villager4",nil,300]];
			_ret set[count _ret,["TRYK_U_B_PCUGs_gry",nil,300]];
			_ret set[count _ret,["TRYK_U_B_PCUGs_OD",nil,300]];
			_ret set[count _ret,["TRYK_U_B_wh_tan_Rollup_CombatUniform",nil,300]];
			_ret set[count _ret,["TRYK_U_B_wh_blk_Rollup_CombatUniform",nil,300]];
			_ret set[count _ret,["TRYK_SUITS_BLK_F",nil,300]];
			_ret set[count _ret,["TRYK_SUITS_BR_F",nil,300]];
			_ret set[count _ret,["TRYK_U_pad_hood_Cl_blk",nil,300]];
			_ret set[count _ret,["TRYK_U_pad_hood_odBK",nil,300]];
			_ret set[count _ret,["RAPTORS2_Pop",nil,300]];
			_ret set[count _ret,["PACMAN_Pop",nil,300]];
			_ret set[count _ret,["JWORLD_Pop",nil,300]];
			_ret set[count _ret,["RAPTORS_Pop",nil,300]];
			_ret set[count _ret,["KITKAT_Pop",nil,300]];
			_ret set[count _ret,["MARITRINI_Pop",nil,300]];
			_ret set[count _ret,["IBERDROGA_Pop",nil,300]];
			_ret set[count _ret,["CHAQUETANEGRA_Pop",nil,300]];
			_ret set[count _ret,["U_C_Slender",nil,500]];
			_ret set[count _ret,["TRYK_U_B_BLK_Tshirt",nil,800]];
			_ret set[count _ret,["TRYK_U_B_BLK",nil,800]];
			_ret set[count _ret,["terminator2",nil,800]];
        };
		
        if(__GETC__(life_donator) > 1) then
        {
            //_ret set[count _ret,["POP_RM",nil,300]];	
        };
		
    };
	
	//Hats
	case 1:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
	    _ret set[count _ret,["H_KermitMask",nil,150]];
		_ret set[count _ret,["H_HulkMask",nil,150]];
		_ret set[count _ret,["H_GingerbreadMask",nil,150]];
		_ret set[count _ret,["H_GrantMask",nil,150]];
		_ret set[count _ret,["H_GuyFawkesMask",nil,150]];
		_ret set[count _ret,["H_SpidermanMask",nil,150]];
		_ret set[count _ret,["pop_gorra_bermu",nil,150]]; 
		_ret set[count _ret,["BOINA_gardonha",nil,150]];  
		_ret set[count _ret,["BOINA_dante",nil,150]];
		_ret set[count _ret,["BOINA_penas",nil,150]];
		_ret set[count _ret,["pop_gorra_gustavo2",nil,150]];
		_ret set[count _ret,["BOINA_dorko",nil,150]];
		_ret set[count _ret,["BOINA_ELN",nil,150]];
		_ret set[count _ret,["pop_gorra_adidaswoman",nil,150]];
		_ret set[count _ret,["pop_gorra_batman",nil,150]];
		_ret set[count _ret,["pop_gorra_ballas",nil,150]];
		_ret set[count _ret,["pop_gorra_creeper",nil,150]];
		_ret set[count _ret,["pop_gorra_deadpool",nil,150]];
		_ret set[count _ret,["pop_gorra_grobe",nil,150]];
		_ret set[count _ret,["pop_gorra_metropolis",nil,150]];
		_ret set[count _ret,["pop_gorra_nike",nil,150]];
		_ret set[count _ret,["pop_gorra_gustavo",nil,150]];
		_ret set[count _ret,["pop_gorra_ss",nil,150]];
		_ret set[count _ret,["pop_gorra_anto",nil,150]];
		_ret set[count _ret,["gorro_rojo",nil,150]];
		_ret set[count _ret,["gorro_azul",nil,150]];
		_ret set[count _ret,["gorro_violeta",nil,150]];
		_ret set[count _ret,["gorro_verde",nil,150]];
		  _ret set[count _ret,["pop_mascara_hannibal",nil,150]];		
		   _ret set[count _ret,["pop_stormtrooper",nil,150]];
		   _ret set[count _ret,["Payday_GeneralO",nil,150]];
		   _ret set[count _ret,["pop_palestino",nil,150]];
		   _ret set[count _ret,["Kio_Pirate_Hat",nil,150]];
		   _ret set[count _ret,["H_GuyFawkesMask",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_blood",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_fire",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_weed",nil,150]];
		   _ret set[count _ret,["pop_corona",nil,150]];
		   _ret set[count _ret,["H_KermitMask",nil,150]];
		   _ret set[count _ret,["pop_corvus",nil,150]];
		   _ret set[count _ret,["Masque_forceAlpha",nil,150]];
		   _ret set[count _ret,["Masque_Metalhead",nil,150]];
		   _ret set[count _ret,["H_MickeyMask",nil,150]];
		   _ret set[count _ret,["H_StarFoxMask",nil,150]];
		   _ret set[count _ret,["H_Soccer_Orange",nil,150]];
		   _ret set[count _ret,["Casque_Moto",nil,150]];
		   _ret set[count _ret,["Kio_Afro_Hat",nil,150]];		  
		   _ret set[count _ret,["pop_mascara",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_2",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_3",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_4",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_5",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_6",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_7",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_8",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_9",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_10",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_11",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_12",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_13",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_14",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_15",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_16",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_17",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_18",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_19",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_20",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_21",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_22",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_23",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_24",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_25",nil,150]];		  
		   _ret set[count _ret,["pop_mascara_26",nil,150]];
	       _ret set[count _ret,["pop_robocop",nil,150]];
	       //_ret set[count _ret,["pop_pervert",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_red",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_grn",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_fire",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_weed",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_frost",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_pun",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_adc",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_blood",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_redranger",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_UK",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_US",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_black",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_can",nil,150]];
	       _ret set[count _ret,["kio_skl_msk_german",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_GOW",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_grey",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_irish",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_nirish",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_o",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_p",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_scot",nil,150]];
		   _ret set[count _ret,["kio_skl_msk_fran",nil,150]];
		   _ret set[count _ret,["rds_police_cap",nil,150]];
		   _ret set[count _ret,["rds_Woodlander_cap4",nil,150]];
		   _ret set[count _ret,["rds_Woodlander_cap1",nil,150]];
		   _ret set[count _ret,["rds_Woodlander_cap3",nil,150]];
		   _ret set[count _ret,["rds_Woodlander_cap2",nil,150]];
		   _ret set[count _ret,["rds_worker_cap1",nil,150]];
		   _ret set[count _ret,["rds_worker_cap2",nil,150]];
		   _ret set[count _ret,["rds_worker_cap3",nil,150]];
		   _ret set[count _ret,["rds_worker_cap4",nil,150]];
		   _ret set[count _ret,["H_ShrekMask",nil,150]];
		   _ret set[count _ret,["H_AugustusMask",nil,150]];
		   _ret set[count _ret,["H_ObamaMask",nil,150]];
		   _ret set[count _ret,["H_VenomMask",nil,150]];
		   _ret set[count _ret,["H_KermitMask",nil,150]];
		   _ret set[count _ret,["Masque_Mempo",nil,150]];
		   _ret set[count _ret,["Masque_Metalhead",nil,150]];
		   _ret set[count _ret,["Masque_Mark",nil,150]];
		   _ret set[count _ret,["Masque_Orc",nil,150]];
		   _ret set[count _ret,["Masque_Lion",nil,150]];
		   _ret set[count _ret,["Masque_archNemesis",nil,150]];
		   _ret set[count _ret,["Masque_Optimiste",nil,150]];
		   _ret set[count _ret,["Masque_forceAlpha",nil,150]];
		   _ret set[count _ret,["H_UltronMask",nil,150]];
		   _ret set[count _ret,["BOINA_boinagustavo",nil,150]];
		      
       };	
	};
	
	//Glasses
	case 2:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
	   		
			_ret set[count _ret,["G_EWK_Shemag_LULZ",nil,60]];
			_ret set[count _ret,["TRYK_kio_balaclavas",nil,60]];	
			_ret set[count _ret,["Payday_Cagoule",nil,60]];	
			_ret set[count _ret,["Masque_Solitaire",nil,60]];	
			_ret set[count _ret,["mgsr_eyepatch_goggles",nil,60]];	
			_ret set[count _ret,["pop_chupete",nil,60]];	
	
	   };	
	};
	
	//Vest
	case 3:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
			_ret set[count _ret,["pop_chaleco_cmd_cmd_79",nil,250]];
			_ret set[count _ret,["pop_chaleco_cmd_cmd_80",nil,250]];
			_ret set[count _ret,["pop_chaleco_cmd_cmd_81",nil,250]];
			_ret set[count _ret,["pop_chaleco_cmd_cmd_76",nil,250]];
			_ret set[count _ret,["pop_chaleco_cmd_cmd_78",nil,250]];
			_ret set[count _ret,["pop_chaleco_cmd_cmd_77",nil,250]];
			_ret set[count _ret,["pop_chaleco_cmd_cmd_73",nil,250]];
			_ret set[count _ret,["pop_chaleco_cmd_cmd_71",nil,250]];
			_ret set[count _ret,["pop_chaleco_cmd_cmd_72",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_11",nil,250]];
		   _ret set[count _ret,["pop_chaleco_cmd_cmd_37",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_16",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_20",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_50",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_53",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_57",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_23",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_31",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_32",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_4",nil,250]];
	       _ret set[count _ret,["pop_chaleco_cmd_cmd_9",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_1",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_2",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_3",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_4",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_5",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_6",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_7",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_8",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_9",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_10",nil,250]];
		   _ret set[count _ret,["pop_chaleco_cmd_cmd_67",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_11",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_12",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_13",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_14",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_15",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_16",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_17",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_18",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_19",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_20",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_21",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_22",nil,250]];
		   _ret set[count _ret,["pop_moteros_cha_23",nil,250]];
		   _ret set[count _ret,["TAC_V_Sheriff_BA_TB",nil,250]];
		   _ret set[count _ret,["TAC_PBDFG2C_B_1",nil,250]];
		   _ret set[count _ret,["TAC_V_Sheriff_BA_TB2",nil,250]];
		   _ret set[count _ret,["TAC_PBDFG2CPL_BK",nil,250]];		   
       };	
	};
	
	//Backpacks
	case 4:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {			
	       _ret set[count _ret,["B_Hello_Kitty",nil,250]];
	       _ret set[count _ret,["CUP_B_AssaultPack_Black",nil,250]];
           _ret set[count _ret,["CUP_B_AssaultPack_Coyote",nil,250]];
           _ret set[count _ret,["B_AssaultPack_cbr",nil,250]];
		   _ret set[count _ret,["B_AssaultPack_blk",nil,250]];
		   _ret set[count _ret,["B_FieldPack_cbr",nil,250]];
		   _ret set[count _ret,["mochila_pequena",nil,250]];
		   _ret set[count _ret,["mochila_grande",nil,300]];
		   _ret set[count _ret,["CUP_B_Bergen_BAF",nil,250]];
		   _ret set[count _ret,["A3L_BergenMurica",nil,250]];
		   _ret set[count _ret,["B_Carryall_cbr",nil,250]];
       };	
	};
};

_ret;