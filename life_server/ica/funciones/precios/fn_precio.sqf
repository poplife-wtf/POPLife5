
/*


*/

_cosa = _this select 0;
_modo = _this select 1; // true precio de compra, false de venta

private "_n";

if (_modo) then { // compra
	_n = switch (_cosa) do {
		case "pop_P_Barbacoa": {20};
		case "pop_P_Clasica": {20};
		case "pop_P_Oliva": {20};
		case "pop_P_Originales": {20};
		case "pop_P_Queso": {20};
		case "pop_G_Ahoy": {15};
		case "pop_G_Chocolate": {25};
		case "pop_G_Oreo": {20};
		case "pop_R_Pepsi": {15};
		case "pop_R_Naranja": {15};
		case "pop_R_7up": {15};
		case "pop_R_Superstar": {20};
		case "pop_R_monster": {20};
		case "pop_R_Pepper": {20};
		case "pop_pringles": {20};
		case "pop_H_Fresa": {15};
		case "pop_H_vainilla": {15};
		case "pop_H_Napolitana": {15};
		case "pop_cheseburge": {25};
		case "pop_pizza": {25};
		case "pop_tostada": {15};
		case "pop_pistacho": {20};
		case "pop_kiwi": {25};
		case "pop_banana": {22};
		case "patatas_huevos": {22};
		case "Fapret_Kebap": {22};
		case "pop_churros": {22};
		case "pop_vaso": {22};
		case "pop_apple": {22};
		case "pop_armario1_inv": {1500};
		case "pop_armario2_inv": {1500};
		case "pop_nevera_inv": {1500};
		case "pop_mesa_tv_inv": {1500};
		case "pop_sofa_inv": {1500};
		
		case "pop_alcohol": {275};
		
		case "pop_esposas": {25};
		case "pop_Ganzua": {25};
        
		case "RH_cz75": {7000};		
		case "RH_16Rnd_9x19_cz": {120};
		case "RH_sw659": {7000};
		case "RH_14Rnd_9x19_sw": {100};
		case "RH_usp": {70000};
		case "RH_12Rnd_45cal_usp": {120};
		case "RH_mak": {7000};
		case "RH_8Rnd_9x18_Mak": {100};
		case "RH_uspm": {7000};
		case "RH_16Rnd_40cal_usp": {100};
		case "RH_m9": {7500};
		case "RH_m9c": {7500};
		case "RH_15Rnd_9x19_M9": {100};
		case "RH_tt33": {7500};
		case "RH_8Rnd_762_tt33": {100};
		case "RH_mk2": {7500};
		case "RH_10Rnd_22LR_mk2": {100};
		case "RH_p226": {7000};
		case "RH_p226s": {7000};
		case "RH_15Rnd_9x19_SIG": {100};
		case "RH_mateba": {7000};
		case "RH_6Rnd_44_Mag": {100};
		case "RH_python": {7000};
		case "RH_mp412": {7000};
		case "RH_6Rnd_357_Mag": {100};
		case "RH_bull": {7500};
		case "RH_bullb": {7500};
		case "RH_6Rnd_454_Mag": {100};
		case "RH_fnp45": {7500};
		case "RH_fnp45t": {7500};
		case "RH_15Rnd_45cal_fnp": {100};
		case "RH_fn57": {7500};
		case "RH_fn57_g": {7500};
		case "RH_fn57_t": {7500};
		case "RH_20Rnd_57x28_FN": {100};
		case "RH_gsh18": {7000};
		case "RH_18Rnd_9x19_gsh": {100};
		case "hgun_Pistol_heavy_01_F": {7000};
		case "11Rnd_45ACP_Mag": {100};
		case "hgun_ACPC2_F": {7000};
		case "9Rnd_45ACP_Mag": {100};
		case "hgun_P07_F": {7000};
		case "hgun_Rook40_F": {7000};
		case "16Rnd_9x21_Mag": {100};
		case "hgun_Pistol_heavy_02_F": {7000};
		case "6Rnd_45ACP_Cylinder": {100};
	    case "RH_ttracker": {7500};
		case "RH_6Rnd_45ACP_Mag": {100};
		
		case "pop_vendas": {5};
		case "pop_vendas_c": {5};
		case "pop_morfina": {5};
		case "pop_epinefrina": {5};
		case "pop_metadona": {100};	
		case "pop_drogotest": {500};		
		case "pop_tramadol": {5};
		case "pop_desfibrilador": {150};
		case "pop_bolsadesangre": {5};
		case "pop_oxigeno": {5};
		case "pop_jarabe": {5};
		case "pop_aguaoxigenada": {50};
		case "pop_cajademedicamentos": {50};
		case "pop_yodo": {5};
		case "pop_csi": {5};
		case "pop_bisturi_item": {80}; 
		case "pop_pancarta": {25};
		case "pop_prob_inv": {5};
		case "pop_armariop": {15000};
		
		case "pop_rabano_s": {4};
		case "pop_trigo_s": {4};
		case "pop_algodon_s": {5};
		case "pop_maiz_s": {5};
		case "pop_bamboo_s": {5};
		case "pop_cannabis_s": {25};
		case "pop_girasol_s": {5};
		
		case "ACE_atropine": {5}; 
		case "ACE_fieldDressing": {5};
		case "ACE_elasticBandage": {5};
		case "ACE_quikclot": {5};    
		case "ACE_bloodIV ": {5};       
		case "ACE_bloodIV_500": {5};    
		case "ACE_bloodIV_250 ": {5};   
		case "ACE_bodyBag ": {5};       
		case "ACE_bodyBagObject": {5};
		case "ACE_epinephrine": {5};
		case "ACE_morphine": {5};
		case "ACE_packingBandage": {5};
		case "ACE_personalAidKit": {15};
		case "ACE_plasmaIV ": {5};   
		case "ACE_plasmaIV_500": {15};
		case "ACE_plasmaIV_250": {5};
		case "ACE_salineIV ": {5};   
		case "ACE_salineIV_500": {15};
		case "ACE_salineIV_250": {5};
		case "ACE_surgicalKit": {5};    
		case "ACE_tourniquet": {5};
		case "ACE_atropine": {5};

		
		case "pop_linterna": {10};
		case "pop_pico_h": {150};
		case "pop_hacha_f": {150};
		case "pop_pala_h": {150};
		case "ItemRadio": {10};
		case "ToolKit": {180};
		case "ItemMap": {10};
		case "pop_note": {25};
		case "Binocular": {75};
		case "pop_iphone": {50};
		case "pop_nokia": {25};
		case "ItemGPS": {15};
		case "pop_llaves": {15};
		case "mgsr_headbag": {150};
		case "pop_componentes": {110};
		case "pop_granlingote": {125};
		case "pop_oxigeno": {250};
		case "soplete": {1150};
		case "pop_portatil": {150};
		case "pop_navaja": {1150};
		case "POP_senal_cuadrada_i": {25};
		case "POP_senal_alcoholemiagc_i": {25};
		case "POP_senal_control_policia_i": {25};
		case "POP_senal_stop_i": {25};
		case "POP_senal_derecha_i": {25};
		case "POP_senal_izquierda_i": {25};
		case "POP_senal_estrechamiento_i": {25};
		case "POP_senal_velocidad20_i": {25};
		case "POP_senal_velocidad40_i": {25};
		case "POP_banda_i": {25};
		case "POP_tetrapodo_i": {25};
		case "POP_tetrapodo_x3_i": {25};
		case "POP_tetrapodo_x5_i": {25};
		case "POP_tetrapodo_x7_i": {25};
		case "POP_electroflare_i": {25};
		case "optic_Arco": {2500};

		case "Mr_Micro_News": {200};
		case "POPTV_Pop": {250};
		case "H_Cap_press": {200};
		case "V_Press_F": {200};
		case "Mr_Camera_News": {200};
	
		case "pop_correos":{550};

		case "MeleeKatana": {3000};
		case "MeleePickaxe": {3000};
		case "MeleeHammer": {3000};
		case "MeleeHammer2": {3000};
		case "MeleeCrowbar": {3000};
		case "MeleeClub": {3000};
		case "MeleeHatchet": {3000};

	    case "KAEL_SUITS_BR_Judge":{50};
	    case "RH_deagle":{7500}; 
	    case "RH_7Rnd_50_AE":{50};
		case "mochila_pequena":{50};
		case "ACE_fieldDressing":{5};
		case "ACE_elasticBandage":{5};
		case "ACE_quikclot":{5};
		case "ACE_bloodIV":{5};
		case "ACE_bloodIV_500":{5};
		case "ACE_bloodIV_250":{5};
		case "ACE_bodyBag":{5};
		case "ACE_bodyBagObject":{5};
		case "ACE_epinephrine":{5};
		case "ACE_morphine":{5};
		case "ACE_packingBandage":{5};
		case "ACE_personalAidKit":{5};
		case "ACE_plasmaIV":{5};
		case "ACE_plasmaIV_500":{5};
		case "ACE_plasmaIV_250":{5};
		case "ACE_salineIV":{5};
		case "ACE_salineIV_500":{5};
		case "ACE_salineIV_250":{5};
		case "ACE_surgicalKit":{5};
		case "ACE_tourniquet":{5};
		
	};
	if (Desc isEqualTo 1) then { _n = round (_n)} else {_n = round (_n * Desc)};
} 
else { // venta
	_n = switch (_cosa) do {
		case "pop_coca_b": {100};
		case "pop_efedrina_b": {100};
		case "pop_opio_b": {100};
		case "pop_cannabis_i": {100};
		case "pop_cocaina_f": {800};
		case "pop_metanfetamina_f": {800};
		case "pop_heroina_f": {800};
		case "pop_marihuana_f": {800};
		case "pop_basura_item":{15};
		case "pop_estomago_item":{1500};
		case "pop_ojos_item":{1500};
		case "pop_corazon_item":{1500};
		case "pop_diamante_t":{1100};
		case "pop_pez2":{150}; 
		case "pop_pez3":{200};
		case "pop_pez4":{250};
		case "pop_tiburon":{300};
		case "Fapret_Bateria": {200};
		case "Fapret_Capo": {220};
		case "Fapret_Carroceria": {180};
		case "Fapret_Escape": {180};
		case "Fapret_Faros": {220};
		case "Fapret_Par_Pistones": {180};
		case "Fapret_Piston": {200};
		case "Fapret_Puerta": {220};
		case "Fapret_Rueda": {200};
		case "Fapret_Techo": {170};
		case "Fapret_Oro": {220};
		case "Fapret_Plata": {150};
		case "Fapret_Cobre": {120};
		case "pop_lana": {70};		

	};

};


// Por si acaso
if (isNil {_n}) exitWith {
	if (_modo) then {
		_n = 999999999; // 999 millones
	} else {
		_n = 0;
	};
	_n
};
if ((typeName _n) != "SCALAR") exitWith {
	if (_modo) then {
		_n = 999999999; // 999 millones
	} else {
		_n = 0;
	};
	_n
};

round _n