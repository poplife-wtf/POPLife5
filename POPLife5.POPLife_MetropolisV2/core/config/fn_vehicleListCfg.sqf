
#include <macro.h>
/*
        File:
        Author: Bryan "Tonic" Boardwine
		Limpiada Por Heisenberg / DanielMaster
		Rellenada Por DanielMaster

        Description:
        Master configuration list / array for buyable vehicles & prices and their shop.
*/
private ["_shop", "_return"];
_shop = [_this, 0, "", [""]] call BIS_fnc_param;
if (_shop == "") exitWith { []};
_return = [];
switch (_shop) do {
	case "dezzie_car": {
		_return = [
			// Tienda Vehiculos Competición
			["pop_ford_gt402", 600000 * Desc],
			["pop_ford_gt403", 600000 * Desc],
			["pop_amg_GT_rojo", 600000 * Desc],
			["pop_laferrari_D", 600000 * Desc],
			["pop_laferrari_amarillo", 600000 * Desc],
			["pop_furai", 600000 * Desc],
			["pop_mp1_D", 600000 * Desc],
			["pop_chevrolet_naranja", 600000 * Desc],
			["pop_chevrolet_negro", 600000 * Desc],
			["pop_chevrolet_azul", 600000 * Desc],
			["pop_chevrolet_amarillo", 600000 * Desc],
			["pop_zonda_s1", 600000 * Desc],
			["pop_r8MP_4", 600000 * Desc],
			["pop_r8MP_5", 600000 * Desc],
			["pop_r8MP_3", 600000 * Desc],
			["pop_mono", 600000 * Desc],
			["pop_Caterham_2", 600000 * Desc],
			["pop_Caterham_3", 600000 * Desc],
			["pop_GT3", 600000 * Desc],
			["pop_GT3_blanco", 600000 * Desc],
			["pop_GT3_azul", 600000 * Desc],
			["pop_megane_GT3_2", 600000 * Desc],
			["pop_lola_1", 600000 * Desc],
			["pop_lola_2", 600000 * Desc],
			["pop_lola_4", 600000 * Desc],
			["pop_lola_7", 600000 * Desc],
			["pop_lola_8", 600000 * Desc],
			["pop_lola_9", 600000 * Desc]
			//["pop_furai_negro", 150000 * Desc],
			//["pop_furai_rojo", 150000 * Desc],
			//["pop_furai_amarillo", 150000 * Desc],
			//["pop_furai_naranja", 150000 * Desc],
			//["pop_LamborghiniVeneno_negro", 150000 * Desc],
			//["pop_LamborghiniVeneno_negro1", 150000 * Desc],
			//["pop_LamborghiniVeneno_gris", 150000 * Desc],
			//["shounka_limo_civ_grise",100000 * Desc],
			//["shounka_limo_civ_orange",100000 * Desc],
			//["pop_lola_5", 110000 * Desc],
			//["pop_lola_6", 110000 * Desc],

		];
	};
	case "kart_shop": {
		_return = [
			["C_Kart_01_Blu_F", 1500 * Desc],
			["C_Kart_01_Fuel_F", 1500 * Desc],
			["C_Kart_01_Red_F", 1500 * Desc],
			["C_Kart_01_Vrana_F", 1500 * Desc]
		];
	};
	case "taxista_shop": {
		_return = [
			["pop_bus_p_noir", 6500 * Desc],
			["pop_peugeot508_taxi_civ", 3500 * Desc]
			//["POP_Opel_Insignia_taxi", 3500 * Desc]
		];
	};
	case "periodista_shop": {
		_return = [
			["pop_nissan_qashqai_2016_poptv1", 16000 * Desc],
			["pop_nissan_qashqai_2016_poptv2", 16000 * Desc],
			["pop_sprinter_poptv1", 16000 * Desc],
			["pop_sprinter_poptv2", 16000 * Desc]

		];
	};
	case "med_shop": {
			_return = [
				["pop_sprinter_2016_amb1", 2500],
				["pop_sprinter_corta_amb1", 2500],
				["pop_sprinter_amb1", 2000],
				["pop_renault_master_amb1", 1500],
				["pop_sprinter_caja_amb1", 3000],
				["pop_fiat_bravo_ems1", 2500],
				["pop_mitsubishi_asx_ems1", 2500],
				["pop_grua", 250],
				["POP_corbillard_c_noir", 1000],										
				["mr_stretcher", 250]				
			];
		};
	case "med_air_hs": {
			_return = [
				["ec135_ems_F", 5000],
				["gazelle_civil_4", 4500]
			];
		};
	case "exo_car": {
		_return = [

			["PKE_92_civ_bleufonce", 550000 * Desc],
			["PKE_92_civ_jaune", 550000 * Desc],
			["PKE_92_civ_rose", 550000 * Desc],
			["PKE_92_civ_grise", 550000 * Desc],
			["PKE_92_civ_violet", 550000 * Desc],
			["PKE_92_civ_orange", 550000 * Desc],
			["pop_cayenne_p_negro", 150000 * Desc],
			["pop_cayenne_p_azul", 150000 * Desc],
			["pop_cayenne_p_rojo", 150000 * Desc],
			["pop_cayenne_p_amarillo", 150000 * Desc],
			["pop_cayenne_p_rosa", 150000 * Desc],
			["pop_cayenne_p_gris", 150000 * Desc],
			["pop_cayenne_p_violeta", 150000 * Desc],
			["pop_cayenne_p_naranja", 150000 * Desc],
			["pop_evox_bleufonce", 150000 * Desc],
			["pop_evox_rouge", 150000 * Desc],
			["pop_evox_jaune", 150000 * Desc],
			["pop_evox_rose", 150000 * Desc],
			["pop_evox_violet", 150000 * Desc],
			["pop_evox_orange", 150000 * Desc],
			["pop_evox_azul_t", 200000 * Desc],
			["pop_evox_rojo_t", 200000 * Desc],
			["pop_evox_amarillo_t", 200000 * Desc],
			["pop_evox_rosa_t", 200000 * Desc],
			["pop_evox_violeta_t", 200000 * Desc],
			["pop_evox_naranja_t", 200000 * Desc],
			["pop_bmwm6_azul", 450000 * Desc],
			["pop_bmwm6_rojo", 450000 * Desc],
			["pop_bmwm6_amarillo", 450000 * Desc],
			["pop_bmwm6_rosa", 450000 * Desc],
			["pop_bmwm6_violet", 450000 * Desc],
			["pop_bmwm6_naranja", 450000 * Desc],
			["pop_bmwm4_D", 500000 * Desc],
			["pop_bmwm4_D1", 500000 * Desc],
			["pop_bmwm4_D2", 500000 * Desc],
			["pop_bmwm6_azul_t", 500000 * Desc],
			["pop_bmwm6_rojo_t", 500000 * Desc],
			["pop_bmwm6_amarillo_t", 500000 * Desc],
			["pop_bmwm6_rosa_t", 500000 * Desc],
			["pop_bmwm6_violet_t", 500000 * Desc],
			["pop_bmwm6_naranja_t", 500000 * Desc],
			["pop_chevrolet_camaro_azul", 500000 * Desc],
			["pop_chevrolet_camaro_amarillo", 500000 * Desc],
			["pop_nissan_silvia2", 500000 * Desc],
			["pop_nissan_silvia3", 500000 * Desc],
			["pop_300c_r", 500000 * Desc],
			["pop_MustangMach1Jet1969", 500000 * Desc],
			["pop_BMW750il_r", 500000 * Desc],
			["pop_Chrysler_r", 500000 * Desc],
			["pop_nissan_skyline2", 500000 * Desc],
			["pop_nissan_skyline3", 500000 * Desc],
			["pop_caymanS_z_noir", 500000 * Desc],
			["pop_lotus_GTE", 500000 * Desc],
			["pop_lotus_GTE_azul", 500000 * Desc],
			["pop_lotus_GTE_negro", 500000 * Desc],
			["pop_lotus_GTE_amarillo", 500000 * Desc],
			["pop_afla_4C_azul", 500000 * Desc],
			["pop_370Z_rojo", 500000 * Desc],
			["pop_MaybachLaundet57", 500000 * Desc],
			["pop_chevroletc7_naranja", 500000 * Desc],
			["pop_chevroletc7_amarillo", 500000 * Desc],
			["pop_chevroletc7_azul", 500000 * Desc],
			["pop_regera_naranja", 500000 * Desc],
			["pop_regera_amarillo", 500000 * Desc],
			["pop_regera_azul", 500000 * Desc],
			["pop_bmw507_d3", 500000 * Desc],
			["pop_bmw507_d1", 500000 * Desc],
			["pop_bmw507_d2", 500000 * Desc],
			//["pop_bmw507_d4", 150000 * Desc],
			["pop_lambo_miura_d", 500000 * Desc],
			["pop_bmw8_rojo", 500000 * Desc],
			["pop_m300sl1", 500000 * Desc],
			["pop_m300sl2", 500000 * Desc],
			["pop_Viper_08_n",500000 * Desc],
			["pop_Viper_08_b",500000 * Desc],
			["pop_RollsRoycePHLimo",500000 * Desc],
			["pop_RollsRoycePH_b",500000 * Desc],
			["pop_RollsRoyce011_b",500000 * Desc],
			["pop_NissanGTR_n",500000 * Desc],
			["pop_Charger_12_r",550000 * Desc],
			["pop_bmw_1series", 500000 * Desc],
			["pop_bmw_1series_bleufonce", 500000 * Desc],
			["pop_bmw_1series_grise", 500000 * Desc],
			["pop_bmw_1series_jaune", 500000 * Desc],
			["pop_bmw_1series_noir", 500000 * Desc],
			["pop_bmw_1series_orange", 500000 * Desc],
			["pop_bmw_1series_rose", 500000 * Desc],
			["pop_bmw_1series_rouge", 500000 * Desc],
			["pop_bmw_1series_violet", 500000 * Desc],
			["shounka_limo_civ_bleufonce",600000 * Desc],
			["shounka_limo_civ_rose",600000 * Desc],
			["pop_porche918", 600000 * Desc],
			["pop_ford_mondeo_azul", 600000 * Desc],
			["pop_ford_mondeo_rojo", 600000 * Desc],
			["pop_ford_mondeo_gris", 600000 * Desc],
			["pop_opel_insignia_azul", 600000 * Desc],
			["pop_opel_insignia_rojo", 600000 * Desc],
			["pop_opel_insignia_gris", 600000 * Desc],
			["pop_toyota_camry_azul", 600000 * Desc],
			["pop_toyota_camry_rojo", 600000 * Desc],
			["pop_toyota_camry_gris", 600000 * Desc]
		];
	};

    case "bus": {
		_return = [
			["pop_bus_p_noir", 6500 * Desc],
			["pop_bus_p_bleufonce", 6500 * Desc],
			["pop_bus_p_rouge", 6500 * Desc],
			["pop_bus_p_jaune", 6500 * Desc],
			["pop_bus_p_rose", 6500 * Desc],
			["pop_bus_p_grise", 6500 * Desc],
			["pop_bus_p_violet", 6500 * Desc],
			["pop_bus_p_orange", 65000 * Desc]

		];
	};
	case "moto_chop": {
		_return = [
			["pop_quad_1", 1500 * Desc],
			["shounka_harley_a3", 3000 * Desc],
			["shounka_harley_a3_noir", 3000 * Desc],
			["shounka_harley_a3_bleu", 3000 * Desc],
			["shounka_harley_a3_rouge", 3000 * Desc],
			["shounka_harley_a3_lolz", 3000 * Desc],
			["pop_quad_sport", 3500 * Desc],	
			["pop_yamaha_p", 2200 * Desc],
			["pop_yamaha_p_bf", 3260 * Desc],
			["pop_yamaha_p_g", 3260 * Desc],
			["pop_yamaha_p_j", 3260 * Desc],
			["pop_yamaha_p_noir", 3260 * Desc],
			["pop_yamaha_p_o", 3260 * Desc],
			["pop_yamaha_p_rose", 3260 * Desc],
			["pop_yamaha_p_r", 3260 * Desc],
			["pop_moto_sidecar", 3260 * Desc],
			["pop_moto_1_azul", 3260 * Desc],
			["pop_moto_1_roja", 3260 * Desc],
			["pop_moto_1_amarilla", 3260 * Desc],
			["pop_moto_2_negra", 3260 * Desc],
			["pop_honda_bizz_Roja", 3260 * Desc],
			["pop_honda_bizz_Amarilla", 3260 * Desc],
			["pop_honda_bizz_Azul", 3260 * Desc],
			["pop_bmw_1200_rt_azul", 3260 * Desc],
			["pop_bmw_1200_rt_roja", 3260 * Desc],
			["pop_bmw_1200_rt_gris", 3260 * Desc],
			["pop_bmw_1200_rt_negra", 3260 * Desc],
			["pop_bmw_1200_rt_blanca", 3260 * Desc],
			["pop_yamaha_xt660r_rojo", 3260 * Desc],
			["pop_yamaha_xt660r_gris", 3260 * Desc],
			["pop_yamaha_xt660r_blanca", 3260 * Desc],
			["pop_yamaha_xt660r_negra", 3260 * Desc]
			//["dbo_CIV_new_bike", 250 * Desc],
			//["dbo_CIV_ol_bike", 250 * Desc],
			/*
			["tcg_hrly",25000* Desc],
			["tcg_hrly_white",25000* Desc],	
			["tcg_hrly_red",25000* Desc],
			["tcg_hrly_metal",25000* Desc],
			["tcg_hrly_blue",25000* Desc],
			["tcg_hrly_limited",32000* Desc],
			["tcg_hrly_demon",32000* Desc],
			["tcg_hrly_coco",32000* Desc],
			["tcg_hrly_orig1",32000* Desc],
			["tcg_hrly_orig2",32000* Desc],
			["tcg_hrly_skeleton",40000* Desc],
			["tcg_hrly_gay",45000* Desc],
			*/
			//["pop_yamaha_p_v", 3260 * Desc]
			/*
			["pop_ducati_negra", 2500 * Desc],
			["pop_ducati_azul", 2500 * Desc],
			["pop_ducati_roja", 2500 * Desc],
			["pop_ducati_Amarilla", 2500 * Desc],
			["pop_ducati_rosa", 2500 * Desc],
			["pop_ducati_gris", 2500 * Desc],
			["pop_ducati_violeta", 2500 * Desc],
			["pop_ducati_naranja", 2500 * Desc]
			*/
		];
	};

	case "dodge_car": {
		_return = [
			// Tienda 4x4
			["shounka_buggy_noir", 75000 * Desc],
			["shounka_buggy_bleufonce", 75000 * Desc],
			["shounka_buggy_rouge", 75000 * Desc],
			["shounka_buggy_jaune", 75000 * Desc],
			["shounka_buggy_rose", 75000 * Desc],
			["shounka_buggy_grise", 75000 * Desc],
			["shounka_buggy_violet", 75000 * Desc],
			["shounka_buggy_orange", 75000 * Desc],

			["pop_mitsubishi_asx_azul", 80000 * Desc],
			["pop_mitsubishi_asx_rojo", 80000 * Desc],
			["pop_mitsubishi_asx_gris", 80000 * Desc],
			["pop_nissan_qashqai_azul", 80000 * Desc],
			["pop_nissan_qashqai_rojo", 80000 * Desc],
			["pop_nissan_qashqai_gris", 80000 * Desc],
			["pop_nissan_qashqai_2016_azul", 80000 * Desc],
			["pop_nissan_qashqai_2016_rojo", 80000 * Desc],
			["pop_nissan_qashqai_2016_gris", 80000 * Desc],
			["pop_mitsubishi_montero_azul", 82500 * Desc],
			["pop_mitsubishi_montero_gris", 82500 * Desc],
			["pop_mitsubishi_montero_rojo", 82500 * Desc],
			["pop_honda_crv_azul", 82500 * Desc],
			["pop_honda_crv_rojo", 82500 * Desc],
			["pop_honda_crv_gris", 82500 * Desc],
			["pop_jeep_grand_cherokee_azul", 82500 * Desc],
			["pop_jeep_grand_cherokee_rojo", 82500 * Desc],
			["pop_jeep_grand_cherokee_gris", 82500 * Desc],
			["pop_land_rover_freelander_azul", 82500 * Desc],
			["pop_land_rover_freelander_rojo", 82500 * Desc],
			["pop_land_rover_freelander_gris", 82500 * Desc],
			["pop_nissan_patrol_azul", 82500 * Desc],
			["pop_nissan_patrol_rojo", 82500 * Desc],
			["pop_nissan_patrol_gris", 82500 * Desc],
			["pop_nissan_xtrail_azul", 82500 * Desc],
			["pop_nissan_xtrail_rojo", 82500 * Desc],
			["pop_nissan_xtrail_gris", 82500 * Desc],
			["pop_toyota_prado_azul", 82500 * Desc],
			["pop_toyota_prado_rojo", 82500 * Desc],
			["pop_toyota_prado_gris", 82500 * Desc],

			["pop_JeepWrangler_r", 85000 * Desc],
			["pop_volvo2", 130000 * Desc],
			["pop_dacia_negro", 150000 * Desc],
			["pop_dacia_rojo", 150000 * Desc], // 200km f 350
			["pop_dacia_naranja", 150000 * Desc],
			["pop_ranger_rover3", 150000 * Desc],
			["pop_hyundai_x352", 150000 * Desc],
			["pop_rover_evo_amarillo", 155000 * Desc],
			["pop_nissan_qashqai2", 165000 * Desc],
			["pop_nissan_qashqai3", 165000 * Desc],
			["pop_GMCSerriaLarge_r", 185000 * Desc], // 240 510
			["pop_toyota_FJCruiser2", 195000 * Desc], // 250KM Fuerza 309
			["pop_toyota_FJCruiser3", 195000 * Desc],
			["pop_lexus_gx4602", 195000 * Desc], // 250km f 309
			["pop_jeep_grandcherokee2", 190000 * Desc], // 250 309
			["pop_jeep_grandcherokee3", 190000 * Desc],
			["pop_nissan_pathfinder2", 195000 * Desc],  // 250 300 
			["pop_nissan_pathfinder3", 195000 * Desc],
			["pop_Suburban2015_n", 212000 * Desc], // 250 510
			["pop_Youkun2015_b", 212000 * Desc], // 250 510
			["pop_Suburban2015_r", 212000 * Desc], // 250 510
			["pop_landcruiser", 212000 * Desc], // 250 510
			["pop_AudiQ7_r", 215000 * Desc], // 250 510
			["pop_13G65_r", 215000 * Desc], // 250 510
			["pop_HummerH2_r", 215000 * Desc],
			["pop_HummerH1_r", 215000 * Desc], // 250 510
			["pop_F350_r", 215000 * Desc], // 250 510
			["pop_F150_r", 215000 * Desc], // 250 510 
			["pop_Explorer_r", 215000 * Desc], // 250 510
			["pop_MercedesBenz6x6_r", 215000 * Desc], // 250 590
			["pop_nissan_patrol_corto", 215000 * Desc], // 260 350
			["pop_S331_morada", 215000 * Desc], // 260 510
			["pop_bmw_x52", 215000 * Desc],    // 285 350
			["pop_bmw_x53", 215000 * Desc],
			["pop_hyundai_veloster2", 215000 * Desc],
			["pop_hyundai_veloster3", 215000 * Desc], // 290 350
			["pop_tahoe_r", 215000 * Desc], // 331 350
			["pop_S331_r", 215000 * Desc],
			["pop_escalade", 215000 * Desc], // 173km 310 2000 maletero
			["pop_Vandura_civ_equipoa", 265000 * Desc]


		];
	};

	case "civ_car": {
		_return = [
			
			["pop_peugeot508_civ_noir", 22000 * Desc],
			["pop_peugeot508_civ_bleufonce", 22000 * Desc],
			["pop_peugeot508_civ_rouge", 22000 * Desc],
			["pop_peugeot508_civ_jaune", 22000 * Desc],
			["pop_peugeot508_civ_rose", 22000 * Desc],
			["pop_peugeot508_civ_grise", 22000 * Desc],
			["pop_peugeot508_civ_violet", 22000 * Desc],
			["pop_peugeot508_civ_orange", 22000 * Desc],
			["pop_peugeot508_civ_noir_t", 22000 * Desc],
			["pop_peugeot508_civ_bleufonce_t", 26000 * Desc],
			["pop_peugeot508_civ_rouge_t", 26000 * Desc],
			["pop_peugeot508_civ_jaune_t", 26000 * Desc],
			["pop_peugeot508_civ_rose_t", 26000 * Desc],
			["pop_peugeot508_civ_grise_t", 26000 * Desc],
			["pop_peugeot508_civ_violet_t", 26000 * Desc],
			["pop_peugeot508_civ_orange_t", 26000 * Desc],
			["pop_peugeot508_civ", 26000 * Desc],
			["pop_alfa_romeo_159_azul", 28000 * Desc],
			["pop_seat_ibiza_azul", 32000 * Desc],
			["pop_seat_ibiza_rojo", 32000 * Desc],
			["pop_clio_civ", 35000 * Desc],
			["pop_clio_civ_noir", 35000 * Desc],
			["pop_clio_civ_bleufonce", 35000 * Desc],
			["pop_clio_civ_rouge", 35000 * Desc],
			["pop_clio_civ_jaune", 35000 * Desc],
			["pop_clio_civ_rose", 35000 * Desc],
			["pop_clio_civ_grise", 35000 * Desc],
			["pop_clio_civ_violet", 35000 * Desc],
			["pop_clio_civ_orange", 35000 * Desc],
			
			["pop_peugeot_406_azul", 35000 * Desc],
			["pop_peugeot_406_rojo", 35000 * Desc],
			["pop_peugeot_406_gris", 35000 * Desc],
			
			["pop_ford_focusrs_azul", 40000 * Desc],
			["pop_ford_focusrs_rojo", 40000 * Desc],

			["pop_opel_astra_h_azul", 40000 * Desc],
			["pop_opel_astra_h_rojo", 40000 * Desc],
			["pop_opel_astra_h_gris", 40000 * Desc],
			["pop_citroen_c4_azul", 40000 * Desc],
			["pop_citroen_c4_rojo", 40000 * Desc],
			["pop_citroen_c4_gris", 40000 * Desc],
			["pop_peugeot_407_azul", 40000 * Desc],
			["pop_peugeot_407_rojo", 40000 * Desc],
			["pop_peugeot_407_gris", 40000 * Desc],
			["pop_peugeot_308_azul", 40000 * Desc],
			["pop_peugeot_308_rojo", 40000 * Desc],
			["pop_peugeot_308_gris", 40000 * Desc],
			["pop_fiat_bravo_azul", 40000 * Desc],
			["pop_fiat_bravo_rojo", 40000 * Desc],
			["pop_fiat_bravo_gris", 40000 * Desc],

			["pop_seat_leon_azul", 43000 * Desc],
			["pop_seat_leon_rojo", 43000 * Desc],
			["pop_astra_RS", 50000 * Desc],
			["pop_AudiA1_blanco", 55000 * Desc],			
			["pop_AudiA1_D2", 55000 * Desc],
			["pop_AudiA1_D3", 55000 * Desc],
			["pop_AudiA1_D5", 55000 * Desc],
			["pop_Caprice1968_r", 60000 * Desc],
			["pop_citroen_xsara_picasso_azul", 60000 * Desc],
			["pop_citroen_xsara_picasso_rojo", 60000 * Desc],
			["pop_citroen_xsara_picasso_gris", 60000 * Desc],
			["pop_69Charger_r", 62000 * Desc],
			["pop_citroen_c4_picasso_azul", 62000 * Desc],
			["pop_citroen_c4_picasso_rojo", 62000 * Desc],
			["pop_citroen_c4_picasso_gris", 62000 * Desc],
			["pop_citroen_c4_picasso_2016_azul", 62000 * Desc],
			["pop_citroen_c4_picasso_2016_rojo", 62000 * Desc],
			["pop_citroen_c4_picasso_2016_gris", 62000 * Desc],
			["pop_opel_astra_j_azul", 62000 * Desc],
			["pop_opel_astra_j_rojo", 62000 * Desc],
			["pop_opel_astra_j_gris", 62000 * Desc]



		];
	};
	case "skate_shop": {
		_return = [

		];

	};
	case "tienda_trasporte": {
		_return = [
			["POP_renaultmagnum1_f", 82000 * Desc],
			["pop_Man_TGXsin_negro", 76000 * Desc],
			["pop_volvo_camion_sin", 70000 * Desc]
		];
	};
	case "civ_truck": {
		_return = [
			["C_Van_01_fuel_F", 50000 * Desc],
			["Volvo_Cisterna_1", 100000 * Desc],
			["pop_mercedes_benz_vito_azul", 70000 * Desc],
			["pop_mercedes_benz_vito_rojo", 70000 * Desc],
			["pop_mercedes_benz_vito_gris", 70000 * Desc],
			["pop_mercedes_sprinter_corta_azul", 75000 * Desc],
			["pop_mercedes_sprinter_corta_rojo", 75000 * Desc],
			["pop_mercedes_sprinter_corta_gris", 75000 * Desc],
			["pop_dafxf_euro6_rojo_oscuro", 80000 * Desc],
			["pop_dafxf_euro6_verde", 80000 * Desc],
			["pop_dafxf_euro6_verde_oscuro", 80000 * Desc],
			["pop_dafxf_euro6_blanco", 80000 * Desc],
			["pop_dafxf_euro6_azul", 80000 * Desc],
			["pop_dafxf_euro6_azul_oscuro", 80000 * Desc],
			["pop_dafxf_euro6_gris", 80000 * Desc],
			["pop_dafxf_euro6_amarillo", 80000 * Desc],
			["pop_dafxf_euro6_rosa", 80000 * Desc],
			["pop_dafxf_euro6_violeta", 80000 * Desc],
			["pop_opel_vivaro_azul", 82500 * Desc],
			["pop_opel_vivaro_rojo", 82500 * Desc],
			["pop_opel_vivaro_gris", 82500 * Desc],
			["pop_sprinter_2016_azul", 85000 * Desc],
			["pop_sprinter_2016_rojo", 85000 * Desc],
			["pop_sprinter_2016_gris", 85000 * Desc],
			["pop_ford_transit_azul", 85000 * Desc],
			["pop_ford_transit_rojo", 85000 * Desc],
			["pop_ford_transit_gris", 85000 * Desc],
			["pop_sprinter_azul", 90000 * Desc],
			["pop_sprinter_rojo", 90000 * Desc],
			["pop_sprinter_gris", 90000 * Desc],
			["pop_mercedes_vito", 100000 * Desc],
			["pop_mercedes_vito1", 100000 * Desc],
			["pop_renault_master", 100000 * Desc],
			["pop_renault_master1", 100000 * Desc],
			["pop_Vandura_civ", 265000 * Desc],
			["pop_Vandura_civ_negro", 265000 * Desc],
			["pop_Vandura_civ_azul", 265000 * Desc],
			["pop_Vandura_civ_rojo", 265000 * Desc],
			["pop_Vandura_civ_Amarillo", 265000 * Desc],
			["pop_Vandura_civ_rosa", 265000 * Desc],
			["pop_Vandura_civ_gris", 265000 * Desc],
			["pop_Vandura_civ_violeta", 265000 * Desc],
			["pop_Vandura_civ_naranja", 265000 * Desc],
			["shounka_a3_spr_civ_noir", 265000 * Desc],
			["shounka_a3_spr_civ_bleufonce", 265000 * Desc],
			["shounka_a3_spr_civ_rouge", 265000 * Desc],
			["shounka_a3_spr_civ_jaune", 265000 * Desc],
			["shounka_a3_spr_civ_rose", 265000 * Desc],
			["shounka_a3_spr_civ_grise", 265000 * Desc],
			["shounka_a3_spr_civ_violet", 265000 * Desc],
			["shounka_a3_spr_civ_orange", 265000 * Desc],
			["midlum_grey", 300000 * Desc],
			["midlum_yellow", 300000 * Desc],
			["midlum_blue", 300000 * Desc],
			["midlum_red", 300000 * Desc],
			["pop_scania_r6202", 350000 * Desc],
			["pop_scania_r6203", 350000 * Desc],
			["pop_volvo_camion", 360000 * Desc],
			["pop_Man_TGX_negro", 400000 * Desc],
			["pop_iveco_f", 430000 * Desc],
			["shounka_ivceco_bleufonce", 470000 * Desc],
			["shounka_ivceco_rouge", 470000 * Desc],
			["shounka_ivceco_jaune", 470000 * Desc],
			["shounka_ivceco_rose", 470000 * Desc],
			["shounka_ivceco_grise", 470000 * Desc],
			["shounka_ivceco_orange", 470000 * Desc],
			["dikeman_haulier2", 530000 * Desc],
			["dikeman_haulier3", 530000 * Desc]
			//["mr_american_classic_truck_default", 40000 * Desc]
		];
	};
	case "med_ship": {
		_return = [
			["O_Lifeboat", 2500],
			["C_Boat_Civil_01_rescue_F", 2500]

		];
	};
	case "cop_car": {
		_return = [
			["pop_nissan_pathfinder_cnp1", 6000],
			["pop_ford_mondeo_atgc1", 5000],
			["pop_seat_altea_xl_cnp1", 5000],
			["pop_bmw_1200_rt_atgc_atgc", 5000],
			["pop_alfa_romeo_159_atgc1", 6000],
			["pop_jeep_grand_cherokee_atgc1", 7000],
			["pop_mitsubishi_asx_atgc", 4000],
			["pop_mitsubishi_montero_atgc1", 4000],
			["pop_nissan_pathfinder_atgc", 3000],
			["pop_nissan_qashqai_atgc1", 3500],
			["pop_nissan_xtrail_policia2", 4000],
			["pop_opel_insignia_atgc1", 5000],
			["pop_peugeot_407_atgc1", 1000],
			["pop_toyota_camry_atgc1", 6000],
			["pop_toyota_prado_atgc", 3000],
			["pop_mercedes_sprinter_corta_atgc1", 5000],
			["pop_mercedes_benz_vito_atgc1", 5000],
			
			["pop_citroen_c4_gc1", 1500],
			["pop_citroen_c4_picasso_2016_gc1", 2000],
			["pop_citroen_c4_picasso_gc1", 1000],
			["pop_fiat_bravo_gc1", 2500],
			["pop_honda_crv_gc1", 4000],
			["pop_land_rover_freelander_gc1", 3500],
			["pop_mitsubishi_asx_gc1", 3000],
			["pop_mitsubishi_montero_gc1", 5000],
			["pop_nissan_pathfinder_gc", 3500],
			["pop_nissan_patrol_gc1", 4000],
			["pop_nissan_qashqai_2016_policia1", 6000],
			["pop_nissan_xtrail_policia1", 4000],
			["pop_opel_astra_h_gc1", 1000],
			["pop_opel_astra_j_gc1", 3000],
			["pop_peugeot_308_gc1", 4000],
			["pop_peugeot_406_gc1", 1500],
			["pop_renault_megane_ii_gc1", 2000],
			["pop_toyota_prado_gc1", 5000],
			
			["pop_yamaha_xt660r_cnp_atgc", 5000],
			["pop_citroen_c4_picasso_2016_cnp1", 2000],
			["pop_citroen_c4_picasso_cnp1", 1000],
			["pop_citroen_xsara_picasso_cnp1", 1500],
			["pop_citroen_xsara_picasso_cnp2", 1500],
			["pop_mercedes_benz_vito_cnp1", 3500],
			["pop_nissan_patrol_cnp1", 4000],
			["pop_nissan_qashqai_2016_policia3", 6000],
			["pop_nissan_qashqai_cnp1", 3500],
			["pop_nissan_xtrail_policia3", 4000],
			["pop_opel_vivaro_cnp1", 200],
			
			["pop_autocar_presos", 1000],
			["pop_mercedes_sprinter_corta_policia1", 3000],
			["pop_mercedes_sprinter_corta_policia2", 3000],
			["pop_nissan_pathfinder_uip1", 2500],
			["pop_nissan_pathfinder_gar", 2500],
			["pop_toyota_prado_gar", 3000],
			["pop_camion_antidisturbios1", 3500],
			
			["pop_hummer_geo_camuflado", 6500],
			["pop_chrysler_camuflado", 6500],
			["pop_audiq7_camuflado", 6500],
			["pop_audi_a1_camuflado", 6500]
		];
	};
	case "civ_air": {
		_return = [
			
			//["EC635_Unarmed", 70000 * Desc],
			["gazelle_civil_1", 700000 * Desc],
			["gazelle_civil_2", 700000 * Desc],
			["gazelle_civil_3", 700000 * Desc], //Este es de pop tv 
			["ec135_popnews_F", 700000 * Desc],
			["pop_heli_Light_01_red_F", 700000 * Desc],
			["pop_heli_Light_01_ion_F", 700000 * Desc],
			["pop_heli_Light_01_blueLine_F", 700000 * Desc],
			["pop_heli_Light_01_digital_F", 700000 * Desc],
			["pop_heli_Light_01_elliptical_F", 700000 * Desc],
			["pop_heli_Light_01_furious_F", 700000 * Desc],
			["pop_heli_Light_01_graywatcher_F", 700000 * Desc],
			["pop_heli_Light_01_jeans_F", 700000 * Desc],
			["pop_heli_Light_01_light_F", 700000 * Desc],
			["pop_heli_Light_01_shadow_F", 700000 * Desc],
			["pop_heli_Light_01_sheriff_F", 700000 * Desc],
			["pop_heli_Light_01_speedy_F", 700000 * Desc],
			["pop_heli_Light_01_sunset_F", 700000 * Desc],
			["pop_heli_Light_01_vrana_F", 700000 * Desc],
			["pop_heli_Light_01_wasp_F", 700000 * Desc],
			["pop_heli_Light_01_wave_F", 700000 * Desc],
			["pop_heli_Light_01_camuflaje_F", 700000 * Desc],
			["pop_heli_Light_01_naranja_F", 700000 * Desc],
			["pop_heli_Light_01_chapa_F", 700000 * Desc],
			["pop_heli_Light_01_escamas_F", 700000 * Desc],
			["pop_heli_Light_01_olas_F", 700000 * Desc],
			["pop_heli_Light_01_pelotas_F", 700000 * Desc],
			["pop_heli_Light_01_psico1_F", 700000 * Desc],
			["pop_heli_Light_01_psico2_F", 700000 * Desc],
			["pop_heli_Light_01_psico3_F", 700000 * Desc],
			["pop_heli_Light_01_psico4_F", 700000 * Desc],
			["pop_heli_Light_01_psico5_F", 700000 * Desc],
			["pop_heli_Light_01_amanecer_F", 700000 * Desc],
			["pop_heli_Light_01_triangulos_F", 700000 * Desc],
			["pop_heli_Light_01_triangulos2_F", 700000 * Desc],
			["ec135_civil_rojo", 800000 * Desc],
			["ec135_civil_blanco", 800000 * Desc],
			["ec135_civil_azul", 800000 * Desc],
			["ec135_civil_Negro", 800000 * Desc],
			["frogger_civil_3", 800000 * Desc],
			["frogger_civil_4", 800000 * Desc]
		];
	};
	case "cop_air": {
		_return = [
			["ec135_policia_f", 7500 * Desc],
			["ec135_guardiacivil_F", 7500 * Desc],
			["bo_105_policia_F", 6000 * Desc],
			["bo_105_guardiacivil_F", 6000 * Desc]
			];	
	};
	case "cop_airhq": {
		_return = [
			["ec135_policia_f", 7500 * Desc],
			["ec135_guardiacivil_F", 7500 * Desc],
			["bo_105_policia_F", 6000 * Desc],
			["bo_105_guardiacivil_F", 6000 * Desc]
		];
	};
	case "civ_ship": {
		_return = [
			["C_Rubberboat", 1200 * Desc],
			["POP_pesca_f", 3500 * Desc],
			["C_Scooter_Transport_01_F", 2500 * Desc],
			["POP_Speed_yatch", 150000 * Desc],
			["pop_pesca", 150000 * Desc]
		];
	};
	case "cop_ship": {
		_return = [
			//["B_SDV_01_F", 100000],
			["C_Boat_Civil_01_police_F", 2000],
			["B_Boat_Transport_01_F", 3000],
			["pop_predator", 3000]
			//["CNP_Boat_police_F", 3000] //MOD CNP

		 ];
	};
	case "donator": {
		if(__GETC__(life_donator) > 0) then {
			_return = [
				
				["pop_insurgent_v1", 110000 * Desc],
				["pop_insurgent_vELN", 110000 * Desc],
				["pop_megane_GT3_gustav", 600000 * Desc],
				["pop_JaguarP7Civil", 600000 * Desc],
				["pop_488GT3Civil", 600000 * Desc],
				["pop_seat_leon_negro", 43000 * Desc],
				["pop_ford_focusrs_verde", 40000 * Desc],
				["pop_ford_focusrs_negro", 40000 * Desc],
				["pop_ford_focusrs_blanco", 40000 * Desc],
				["pop_seat_ibiza_blanco", 32000 * Desc],
				["pop_seat_ibiza_negro", 32000 * Desc],
				["pop_alfa_romeo_159_negro", 28000 * Desc],
				["pop_alfa_romeo_159_rojo", 28000 * Desc],
				["pop_AudiA1_D4", 55000 * Desc],
				["pop_AudiA1_D5", 55000 * Desc],
				["pop_AudiA1_D1", 55000 * Desc],
				["pop_daciaCivil", 150000 * Desc],
				["pop_mercedes_vito2", 100000 * Desc],
				["pop_mercedes_vito3", 100000 * Desc],
				//["pop_afla_4C1", 35000 * Desc],
				["pop_afla_4C_rojo", 500000 * Desc],
				["pop_afla_4C_negro", 500000 * Desc],
				["pop_afla_4C_amarillo", 500000 * Desc],
				["pop_afla_4C_naranja", 500000 * Desc],
				["pop_chevroletc7_rojo", 500000 * Desc],
				["pop_chevroletc7_negro", 500000 * Desc],
				["pop_chevroletc7_blanco", 500000 * Desc],
				["pop_regera_negro", 500000 * Desc],
				["pop_regera_rojo", 500000 * Desc],
				["pop_bmw507_d", 500000 * Desc],
				["pop_bmw8", 500000 * Desc],
				["pop_bmw8_blanco", 500000 * Desc],
				["pop_m300sl3", 500000 * Desc],
				["pop_laferrari_negro", 500000 * Desc],
				["pop_chevrolet_rojo", 500000 * Desc],
				["pop_InsurgentCivil", 345000 * Desc],
				//["pop_lexus_gx460", 45000 * Desc],
				["shounka_ivceco_noir", 470000 * Desc],
			    ["pop_scania_r620", 350000 * Desc],
			    ["pop_scania_r6201", 350000 * Desc],
			    ["dikeman_haulier", 530000 * Desc],
			    ["dikeman_haulier1", 530000 * Desc],
			    ["midlum", 300000 * Desc],
			    ["midlum_black", 300000 * Desc],	
				["pop_dafxf_euro6_rojo", 80000 * Desc],
				["pop_dafxf_euro6_negro", 80000 * Desc],
				["shounka_limo_civ_noir",600000 * Desc],
				["shounka_limo_civ_rouge",600000 * Desc],
				["shounka_limo_civ_jaune",600000 * Desc],
				["pop_Viper_08_n",500000 * Desc],
				["pop_Viper_08_b",500000 * Desc],
				["pop_S331_g", 215000 * Desc],
				["pop_S331_n", 215000 * Desc],
				["pop_RollsRoycePH_n",500000 * Desc],
				["pop_RollsRoycePH_b",500000 * Desc],
				["pop_RollsRoyce011_n",500000 * Desc],
				["pop_RollsRoyce011_b",500000 * Desc],
				["pop_NissanGTR_n",500000 * Desc],
				["pop_NissanGTR_b",500000 * Desc],
				["pop_MustangMach1Jet1969", 500000 * Desc],
				["pop_MustangMach1Jet1969_b", 500000 * Desc],
				["pop_Caprice1968_b", 60000 * Desc],
				["pop_Caprice1968_r", 60000 * Desc],
				["pop_BMW750il_b", 155500 * Desc],
				["pop_BMW750il_n", 155500 * Desc],
				["pop_AudiQ7_b", 215000 * Desc],
				["pop_AudiQ7_n", 215000 * Desc],
				["pop_300c_b", 500000 * Desc],
				["pop_300c_n", 500000 * Desc],
				["pop_69Charger_n", 62000 * Desc],
				["pop_69Charger_b", 62000 * Desc],
				["pop_13G65_b", 215000 * Desc],
				["pop_13G65_n", 215000 * Desc],
				["pop_renault_master2", 100000 * Desc],
				["pop_renault_master3", 100000 * Desc],
				["pop_honda_bizz_Negra", 49500 * Desc],
				["pop_honda_bizz_Blanca", 49500 * Desc],
				["pop_moto_1_negra", 49500 * Desc],
				["pop_moto_1_blanca", 49500 * Desc],
				["pop_moto_2_blanca", 49500 * Desc],
				["frogger_civil_1", 800000 * Desc],
				["frogger_civil_2", 800000 * Desc],
				["pop_bmwm6_negro_t", 500000 * Desc],
				["pop_bmwm6_gris_t", 500000 * Desc],
				["pop_bmwm6_negro", 450000 * Desc],
				["pop_bmwm6_gris", 450000 * Desc],
				["C_Van_01_fuel_F", 50000 * Desc],
				["Volvo_Cisterna_1", 100000 * Desc],
				["pop_sprinter_2016_negro", 85000 * Desc],
				["pop_sprinter_2016_blanco", 85000 * Desc],
				["pop_sprinter_negro", 90000 * Desc],
				["pop_sprinter_blanco", 90000 * Desc],
				["pop_opel_vivaro_negro", 82500 * Desc],
				["pop_opel_vivaro_blanco", 82500 * Desc],
				["pop_mercedes_sprinter_corta_negro", 75000 * Desc],
				["pop_mercedes_sprinter_corta_blanco", 75000 * Desc],
				["pop_mercedes_benz_vito_negro", 70000 * Desc],
				["pop_mercedes_benz_vito_blanco", 70000 * Desc],
				["pop_ford_transit_blanco", 85000 * Desc],
				["pop_ford_transit_negro", 85000 * Desc],
				// 4x4
				["pop_toyota_FJCruiser", 195000 * Desc],
				["pop_toyota_FJCruiser1", 195000 * Desc],
				["pop_nissan_qashqai", 165000 * Desc],
				["pop_nissan_qashqai1", 165000 * Desc],
				["pop_jeep_grandcherokee", 190000 * Desc],
				["pop_jeep_grandcherokee1", 190000 * Desc],
				["pop_lexus_gx4601", 195000 * Desc],
				["pop_volvo", 130000 * Desc],
				["pop_volvo1", 130000 * Desc],
				["pop_volvo2", 130000 * Desc],
				["pop_volvo3", 130000 * Desc],
				["pop_hyundai_x35", 150000 * Desc],
				["pop_hyundai_x351", 150000 * Desc],
				["pop_hyundai_x352", 150000 * Desc],
				["pop_hyundai_x353", 150000 * Desc],
				["pop_rover_evo_negro", 155000 * Desc],
				["pop_rover_evo_naranja", 155000 * Desc],
				["pop_ranger_rover", 155000 * Desc],
				["pop_ranger_rover1", 155000 * Desc],
				["pop_ranger_rover2", 155000 * Desc],
				["pop_rover_evo_rojo", 155000 * Desc],
				["PKE_92_civ_noir", 550000 * Desc],
				["PKE_92_civ_rouge", 550000 * Desc],
				["pop_nissan_xtrail_negro", 82500 * Desc],
				["pop_nissan_xtrail_blanco", 82500 * Desc],
				["pop_toyota_prado_negro", 82500 * Desc],
				["pop_toyota_prado_blanco", 82500 * Desc],
				["pop_nissan_qashqai_negro", 80000 * Desc],
				["pop_nissan_qashqai_blanco", 80000 * Desc],
				["pop_nissan_qashqai_2016_negro", 80000 * Desc],
				["pop_nissan_qashqai_2016_blanco", 80000 * Desc],
				["pop_nissan_patrol_negro", 82500 * Desc],
				["pop_nissan_patrol_blanco", 82500 * Desc],
				["pop_mitsubishi_montero_negro", 82500 * Desc],
				["pop_mitsubishi_montero_blanco", 82500 * Desc],
				["pop_mitsubishi_asx_negro", 80000 * Desc],
				["pop_mitsubishi_asx_blanco", 80000 * Desc],
				["pop_jeep_grand_cherokee_negro", 82500 * Desc],
				["pop_jeep_grand_cherokee_blanco", 82500 * Desc],
				["pop_land_rover_freelander_negro", 82500 * Desc],
				["pop_land_rover_freelander_blanco", 82500 * Desc],
				["pop_honda_crv_negro", 82500 * Desc],
				["pop_honda_crv_blanco", 82500 * Desc],
				["pop_tahoe_b",215000 * Desc],
				["pop_tahoe_n",215000 * Desc],
				["pop_nissan_patrol_corto", 215000 * Desc],
				["pop_hyundai_veloster", 215000 * Desc],
				["pop_hyundai_veloster1", 215000 * Desc],
				["pop_nissan_pathfinder", 195000 * Desc],
				["pop_nissan_pathfinder1", 195000 * Desc],
				["pop_bmw_x5", 215000 * Desc],
				["pop_bmw_x51", 215000 * Desc],
				["pop_MercedesBenz6x6_n", 215000 * Desc],
				["pop_MercedesBenz6x6_b", 215000 * Desc],
				["pop_MaybachLaundet57_b", 500000 * Desc],
				["pop_landcruiser_b", 212000 * Desc],
				["pop_JeepWrangler_b", 85000 * Desc],
				["pop_JeepWrangler_n", 85000 * Desc],
				["pop_HummerH2", 215000 * Desc],
				["pop_HummerH2_b", 215000 * Desc],
				["pop_HummerH2_a", 215000 * Desc],
				["pop_HummerH1", 215000 * Desc],
				["pop_HummerH1_b", 215000 * Desc],
				["pop_HummerH1_a", 215000 * Desc],
				["pop_GMCSerriaLarge_b", 185000 * Desc],
				["pop_GMCSerriaLarge_n", 185000 * Desc],
				["pop_F350_n", 215000 * Desc],
				["pop_F350_b", 215000 * Desc],
				["pop_F150_n", 215000 * Desc],
				["pop_F150_b", 215000 * Desc],
				["pop_Explorer_n", 215000 * Desc],
				["pop_Explorer_b", 215000 * Desc],
				["pop_Youkun2015_n", 212000 * Desc],
				["pop_Suburban2015_b", 212000 * Desc],
				["pop_Suburban2015_n", 212000 * Desc],
				["pop_escalade", 215000 * Desc],
				// Coches Caros
				["pop_lotus_GTE_naranja", 500000 * Desc],
				["pop_lotus_GTE_rojo", 500000 * Desc],
				["pop_caymanS_z_blanco", 500000 * Desc],
				["pop_370Z1", 500000 * Desc],
				["pop_370Z_blanco", 500000 * Desc],
				["pop_nissan_silvia", 500000 * Desc],   
				["pop_nissan_silvia1", 500000 * Desc],
				["pop_nissan_silvia4", 500000 * Desc],
				["pop_chevrolet_camaro_vip_david", 500000 * Desc],
				["pop_chevrolet_camaro_blanco", 500000 * Desc],
				["pop_chevrolet_camaro_negro", 500000 * Desc],
				["pop_chevrolet_camaro_amarillo", 500000 * Desc],
				["pop_ford_mondeo_negro", 600000 * Desc],
				["pop_ford_mondeo_blanco", 600000 * Desc],
				["pop_opel_insignia_negro", 600000 * Desc],
				["pop_opel_insignia_blanco", 600000 * Desc],
				["pop_toyota_camry_negro", 600000 * Desc],
				["pop_toyota_camry_blanco", 600000 * Desc],
				["pop_evox_noir", 600000 * Desc],
				["pop_evox_negro_t", 600000 * Desc],
				["pop_nissan_skyline", 500000 * Desc],
				["pop_nissan_skyline1", 500000 * Desc],
				["POP_veneno_blanco", 600000 * Desc],
				["POP_veneno_negro", 600000 * Desc],
				["pop_Chrysler_n", 49500 * Desc],
				["pop_Chrysler_b", 49500 * Desc],
				["pop_Charger_12_n",150000 * Desc],
				["pop_Charger_12_b",150000 * Desc],
				// Coches Competicion
				["pop_GT3_negro", 600000 * Desc],
				["pop_Caterham_1", 600000 * Desc],
				["pop_Caterham_4", 600000 * Desc],
				["pop_mono_D1", 600000 * Desc],
				["pop_mono_D2", 600000 * Desc],
				["pop_mono_D3", 600000 * Desc],
				["pop_mono_D4", 600000 * Desc],
				["pop_r8MP_2", 600000 * Desc],
				["pop_r8MP_6", 600000 * Desc],
				["pop_r8MP_7", 600000 * Desc],
				["pop_ford_gt40", 600000 * Desc],
				["pop_amg_GT1", 600000 * Desc],
				["pop_amg_GT_blanco", 600000 * Desc],
				["pop_ford_gt401", 600000 * Desc],
				["pop_lola_10", 600000 * Desc],
				["pop_lola_3", 600000 * Desc],
				["pop_megane_GT3_16", 600000 * Desc],
				["pop_megane_GT3_38", 600000 * Desc],
				["pop_megane_GT3_36", 600000 * Desc],
				["pop_megane_GT3_34", 600000 * Desc],
				["pop_megane_GT3_24", 600000 * Desc],
				["pop_megane_GT3_1", 600000 * Desc],
				["pop_megane_GT3_5", 600000 * Desc],
				["pop_megane_GT3_3", 600000 * Desc],
				["pop_megane_GT3_4", 600000 * Desc],
				["pop_megane_GT3_6", 600000 * Desc],
				["pop_megane_GT3_7", 600000 * Desc],
				["pop_megane_GT3_8", 600000 * Desc],
				["pop_megane_GT3_9", 600000 * Desc],
				["pop_megane_GT3_10", 600000 * Desc],
				["pop_megane_GT3_11", 600000 * Desc],
				["pop_megane_GT3_12", 600000 * Desc],
				["pop_megane_GT3_13", 600000 * Desc],
				["pop_megane_GT3_14", 600000 * Desc],
				["pop_megane_GT3_15", 600000 * Desc],
				//["pop_megane_GT3_17", 600000 * Desc],
				["pop_megane_GT3_18", 600000 * Desc],
				["pop_megane_GT3_19", 600000 * Desc],
				["pop_megane_GT3_20", 600000 * Desc],
				//["pop_megane_GT3_21", 600000 * Desc],
				["pop_megane_GT3_22", 600000 * Desc],
				["pop_megane_GT3_23", 600000 * Desc],
				["pop_megane_GT3_25", 600000 * Desc],
				["pop_megane_GT3_26", 600000 * Desc],
				["pop_megane_GT3_27", 600000 * Desc],
				["pop_megane_GT3_28", 600000 * Desc],
				["pop_megane_GT3_29", 600000 * Desc],
				["pop_megane_GT3_30", 600000 * Desc],
				["pop_megane_GT3_31", 600000 * Desc],
				["pop_megane_GT3_32", 600000 * Desc],
				["pop_megane_GT3_33", 600000 * Desc],
				["pop_megane_GT3_35", 600000 * Desc],
				["pop_megane_GT3_37", 600000 * Desc],
				["pop_ford_gt404", 600000 * Desc]
			];
		};
	};
};

_return;