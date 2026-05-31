
// ***********************************************************
// PoP Police framework by Blakord
// Verificar matriz de tipo de vehiculo especiales
// ***********************************************************

/* Como usar
Metodo 1
	[ Tipo_a_Buscar,vehiculoClassName ] call ica_fnc_vehiculoValidar *** Esto va a devolver falso o verdadero si encuentra el vehiculo dentro de la matriz o categoria requerida, se puede buscar en varias
	
	_Some = [ "poliveh polinav","pop_cherokee_GC" ] call ica_fnc_vehiculoValidar ;
	hint _Some; // true

Metodo 2
	[ "",vehiculoClassName ] call ica_fnc_vehiculoValidar *** Dejando en blanco el parametro de la categoria a buscar, va a retornar una matriz con las categorias donde encuentre el vehiculo
	
	_Some = [ "","pop_cherokee_GC" ] call ica_fnc_vehiculoValidar ;
	hint _Some; // ["poliveh","veh4x4"]
*/

private ["_VehVeri","_VehReq","_bkMyVehArray","_isFind"];

_VehReq  = param[0];
_VehVeri = param[1];

_poliListVeh 	= ["pop_bmw_1200_rt_atgc_atgc","pop_alfa_romeo_159_atgc1","pop_jeep_grand_cherokee_atgc1","pop_mitsubishi_asx_atgc","pop_mitsubishi_montero_atgc1","pop_nissan_pathfinder_atgc","pop_nissan_qashqai_atgc1","pop_nissan_xtrail_policia2","pop_opel_insignia_atgc1","pop_peugeot_407_atgc1","pop_toyota_camry_atgc1","pop_toyota_prado_atgc","pop_mercedes_sprinter_corta_atgc1","pop_mercedes_benz_vito_atgc1","pop_citroen_c4_gc1","pop_citroen_c4_picasso_2016_gc1","pop_citroen_c4_picasso_gc1","pop_fiat_bravo_gc1",
					"pop_honda_crv_gc1","pop_land_rover_freelander_gc1","pop_mitsubishi_asx_gc1","pop_mitsubishi_montero_gc1","pop_nissan_pathfinder_gc","pop_nissan_patrol_gc1","pop_nissan_qashqai_2016_policia1","pop_nissan_xtrail_policia1","pop_opel_astra_h_gc1","pop_opel_astra_j_gc1","pop_peugeot_308_gc1","pop_peugeot_406_gc1","pop_renault_megane_ii_gc1","pop_toyota_prado_gc1","pop_yamaha_xt660r_cnp_atgc","pop_citroen_c4_picasso_2016_cnp1","pop_citroen_c4_picasso_cnp1","pop_citroen_xsara_picasso_cnp1","pop_citroen_xsara_picasso_cnp2","pop_mercedes_benz_vito_cnp1","pop_nissan_patrol_cnp1","pop_nissan_qashqai_2016_policia3","pop_nissan_qashqai_cnp1","pop_nissan_xtrail_policia3","pop_opel_vivaro_cnp1","pop_autocar_presos","pop_mercedes_sprinter_corta_policia1","pop_mercedes_sprinter_corta_policia2","pop_nissan_pathfinder_uip1","pop_nissan_pathfinder_gar","pop_toyota_prado_gar","pop_camion_antidisturbios1","pop_hummer_geo_camuflado","pop_chrysler_camuflado","pop_audiq7_camuflado","pop_audi_a1_camuflado",
					"pop_seat_alta_xl_cnp1","pop_nissan_pathfinder_cnp1","pop_ford_mondeo_atgc1","pop_seat_altea_xl_cnp1"];
_poliListHeli 	= ["EC635_BW","ec135_guardiacivil_F","ec135_policia_F"];
_poliListNav 	= ["C_Boat_Civil_01_police_F","POP_Lancha_policia","C_Boat_Civil_01_F"];
_poliListMoto 	= ["Mrshounka_ducati_police_cnp","Mrshounka_ducati_police_gc"];
_emsListVeh 	= ["pop_sprinter_corta_amb1","pop_sprinter_2016_amb1","pop_sprinter_amb1","pop_sprinter_caja_amb1","pop_ford_transit_amb1","pop_mitsubishi_asx_ems1","pop_fiat_bravo_ems1"];
_emsListHeli 	= ["ec135_ems_F"];
_emsListNav 	= ["C_Boat_Civil_01_rescue_F","POP_EMS_Boat","POP_Lancha_EMS"];
_airListVeh 	= ["Jonzie_Ambulance","cg_ambulanceexpansion","mercedes_atego_bomberos_ingame"];
_4x4ListVeh 	= ["cherokee","bowler","hummer","buggy","Quiet_Cadillac","avalanche","monsteur","raptor","jeep","Defender","Offroad","c65amg","Qashqai","cayenne",
					"smart_supercharge","sub2015","Offroad","SUV_01","UAZ_Patriot","pop_rover","pop_hummer","pop_h2","pop_Bowler","pop_avalanche","pop_monsteur","POP_Qashqai","pop_FordTransiSupervan"];
