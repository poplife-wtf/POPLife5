
/*


*/

_param = _this select 0;

switch (_param) do {
	// Compra
	case "Tienda general": { ["ToolKit","ItemGPS","mgsr_headbag","Binocular","pop_note","pop_iphone","pop_nokia","ACE_tourniquet","ACE_fieldDressing","ItemMap","pop_portatil","pop_pico_h","pop_pala_h","pop_hacha_f","pop_Ganzua","pop_pistacho","pop_navaja","pop_pancarta","pop_armario1_inv","pop_armario2_inv","pop_nevera_inv","pop_mesa_tv_inv","pop_sofa_inv"]	};
	case "Tienda de taxista": { ["Binocular","ItemGPS","ToolKit"] };
	case "Paqueteria correos": { ["pop_correos"] };
	case "Tienda del periodista": { ["Mr_Micro_News","Mr_Camera_News","ItemGPS","ToolKit","POPTV_Pop","H_Cap_press","V_Press_F"] };
	case "Tienda de los chinos": { ["pop_P_Barbacoa","pop_P_Queso","pop_P_Originales","pop_R_Pepsi","pop_R_Superstar","pop_R_Pepper","pop_H_Fresa","pop_alcohol"] };
	case "super": { ["ToolKit","pop_pistacho","pop_G_Chocolate","pop_G_Oreo","pop_G_Ahoy","pop_R_Pepsi","pop_R_Superstar","pop_R_Pepper","pop_H_Fresa"] };
	case "Economato": { ["pop_P_Clasica","pop_G_Chocolate","pop_R_Naranja","pop_pringles","pop_H_vainilla","pop_kiwi","pop_Ganzua","pop_prob_inv","pop_pistacho","ToolKit","pop_note","pop_iphone","pop_nokia","ItemMap","ItemGPS"] };
	case "Pizzeria hamburgueseria": { ["patatas_huevos","pop_cheseburge","pop_pizza","pop_tostada","pop_banana","pop_kiwi","pop_pistacho","pop_apple","pop_R_Pepsi","pop_R_Naranja"] };
	case "Farmacia EMS": { ["pop_metadona","ACE_atropine","ACE_fieldDressing","ACE_elasticBandage","ACE_quikclot","ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250","ACE_bodyBag","ACE_bodyBagObject","ACE_epinephrine","ACE_morphine","ACE_packingBandage","ACE_personalAidKit","ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250","ACE_salineIV","ACE_salineIV_500","ACE_salineIV_250","ACE_surgicalKit","ACE_tourniquet"] };
//	case "Farmacia EMS": { ["pop_bisturi_item","pop_vendas","ACE_tourniquet","ACE_fieldDressing","pop_metadona","pop_morfina","pop_epinefrina","pop_tramadol","pop_desfibrilador","pop_bolsadesangre","pop_csi","POP_senal_stop_i","POP_senal_derecha_i","POP_senal_izquierda_i","POP_senal_estrechamiento_i","POP_senal_velocidad20_i","POP_senal_velocidad40_i","POP_banda_i","POP_tetrapodo_i","POP_tetrapodo_x3_i","POP_tetrapodo_x5_i","POP_tetrapodo_x7_i","POP_electroflare_i"] };
	case "Supermercado para polis": { ["pop_drogotest","pop_P_Oliva","pop_G_Oreo","ACE_tourniquet","ACE_fieldDressing","pop_kiwi","pop_R_7up","pop_portatil","pop_pringles","pop_llaves","pop_H_Napolitana","pop_Ganzua","pop_esposas","pop_pistacho","ToolKit","pop_note","pop_iphone","pop_nokia","ItemMap","ItemGPS","pop_csi","pop_granlingote","pop_oxigeno","soplete","pop_componentes"] };
	case "Tienda chunga": { ["pop_P_Originales","pop_G_Oreo","pop_R_monster","pop_pringles","pop_H_Napolitana","ACE_tourniquet","ACE_fieldDressing","pop_Ganzua","pop_portatil","pop_esposas","pop_llaves","pop_pistacho","ToolKit","pop_note","pop_iphone","pop_nokia","ItemMap","ItemGPS"] };
	case "Armeria": {	["RH_cz75","RH_16Rnd_9x19_cz", 0,"RH_sw659","RH_14Rnd_9x19_sw", 0,"RH_usp","RH_12Rnd_45cal_usp", 0,"RH_mak","RH_8Rnd_9x18_Mak", 0,"RH_uspm","RH_16Rnd_40cal_usp", 0,"RH_m9","RH_15Rnd_9x19_M9", 0,"RH_tt33","RH_8Rnd_762_tt33", 0,"RH_mk2","RH_10Rnd_22LR_mk2", 0,"RH_p226","RH_15Rnd_9x19_SIG", 0,"RH_mateba","RH_6Rnd_44_Mag", 0,"RH_python","RH_mp412","RH_6Rnd_357_Mag"]	};
	case "Armeria 2": { ["RH_bull","RH_bullb","RH_6Rnd_454_Mag", 0,"RH_ttracker","RH_6Rnd_45ACP_Mag", 0,"RH_fnp45","RH_fnp45t","RH_15Rnd_45cal_fnp", 0,"RH_fn57","RH_fn57_g","RH_fn57_t","RH_20Rnd_57x28_FN", 0,"RH_gsh18","RH_18Rnd_9x19_gsh", 0,"hgun_Pistol_heavy_01_F","11Rnd_45ACP_Mag", 0,"hgun_ACPC2_F","9Rnd_45ACP_Mag", 0,"hgun_P07_F","hgun_Rook40_F","16Rnd_9x21_Mag", 0,"hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"] };
	case "Tienda de semillas": { ["pop_rabano_s","pop_bamboo_s","pop_algodon_s","pop_maiz_s","pop_cannabis_s","pop_trigo_s","pop_girasol_s"] };
	case "Tienda alcalde": { ["KAEL_SUITS_BR_Judge","mochila_pequena","RH_deagle","RH_7Rnd_50_AE","pop_iphone","ACE_tourniquet","ACE_fieldDressing","ItemGPS","pop_esposas","pop_llaves","pop_kiwi","ToolKit","pop_R_Superstar"] };
	case "Tienda de Kebap": { ["Fapret_Kebap","pop_R_Pepsi","pop_R_Superstar","pop_R_Pepper"] };
	case "Tienda de Churros": { ["pop_churros","pop_vaso"] };
	case "Supermercado SP": { ["pop_drogotest","pop_P_Oliva","pop_G_Oreo","ACE_tourniquet","ACE_fieldDressing","pop_kiwi","pop_R_7up","pop_portatil","pop_pringles","pop_llaves","pop_H_Napolitana","pop_Ganzua","pop_esposas","pop_pistacho","ToolKit","pop_note","pop_iphone","pop_nokia","ItemMap","ItemGPS","pop_csi","pop_granlingote","pop_oxigeno","soplete","pop_componentes"] };
	// Venta
	case "Planta de reciclaje": { ["pop_basura_item"] };
    case "Tienda de incautaciones": { ["pop_coca_b","pop_efedrina_b","pop_opio_b","pop_cannabis_i","pop_cocaina_f","pop_metanfetamina_f","pop_heroina_f","pop_marihuana_f"] };
    case "mercado negro": { ["pop_ojos_item","pop_corazon_item","pop_estomago_item"] };	
	case "Tienda de tesoros": { ["pop_diamante_t"] };
	case "Chatarrero": { ["Fapret_Bateria","Fapret_Capo","Fapret_Carroceria","Fapret_Escape","Fapret_Faros","Fapret_Par_Pistones","Fapret_Piston","Fapret_Puerta","Fapret_Rueda","Fapret_Techo"] };
	case "Tesorero": { ["Fapret_Oro","Fapret_Plata","Fapret_Cobre"] };
	case "Lana": { ["pop_lana"] };
    
	//case "Pescaderia": { ["pop_pez2","pop_pez3","pop_pez4","pop_tiburon"] };	
	};