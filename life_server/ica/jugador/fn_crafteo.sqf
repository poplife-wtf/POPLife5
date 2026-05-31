
/*
Crafteo por Icaruk & AxE
	["menu"] call ica_fnc_crafteo;
*/

_param = _this select 0;

_fnc_ingredientes = {
	private ["_cosa", "_ingred"];
	_cosa = _this select 0;
	switch (_cosa) do {
		case "": {_ingred = ["Selecciona una receta", 0] };


		// materiales
		case "pop_tela": {_ingred = ["pop_algodon_i", 2] };
		case "pop_silicio": {_ingred = ["pop_arena_r", 2] };
		case "pop_cristal": {_ingred = ["pop_arena_r", 4] };
		case "pop_paneldecristal": {_ingred = ["pop_cristal", 4] };
		case "pop_botella": {_ingred = ["pop_cristal", 1] };
		case "pop_lingotehierro": {_ingred = ["pop_hierro_r", 4] };
		case "pop_granlingote": {_ingred = ["pop_lingotehierro", 6] };
		case "pop_componentes": {_ingred = [["pop_hierro_r", 1, "pop_silicio", 1,"pop_cristal",1], 20] };
		case "pop_polvora": {_ingred = [["pop_arena_r", 1, "pop_carbon_r", 1], 20] };
		case "pop_pintura": {_ingred = [["pop_arena_r", 5, "pop_carbon_r", 1,"pop_silicio", 5], 20] };
		case "pop_oxigeno": {_ingred = [["pop_botella", 1, "pop_carbon_r", 1, "pop_componentes", 5], 20] };

		// ropa	
		case "EF_M_jkt2": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "EF_M_jkt22": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "EF_M_jkt1": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "EF_M_jkt2_2": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };		
		case "EF_M_jkt2_22": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "EF_M_jkt1_2": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
	
	
		//chalecos			
		case "pop_chaleco_carga": {_ingred = [["pop_tela", 6], 5] };
		case "CUP_V_RUS_Smersh_1": {_ingred = [["pop_tela", 3], 5] };
		case "TAC_HSG_ABH_B": {_ingred = [["pop_tela", 3], 5] };
		case "CUP_V_OI_TKI_Jacket2_06": {_ingred = [["pop_tela", 3], 5] };
		case "TAC_V_Sheriff_BA_TB5": {_ingred = [["pop_hierro_r", 1, "pop_silicio", 1,"pop_tela", 3], 5] };
		case "TAC_FS_FO_mL_B": {_ingred = [["pop_hierro_r", 1, "pop_silicio", 1,"pop_tela", 3], 5] };
		case "TAC_V_Sheriff_BA_TB5": {_ingred = [["pop_hierro_r", 1, "pop_silicio", 1,"pop_tela", 3], 5] };
	

		//mochilas
		case "A3L_BergenMurica":{_ingred = [["pop_bamboo_i", 1, "pop_tela", 1],5] };
		case "CUP_B_GER_Pack_Tropentarn": {_ingred = [["pop_bamboo_i", 2, "pop_tela", 1], 5] };
		case "mochila_mediana":{_ingred = [["pop_bamboo_i", 2, "pop_tela", 2], 5] };
		case "mochila_grande": {_ingred = [["pop_bamboo_i", 2, "pop_tela", 3], 5] };

		//mascaras
		case "CUP_H_ChDKZ_Beret": {_ingred = ["pop_tela", 3] };
		case "G_Bandanna_beast": {_ingred = ["pop_tela", 3] };
		case "pop_stormtrooper": {_ingred = ["pop_tela", 3] };
		case "TRYK_Kio_Balaclava": {_ingred = ["pop_tela", 3] };
		case "CUP_H_RUS_TSH_4_Brown": {_ingred = ["pop_tela", 3] };
		case "CUP_H_TK_Lungee": {_ingred = ["pop_tela", 3] };
		case "G_Balaclava_TI_G_tna_F": {_ingred = ["pop_tela", 3] };
	

		//herramientas ladron		
		case "pop_Ganzua": {_ingred = [["pop_lingotehierro", 1], 5] };
		case "pop_esposas":{_ingred = [["pop_lingotehierro", 1], 5] };
		case "pop_llaves": {_ingred = [["pop_lingotehierro", 1], 5] };
		case "MeleeCrowbar": {_ingred = [["pop_lingotehierro", 1], 5] };
		case "soplete": {_ingred = [["pop_oxigeno", 1,"pop_componentes",1,"pop_granlingote", 1], 5] };
		

		//chalecos antibalas
		case "k_cut_7": {_ingred = [["pop_tela", 4,"pop_bamboo_i",1,"pop_lingotehierro", 1], 5] };
		case "TAC_PBDFG2_B_1": {_ingred = [["pop_tela", 4,"pop_bamboo_i",1,"pop_lingotehierro", 1], 5] };
		case "pop_chaleco_cmd_cmd_31": {_ingred = [["pop_tela", 4,"pop_bamboo_i",1,"pop_lingotehierro", 1], 5] };
		case "TAC_V_Sheriff_BA_TBL3_BK": {_ingred = [["pop_tela", 4,"pop_bamboo_i",1,"pop_lingotehierro", 1], 5] };
		case "TAC_Punisher_Vest_BK": {_ingred = [["pop_tela", 4,"pop_bamboo_i",1,"pop_lingotehierro", 1], 5] };

		//ropa especial	
		case "EF_M_jkt2": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "EF_M_jkt22": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "EF_M_jkt1": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "EF_M_jkt2_2": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };		
		case "EF_M_jkt2_22": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "EF_M_jkt1_2": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };		
		case "EF_M_jkt2_3": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };				
		case "EF_M_jkt2_32": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };		
		case "EF_M_jkt1_3": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };		
		case "EF_M_jkt32_2": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };		
		case "EF_M_jkt2_4": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };		
		case "EF_M_jkt4": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };		
		case "EF_M_jkt3": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };	
		case "EF_M_jkt42": {_ingred = [["pop_tela", 1, "pop_lana", 1], 5] };
		case "U_C_Polo_Dalton": {_ingred = [["pop_tela", 1,"pop_bamboo_i",1], 30] };
		case "CUP_U_O_CHDKZ_Lopotev": {_ingred = [["pop_tela",2,"pop_bamboo_i",1], 30] };
		case "EF_suit_6": {_ingred = [["pop_tela",2,"pop_bamboo_i",1], 30] };
		case "U_B_Wetsuit": {_ingred = [["pop_tela",2,"pop_bamboo_i",1], 30] };
		case "V_RebreatherB": {_ingred = [["pop_componentes", 1,"pop_lingotehierro", 1], 25] };
		case "G_Diving": {_ingred = [["pop_componentes",1,"pop_lingotehierro", 1], 20] };
		
		//herramientas crimen		
		case "pop_taladro": {_ingred = ["pop_lingotehierro",2,"pop_componentes",7] };
		case "O_IR_Grenade": {_ingred = [["pop_componentes",3,"pop_lingotehierro", 1,"pop_arena_r",1], 5] };
		case "hakiador_puertas": {_ingred = [["pop_lingotehierro",1,"pop_componentes",2], 5] };
		case "POP_BandaClavos_i": {_ingred = [["pop_lingotehierro",3,"pop_componentes",3], 5] };
		case "CSW_FN57": {_ingred = [["pop_granlingote",4,"pop_componentes",2,"pop_polvora",2], 5] };
		case "CSW_20Rnd_57x28_SS198": {_ingred = [["pop_hierro_r",2,"pop_polvora",1], 2] };
		case "CSW_FN57_silencer2": {_ingred = [["pop_lingotehierro",2,"pop_componentes",1], 5] };
		case "KA_Mk23_black": {_ingred = [["pop_granlingote",4,"pop_componentes",2,"pop_polvora",2], 5] };
		case "KA_12Rnd_45ACP_FMJ_Mag": {_ingred = [["pop_hierro_r",2,"pop_polvora",1], 2] };
		case "KA_12Rnd_45ACP_JHP_High_Presure_Mag": {_ingred = [["pop_hierro_r",2,"pop_polvora",1], 2] };
		
		//bombas
		case "pop_c4": {_ingred = [["pop_componentes", 2,"pop_lingotehierro",3,"pop_silicio",2,"pop_polvora",1], 2] };
			

		// misc
		case "pop_bisturi_item": {_ingred = [["pop_lingotehierro",3,"pop_paneldecristal",2],2] };
		case "pop_tramadol": {_ingred = [["pop_botella",1,"pop_alcohol",1,"pop_opio_b",5], 10] };
		case "pop_pociondeparkour": {_ingred = [["pop_botella",1,"pop_polvora",2,"pop_r_monster",5], 10] };

		// vehículos

	};

	if (isNil {_this select 1}) then { // no he llamado a la funcion pidiendo tiempo, devuelvo ingredientes
		if ((typeName (_ingred select 0)) == "STRING") then { // contiene 1 array
			_ingred
		} else { // contiene 2 arrays, pero sólo devuelvo 1
			_ingred select 0
		};
	} else { // aquí la he llamado con ["nombre", "tiempoCraft"] así que devuelvo número
		if ((typeName (_ingred select 0)) == "STRING") then { // no tiene tiempo definido, le pongo por defecto y lo devuelvo
			_ingred = 10;
			_ingred
		} else { // tiene uno y lo devuelvo
			_ingred = _ingred select 1;
			_ingred
		};
	};
};

