/*
    File: fn_houseConfig.sqf
    Author: BoGuu

    Description:
    Fetch data from Config_Housing/Garages
*/

private["_house"];
_house = [_this,0,"",[""]] call BIS_fnc_param;
if(_house == "") exitWith {[]};

/*
	Return Format:
	[price,# of containers allowed]
*/
switch (true) do {

	case (_house in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"]): {[275000,5]};
	case (_house in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"]): {[415000,6]};
	case (_house in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]): {[30500,0]};
	case (_house in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"]): {[222500,3]};
	case (_house in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]): {[257500,2]};
	case (_house in ["Land_i_House_Small_03_V1_F"]): {[1750000,5]};
	case (_house in ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"]): {[257500,2]};
	case (_house in ["Land_i_Addon_02_V1_F"]): {[222500,3]};
	case (_house in ["Land_HouseB"]): {[485000,6]};
	case (_house in ["Land_HouseA"]): {[485000,6]};
	case (_house in ["land_pop_chalet"]): {[485000,6]};
	case (_house in ["Land_HouseC1_L"]): {[485000,6]};
	case (_house in ["Land_Home6b_DED_Home6b_01_F"]): {[485000,6]};
	case (_house in ["Land_Home3r_DED_Home3r_01_F"]): {[485000,6]};
	//case (_house in ["Land_HouseDoubleAL"]): {[485000,6]};
	//case (_house in ["Land_HouseDoubleAL2"]): {[485000,6]};
	case (_house in ["Land_Ranch_DED_Ranch_01_F"]): {[257500,5]};
	case (_house in ["Land_pop_eurobldg_02"]): {[257500,5]};
	case (_house in ["Land_Ranch_DED_Ranch_02_F"]): {[257500,5]};
	case (_house in ["Land_pop_eurobldg_05"]): {[257500,5]};
	case (_house in ["Land_pop_eurobldg_11"]): {[257500,5]};
	case (_house in ["Land_pop_eurobldg_08"]): {[257500,5]};
	case (_house in ["land_POP_Mansion_4"]): {[457500,6]};
	case (_house in ["Land_pop_eurobldg_01"]): {[257500,5]};
	case (_house in ["Land_pop_eurobldg_04"]): {[257500,5]};
	case (_house in ["Land_pop_eurobldg_12"]): {[257500,5]};
	case (_house in ["Land_pop_eurobldg_07"]): {[257500,5]};
	case (_house in ["land_pop_caravana1"]): {[57500,1]};
	case (_house in ["land_pop_caravana2"]): {[57500,1]};
	case (_house in ["land_pop_caravana"]): {[57500,1]};
	case (_house in ["Land_pop_duplex1"]): {[485000,1]};
	//apartamentos
	case (_house in ["Land_pop_bloques2"]): {[157500,5]};
	case (_house in ["Land_pop_Apartamentos"]): {[157500,5]};
	case (_house in ["Land_pop_Apartamentos_Black"]): {[157500,5]};
	case (_house in ["Land_pop_bloques1"]): {[157500,5]};
	//
	case (_house in ["Land_HouseB1"]): {[157500,5]};
	case (_house in ["Land_pop_bloques2"]): {[157500,5]};
	case (_house in ["Land_mr_wooden_house01_red"]): {[257500,5]};
	case (_house in ["land_pop_mansion"]): {[257500,5]};
	case (_house in ["land_modern6"]): {[257500,5]};
	case (_house in ["Land_pop_mansion_deluxe"]): {[457500,5]};
	
	
	default {[]};
};