_YateListVeh 	= ["POP_Speed_yatch"];
_NavioListVeh 	= ["POP_pesca_f","Mattaust_Fisher","mr_max_freighter"];

If ( isNil "_VehReq" Or _VehReq == "" ) Then {

	_isFind = [];
	{ If ( (_VehVeri isKindOf "Car")  AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "poliveh" }; } forEach _poliListVeh;
	{ If ( (_VehVeri isKindOf "Air")  AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "polihel" }; } forEach _poliListHeli;
	{ If ( (_VehVeri isKindOf "Ship") AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "polinav" }; } forEach _poliListNav;
	{ If ( (_VehVeri isKindOf "Car")  AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "polimoto"}; } forEach _poliListMoto;
	{ If ( (_VehVeri isKindOf "Car")  AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "emsveh" }; } forEach _emsListVeh;
	{ If ( (_VehVeri isKindOf "Air")  AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "emshel" }; } forEach _emsListHeli;
	{ If ( (_VehVeri isKindOf "Ship") AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "emsnav" }; } forEach _emsListNav;
	{ If ( (_VehVeri isKindOf "Car")  AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "airveh" }; } forEach _airListVeh;
	{ If ( (_VehVeri isKindOf "Car")  AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "veh4x4" }; } forEach _4x4ListVeh;
	{ If ( (_VehVeri isKindOf "Ship") AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "yate" };   } forEach _YateListVeh;
	{ If ( (_VehVeri isKindOf "Ship") AND (toLower _VehVeri find toLower _x >= 0) ) Then { _isFind pushBack "navio" };  } forEach _NavioListVeh;
	//player sideChat format ["Procesado metodo 1 call: %1 / veh: %2 / Result: %3", _VehReq, _VehVeri, _isFind];
	_isFind
} Else {

	_bkMyVehArray = [];
	_isFind = false;

	If ( ( _VehVeri isKindOf "Car"  and toLower _VehReq find "poliveh" >= 0 ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _poliListVeh; };
	If ( ( _VehVeri isKindOf "Air"  and toLower _VehReq find "polihel" >= 0 ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _poliListHeli; };
	If ( ( _VehVeri isKindOf "Ship" and toLower _VehReq find "polinav" >= 0 ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _poliListNav; };
	If ( ( _VehVeri isKindOf "Car"  and toLower _VehReq find "polimoto" >= 0) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _poliListMoto; };
	If ( ( _VehVeri isKindOf "Car"  and toLower _VehReq find "emsveh"  >= 0 ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _emsListVeh; };
	If ( ( _VehVeri isKindOf "Air"  and toLower _VehReq find "emshel"  >= 0 ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _emsListHeli; };
	If ( ( _VehVeri isKindOf "Ship" and toLower _VehReq find "emsnav"  >= 0 ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _emsListNav; };
	If ( ( _VehVeri isKindOf "Car"  and toLower _VehReq find  "airveh" >= 0 ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _airListVeh; };
	If ( ( _VehVeri isKindOf "Car"  and toLower _VehReq find  "veh4x4" >= 0 ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _4x4ListVeh; };
	If ( ( _VehVeri isKindOf "Ship"  and toLower _VehReq find "yate" >= 0   ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _YateListVeh; };
	If ( ( _VehVeri isKindOf "Ship"  and toLower _VehReq find "navio" >= 0  ) Or toLower _VehReq == "todo" ) Then { _bkMyVehArray append _NavioListVeh; };


	{ 
		If (toLower _VehVeri find toLower _x >= 0) exitWith { 
			_isFind = true;
			//Hint parseText format ["coche encontrado <br />%1<br />buscando; %2<br />Enc como: %3<br /><br />Array: %4",_VehVeri,_VehReq,_x,_bkMyVehArray];
		}; 
	} forEach _bkMyVehArray;

	If ( _isFind ) Then {
		//Hint parseText format ["coche encontrado <br />%1<br />%2<br /><br />%3",_VehVeri,_VehReq,_bkMyVehArray];
		//player sideChat format ["encontrado metodo 2 call: %1 / veh: %2 / Result: %3", _VehReq, _VehVeri, _isFind];
		true;
	} Else {
		//Hint parseText format ["NO encontrado <br />%1<br />%2<br /><br />%3",_VehVeri,_VehReq,_bkMyVehArray];
		//player sideChat format ["No encontrado metodo 2 call: %1 / veh: %2 / Result: %3",_VehReq, _VehVeri, _isFind];
		false;
	};
};