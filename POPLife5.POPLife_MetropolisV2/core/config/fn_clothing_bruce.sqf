/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
	
	Rellenada por Juan :D

*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Moda POP"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Travello1","Vestido Travesti 1", 400 * Desc], //Travello 1
			["U_C_Travello2","Vestido Travesti 2", 400 * Desc], //travello 2
			["POP_CHAW3_D5",nil, 550 * Desc],//yoli
			["POP_Mujer_Azul",nil, 390 * Desc], //Traje Azul
			["POP_Mujer_Flores",nil, 360 * Desc], //Traje Flores
			["POP_Mujer_Manga",nil, 360 * Desc], //Traje Manga
			["POP_Mujer_Rosa",nil, 360 * Desc], //Traje Rosa
			["U_GirlSet1_uniform",nil, 390 * Desc], //Girl Set 1
			["U_GirlSet2_uniform",nil, 390 * Desc], //Girl Set 2
			["U_GirlSet4_uniform",nil, 390 * Desc], //Girl Set 4
			["EF_FEM_2U",nil, 390 * Desc], //EF Female 2
			["EF_FEM_2BK",nil, 390 * Desc], //EF Female 2 BK
			["EF_FEM_3_2",nil, 390 * Desc], //EF Female 3
			["EF_FEM_3",nil, 390 * Desc], //EF Female 3 hoodie
			["EF_FEM_3_3LPBPS",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBP",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBR",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBW",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPB",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBL",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBPS2",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBP2",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBW2",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPB2",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_3_3LPBL2",nil, 390 * Desc], //EF Female 3 Punks Hoodie Falda
			["EF_FEM_4_2LPBPS",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBP",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBR",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBW",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPB",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBL",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBPS2",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBP2",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBR2",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBW2",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPB2",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_4_2LPBL2",nil, 390 * Desc], //EF Female 4 Punks Hoodie Pantalon
			["EF_FEM_5",nil, 390 * Desc], //EF Female 5 
			["U_007_BIS_Marshall",nil, 390 * Desc], //007 Uniform
			["A3L_CivShirtObey",nil, 390 * Desc], //7 channel
			["A3L_CivShirtAdidasMake",nil, 390 * Desc], //Adidas Make
			["A3L_CivShirtAdidas_r",nil, 390 * Desc], //Adidas Rasta
			["A3L_CivShirtAdidas",nil, 390 * Desc], //Adidas
			["CUP_U_I_GUE_Anorak_01",nil, 390 * Desc], //Anorak
			["CUP_U_I_GUE_Anorak_03",nil, 390 * Desc], //Anorak
			["CUP_U_I_GUE_Anorak_02",nil, 390 * Desc], //anorak
			["A3L_CivShirtAnotherCat",nil, 390 * Desc], //Another Cat Shirt
			["APIPAS_Pop",nil, 390 * Desc], //Apipas
			["U_C_Polo_Arbitre",nil, 390 * Desc], //Arbitro
			["U_Marshal",nil, 390 * Desc], //Atuendo Comisario
			["POP_Simpson",nil, 390 * Desc], //Bart Simpson
			["A3L_CivShirtBillabong",nil, 390 * Desc], //Billabong
			["A3L_CivShirtBillabong2",nil, 390 * Desc], //Billabong 2
			["U_BG_Guerilla3_1",nil, 390 * Desc], //Blusón de guerrilla
			["A3LCokeShirt",nil, 390 * Desc], //Cannabis
			["A3LCatShirt",nil, 390 * Desc], //Cat
			["CEDA_Pop",nil, 390 * Desc], //Ceda el Vaso
			["CHAQUETAAZUL_Pop",nil, 390 * Desc], //Chaqueta Azul
			["CHAQUETALEOPARDO_Pop",nil, 390 * Desc], //Chaqueta Leopardo
			["CHAQUETAMARRON_Pop",nil, 390 * Desc], //Chaqueta Marron
			["CHAQUETANEGRA_Pop",nil, 390 * Desc], //Chaqueta Negra
			["CHAQUETAROJA_Pop",nil, 390 * Desc], //Chaqueta Roja MC
			["CHAQUETASERPIENTE_Pop",nil, 390 * Desc], //Chaqueta Serpiente
			["U_OrestesBody",nil, 390 * Desc], //Chaqueta y Pantalón
			["CUP_U_O_CHDKZ_Bardak",nil, 390 * Desc], //ChDKZ Outfit
			["CUP_U_O_CHDKZ_Lopotev",nil, 390 * Desc], //ChDKZ Tracksuit
			["U_C_Polo_Civil1",nil, 390 * Desc], //Civil1
			["CUP_U_C_Citizen_02",nil, 390 * Desc], //Civilian Clothes
			["CUP_U_C_Citizen_01",nil, 390 * Desc], //Civilian Clothes
			["CUP_U_C_Citizen_04",nil, 390 * Desc], //Civilian Clothes
			["CUP_U_C_Citizen_03",nil, 390 * Desc], //Civilian Clothes
			["A3LCloudShirt",nil, 390 * Desc], //Cloud Shirt
			["U_C_Polo_Dalton",nil, 390 * Desc], //Dalton
			["A3L_CivShirtDiamond",nil, 390 * Desc], //Diamond Shirt
			["A3L_CivShirtDJ",nil, 390 * Desc], //DJ Shirt
			["EF_HMARMY_1",nil, 390 * Desc], //EF Male Army
			["EF_HMARMY_2",nil, 390 * Desc], //EF Male Army 2
			["EF_HM_LPBPS",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBP",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBR",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBW",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBL",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBPS2",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBP2",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBR2",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBW2",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPB2",nil, 390 * Desc], //EF PUNKS hoodie
			["EF_HM_LPBL2",nil, 390 * Desc], //EF PUNKS hoodie
			["RAPTORS2_Pop",nil, 390 * Desc], //RAPTORS
			["ET_Pop",nil, 390 * Desc], //ET
			["A3L_CivShirtGetHigh",nil, 390 * Desc], //Get High
			["A3L_CivShirtGrumpyCat",nil, 390 * Desc], //Grumpy
			["TITTY_Pop",nil, 390 * Desc], //Hello Titty
			["A3L_CivShirtHollister",nil, 390 * Desc], //Hollister
			["IBERDROGA_Pop",nil, 390 * Desc], //IberDroga
			["IDIOTA_Pop",nil, 390 * Desc], //Idiota
			["TRONOS_Pop",nil, 390 * Desc], //Juego de Tronos
			["JWORLD_Pop",nil, 390 * Desc], //Jurassic World
			["A3L_CivShirtKeepCalm",nil, 390 * Desc], //Keep Calm
			["CUP_O_TKI_Khet_Jeans_04",nil, 390 * Desc], //Khe / Jeans
			["CUP_O_TKI_Khet_Jeans_02",nil, 390 * Desc], //Khet / Jeans
			["CUP_O_TKI_Khet_Jeans_01",nil, 390 * Desc], //Khet Partug
			["CUP_O_TKI_Khet_Jeans_03",nil, 390 * Desc], //Khet Partug
			["CUP_O_TKI_Khet_Partug_04",nil, 390 * Desc], //Khet Partug
			["CUP_O_TKI_Khet_Partug_02",nil, 390 * Desc], //Khet Partug
			["CUP_O_TKI_Khet_Partug_01",nil, 390 * Desc], //Khet Partug
			["CUP_O_TKI_Khet_Partug_07",nil, 390 * Desc], //Khet Partug
			["CUP_O_TKI_Khet_Partug_08",nil, 390 * Desc], //Khet Partug 
			["CUP_O_TKI_Khet_Partug_05",nil, 390 * Desc], //Khet Partug
			["CUP_O_TKI_Khet_Partug_06",nil, 390 * Desc], //Khet Partug
			["CUP_O_TKI_Khet_Partug_03",nil, 390 * Desc], //Khet Partug
			["KITKAT_Pop",nil, 390 * Desc], //Kita Kono
			["A3L_Lacoste_C",nil, 390 * Desc], //Lacoste
			["A3L_Lacoste_G",nil, 390 * Desc], //Lacoste
			["A3L_Lacoste_S",nil, 390 * Desc], //Lacoste
			["A3L_Lacoste_T",nil, 390 * Desc], //Lacoste
			["MADURANDO_Pop",nil, 390 * Desc], //Madurando
			["MARITRINI_Pop",nil, 390 * Desc], //Martini
			["MORCILLA_Pop",nil, 390 * Desc], //Morcilla
			["A3L_CivShirtNikeCamo",nil, 390 * Desc], //Nike Cammo
			["A3L_CivShirtNikeDoIt2",nil, 390 * Desc], //Just Do It
			["A3L_CivShirtNikeDoIt",nil, 390 * Desc], //Just Do it
			["A3L_CivShirtNikeFeet",nil, 390 * Desc], //My Feet Hurt
			["RAPTORS_Pop",nil, 390 * Desc], //Ninja Raptors
			["NOENTIENDO_Pop",nil, 390 * Desc], //Noentiendo
			["A3L_CivShirtThanksObama",nil, 390 * Desc], //Obama
			["A3L_CivShirtOhBoy",nil, 390 * Desc], //Ooo Yeah
			["PACMAN_Pop",nil, 390 * Desc], //Pacman
			["PICAPIEDRA_Pop",nil, 390 * Desc], //Picapiedra
			["CUP_U_C_Pilot_01",nil, 390 * Desc], //Pilot
			["A3LCivPoloGreenBlack",nil, 390 * Desc], //Polo
			["A3LCivPoloGreenGreen",nil, 390 * Desc], //Polo
			["A3LCivPoloGreenGrey",nil, 390 * Desc], //Polo
			["A3LCivPoloGreenOrange",nil, 390 * Desc], //Polo
			["A3LCivPoloUK",nil, 390 * Desc], //Polo
			["A3LCivPoloUS",nil, 390 * Desc], //Polo
			["POP_Apilas",nil, 390 * Desc], //Apilas
			["POP_Borracho",nil, 390 * Desc], //POP
			["POP_Chorizo",nil, 390 * Desc], //POP
			["POP_Estoytoloko",nil, 390 * Desc], //POP
			["POP_Google",nil, 390 * Desc], //POP
			["POP_Heinena",nil, 390 * Desc], //POP
			["POP_Lecuesta",nil, 390 * Desc], //POP
			["POP_Logo1",nil, 390 * Desc], //POP
			["LOGOPOP_Pop",nil, 390 * Desc], //POP
			["POP_Metro",nil, 390 * Desc], //POP
			["POP_Padre",nil, 390 * Desc], //POP
			["POP_Open",nil, 390 * Desc], //POP
			["POP_Paridas",nil, 390 * Desc], //POP
			["POP_Pena",nil, 390 * Desc], //POP
			["POP_Sirena",nil, 390 * Desc], //POP
			["POP_Torito",nil, 390 * Desc], //POP
			["POP_Vivir",nil, 390 * Desc], //POP
			["RastaCiv",nil, 390 * Desc], //Pothead
			["CUP_U_C_Priest_01",nil, 390 * Desc], //Priest
			["A3L_CivShirtProbe",nil, 390 * Desc], //Prove
			["CUP_U_C_Profiteer_01",nil, 390 * Desc], //Profiteer
			["CUP_U_C_Profiteer_02",nil, 390 * Desc], //Profiteer
			["CUP_U_C_Profiteer_03",nil, 390 * Desc], //Profiteer
			["CUP_U_C_Profiteer_04",nil, 390 * Desc], //Profiteer
			["PUMBA_Pop",nil, 390 * Desc], //Pumba
			["A3L_Badoodlenoodleshirt",nil, 390 * Desc], //Putin
			["CUP_U_C_Rocker_02",nil, 390 * Desc], //Rocker
			["CUP_U_C_Rocker_03",nil, 390 * Desc], //Rocker
			["CUP_U_C_Rocker_04",nil, 390 * Desc], //Rocker
			["U_C_HunterBody_grn",nil, 390 * Desc], //Cazador
			["U_C_Poor_1",nil, 390 * Desc], //Desgastada
			["U_C_Poloshirt_stripped",nil, 390 * Desc], //Informal
			["U_C_Poloshirt_blue",nil, 390 * Desc], //Informal
			["U_C_Poloshirt_burgundy",nil, 390 * Desc], //Informal
			["U_C_Poloshirt_redwhite",nil, 390 * Desc], //Informal
			["U_C_Poloshirt_salmon",nil, 390 * Desc], //Informal
			["U_C_Poloshirt_tricolour",nil, 390 * Desc], //Informal
			["A3L_CivShirtRelationships",nil, 390 * Desc], //Russian
			["U_C_Superman",nil, 390 * Desc], //Superman
			["U_BG_Guerilla2_3",nil, 390 * Desc], //Guerrilla
			["U_BG_Guerilla2_1",nil, 390 * Desc], //Guerrilla
			["U_BG_Guerilla2_2",nil, 390 * Desc], //Guerrilla
			["Tren_mcam",nil, 390 * Desc], //tren
			["TRYK_U_B_PCUGs_OD",nil, 390 * Desc], //TRYK PCU JACKET
			["TRYK_U_B_BLK_OD_Rollup_CombatUniform",nil, 390 * Desc], //TRYK ROLLUP BDU
			["TRYK_U_B_BLK_tan_Rollup_CombatUniform",nil, 390 * Desc], //TRYK ROLLUP BDU
			["TRYK_U_B_wh_blk_Rollup_CombatUniform",nil, 390 * Desc], //TRYK ROLLUP BDU
			["TRYK_U_B_wh_OD_Rollup_CombatUniform",nil, 390 * Desc], //TRYK ROLLUP BDU
			["TRYK_U_B_wh_tan_Rollup_CombatUniform",nil, 390 * Desc], //TRYK ROLLUP BDU
			["TRYK_shirts_DENIM_BK",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_BL",nil, 390 * Desc], //TRYK 
			["TRYK_shirts_DENIM_BWH",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_od",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_R",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_RED2",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_WH",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_WHB",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_ylb",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_od_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_ylb_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_BK_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_BL_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_BWH_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_R_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_RED2_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_WH_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_DENIM_WHB_Sleeve",nil, 390 * Desc], //TRYK
			["TRYK_shirts_PAD_BK",nil, 390 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_BK",nil, 390 * Desc], //TRYK
			["TRYK_shirts_OD_PAD_BK",nil, 390 * Desc], //TRYK
			["TRYK_shirts_TAN_PAD_BK",nil, 390 * Desc], //TRYK
			["TRYK_shirts_PAD_BL",nil, 390 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_BL",nil, 390 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_BLW",nil, 390 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_BLU3",nil, 390 * Desc], //TRYK
			["TRYK_shirts_PAD",nil, 390 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD",nil, 390 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_RED2",nil, 390 * Desc], //TRYK
			["TRYK_shirts_PAD_YEL",nil, 390 * Desc], //TRYK
			["TRYK_shirts_BLK_PAD_YEL",nil, 390 * Desc], //TRYK
			["TRYK_shirts_TAN_PAD_YEL",nil, 390 * Desc], //TRYK
			["TRYK_U_B_PCUGs_gry",nil, 390 * Desc], //TRYK
			["TRYK_U_B_PCUGs_BLK_R",nil, 390 * Desc], //TRYK
			["TRYK_U_B_PCUGs_gry_R",nil, 390 * Desc], //TRYK
			["TRYK_U_B_PCUGs_OD_R",nil, 390 * Desc], //TRYK
			["TRYK_U_B_PCUGs_gry",nil, 390 * Desc], //TRYK
			["TRYK_U_B_PCUGs_OD",nil, 390 * Desc], //TRYK
			["TRYK_U_pad_hood_Blod",nil, 390 * Desc], //TRYK
			["TRYK_U_pad_hood_Blk",nil, 390 * Desc], //TRYK
			["TRYK_U_pad_hood_odBK",nil, 390 * Desc], //TRYK
			["TRYK_U_denim_hood_3c",nil, 390 * Desc], //TRYK
			["TRYK_U_denim_hood_blk",nil, 390 * Desc], //TRYK
			["TRYK_U_denim_hood_nc",nil, 390 * Desc], //TRYK
			["TRYK_U_denim_jersey_blk",nil, 390 * Desc], //TRYK
			["TRYK_U_denim_jersey_blu",nil, 390 * Desc], //TRYK
			["TRYK_U_pad_j_blk",nil, 390 * Desc], //TRYK
			["TRYK_U_pad_j",nil, 390 * Desc], //TRYK //TRYK
			["TRYK_U_B_BLK_T_BG_BK",nil, 390 * Desc], //TRYK
			["TRYK_U_B_RED_T_BG_BR",nil, 390 * Desc], //TRYK
			["TRYK_U_B_BLK_T_BG_WH",nil, 390 * Desc], //TRYK
			["TRYK_U_B_BLK_T_BK",nil, 390 * Desc], //TRYK
			["TRYK_U_B_BLK_T_WH",nil, 390 * Desc], //TRYK
			["TRYK_U_B_Denim_T_BG_BK",nil, 390 * Desc], //TRYK
			["TRYK_U_B_Denim_T_BG_WH",nil, 390 * Desc], //TRYK
			["TRYK_U_B_Denim_T_BK",nil, 390 * Desc], //TRYK
			["TRYK_U_B_Denim_T_WH",nil, 390 * Desc], //TRYK
			["A3L_CivShirtVans2",nil, 390 * Desc], //Vans
			["A3L_CivShirtVolcomLogo",nil, 390 * Desc], //Volcom
			["A3L_CivShirtVolcomMonster",nil, 390 * Desc], //Volcom
			["A3L_CivShirtVolcom",nil, 390 * Desc], //Volcom
			["A3LWolfShirt",nil, 390 * Desc], //Wolf
			["CUP_U_C_Woodlander_01",nil, 390 * Desc], //Woodlander
			["CUP_U_C_Woodlander_02",nil, 390 * Desc], //Woodlander
			["CUP_U_C_Woodlander_03",nil, 390 * Desc], //Woodlander
			["CUP_U_C_Woodlander_04",nil, 390 * Desc], //Woodlander
			["CUP_U_C_Worker_01",nil, 390 * Desc], //Worker
			["CUP_U_C_Worker_02",nil, 390 * Desc], //Worker
			["CUP_U_C_Worker_03",nil, 390 * Desc], //Worker
			["CUP_U_C_Worker_04",nil, 390 * Desc], //Worker
			["U_Competitor",nil, 390 * Desc], //Competición
			["EF_suit_1",nil, 500 * Desc], //EF Suit 1
			["EF_suit_2",nil, 500 * Desc], //EF Suit 2
			["EF_suit_3",nil, 500 * Desc], //EF Suit 3
			["EF_suit_4",nil, 500 * Desc], //EF Suit 4
			["EF_suit_5",nil, 500 * Desc], //EF Suit 5
			["EF_suit_6",nil, 500 * Desc], //EF Suit 6
			["KAEL_SUITS_BR_F3",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F12",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F8",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BLK_F",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F11",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F10",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F6",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F4",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F",nil, 500 * Desc], //Kael Suit
			["KAEL_SUITS_BR_F9",nil, 500 * Desc], //Kael Suit
			["CUP_U_C_Suit_01",nil, 500 * Desc], //Suit
			["CUP_U_C_Suit_02",nil, 500 * Desc], //Suit
			["CUP_O_TKI_Khet_Jeans_02",nil, 500 * Desc],
			["TRYK_SUITS_BR_F",nil, 500 * Desc] //TRYK suit
		];
	};
	
	//Hats
	case 1:
	{
		[	
 			
			["Afghan_01Hat", "Sombrero Arabe 1", 100 * Desc], 		
			["Afghan_02Hat", "Sombrero Arabe 2", 100 * Desc], 		
			["Afghan_03Hat", "Sombrero Arabe 3", 100 * Desc], 	
			["Afghan_06Hat", "Sombrero Arabe 4", 100 * Desc], 
			["CUP_H_FR_BandanaGreen", "Bandana Verde", 100 * Desc],
			["CUP_H_C_Beanie_01", "Gorro Blanco", 100 * Desc], 	
			["CUP_H_C_Beanie_02", "Gorro Marron", 100 * Desc], 	
			["CUP_H_C_Beret_04", "Boina Antigua Marron", 100 * Desc], 	
			["CUP_H_C_Beret_01", "Boina Antigua Negra", 100 * Desc], 	
			["CUP_H_C_Beret_03", "Boina Antigua Patron", 100 * Desc], 	
			["CUP_H_PMC_Cap_Burberry", "Gorra a Cuadros 1", 100 * Desc],			
			["CUP_H_PMC_Cap_Back_Burberry", "Gorra a Cuadros 2", 100 * Desc], 	 	
			["CUP_H_PMC_Cap_Grey", "Gorra Gris 1", 100 * Desc], 	
			["CUP_H_PMC_Cap_Back_Grey", "Gorra Gris 2", 100 * Desc], 	
			["CUP_H_PMC_Cap_Tan", "Gorra Marron 1", 100 * Desc], 	
			["CUP_H_PMC_Cap_Back_Tan", "Gorra Marron 2", 100 * Desc], 	
			["EF_Fcap_O", "Gorra Chica Verde", 100 * Desc], 	
			["EF_Fcap_R", "Gorra Chica Roja", 100 * Desc], 	
			["EF_Fcap_Surf", "Gorra Chica Surf", 100 * Desc], 	
			["EF_Fcap_TN", "Gorra Chica Marron", 100 * Desc], 	
			["CUP_H_NAPA_Fedora", "Sombrero Indiana Jones", 100 * Desc], 	
			["H_Cap_blu", "Gorra Azul", 100 * Desc], 	
			["H_Cap_blk", "Gorra Negra", 100 * Desc], 	
			["H_Cap_oli", "Gorra Oliva", 100 * Desc], 	
			["H_Cap_tan", "Gorra Marron", 100 * Desc], 	
			["H_Cap_red", "Gorra Roja", 100 * Desc], 	
			["H_Cap_surfer", "Gorra Surfista", 100 * Desc], 	
			["H_Cap_grn", "Gorra Verde", 100 * Desc], 	
			["pop_gorra_cyan", "Gorra Cyan Los Angeles", 100 * Desc], 	
			["pop_gorra_redsox", "Gorra Boston RedSox", 100 * Desc], 	
			["pop_gorra_lakers", "Gorra Lakers", 100 * Desc], 	
			["pop_gorra_monster", "Gorra Monster", 100 * Desc], 	
			["pop_gorra_superman", "Gorra Superman", 100 * Desc], 	
			["pop_gorra_negra", "Gorra Negra New York", 100 * Desc], 	
			["POP_Cowboy_hat", "Sombrero CowBoy", 100 * Desc], 	
			["H_Orel_Kepi", "Gorra Kepi", 100 * Desc], 		
			["Kio_Santa_Hat", "Gorro Papa Noel", 100 * Desc], 	
			["H_Hat_checker", "Sombrero a Cuadros", 100 * Desc], 	
			["H_Hat_blue", "Sombrero a Cuadros Azul", 100 * Desc], 	
			["H_Hat_grey", "Sombrero Gris", 100 * Desc], 	
			["H_Hat_brown", "Sombrero Marron 1", 100 * Desc], 	
			["H_Hat_tan", "Sombrero Marron 2", 100 * Desc], 	
			["H_StrawHat", "Sombrero de Paja", 100 * Desc], 	
			["pop_mexicano", "Sombrero Mexicano", 100 * Desc], 	
			["Kio_Spinning_Hat", "Gorrocoptero", 100 * Desc], 	
			["CUP_H_TKI_Lungee_Open_01", "Pañuelo Arabe 1", 100 * Desc], 	
			["CUP_H_TKI_Lungee_Open_04", "Pañuelo Arabe 2", 100 * Desc], 	
			["CUP_H_TKI_Lungee_Open_05", "Pañuelo Arabe 3", 100 * Desc], 	
			["CUP_H_TKI_Lungee_Open_06", "Pañuelo Arabe 4", 100 * Desc], 	
			["CUP_H_TKI_Lungee_01", "Pañuelo Arabe 5", 100 * Desc], 	
			["CUP_H_TKI_Lungee_05", "Pañuelo Arabe 6", 100 * Desc], 	
			["CUP_H_TKI_Lungee_06", "Pañuelo Arabe 7", 100 * Desc], 	
			["CUP_H_TKI_Pakol_2_04", "Pañuelo Arabe 8", 100 * Desc], 	
			["CUP_H_TKI_Pakol_2_05", "Pañuelo Arabe 9", 100 * Desc], 	
			["CUP_H_TKI_Pakol_2_06", "Pañuelo Arabe 10", 100 * Desc], 	
			["CUP_H_TKI_Pakol_1_03", "Pañuelo Arabe 11", 100 * Desc], 	
			["CUP_H_TKI_Pakol_1_04", "Pañuelo Arabe 12", 100 * Desc], 	
			["CUP_H_TKI_Pakol_1_06", "Pañuelo Arabe 13", 100 * Desc], 	
			["CUP_H_TKI_SkullCap_01", "Pañuelo Arabe 14", 100 * Desc], 	
			["CUP_H_TKI_SkullCap_04", "Pañuelo Arabe 15", 100 * Desc], 	
			["CUP_H_TKI_SkullCap_03", "Pañuelo Arabe 16", 100 * Desc], 	
			["POP_Tophat", "Sombrero de Copa", 100 * Desc], 	
			["TRYK_R_CAP_BLK", "Gorra Negra Hacia Atras", 100 * Desc], 	
			["TRYK_R_CAP_TAN", "Gorra Marron Hacia Atras", 100 * Desc], 	
			["TRYK_H_woolhat", "Gorro Negro", 100 * Desc], 	
			["TRYK_H_woolhat_br", "Gorro Marron", 100 * Desc], 	
			["TRYK_H_woolhat_cu", "Gorro Verde", 100 * Desc], 	
			["CUP_H_C_Ushanka_03", "Gorro Ruso Marron 1", 100 * Desc], 
			["CUP_H_C_Ushanka_04", "Gorro Ruso Marron 2", 100 * Desc], 					
			["CUP_H_C_Ushanka_02", "Gorro Ruso Verde", 100 * Desc], 	
			["CUP_H_C_Ushanka_01", "Gorro Ruso Rojo", 100 * Desc], 	
			["kio_vfv_mask", "Mascara Anonimous 1", 100 * Desc],	
			["Masque_Anonymous", "Mascara Anonymous 3", 100 * Desc], 	
			["kio_skl_msk_adc", "Mascara Calavera Marihuana", 100 * Desc],			
			["kio_skl_msk_black", "Mascara Calavera Negra", 100 * Desc],
			["kio_skl_msk_can", "Mascara Calavera Canada", 100 * Desc], 		
			["kio_skl_msk_fran", "Mascara Calavera francia", 100 * Desc], 		
			["kio_skl_msk_frost", "Mascara Calavera Congelada", 100 * Desc], 		
			["kio_skl_msk_GOW", "Mascara Calavera GoW", 100 * Desc], 		
			["kio_skl_msk_german", "Mascara Calavera Alemania", 100 * Desc], 		
			["kio_skl_msk_grey", "Mascara Calavera Gris", 100 * Desc], 		
			["kio_skl_msk_irish", "Mascara Calavera Irlanda 1", 100 * Desc], 				
			["kio_skl_msk_nirish", "Mascara Calavera Irlanda 2", 100 * Desc], 				
			["kio_skl_msk_o", "Mascara Calavera Naranja", 100 * Desc], 				
			["kio_skl_msk_pun", "Mascara Calavera Punisher", 100 * Desc], 				
			["kio_skl_msk_p", "Mascara Calavera Morada", 100 * Desc], 				
			["kio_skl_msk_redranger", "Mascara Calavera Power Ranger", 100 * Desc], 				
			["kio_skl_msk", "Mascara Calavera Blanca y Negra", 100 * Desc], 				
			["kio_skl_msk_grn", "Mascara Calavera verde y Negra", 100 * Desc], 				
			["kio_skl_msk_red", "Mascara Calavera Roja y Negra", 100 * Desc], 				
			["kio_skl_msk_scot", "mascara Calavera Escocia", 100 * Desc], 				
			["kio_skl_msk_UK", "mascara Calavera UK", 100 * Desc], 				
			["kio_skl_msk_US", "mascara Calavera US", 100 * Desc], 				
			["H_AntmanMask", "Mascara AntMan", 100 * Desc], 		
			["H_AugustusMask", "Mascara GoW", 100 * Desc], 		
			["H_BatmanMask", "Mascara Batman", 100 * Desc], 		
			["H_BushMask", "Mascara Presidente Bush", 100 * Desc], 		
			["H_BobaMask", "Mascara La Empresa", 100 * Desc], 					
			["pop_robocop", "Mascara RoboCop", 100 * Desc], 		
			["H_ClintonMask", "Mascara Presidente Clinton", 100 * Desc], 		
			["H_Orel_Mask_Dead", "Mascara Muerte", 100 * Desc], 	
			["H_DeadpoolMask", "Mascara Deadpool", 100 * Desc], 		
			["H_FranklinMask", "Mascara Presidente Franklin", 100 * Desc], 		
			["H_RAAMMask", "Mascara General RAAM", 100 * Desc], 		
			["H_GrantMask", "Mascara Presidente Grant", 100 * Desc], 		
			["H_HulkMask", "Mascara Hulk", 100 * Desc], 		
			["H_JasonMask", "Mascara Jason Voorhes", 100 * Desc], 		
			["H_LincolnMask", "Mascara Presidente Lincoln", 100 * Desc], 		
			["Masque_Mempo", "Mascara Mempo", 100 * Desc], 		
			["Masque_Alien1", "Mascara Alien", 100 * Desc], 		
			["Masque_archNemesis", "Mascara Arch Nemesis", 100 * Desc], 		
			["Masque_Arnold", "Mascara Arnold", 100 * Desc], 		
			["Masque_Aubrey", "Marcara Cerdo", 100 * Desc],
			["Masque_Bonnie", "Mascara Bonnie", 100 * Desc], 		
			["Masque_Chains", "Mascara Payaso Chains", 100 * Desc], 		
			["Masque_Dallas", "MAscara Payaso Dallas", 100 * Desc], 		
			["Masque_Hoxton", "Mascara Payaso Hoxton", 100 * Desc], 
			["Masque_Wolfv2", "Mascara Payaso Wolf", 100 * Desc], 					
			["Masque_Gombo", "Mascara Payaso Gombo", 100 * Desc], 		
			["Masque_Incendiaire", "Mascara Payaso Incendiare", 100 * Desc], 		
			["Masque_Macrilleuse", "Mascara Payaso Pussy Destroller", 100 * Desc], 		
			["Masque_Smiley", "Macars Payaso Smiley", 100 * Desc], 		
			["Masque_Clover", "Mascara Payaso Clover", 100 * Desc], 		
			["Masque_Chuck", "Mascara de Aguila", 100 * Desc], 		
			["Masque_Fish", "Mascara de Pez", 100 * Desc], 		
			["Masque_GdG", "Mascara Cara Feliz", 100 * Desc], 		
			["Masque_Hockey", "Mascara Hockey", 100 * Desc], 		
			["Masque_Lion", "Mascara de leon", 100 * Desc], 		
			["Masque_Mark", "Mascara de Oso", 100 * Desc], 		
			["Masque_Momie", "Mascara de Momia", 100 * Desc], 		
			["Masque_Optimiste", "Mascara de Robot", 100 * Desc], 		
			["Masque_Orc", "MAscara de Orco", 100 * Desc], 		
			["Masque_Religieuse", "Mascara de Monja", 100 * Desc], 		
			["Masque_Santa", "Mascara de Papa Noel", 100 * Desc], 		
			["Masque_speedRunner", "Mascara de Speed Runner", 100 * Desc], 		
			["Masque_Unic", "Mascara de Unicorio", 100 * Desc], 		
			["H_ObamaMask", "·Mascara Obama", 100 * Desc], 		
			["H_PatriotMask", "Mascara IronMan", 100 * Desc], 		
			["H_ScarecrowMask", "Mascara Espantapajaros", 100 * Desc], 		
			["H_ShrekMask", "Mascara Shrek", 100 * Desc], 		
			["H_SpidermanMask", "Mascara de Spiderman", 100 * Desc], 		
			["H_SpongebobMask", "Mascara de Bob Esponja", 100 * Desc], 		
			["H_SquidwardMask", "MAscara de Calamardo", 100 * Desc], 		
			["H_UltronMask", "Mascara Ultron", 100 * Desc], 		
			["H_GingerbreadMask", "Mascara Galleta", 100 * Desc], 		
			["H_VenomMask", "Mascara de Venom", 100 * Desc], 		
			["Kio_Hat", "Cubreorejas Calentito", 100 * Desc], 		
			["BHD_Protec_helmet", "Casco de Bici con Manoslibres", 100 * Desc], 	
			["H_RacingHelmet_1_yellow_F", "Casco de Moto Amarillo", 100 * Desc], 	
			["H_RacingHelmet_1_blue_F", "Casco de Moto Azul", 100 * Desc], 	
			["H_RacingHelmet_1_white_F", "Casco de Moto Blanco", 100 * Desc], 	
			["H_RacingHelmet_1_red_F", "Casco de Moto Rojo", 100 * Desc], 	
			["H_RacingHelmet_1_green_F", "Casco de Moto Verde", 100 * Desc], 
			["H_RacingHelmet_1_orange_F", "Casco de Moto Naranja", 100 * Desc], 	
			["H_RacingHelmet_1_black_F", "Casco de Moto Negro", 100 * Desc], 	
			["H_RacingHelmet_3_F", "Casco de Moto Dorado", 100 * Desc], 	
			["H_RacingHelmet_2_F", "Casco de Moto BlueKing", 100 * Desc], 	
			["H_RacingHelmet_1_F", "Casco de Moto Fuel", 100 * Desc], 	
			["H_RacingHelmet_4_F", "Casco de Moto Vrana", 100 * Desc], 	
			["EF_Long_wig_B", "Peluca Larga Negra", 100 * Desc], 	
			["EF_Long_wig_BLE", "Peluca Larga Rubia", 100 * Desc], 	
			["EF_Long_wig_BL", "Peluca Larga Castaña", 100 * Desc], 	
			["EF_Long_wig_BW", "Peluca Larga Castaña Oscura", 100 * Desc], 	
			["EF_Punk_wig_B", "Cresta Punk Negra", 100 * Desc], 	
			["EF_Punk_wig_BLE", "Cresta Punk Rubia", 100 * Desc], 	
			["EF_Punk_wig_BL", "Cresta Punk Castaña", 100 * Desc], 	
			["EF_Punk_wig_BW", "Cresta Punk Castaña Oscura", 100 * Desc], 	
			["EF_Punk_wig_GL", "Cresta Negra y Blanca", 100 * Desc], 	
			["POP_Mohawk", "Cresta Mohawk", 100 * Desc] 
		];
	};
	
	//Glasses
	case 2:
	{
		[	

			["EF_FG1", "Gafas Deportivas",60 * Desc],
			["G_Shades_Blue", "Gafas Deportivas Azules",60 * Desc],
			["G_Shades_Black", "Gafas Deportivas Negras",60 * Desc],
			["G_Sport_Red",nil,60 * Desc],
			["G_Sport_Blackyellow", "Gafas Deportivas Abejorro",60 * Desc],
			["G_Sport_BlackWhite", "Gafas Deportivas Black&White",60 * Desc],
			["G_Sport_Blackred", "Gafas Deportivas Llama",60 * Desc],
			["G_Sport_Greenblack", "gafas Deportivas Monster",60 * Desc],
			["G_Shades_Red", "Gafas Deportivas Rojas",60 * Desc],
			["G_Shades_Green", "Gafas Deportivas verdes",60 * Desc],
			["G_Aviator", "Gafas de Aviador",60 * Desc],
			["G_Spectacles", "Gafas de Pasta Marrones",60 * Desc],
			["G_Spectacles_Tinted", "Gafas P. Marrones Tintadas",60 * Desc],
			["G_Squares", "Gafas de Espejo Cuadradas",60 * Desc],
			["G_Lowprofile", "Gafas de Buceo",60 * Desc],
			["CUP_TK_NeckScarf", "Bufanda Ajustada Blanca y Marron",60 * Desc],
			["CUP_FR_NeckScarf", "Bufanda Ajustada Verde",60 * Desc],
			["CUP_FR_NeckScarf2", "Bufanda Ajustada Marron",60 * Desc],
			["G_EWK_Shemag_NB", "Bufanda Blanca",60 * Desc],
			["G_EWK_Shemag_GRE", "Bufanda verde",60 * Desc],
			["G_EWK_Shemag_tan", "Bufanda Marron",60 * Desc],
			["G_Bandanna_aviator", "Pañuelo de Aviador",60 * Desc],
			["G_Bandanna_beast", "Pañuelo de Bestia",60 * Desc],
			["G_Bandanna_khk", "Pañuelo caqui",60 * Desc],
			["G_Bandanna_tan", "Pañuelo Marron",60 * Desc],
			["G_Bandanna_blk", "Pañuelo Negro",60 * Desc],
			["G_Bandanna_oli", "Pañuelo Oliva",60 * Desc],
			["TRYK_kio_balaclava_BLK", "Pasamontanas Cuero Ajustado Negro",60 * Desc],
			["G_Balaclava_oli", "Pasamontañas Tela Ajustado Oliva",60 * Desc],
			["G_Balaclava_blk", "Pasamontañas Tela Ajustado Negro",60 * Desc],
			["G_Bandanna_sport", "Pañuelo Negero & Gafas 1",120 * Desc],
			["G_Bandanna_shades", "Pañuelo Negero & Gafas 2",120 * Desc],
			["G_EWK_Cigar2", "Gafas Aviador & Puro",120 * Desc],
			["G_EWK_Glasses_Cig1", "Gafas Aviador & Cigarrillo 1",120 * Desc],
			["G_EWK_Glasses_Cig6", "Gafas Aviador & Cigarrillo 2",120 * Desc],
			["G_EWK_Glasses_Cig4", "Gafas & Cigarrillo 3",120 * Desc],
			["G_EWK_Shemag_NB_Cig6", "Pañuelo Blanco & Cigarrillo",120 * Desc],
			["G_EWK_Shemag_GRE_Cig6", "Pañuelo Verde & Cigarrillo",120 * Desc],
			["G_EWK_Shemag_tan_Cig6", "Pañuelo Marron & Cigarrillo",120 * Desc],
			["G_EWK_Glasses_Shemag_NB_Cig6", "Gafas & Pañuelo Blanco & Cigarrillo",180 * Desc],
			["G_EWK_Glasses_Shemag_GRE_Cig6", "Gafas & Pañuelo Verde & Cigarrillo",180 * Desc],
			["G_EWK_Glasses_Shemag_tan_Cig6", "Gafas & Pañuelo Marron & Cigarrillo",180 * Desc],
			["G_EWK_Glasses_Cig3", "Gafas & Cigarrillo Consumido",120 * Desc],
			["EF_ACC1", "Pendientes Aro Abiertos Grandes",60 * Desc],
			["EF_AC1", "Pendientes Aro Cerrados Pequeños",60 * Desc],
			["EF_AC2", "Piercing Nariz",60 * Desc],
			["EF_AC3", "Piercing de Vaca",60 * Desc],
			["G_EWK_Cigar1", "Puro",60 * Desc],
			["G_EWK_Cig1", "Cigarrillo",60 * Desc],
			["G_EWK_Cig2", "Cigarrillo Quemado 1",60 * Desc],
			["G_EWK_Cig3", "Cigarrillo Consumido",60 * Desc],
			["G_EWK_Cig6", "Cigarrillo Quemado Encendido",60 * Desc],
			["G_EWK_Cig4", "Cigarrillo Encendido",60 * Desc],
			["SFG_Tac_ChopsB", "Barba Corta Rubia",60 * Desc],
			["SFG_Tac_ChopsD", "Barba Corta Castaña",60 * Desc],
			["SFG_Tac_ChopsG", "Barba Corta PeliRoja",60 * Desc],
			["SFG_Tac_ChopsO", "Barba Corta Canosa",60 * Desc],
			["SFG_Tac_smallBeardB", "Barba Mediana Rubia",60 * Desc],
			["SFG_Tac_smallBeardD", "Barba Mediana Castaña",60 * Desc],
			["SFG_Tac_smallBeardG", "Barba Mediana PeliRoja",60 * Desc],
			["SFG_Tac_smallBeardO", "Barba Mediana Canosa",60 * Desc],
			["SFG_Tac_BeardB", "Barba Larga Rubia",60 * Desc],
			["SFG_Tac_BeardD", "Barba Larga Castaña",60 * Desc],
			["SFG_Tac_BeardG", "Barba LArga PeliRoja",60 * Desc],
			["SFG_Tac_BeardO", "Barba Larga Canosa",60 * Desc],
			["SFG_Tac_chinlessbB", "Barba & Bigote Rubio",60 * Desc],
			["SFG_Tac_chinlessbD", "Barba & Bigote Castaño",60 * Desc],
			["SFG_Tac_chinlessbG", "Barba & Bigote PeliRojo",60 * Desc],
			["SFG_Tac_chinlessbO", "Barba & Bigote Canoso",60 * Desc],
			["SFG_Tac_moustacheB", "Bigote Rubio ",60 * Desc],
			["SFG_Tac_moustacheD", "Bigote Castaño",60 * Desc],
			["SFG_Tac_moustacheG", "Bigote PeliRojo",60 * Desc],
			["SFG_Tac_moustacheO", "Bigote Canoso",60 * Desc],
			["TRYK_Beard_BK", "Barba & Perilla Negra Corta",60 * Desc],
			["TRYK_Beard_BL", "Barba & Perilla Rubia Corta",60 * Desc],
			["TRYK_Beard", "Barba & Perilla Castaña 1 Corta",60 * Desc],
			["TRYK_Beard_BW", "Barba & Perilla Castaña 2 Corta",60 * Desc],
			["TRYK_Beard_Gr", "Barba & Perilla Canosa Corta",60 * Desc],
			["TRYK_Beard_BK3", "Barba & Perilla Negra Larga",60 * Desc],
			["TRYK_Beard_BL3", "Barba & Perilla Rubia Larga",60 * Desc],
			["TRYK_Beard3", "Barba & Perilla Castaña 1 Larga",60 * Desc],
			["TRYK_Beard_BW3", "Barba & Perilla Castaña 2 Larga",60 * Desc],
			["TRYK_Beard_Gr3", "Barba & Perilla Larga",60 * Desc]
		];
	};
	
	//Vest
	case 3:
	{
		[

			["CUP_V_OI_TKI_Jacket1_04",nil,250 * Desc],
			["CUP_V_OI_TKI_Jacket1_06",nil,250 * Desc],
			["CUP_V_OI_TKI_Jacket1_05",nil,250 * Desc]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["CUP_B_AssaultPack_Black", "Mochila Utilitaria 1",200 * Desc],
			["CUP_B_AssaultPack_Coyote", "Mochila Utlitaria 2",200 * Desc],
			["B_AssaultPack_cbr", "Mochila de Asalto pequeña 1",250 * Desc],
			["B_AssaultPack_blk", "Mochila de Asalto pequeña 2",250 * Desc],			
			["B_FieldPack_cbr", "Mochila de Campo",250 * Desc],
			["mochila_pequena", "Mochila Pequeña",290 * Desc],
			["CUP_B_Bergen_BAF", "Mochila de Asalto Mediana",250 * Desc],
			["A3L_BergenMurica", "Mochila verde",350 * Desc],
			["B_Carryall_cbr", "mochila de Viaje",400 * Desc]							
		];
	};
};