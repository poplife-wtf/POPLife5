#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Policia Metropolis"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
        _ret set[count _ret,["POP_CHAW_P","Traje CNP gala",100]];
		_ret set[count _ret,["POP_CHAW_P1","Traje GC gala",100]];
		_ret set[count _ret,["CNP_MUJER","Traje CNP Mujer",100]];
		_ret set[count _ret,["GC_MUJER","Traje GC Mujer",100]];
		_ret set[count _ret,["GCC_Pop","Traje GC",100]];
		_ret set[count _ret,["GCM_Pop","Traje GC",100]];
		_ret set[count _ret,["UPR_Pop","Traje UPR",100]];
		_ret set[count _ret,["GRS_Pop","Traje GRS",100]];
		_ret set[count _ret,["CNP_Pop","Traje CNP",100]];
		_ret set[count _ret,["GC_Pop","Guardia civil",100]];
		_ret set[count _ret,["CNP2_Pop","Traje CNP2",100]];
		_ret set[count _ret,["GC2_Pop","Guardia civil 2",100]];
		_ret set[count _ret,["GCT_Pop","Guardia civil trafico",100]];
		_ret set[count _ret,["GC3_Pop","Guardia manga larga",100]];
		_ret set[count _ret,["TRAFICO_Pop","Guardia civil trafico",100]];
		_ret set[count _ret,["CNP3_Pop","Traje CNP3",100]];
		_ret set[count _ret,["UEI_Pop","Traje",100]];
		_ret set[count _ret,["U_B_HeliPilotCoveralls","Piloto",100]];
		_ret set[count _ret,["U_B_Wetsuit","Traje de Buzo",100]];
		
        if(__GETC__(life_coplevel) >= 6) then
        {
            _ret set[count _ret,["GEO_Pop","GEO",150]];
        };

    };

	//Hats
	case 1:
	{

			_ret set[count _ret,["H_Beret_blk_POLICE",nil,15]];
			_ret set[count _ret,["Casque_Moto",nil,15]];
			_ret set[count _ret,["H_RacingHelmet_1_green_F",nil,15]];
			_ret set[count _ret,["H_RacingHelmet_1_white_F",nil,15]];
			_ret set[count _ret,["H_RacingHelmet_1_black_F",nil,15]];			
			_ret set[count _ret,["H_Beret_02",nil,15]];
			_ret set[count _ret,["H_Cap_press",nil,15]];
			_ret set[count _ret,["GORRA_CNP",nil,15]];
			_ret set[count _ret,["GORRA_GC",nil,15]];
			_ret set[count _ret,["BOINA1_GC",nil,15]];
			_ret set[count _ret,["GORRA_GC_M",nil,15]];
			_ret set[count _ret,["BOINA_CNP",nil,15]];
			_ret set[count _ret,["BOINA1_CNP",nil,15]];
			_ret set[count _ret,["BOINA_CNP2",nil,15]];
			_ret set[count _ret,["BOINA_CNP3",nil,15]];  
			_ret set[count _ret,["BOINA_GC",nil,15]];
			_ret set[count _ret,["BOINA_GC2",nil,15]];
			_ret set[count _ret,["H_PilotHelmetHeli_B",nil,20]];

		if(__GETC__(life_coplevel) > 2) then
		{
            		_ret set[count _ret,["POP_tricornio","tricornio",15]];
		};
		if(__GETC__(life_coplevel) > 5) then
        	{
        		_ret set[count _ret,["CASCO_GEO",nil,100]];
			_ret set[count _ret,["CASCO_GEO2",nil,100]];
		};


	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Balaclava_blk",nil,30],
			["G_Combat",nil,55],
			["G_Diving",nil,50],
			["G_EWK_Cigar1", "Puro",60 * Desc],
			["G_EWK_Cig1", "Cigarrillo",60 * Desc],
			["G_EWK_Cig2", "Cigarrillo Quemado 1",60 * Desc],
			["G_EWK_Cig3", "Cigarrillo Consumido",60 * Desc],
			["G_EWK_Cig6", "Cigarrillo Quemado Encendido",60 * Desc],
			["G_EWK_Cig4", "Cigarrillo Encendido",60 * Desc],
			["SFG_Tac_ChopsB", "Barba Corta Rubia",60 * Desc],
			["SFG_Tac_ChopsD", "Barba Corta Castaña",60 * Desc],
			["SFG_Tac_ChopsO", "Barba Corta Canosa",60 * Desc],
			["SFG_Tac_smallBeardD", "Barba Mediana Castaña",60 * Desc],
			["SFG_Tac_BeardD", "Barba Larga Castaña",60 * Desc],
			["SFG_Tac_chinlessbD", "Barba & Bigote Castaño",60 * Desc],
			["SFG_Tac_moustacheD", "Bigote Castaño",60 * Desc],
			["TRYK_Beard_BK", "Barba & Perilla Negra Corta",60 * Desc],
			["TRYK_Beard", "Barba & Perilla Castaña 1 Corta",60 * Desc],
			["TRYK_Beard_BK3", "Barba & Perilla Negra Larga",60 * Desc],
			["TRYK_Beard3", "Barba & Perilla Castaña 1 Larga",60 * Desc],
			["TRYK_Beard_BW3", "Barba & Perilla Castaña 2 Larga",60 * Desc],
			["TRYK_Beard_Gr3", "Barba & Perilla Larga",60 * Desc]			
		];
	};

	//Vest
	case 3:
	{

		_ret set[count _ret,["CNP_BELT","Chaleco CNP1",80]];     
		_ret set[count _ret,["CNP_CHALECO","Chaleco CNP2",80]];
		_ret set[count _ret,["CNP_CHALECO2","Chaleco CNP3",80]];
		_ret set[count _ret,["S_VHO_OV_BLK_2","Chaleco CNP4",80]];
		_ret set[count _ret,["S_VHO_PV_OD1","Chaleco CNP Intervencion",80]];
		_ret set[count _ret,["S_VHO_PB_2","Cinturon GC",80]];
		_ret set[count _ret,["GC_CHALECO","Chaleco guardia civil",80]];
		_ret set[count _ret,["S_VHO_OV_BLK_3","Chaleco guardia civil 2",80]];
		_ret set[count _ret,["S_VHO_PV_OD","Chaleco guardia civil Intervencion",80]];
		_ret set[count _ret,["UEI_CHALECO","Chaleco UEI",500]];
		_ret set[count _ret,["pop_chaleco_pocient2","Chaleco Cientifica",100]];
		_ret set[count _ret,["GEO_CHALECO","Chaleco geo",500]];
		_ret set[count _ret,["pop_chaleco_gcreflectante","Chaleco reflectante ATGC",100]];
		_ret set[count _ret,["V_RebreatherB","Respirador",100]];



	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Parachute",nil,100],
			["mochila_mediana",nil,100]
			//["B_TacticalPack_blk",nil,1000],
			//["B_Carryall_cbr",nil,1000]
		];
	};
};

_ret;