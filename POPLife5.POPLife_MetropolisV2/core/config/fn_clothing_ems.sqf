/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"EMS Clothing Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["SAMUR_Pop",nil,50],
			["SAMUR1_Pop",nil,50],
			["SAS_Pop",nil,50],
			["POP_CHAW2_D",nil,100],
			["SAS1_Pop",nil,50],
			["SUMMA1_Pop",nil,50],
		    ["SEM_Pop",nil,50],
			["SEMLARGO_Pop",nil,50],
			["SUMMA_Pop",nil,50],
			["VOLUNTARIO_Pop",nil,50],
			["CRUZROJA_Pop",nil,50],
			["TRYK_OVERALL_SAGE_BLKboots_nk_blk2",nil,85],
			["TRYK_OVERALL_nok_flesh",nil,85],
			["TRYK_SUITS_BLK_F",nil, 100],
			["TRYK_SUITS_BLK_F",nil, 100],
			["TRYK_SUITS_BLK_F",nil, 100],
			["U_B_Wetsuit",nil,50]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["GORRA_SAMUR",nil,50],
		    ["GORRA_SEM",nil,50],
			["GORRA_CRUZ",nil,50],
			["H_Cap_Headphones",nil,50],
			["H_Orel_FireFighter",nil,85],
			["V_RebreatherB",nil,85],
			["H_CrewHelmetHeli_O",nil,85],
			["H_PilotHelmetHeli_O",nil,85],
			["H_Orel_FireFighter_Gaz",nil,85]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["Masque_Chirurgical",nil,75],
			["G_Squares",nil,10],
			["G_Aviator",nil,75],
			["G_Diving", nil, 20]
			
		];
	};
	
	//Vest
	case 3:
	{
		[
			["SAMUR_CHALECO",nil,50],
			/*
			["SAMUR_CHALECO2",nil,50],
            ["SAMUR_CHALECO3",nil,50],
			["SAMUR_CHALECO4",nil,50],
			["Respirador: V_RebreatherB",nil,50],
			["Bombero: V_Firefighter",nil,50],
			*/
			["pop_chaleco_samurrefl",nil,50],
			["pop_chaleco_samurrefl2",nil,50]
			/*
		    ["SEM_CHALECO",nil,50],
			["SEM_CHALECO2",nil,50],
		    ["SEM_CHALECO3",nil,50]
			*/
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["mochila_mediana",nil,100],
			["mochila_pequena",nil,30]
		];
	};
};