_fnc_preguntoOresto = {
	private ["_param", "_ing", "_n", "_final"];
	_param = _this select 0;
	_ing = _this select 1;
	_n = _this select 2;

	_tengo = false;
	_tengo = switch (_param) do {
		case "pregunto": {	if (([_ing] call ica_fnc_tengo) >= _n) then {true};	};
		case "resto": { [_ing, _n *-1] call ica_fnc_item };
	};
	if (isNil {_tengo}) exitWith {false};
	_tengo
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "menu") exitWith {
	
	disableSerialization;
	createDialog "crafteo";
	_ui = uiNamespace getVariable "crafteo";
	_lista1 = (_ui displayCtrl 5035);
	_lista3 = (_ui displayCtrl 5037);

	_categorias = [ "Materiales","Ropa","Chalecos","Mochilas", "Mascaras", "Ladron", "Antibalas","Ropa Molona","Crimen","Bombas","Misc" ];

	_idx = 0;
	lbClear _lista1;
	while {_idx < (count _categorias)} do { // categorias
		_lista1 lbAdd format [(_categorias select _idx)];
		_lista1 lbSetData [_idx, (_categorias select _idx)];
		_idx = _idx + 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "actualiza2") exitWith { // ver recetas
	
	disableSerialization;
	_ui = uiNamespace getVariable "crafteo";
	_lista1 = (_ui displayCtrl 5035);
	_lista2 = (_ui displayCtrl 5036);
	_lista3 = (_ui displayCtrl 5037);
	_idxLista1 = lbCurSel 5035;
	_categoria = _lista1 lbData _idxLista1;

	private "_recetas";
	switch (_categoria) do {

		case "Materiales": {
			_recetas = [
				["pop_tela", 1], ["pop_silicio", 1], ["pop_cristal", 1], ["pop_paneldecristal", 1], ["pop_botella", 1], ["pop_lingotehierro", 1], ["pop_granlingote", 1],
				["pop_componentes", 1],["pop_polvora", 1],["pop_pintura", 1],["pop_oxigeno", 1]
			];
		};
		case "Ropa": {
			_recetas = [["EF_M_jkt2",1],["EF_M_jkt22",1],["EF_M_jkt1",1],["EF_M_jkt2_2",1],["EF_M_jkt2_22",1],["EF_M_jkt1_2",1]];
		};

		
		case "Chalecos": {
			_recetas = [
				["pop_chaleco_carga", 1],["TAC_HSG_ABH_B", 1], ["TAC_Punisher_Vest_BK",1]
			];

		};


		case "Mochilas": {
			_recetas = [
				["A3L_BergenMurica", 1], ["mochila_mediana", 1], ["mochila_grande", 1]
			];
		};


		case "Mascaras": {
			_recetas = [["CUP_H_ChDKZ_Beret", 1], ["G_Bandanna_beast", 1], ["pop_stormtrooper", 1], ["TRYK_Kio_Balaclava", 1], 
			 ["CUP_H_TK_Lungee", 1], ["G_Balaclava_TI_G_tna_F", 1] 

			 ];
		};

		case "Ladron": {
			_recetas = [["pop_Ganzua", 1], ["pop_esposas", 1], ["pop_llaves", 1], ["MeleeCrowbar", 1], ["soplete", 1]];
		};


		case "Antibalas": {
			_recetas = [["k_cut_7", 1], ["TAC_PBDFG2_B_1", 1], ["pop_chaleco_cmd_cmd_31", 1], ["TAC_V_Sheriff_BA_TBL3_BK", 1]];
		};


		case "Ropa Molona": {
			_recetas = [["EF_M_jkt2",1],["EF_M_jkt22",1],["EF_M_jkt1",1],["EF_M_jkt2_2",1],["EF_M_jkt2_22",1],["EF_M_jkt1_2",1],["EF_M_jkt2_3",1],["EF_M_jkt2_32",1],["EF_M_jkt1_3",1],["EF_M_jkt32_2",1],["EF_M_jkt2_4",1],["EF_M_jkt4",1],["EF_M_jkt3",1],["EF_M_jkt42",1],["U_B_Wetsuit", 1],["V_RebreatherB", 1],["G_Diving", 1]];
		};

		case "Crimen": {
			_recetas = [ ["pop_taladro", 1], ["O_IR_Grenade", 1], ["hakiador_puertas", 1] ,["POP_BandaClavos_i",1],["pop_movil_s",1],["CSW_FN57",1],["CSW_20Rnd_57x28_SS198",1],["CSW_FN57_silencer2",1]
			,["KA_Mk23_black",1],["KA_12Rnd_45ACP_JHP_High_Presure_Mag",1],["KA_12Rnd_45ACP_FMJ_Mag",1]];
		};


		case "Bombas": {
			_recetas = [["pop_c4", 1]];
		};

		case "Misc": {
			_recetas = [["pop_bisturi_item", 1], ["pop_tramadol", 1], ["pop_pociondeparkour", 1]];
		};

		case "Vehículos": {
			_recetas = [["", 1]];
		};
	};
	
	_idx = 0;
	lbClear _lista2;
	lbClear _lista3;
	while {_idx < (count _recetas)} do { // recetas
		_nom = [_recetas select _idx select 0] call ica_fnc_classToName;
		_lista2 lbAdd _nom;
		_lista2 lbSetData [_idx, (_recetas select _idx select 0)];
		_lista2 lbSetValue [_idx, (_recetas select _idx select 1)];
		_lista2 lbSetPicture [_idx, [_recetas select _idx select 0] call ica_fnc_classToPic];
		_idx = _idx + 1;
	};
};

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "actualiza3") exitWith { // ver ingredientes
	
	disableSerialization;
	_ui = uiNamespace getVariable "crafteo";
	_lista2 = (_ui displayCtrl 5036);
	_lista3 = (_ui displayCtrl 5037);
	_boton = (_ui displayCtrl 5039);
	_idxLista2 = lbCurSel 5036;
	_receta = [_lista2 lbData _idxLista2, _lista2 lbValue _idxLista2];

	_ingredientes = ([_receta select 0] call _fnc_ingredientes);

	lbClear _lista3;
	_idx = 0;
	_idxLista = 0;
	while {_idx < (count _ingredientes)} do { // meto ingredientes en lista
		_lista3 lbAdd format ["%1 x %2", [_ingredientes select _idx] call ica_fnc_classToName, (_ingredientes select (_idx + 1))];
		_lista3 lbSetPicture [_idx, [_ingredientes select _idx] call ica_fnc_classToPic];
		_lista3 lbSetColor [_idxLista, [0.2, 1, 0.2, 1]]; // verde

		if !(["pregunto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_preguntoOresto) then {
			_lista3 lbSetColor [_idxLista, [1, 0.2, 0.2, 1]]; // rojo
		};

		_idx = _idx + 2;
		_idxLista = _idxLista + 1;
	};

	receta = _receta;
	ingredientes = _ingredientes;

	_boton buttonSetAction '
		["craft"] spawn ica_fnc_crafteo;
	';

};
// ["craft", receta, ingredientes] ica_fnc_crafteo;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if (_param isEqualTo "craft") exitWith {

	disableSerialization;
	_ui = uiNamespace getVariable "crafteo";
	_barrita = (_ui displayCtrl 5038);
	_boton = (_ui displayCtrl 5039);
	_lista = _ui displayCtrl 5036;
	//_receta = _this select 1;
	//_ingredientes = _this select 2;
	_receta = receta;
	_ingredientes = ingredientes;

	_boton ctrlEnable false;
	_lista lbSetCurSel -1;

	receta = nil;
	ingredientes = nil;
	boton = nil;

	private "_fuera";

	_idx = 0; // tengo ingredientes?
	while {_idx < (count _ingredientes)} do {
		if !(["pregunto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_preguntoOresto) exitWith {_fuera = true; };
		_idx = _idx + 2;
	};
	if (!isNil {_fuera}) exitWith {hint "No tienes suficientes ingredientes"; };

	_t = [_receta select 0, "tiempoCraft"] call _fnc_ingredientes;	// saco tiempo de crafteo
	_frag = (100 / _t) / 100;
	while {true} do {
		if (_t <= 0) exitWith {_barrita progressSetPosition 0; };
		if (!alive player) exitWith {fuera = true};
		if (isNull (findDisplay 5040)) exitWith {fuera = true};
		_barrita progressSetPosition ((progressPosition _barrita) + _frag);
		_t = _t - 1;
		sleep 1;
	};
	_boton ctrlEnable true;
	if (!isNil {fuera}) exitWith {hint "Crafteo cancelado"; fuera = nil; };

	// Compruebo condiciones
	_cra = "cra" call ica_fnc_expToLevel;

	
	_que = _receta select 0;

	_puedo = true;
	_puedo = switch (true) do {

		// ropa		
		case ((_que == "CUP_U_C_Worker_01") AND (_cra < 1)): {false};
		case ((_que == "CUP_U_I_GUE_Anorak_01") AND (_cra < 1)): {false};
		case ((_que == "CUP_U_O_CHDKZ_Bardak") AND (_cra < 1)): {false};
		case ((_que == "CUP_U_I_GUE_Flecktarn3") AND (_cra < 1)): {false};

		//chalecos	
		case ((_que == "pop_chaleco_carga") AND (_cra < 2)): {false};
		case ((_que == "CUP_V_RUS_Smersh_1") AND (_cra < 2)): {false};
		case ((_que == "TAC_HSG_ABH_B") AND (_cra < 2)): {false};
		case ((_que == "CUP_V_OI_TKI_Jacket2_06") AND (_cra < 2)): {false};
		case ((_que == "TAC_Punisher_Vest_BK") AND (_cra < 2)): {false};

		//mochilas
		case ((_que == "A3L_BergenMurica") AND (_cra < 3)): {false};
		case ((_que == "CUP_B_GER_Pack_Tropentarn") AND (_cra < 3)): {false};
		case ((_que == "mochila_mediana") AND (_cra < 3)): {false};
		case ((_que == "mochila_grande") AND (_cra < 3)): {false};
		
		//mascaras		
		case ((_que == "CUP_H_ChDKZ_Beret") AND (_cra < 4)): {false};
		case ((_que == "G_Bandanna_beast") AND (_cra < 4)): {false};
		case ((_que == "pop_stormtrooper") AND (_cra < 4)): {false};
		case ((_que == "TRYK_Kio_Balaclava") AND (_cra < 4)): {false};
		case ((_que == "CUP_H_RUS_TSH_4_Brown") AND (_cra < 4)): {false};
		case ((_que == "CUP_H_TK_Lungee") AND (_cra < 4)): {false};
		case ((_que == "G_Balaclava_TI_G_tna_F") AND (_cra < 4)): {false};

		//herramientas ladron
		case ((_que == "pop_Ganzua") AND (_cra < 5)): {false};
		case ((_que == "pop_esposas") AND (_cra < 5)): {false};
		case ((_que == "pop_llaves") AND (_cra < 5)): {false};
		case ((_que == "MeleeCrowbar") AND (_cra < 5)): {false};
		
		//chalecos antibalas
		case ((_que == "k_cut_7") AND (_cra < 6)): {false};
		case ((_que == "TAC_PBDFG2_B_1") AND (_cra < 6)): {false};
		case ((_que == "pop_chaleco_cmd_cmd_31") AND (_cra < 6)): {false};
		case ((_que == "TAC_V_Sheriff_BA_TBL3_BK") AND (_cra < 6)): {false};

		//ropa especial	
		case ((_que == "U_C_Polo_Dalton") AND (_cra < 7)): {false};	
		case ((_que == "CUP_U_O_CHDKZ_Lopotev") AND (_cra < 7)): {false};
		case ((_que == "EF_suit_6") AND (_cra < 7)): {false};
		case ((_que == "CUP_U_C_Mechanic_01") AND (_cra < 7)): {false};	
		case ((_que == "U_B_Wetsuit") AND (_cra < 7)): {false};
		case ((_que == "V_RebreatherB") AND (_cra < 7)): {false};
		case ((_que == "G_Diving") AND (_cra < 7)): {false};

		//herramientas crimen
		case ((_que == "pop_taladro") AND (_cra < 8)): {false};	
		case ((_que == "hakiador_puertas") AND (_cra < 8)): {false};
		case ((_que == "POP_BandaClavos_i") AND (_cra < 8)): {false};
		case ((_que == "CSW_FN57") AND (_cra < 8)): {false};
		case ((_que == "KA_Mk23_black") AND (_cra < 8)): {false};
		
		//bombas
		case ((_que == "pop_c4") AND (_cra < 9)): {false};

		// misc
		case ((_que == "pop_bisturi_item") AND (_cra < 10)): {false};
		case ((_que == "pop_tramadol") AND (_cra < 10)): {false};
		case ((_que == "pop_pociondeparkour") AND (_cra < 10)): {false};
	
	
	};

	if (!_puedo) exitWith {hint "Aún no sabes hacer eso"};

	if (
		!(player canAdd (_receta select 0)) AND
		(((_receta select 0) call ica_fnc_item) != "Bac") AND
		(((_receta select 0) call ica_fnc_item) != "Ves")
	) exitWith {hint "No tienes suficiente espacio"};

	// Resto ingredientes y crafteo
	_idx = 0;
	while {_idx < (count _ingredientes)} do {
		["resto", _ingredientes select _idx, _ingredientes select (_idx + 1)] call _fnc_preguntoOresto;
		_idx = _idx + 2;
	};

	if ((_receta select 0) == "") exitWith {
		0 spawn {hint "¿Qué intentas?";
		sleep 2;
		hint "No, en serio, ¿qué intentas? xD"};
	};

	[_receta select 0, _receta select 1] call ica_fnc_item;
	hint format ["Has crafteado %1 unidad(es) de %2", _receta select 1, [_receta select 0] call ica_fnc_classToName];
};
