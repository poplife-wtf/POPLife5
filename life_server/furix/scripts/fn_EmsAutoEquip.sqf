// By FuRixX Lamborghini \\

if (side player != Independent) exitWith {};
_Precio = 500;
_Equipo = [];
_Seleccion = _this select 0;
_EquipoSeleccionado = "";

if (isNil "_Seleccion") exitWith {hint "ERROR, PARAMETRO INCORRECTO"};

if (pop_din < _Precio) exitWith {
hint format ["Necesitas %1€ para comprar este equipo",_Precio];
};

switch (_Seleccion) do {
	
	case "Init": {
	_NPCs = [FuRixX_AutoEquipEMS_1,FuRixX_AutoEquipEMS_2];	
	
	{				
		_x addAction ["Voluntario",{["Voluntario"] spawn FuRixX_fnc_EmsAutoEquip}];
		_x addAction ["SME",{["SME"] spawn FuRixX_fnc_EmsAutoEquip}];
		_x addAction ["Jefatura",{["Jefatura"] spawn FuRixX_fnc_EmsAutoEquip}];
		_x addAction ["Cirujano",{["Cirujano"] spawn FuRixX_fnc_EmsAutoEquip}];
		_x addAction ["Buzo",{["Buzo"] spawn FuRixX_fnc_EmsAutoEquip}];
		_x addAction ["Gruista",{["Gruista"] spawn FuRixX_fnc_EmsAutoEquip}];
		_x addAction ["Infecciones",{["Infecciones"] spawn FuRixX_fnc_EmsAutoEquip}];	
	} forEach _NPCs;
	
	};

	case "Voluntario": {
	_Equipo = [[],[],[],["CRUZ_ROJA",[["pop_note",1,1]]],[],["mochila_mediana",[["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_salineIV_500",7],["ACE_plasmaIV_500",2],["ACE_personalAidKit",5],["ACE_tourniquet",5],["ACE_surgicalKit",1],["ToolKit",2],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_bloodIV_250",5],["ACE_bloodIV_500",10],["pop_kiwi",10,1]]],"GORRA_CRUZROJA","",[],["ItemMap","ItemGPS","","ItemCompass","",""]];
	_EquipoSeleccionado = "Voluntario";
	player setUnitLoadout _Equipo;
	pop_din = pop_din - _Precio;
	hint format ['Equipacion "%1" \n Cargada Correctamente', _EquipoSeleccionado];
	};
	case "SME": {
	_Equipo = [[],[],[],["SME",[["pop_note",1,1]]],[],["mochila_mediana",[["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_salineIV_500",7],["ACE_plasmaIV_500",2],["ACE_personalAidKit",5],["ACE_tourniquet",5],["ACE_surgicalKit",1],["ToolKit",2],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_bloodIV_250",5],["ACE_bloodIV_500",10],["pop_kiwi",10,1]]],"GORRA_SME","",[],["ItemMap","ItemGPS","","ItemCompass","",""]];
	_EquipoSeleccionado = "SME";
	player setUnitLoadout _Equipo;
	pop_din = pop_din - _Precio;
	hint format ['Equipacion "%1" \n Cargada Correctamente', _EquipoSeleccionado];
	};
	case "Jefatura": {
	_Equipo = [[],[],[],["SME2",[["pop_note",1,1]]],[],["mochila_mediana",[["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_salineIV_500",7],["ACE_plasmaIV_500",2],["ACE_personalAidKit",5],["ACE_tourniquet",5],["ACE_surgicalKit",1],["ToolKit",2],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_bloodIV_250",5],["ACE_bloodIV_500",10],["pop_kiwi",10,1]]],"GORRA_SME","",[],["ItemMap","ItemGPS","","ItemCompass","",""]];
	_EquipoSeleccionado = "Jefatura";
	player setUnitLoadout _Equipo;
	pop_din = pop_din - _Precio;
	hint format ['Equipacion "%1" \n Cargada Correctamente', _EquipoSeleccionado];
	};
	case "Cirujano": {
	_Equipo = [[],[],[],["rds_uniform_doctor",[["pop_note",1,1]]],[],["mochila_mediana",[["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_salineIV_500",7],["ACE_plasmaIV_500",2],["ACE_personalAidKit",5],["ACE_tourniquet",5],["ACE_surgicalKit",1],["ToolKit",2],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_bloodIV_250",5],["ACE_bloodIV_500",10],["pop_kiwi",10,1]]],"","",[],["ItemMap","ItemGPS","","ItemCompass","",""]];
	_EquipoSeleccionado = "Cirujano";
	player setUnitLoadout _Equipo;
	pop_din = pop_din - _Precio;
	hint format ['Equipacion "%1" \n Cargada Correctamente', _EquipoSeleccionado];
	};
	case "Buzo": {
	_Equipo = [[],[],[],["U_B_Wetsuit",[["pop_note",1,1]]],[],["mochila_mediana",[["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_salineIV_500",7],["ACE_plasmaIV_500",2],["ACE_personalAidKit",5],["ACE_tourniquet",5],["ACE_surgicalKit",1],["ToolKit",2],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_bloodIV_250",5],["ACE_bloodIV_500",10],["pop_kiwi",10,1]]],"","",[],["ItemMap","ItemGPS","","ItemCompass","",""]];
	_EquipoSeleccionado = "Buzo";
	player setUnitLoadout _Equipo;
	pop_din = pop_din - _Precio;
	hint format ['Equipacion "%1" \n Cargada Correctamente', _EquipoSeleccionado];
	};
	case "Gruista": {
	_Equipo = [[],[],[],["TRYK_OVERALL_SAGE_BLKboots_nk_blk",[["pop_note",1,1]]],[],["mochila_mediana",[["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_salineIV_500",7],["ACE_plasmaIV_500",2],["ACE_personalAidKit",5],["ACE_tourniquet",5],["ACE_surgicalKit",1],["ToolKit",2],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_bloodIV_250",5],["ACE_bloodIV_500",10],["pop_kiwi",10,1]]],"","",[],["ItemMap","ItemGPS","","ItemCompass","",""]];
	_EquipoSeleccionado = "Gruista";
	player setUnitLoadout _Equipo;
	pop_din = pop_din - _Precio;
	hint format ['Equipacion "%1" \n Cargada Correctamente', _EquipoSeleccionado];
	};
	case "Infecciones": {
	_Equipo = [[],[],[],["POP_CHAW2_D",[["pop_note",1,1]]],[],["mochila_mediana",[["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_salineIV_500",7],["ACE_plasmaIV_500",2],["ACE_personalAidKit",5],["ACE_tourniquet",5],["ACE_surgicalKit",1],["ToolKit",2],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_bloodIV_250",5],["ACE_bloodIV_500",10],["ACE_bodyBag",3],["pop_kiwi",10,1]]],"","",[],["ItemMap","ItemGPS","","ItemCompass","",""]];
	_EquipoSeleccionado = "Infecciones";
	player setUnitLoadout _Equipo;
	pop_din = pop_din - _Precio;
	hint format ['Equipacion "%1" \n Cargada Correctamente', _EquipoSeleccionado];
	};
	
	default {
	_Equipo = [[],[],[],["CRUZ_ROJA",[["pop_note",1,1]]],[],["mochila_mediana",[["ACE_packingBandage",20],["ACE_elasticBandage",20],["ACE_salineIV_500",7],["ACE_plasmaIV_500",2],["ACE_personalAidKit",5],["ACE_tourniquet",5],["ACE_surgicalKit",1],["ToolKit",2],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_bloodIV_250",5],["ACE_bloodIV_500",10],["pop_kiwi",10,1]]],"GORRA_CRUZROJA","",[],["ItemMap","ItemGPS","","ItemCompass","",""]];
	_EquipoSeleccionado = "Default";
	player setUnitLoadout _Equipo;
	pop_din = pop_din - _Precio;
	hint format ['Equipacion "%1" \n Cargada Correctamente', _EquipoSeleccionado];
	};

};



// By FuRixX Lamborghini \\