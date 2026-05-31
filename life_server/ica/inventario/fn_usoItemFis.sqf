
/*

por: Icaruk
Mejorado por AxE;

*/

private "_item";

_class = toLower (_this select 0);
_visual = toLower (_this select 1);

_item = if (_class == "") then {_visual} else {_class};
if (isNil {_item}) exitWith {};

// hint format ["%1 (%2) \n\n %3 (%4)", _class, typeName _class, _visual, typeName _visual];
//hint str _item;

switch (_item) do {
	case "pop_pociondeparkour": {closeDialog 0; ["beberPocion"] spawn ica_fnc_saltar; _item spawn {sleep 0.1; player removeItem _this};};
	case "pop_pociondeinvis": {closeDialog 0; puedodisparar = nil; ["preparo"] call ica_fnc_hab_pocionDeInvis; _item spawn {sleep 0.1; player removeItem _this};};
	case "pop_molotov": {closeDialog 0; 0 spawn ica_fnc_hab_molotov; _item spawn {sleep 0.1; player removeItem _this};};

	case "pop_note": {closeDialog 0; ["init", "samsung"] spawn ica_fnc_initmovil};
	case "pop_nokia": {closeDialog 0;  hint "Si, es un nokia pero abre un android.. ya vendrá el windows phone :)"; ["init", "samsung"] spawn ica_fnc_initmovil};
	case "pop_iphone": {closeDialog 0; hint "Si, es un iphone pero abre un android.. ya vendrá el iphone :)"; ["init", "samsung"] spawn ica_fnc_initmovil};
	case "pop_portatil": {
		closeDialog 0;
		if (("baj" call ica_fnc_expTolevel) < 3 && playerSide != WEST) exitWith {hint "Si no sabes, no toques -- debes aprender en la universidad para usar este objeto como se debe."};
		if (!isNil {accHacker2}) then {player removeAction accHacker2};

		accHacker2 = player addAction ["Abrir el Portatil", "
			player removeAction accHacker; player removeAction accHacker2; ['inicio'] call ica_fnc_portatil;
		"];
	};
	case "pop_c4": { ["bgrande"] spawn ica_fnc_robo};
	// comida
	case "patatas_huevos": {["como",65,_item] call ica_fnc_comoBebo};
	case "fapret_kebap": {["como",60,_item] call ica_fnc_comoBebo};
	case "pop_vaso": {["todo",20,_item] call ica_fnc_comoBebo};   
	case "pop_churros": {["como",50,_item] call ica_fnc_comoBebo};   
	case "pop_p_barbacoa": {["como",40,_item] call ica_fnc_comoBebo};   // antes 20
	case "pop_p_clasica": {["como",40,_item] call ica_fnc_comoBebo};    // antes 20
	case "pop_p_oliva": {["como",40,_item] call ica_fnc_comoBebo};      // antes 20
	case "pop_p_originales": {["como",40,_item] call ica_fnc_comoBebo}; // antes 20
	case "pop_p_queso": {["como",40,_item] call ica_fnc_comoBebo};      // antes 20
	case "pop_g_ahoy": {["como",30,_item] call ica_fnc_comoBebo};       // antes 15
	case "pop_g_chocolate": {["como",50,_item] call ica_fnc_comoBebo};  // antes 15
	case "pop_g_oreo": {["como",30,_item] call ica_fnc_comoBebo};       // antes 15
	case "pop_pringles": {["como",30,_item] call ica_fnc_comoBebo};     // antes 15
	case "pop_h_fresa": {["todo",15,_item] call ica_fnc_comoBebo};      // antes 10
	case "pop_h_vainilla": {["todo",15,_item] call ica_fnc_comoBebo};   // antes 10
	case "pop_h_napolitana": {["como",20,_item] call ica_fnc_comoBebo}; // antes 10
	case "pop_r_pepsi": {["bebo",30,_item] call ica_fnc_comoBebo};      // antes 15
	case "pop_r_naranja": {["bebo",30,_item] call ica_fnc_comoBebo};    // antes 15
	case "pop_r_7up": {["bebo",30,_item] call ica_fnc_comoBebo};        // antes 15
	case "pop_r_superstar": {["bebo",40,_item] call ica_fnc_comoBebo};  // antes 20
	case "pop_r_monster": {["bebo",40,_item] call ica_fnc_comoBebo};    // antes 20
	case "pop_r_pepper": {["bebo",40,_item] call ica_fnc_comoBebo};     // antes 20
	case "pop_apple": {["todo",20,_item] call ica_fnc_comoBebo};        // antes 15
	case "pop_banana": {["todo",20,_item] call ica_fnc_comoBebo};       // antes 15
	case "pop_kiwi": {["todo",25,_item] call ica_fnc_comoBebo; };       // antes 15
	case "pop_tostada": {["como",15,_item] call ica_fnc_comoBebo};      // antes 20
	case "pop_pizza": {["como",60,_item] call ica_fnc_comoBebo};        // antes 30
	case "pop_cheseburge": {["como",60,_item] call ica_fnc_comoBebo};   // antes 30
	case "pop_pistacho": {["como",30,_item] call ica_fnc_comoBebo};     // antes 15
	case "pop_leche_cabra": {comfort = comfort + 50;["bebo",100,_item] call ica_fnc_comoBebo};  

	// semillas
	case "pop_rabano_s": {estoyPlantando = "rabano"};
	case "pop_bamboo_s": {estoyPlantando = "bamboo"};
	case "pop_algodon_s": {estoyPlantando = "algodon"};
	case "pop_maiz_s": {estoyPlantando = "maiz"};
	case "pop_trigo_s": {estoyPlantando = "trigo"};
	case "pop_cannabis_s": {estoyPlantando = "cannabis"};
	case "pop_girasol_s": {estoyPlantando = "girasol"};

	//case "pop_combustible":{_coche = (nearestObjects [player,["car"],3] select 0);_coche setfuel ((fuel _coche) + 0.25); [] spawn {sleep 0.2;["pop_combustible", -1] call ica_fnc_item};
	
	// armarios
	case "pop_armariop": {[_item] call life_fnc_storageBox;};
	case "pop_armariog": {[_item] call life_fnc_storageBox;};
	case "pop_armario1_inv": { _item spawn {sleep 0.1; player removeItem _this}; ["pop_armario1_box"] spawn life_fnc_storageBox; };
	case "pop_armario2_inv": { _item spawn {sleep 0.1; player removeItem _this}; ["pop_armario2_box"] spawn life_fnc_storageBox;};
	case "pop_nevera_inv": { _item spawn {sleep 0.1; player removeItem _this}; ["pop_nevera_box"] spawn life_fnc_storageBox;};
	case "pop_mesa_tv_inv": { _item spawn {sleep 0.1; player removeItem _this}; ["pop_mesa_tv_box"] spawn life_fnc_storageBox;};
	//case "pop_cama_inv": { _item spawn {sleep 0.1; player removeItem _this}; ["pop_cama"] spawn life_fnc_storageBox;};
	case "pop_sofa_inv": { _item spawn {sleep 0.1; player removeItem _this}; ["pop_sofa"] spawn life_fnc_storageBox;};


	// objetos controles
	case "pop_tetrapodo_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_tetrapodo_i"; ["POP_tetrapodo"] spawn ica_fnc_objetos;};};};
	case "pop_tetrapodo_x3_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_tetrapodo_x3_i"; ["POP_tetrapodo_x3"] spawn ica_fnc_objetos;};};};
	case "pop_tetrapodo_x5_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_tetrapodo_x5_i";["POP_tetrapodo_x5"] spawn ica_fnc_objetos;};};};
	case "pop_tetrapodo_x7_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_tetrapodo_x7_i"; ["pop_nevera_box"] spawn ica_fnc_objetos;};};};
	case "pop_electroflare_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_electroflare_i"; ["POP_electroflare"] spawn ica_fnc_objetos;};};};
	case "pop_banda_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_banda_i"; ["POP_banda"] spawn ica_fnc_objetos;};};};
	case "pop_senal_alcoholemiagc_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_senal_alcoholemiagc_i"; ["POP_senal_alcoholemiagc"] spawn ica_fnc_objetos;};};};
	case "pop_senal_control_policia_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_senal_control_policia_i"; ["POP_senal_control_policia"] spawn ica_fnc_objetos;};};};
	case "pop_senal_izquierda_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_senal_izquierda_i";["POP_senal_izquierda"] spawn ica_fnc_objetos;};};};
	case "pop_senal_derecha_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0;player removeItem "POP_senal_derecha_i";["POP_senal_derecha"] spawn ica_fnc_objetos;};};};
	case "pop_senal_stop_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_senal_stop_i"; ["POP_senal_stop"] spawn ica_fnc_objetos;};};};
	case "pop_senal_estrechamiento_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_senal_estrechamiento_i"; ["POP_senal_estrechamiento"] spawn ica_fnc_objetos;};};};
	case "pop_senal_velocidad20_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0; player removeItem "POP_senal_velocidad20_i"; ["POP_senal_velocidad20"] spawn ica_fnc_objetos;};};};
	case "pop_senal_velocidad40_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1; closeDialog 0; player removeItem "POP_senal_velocidad40_i"; ["POP_senal_velocidad40"] spawn ica_fnc_objetos;};};};
	case "pop_bandaclavos_i": {if (!axe_itemCreado) exitWith {[] spawn {sleep 0.1;closeDialog 0;player removeItem "POP_BandaClavos_i";["POP_BandaClavos"] spawn ica_fnc_objetos;};};};
   
 
   	case "pop_cannabis_i": { 0 spawn ica_fnc_marijuana};
	case "pop_coca_b":  { 0 spawn ica_fnc_cocaine };
	case "pop_opio_b":  { 0 spawn ica_fnc_heroin};
	case "pop_efedrina_b":  { 0 spawn ica_fnc_meth};
	case "pop_efedrina_meta_b":  { 0 spawn ica_fnc_crank };
	case "pop_meta_b":  { 0 spawn ica_fnc_crank };

	case "pop_metadona": { ["pastillaAntidroga"] spawn ica_fnc_usarDroga; _item spawn {sleep 0.1; player removeItem "pop_metadona"} };
	case "pop_drogotest": { ["testDrogas"] spawn ica_fnc_usarDroga;};
	case "pop_prob_inv": { ["deteccion"] spawn ica_fnc_pandemia;};
 
 //Items AxE
 	case "pop_ied_inv":  { ["plantar"] spawn ica_fnc_ied; _item spawn {sleep 0.1; player removeItem "pop_ied_inv"} };
	case "pop_movil_s":  { _pos = getPos player; [_pos] spawn ica_fnc_generoPaqueteAereo; };	
	case "pop_vacuna1": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia; ["cura","pop_vacuna1"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna2": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia; ["cura","pop_vacuna2"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna3": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia;  ["cura","pop_vacuna3"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna4": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia;  ["cura","pop_vacuna4"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna5": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia;  ["cura","pop_vacuna5"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna6": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia;  ["cura","pop_vacuna6"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna7": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia;  ["cura","pop_vacuna7"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna8": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia;  ["cura","pop_vacuna8"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna9": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia;  ["cura","pop_vacuna9"] spawn ica_fnc_pandemia}]}};
	case "pop_vacuna10": { 0 spawn {sleep 0.1; accionPandemia = player addAction ["Aplicar cura",{player removeAction accionPandemia;  ["cura","pop_vacuna10"] spawn ica_fnc_pandemia}]}};
 
 //Robo banco Rosen
	case "pop_taladro": {
		_d = player distance cajaBanco;
		if(_d <= 10) then {
			0 spawn {sleep 1.2; ["pop_taladro", -1] call ica_fnc_item;};
			[] spawn ica_fnc_bancoheist;
		};
	};
};
