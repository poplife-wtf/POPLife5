/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as"" for default)
*        2: SCALAR (Price)
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*               "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for"pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
    class bruce {
        title ="Moda POPV";
        conditions ="";
        side ="civ";
        uniforms[] = {
            {"NONE", $STR_C_Remove_uniforms, 0,"" },
			{"POP_CHAW4_D3", 400 ,"" },			//rapero 
			{"POP_CHAW3_D5","", 550,"" },//yoli
			{"POP_Mujer_Azul","", 390 ,"" }, //Traje Azul
			{"POP_Mujer_Flores","", 360 ,"" }, //Traje Flores
			{"POP_Mujer_Manga","", 360 ,"" }, //Traje Manga
			{"POP_Mujer_Rosa","", 360 ,"" }, //Traje Rosa
			{"U_GirlSet1_uniform","", 390 ,"" }, //Girl Set 1
			{"U_GirlSet2_uniform","", 390 ,"" }, //Girl Set 2
			{"U_GirlSet4_uniform","", 390 ,"" }, //Girl Set 4
			{"EF_FEM_2U","", 390 ,"" }, //EF Female 2
			{"EF_FEM_2BK","", 390 ,"" }, //EF Female 2 BK
			{"EF_FEM_3_2","", 390 ,"" }, //EF Female 3
			{"EF_FEM_3","", 390 ,"" }, //EF Female 3 hoodie
			{"EF_FEM_3_3LPBPS","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPBP","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPBR","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPBW","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPB","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPBL","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPBPS2","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPBP2","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPBW2","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPB2","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_3_3LPBL2","", 390 ,"" }, //EF Female 3 Punks Hoodie Falda
			{"EF_FEM_4_2LPBPS","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBP","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBR","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBW","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPB","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBL","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBPS2","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBP2","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBR2","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBW2","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPB2","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_4_2LPBL2","", 390 ,"" }, //EF Female 4 Punks Hoodie Pantalon
			{"EF_FEM_5","", 390 ,"" }, //EF Female 5 
			{"U_007_BIS_Marshall","", 390 ,"" }, //007 Uniform
			{"A3L_CivShirtObey","", 390 ,"" }, //7 channel
			{"A3L_CivShirtAdidasMake","", 390 ,"" }, //Adidas Make
			{"A3L_CivShirtAdidas_r","", 390 ,"" }, //Adidas Rasta
			{"A3L_CivShirtAdidas","", 390 ,"" }, //Adidas
			{"CUP_U_I_GUE_Anorak_01","", 390 ,"" }, //Anorak
			{"CUP_U_I_GUE_Anorak_03","", 390 ,"" }, //Anorak
			{"CUP_U_I_GUE_Anorak_02","", 390 ,"" }, //anorak
			{"A3L_CivShirtAnotherCat","", 390 ,"" }, //Another Cat Shirt
			{"APIPAS_Pop","", 390 ,"" }, //Apipas
			{"U_C_Polo_Arbitre","", 390 ,"" }, //Arbitro
			{"U_Marshal","", 390 ,"" }, //Atuendo Comisario
			{"POP_Simpson","", 390 ,"" }, //Bart Simpson
			{"A3L_CivShirtBillabong","", 390 ,"" }, //Billabong
			{"A3L_CivShirtBillabong2","", 390 ,"" }, //Billabong 2
			{"U_BG_Guerilla3_1","", 390 ,"" }, //Blusón de guerrilla
			{"A3LCokeShirt","", 390 ,"" }, //Cannabis
			{"A3LCatShirt","", 390 ,"" }, //Cat
			{"CEDA_Pop","", 390 ,"" }, //Ceda el Vaso
			{"CHAQUETAAZUL_Pop","", 390 ,"" }, //Chaqueta Azul
			{"CHAQUETALEOPARDO_Pop","", 390 ,"" }, //Chaqueta Leopardo
			{"CHAQUETAMARRON_Pop","", 390 ,"" }, //Chaqueta Marron
			{"CHAQUETANEGRA_Pop","", 390 ,"" }, //Chaqueta Negra
			{"CHAQUETAROJA_Pop","", 390 ,"" }, //Chaqueta Roja MC
			{"CHAQUETASERPIENTE_Pop","", 390 ,"" }, //Chaqueta Serpiente
			{"U_OrestesBody","", 390 ,"" }, //Chaqueta y Pantalón
			{"CUP_U_O_CHDKZ_Bardak","", 390 ,"" }, //ChDKZ Outfit
			{"CUP_U_O_CHDKZ_Lopotev","", 390 ,"" }, //ChDKZ Tracksuit
			{"U_C_Polo_Civil1","", 390 ,"" }, //Civil1
			{"CUP_U_C_Citizen_02","", 390 ,"" }, //Civilian Clothes
			{"CUP_U_C_Citizen_01","", 390 ,"" }, //Civilian Clothes
			{"CUP_U_C_Citizen_04","", 390 ,"" }, //Civilian Clothes
			{"CUP_U_C_Citizen_03","", 390 ,"" }, //Civilian Clothes
			{"A3LCloudShirt","", 390 ,"" }, //Cloud Shirt
			{"U_C_Polo_Dalton","", 390 ,"" }, //Dalton
			{"A3L_CivShirtDiamond","", 390 ,"" }, //Diamond Shirt
			{"A3L_CivShirtDJ","", 390 ,"" }, //DJ Shirt
			{"EF_HMARMY_1","", 390 ,"" }, //EF Male Army
			{"EF_HMARMY_2","", 390 ,"" }, //EF Male Army 2
			{"EF_HM_LPBPS","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBP","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBR","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBW","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBL","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBPS2","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBP2","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBR2","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBW2","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPB2","", 390 ,"" }, //EF PUNKS hoodie
			{"EF_HM_LPBL2","", 390 ,"" }, //EF PUNKS hoodie
			{"RAPTORS2_Pop","", 390 ,"" }, //RAPTORS
			{"ET_Pop","", 390 ,"" }, //ET
			{"A3L_CivShirtGetHigh","", 390 ,"" }, //Get High
			{"A3L_CivShirtGrumpyCat","", 390 ,"" }, //Grumpy
			{"TITTY_Pop","", 390 ,"" }, //Hello Titty
			{"A3L_CivShirtHollister","", 390 ,"" }, //Hollister
			{"IBERDROGA_Pop","", 390 ,"" }, //IberDroga
			{"IDIOTA_Pop","", 390 ,"" }, //Idiota
			{"TRONOS_Pop","", 390 ,"" }, //Juego de Tronos
			{"JWORLD_Pop","", 390 ,"" }, //Jurassic World
			{"A3L_CivShirtKeepCalm","", 390 ,"" }, //Keep Calm
			{"CUP_O_TKI_Khet_Jeans_04","", 390 ,"" }, //Khe / Jeans
			{"CUP_O_TKI_Khet_Jeans_02","", 390 ,"" }, //Khet / Jeans
			{"CUP_O_TKI_Khet_Jeans_01","", 390 ,"" }, //Khet Partug
			{"CUP_O_TKI_Khet_Jeans_03","", 390 ,"" }, //Khet Partug
			{"CUP_O_TKI_Khet_Partug_04","", 390 ,"" }, //Khet Partug
			{"CUP_O_TKI_Khet_Partug_02","", 390 ,"" }, //Khet Partug
			{"CUP_O_TKI_Khet_Partug_01","", 390 ,"" }, //Khet Partug
			{"CUP_O_TKI_Khet_Partug_07","", 390 ,"" }, //Khet Partug
			{"CUP_O_TKI_Khet_Partug_08","", 390 ,"" }, //Khet Partug 
			{"CUP_O_TKI_Khet_Partug_05","", 390 ,"" }, //Khet Partug
			{"CUP_O_TKI_Khet_Partug_06","", 390 ,"" }, //Khet Partug
			{"CUP_O_TKI_Khet_Partug_03","", 390 ,"" }, //Khet Partug
			{"KITKAT_Pop","", 390 ,"" }, //Kita Kono
			{"A3L_Lacoste_C","", 390 ,"" }, //Lacoste
			{"A3L_Lacoste_G","", 390 ,"" }, //Lacoste
			{"A3L_Lacoste_S","", 390 ,"" }, //Lacoste
			{"A3L_Lacoste_T","", 390 ,"" }, //Lacoste
			{"MADURANDO_Pop","", 390 ,"" }, //Madurando
			{"MARITRINI_Pop","", 390 ,"" }, //Martini
			{"MORCILLA_Pop","", 390 ,"" }, //Morcilla
			{"A3L_CivShirtNikeCamo","", 390 ,"" }, //Nike Cammo
			{"A3L_CivShirtNikeDoIt2","", 390 ,"" }, //Just Do It
			{"A3L_CivShirtNikeDoIt","", 390 ,"" }, //Just Do it
			{"A3L_CivShirtNikeFeet","", 390 ,"" }, //My Feet Hurt
			{"RAPTORS_Pop","", 390 ,"" }, //Ninja Raptors
			{"NOENTIENDO_Pop","", 390 ,"" }, //Noentiendo
			{"A3L_CivShirtThanksObama","", 390 ,"" }, //Obama
			{"A3L_CivShirtOhBoy","", 390 ,"" }, //Ooo Yeah
			{"PACMAN_Pop","", 390 ,"" }, //Pacman
			{"PICAPIEDRA_Pop","", 390 ,"" }, //Picapiedra
			{"CUP_U_C_Pilot_01","", 390 ,"" }, //Pilot
			{"A3LCivPoloGreenBlack","", 390 ,"" }, //Polo
			{"A3LCivPoloGreenGreen","", 390 ,"" }, //Polo
			{"A3LCivPoloGreenGrey","", 390 ,"" }, //Polo
			{"A3LCivPoloGreenOrange","", 390 ,"" }, //Polo
			{"A3LCivPoloUK","", 390 ,"" }, //Polo
			{"A3LCivPoloUS","", 390 ,"" }, //Polo
			{"POP_Apilas","", 390 ,"" }, //Apilas
			{"POP_Borracho","", 390 ,"" }, //POP
			{"POP_Chorizo","", 390 ,"" }, //POP
			{"POP_Estoytoloko","", 390 ,"" }, //POP
			{"POP_Google","", 390 ,"" }, //POP
			{"POP_Heinena","", 390 ,"" }, //POP
			{"POP_Lecuesta","", 390 ,"" }, //POP
			{"POP_Logo1","", 390 ,"" }, //POP
			{"LOGOPOP_Pop","", 390 ,"" }, //POP
			{"POP_Metro","", 390 ,"" }, //POP
			{"POP_Padre","", 390 ,"" }, //POP
			{"POP_Open","", 390 ,"" }, //POP
			{"POP_Paridas","", 390 ,"" }, //POP
			{"POP_Pena","", 390 ,"" }, //POP
			{"POP_Sirena","", 390 ,"" }, //POP
			{"POP_Torito","", 390 ,"" }, //POP
			{"POP_Vivir","", 390 ,"" }, //POP
			{"RastaCiv","", 390 ,"" }, //Pothead
			{"CUP_U_C_Priest_01","", 390 ,"" }, //Priest
			{"A3L_CivShirtProbe","", 390 ,"" }, //Prove
			{"CUP_U_C_Profiteer_01","", 390 ,"" }, //Profiteer
			{"CUP_U_C_Profiteer_02","", 390 ,"" }, //Profiteer
			{"CUP_U_C_Profiteer_03","", 390 ,"" }, //Profiteer
			{"CUP_U_C_Profiteer_04","", 390 ,"" }, //Profiteer
			{"PUMBA_Pop","", 390 ,"" }, //Pumba
			{"A3L_Badoodlenoodleshirt","", 390 ,"" }, //Putin
			{"CUP_U_C_Rocker_02","", 390 ,"" }, //Rocker
			{"CUP_U_C_Rocker_03","", 390 ,"" }, //Rocker
			{"CUP_U_C_Rocker_04","", 390 ,"" }, //Rocker
			{"U_C_HunterBody_grn","", 390 ,"" }, //Cazador
			{"U_C_Poor_1","", 390 ,"" }, //Desgastada
			{"U_C_Poloshirt_stripped","", 390 ,"" }, //Informal
			{"U_C_Poloshirt_blue","", 390 ,"" }, //Informal
			{"U_C_Poloshirt_burgundy","", 390 ,"" }, //Informal
			{"U_C_Poloshirt_redwhite","", 390 ,"" }, //Informal
			{"U_C_Poloshirt_salmon","", 390 ,"" }, //Informal
			{"U_C_Poloshirt_tricolour","", 390 ,"" }, //Informal
			{"A3L_CivShirtRelationships","", 390 ,"" }, //Russian
			{"U_C_Superman","", 390 ,"" }, //Superman
			{"U_BG_Guerilla2_3","", 390 ,"" }, //Guerrilla
			{"U_BG_Guerilla2_1","", 390 ,"" }, //Guerrilla
			{"U_BG_Guerilla2_2","", 390 ,"" }, //Guerrilla
			{"Tren_mcam","", 390 ,"" }, //tren
			{"TRYK_U_B_PCUGs_OD","", 390 ,"" }, //TRYK PCU JACKET
			{"TRYK_U_B_BLK_OD_Rollup_CombatUniform","", 390 ,"" }, //TRYK ROLLUP BDU
			{"TRYK_U_B_BLK_tan_Rollup_CombatUniform","", 390 ,"" }, //TRYK ROLLUP BDU
			{"TRYK_U_B_wh_blk_Rollup_CombatUniform","", 390 ,"" }, //TRYK ROLLUP BDU
			{"TRYK_U_B_wh_OD_Rollup_CombatUniform","", 390 ,"" }, //TRYK ROLLUP BDU
			{"TRYK_U_B_wh_tan_Rollup_CombatUniform","", 390 ,"" }, //TRYK ROLLUP BDU
			{"TRYK_shirts_DENIM_BK","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_BL","", 390 ,"" }, //TRYK 
			{"TRYK_shirts_DENIM_BWH","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_od","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_R","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_RED2","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_WH","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_WHB","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_ylb","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_od_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_ylb_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_BK_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_BL_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_BWH_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_R_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_RED2_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_WH_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_DENIM_WHB_Sleeve","", 390 ,"" }, //TRYK
			{"TRYK_shirts_PAD_BK","", 390 ,"" }, //TRYK
			{"TRYK_shirts_BLK_PAD_BK","", 390 ,"" }, //TRYK
			{"TRYK_shirts_OD_PAD_BK","", 390 ,"" }, //TRYK
			{"TRYK_shirts_TAN_PAD_BK","", 390 ,"" }, //TRYK
			{"TRYK_shirts_PAD_BL","", 390 ,"" }, //TRYK
			{"TRYK_shirts_BLK_PAD_BL","", 390 ,"" }, //TRYK
			{"TRYK_shirts_BLK_PAD_BLW","", 390 ,"" }, //TRYK
			{"TRYK_shirts_BLK_PAD_BLU3","", 390 ,"" }, //TRYK
			{"TRYK_shirts_PAD","", 390 ,"" }, //TRYK
			{"TRYK_shirts_BLK_PAD","", 390 ,"" }, //TRYK
			{"TRYK_shirts_BLK_PAD_RED2","", 390 ,"" }, //TRYK
			{"TRYK_shirts_PAD_YEL","", 390 ,"" }, //TRYK
			{"TRYK_shirts_BLK_PAD_YEL","", 390 ,"" }, //TRYK
			{"TRYK_shirts_TAN_PAD_YEL","", 390 ,"" }, //TRYK
			{"TRYK_U_B_PCUGs_gry","", 390 ,"" }, //TRYK
			{"TRYK_U_B_PCUGs_BLK_R","", 390 ,"" }, //TRYK
			{"TRYK_U_B_PCUGs_gry_R","", 390 ,"" }, //TRYK
			{"TRYK_U_B_PCUGs_OD_R","", 390 ,"" }, //TRYK
			{"TRYK_U_B_PCUGs_gry","", 390 ,"" }, //TRYK
			{"TRYK_U_B_PCUGs_OD","", 390 ,"" }, //TRYK
			{"TRYK_U_pad_hood_Blod","", 390 ,"" }, //TRYK
			{"TRYK_U_pad_hood_Blk","", 390 ,"" }, //TRYK
			{"TRYK_U_pad_hood_odBK","", 390 ,"" }, //TRYK
			{"TRYK_U_denim_hood_3c","", 390 ,"" }, //TRYK
			{"TRYK_U_denim_hood_blk","", 390 ,"" }, //TRYK
			{"TRYK_U_denim_hood_nc","", 390 ,"" }, //TRYK
			{"TRYK_U_denim_jersey_blk","", 390 ,"" }, //TRYK
			{"TRYK_U_denim_jersey_blu","", 390 ,"" }, //TRYK
			{"TRYK_U_pad_j_blk","", 390 ,"" }, //TRYK
			{"TRYK_U_pad_j","", 390 ,"" }, //TRYK //TRYK
			{"TRYK_U_B_BLK_T_BG_BK","", 390 ,"" }, //TRYK
			{"TRYK_U_B_RED_T_BG_BR","", 390 ,"" }, //TRYK
			{"TRYK_U_B_BLK_T_BG_WH","", 390 ,"" }, //TRYK
			{"TRYK_U_B_BLK_T_BK","", 390 ,"" }, //TRYK
			{"TRYK_U_B_BLK_T_WH","", 390 ,"" }, //TRYK
			{"TRYK_U_B_Denim_T_BG_BK","", 390 ,"" }, //TRYK
			{"TRYK_U_B_Denim_T_BG_WH","", 390 ,"" }, //TRYK
			{"TRYK_U_B_Denim_T_BK","", 390 ,"" }, //TRYK
			{"TRYK_U_B_Denim_T_WH","", 390 ,"" }, //TRYK
			{"A3L_CivShirtVans2","", 390 ,"" }, //Vans
			{"A3L_CivShirtVolcomLogo","", 390 ,"" }, //Volcom
			{"A3L_CivShirtVolcomMonster","", 390 ,"" }, //Volcom
			{"A3L_CivShirtVolcom","", 390 ,"" }, //Volcom
			{"A3LWolfShirt","", 390 ,"" }, //Wolf
			{"CUP_U_C_Woodlander_01","", 390 ,"" }, //Woodlander
			{"CUP_U_C_Woodlander_02","", 390 ,"" }, //Woodlander
			{"CUP_U_C_Woodlander_03","", 390 ,"" }, //Woodlander
			{"CUP_U_C_Woodlander_04","", 390 ,"" }, //Woodlander
			{"CUP_U_C_Worker_01","", 390 ,"" }, //Worker
			{"CUP_U_C_Worker_02","", 390 ,"" }, //Worker
			{"CUP_U_C_Worker_03","", 390 ,"" }, //Worker
			{"CUP_U_C_Worker_04","", 390 ,"" }, //Worker
			{"U_Competitor","", 390 ,"" }, //Competición
			{"EF_suit_1","", 500 ,"" }, //EF Suit 1
			{"EF_suit_2","", 500 ,"" }, //EF Suit 2
			{"EF_suit_3","", 500 ,"" }, //EF Suit 3
			{"EF_suit_4","", 500 ,"" }, //EF Suit 4
			{"EF_suit_5","", 500 ,"" }, //EF Suit 5
			{"EF_suit_6","", 500 ,"" }, //EF Suit 6
			{"KAEL_SUITS_BR_F3","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BR_F12","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BR_F8","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BLK_F","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BR_F11","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BR_F10","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BR_F6","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BR_F4","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BR_F","", 500 ,"" }, //Kael Suit
			{"KAEL_SUITS_BR_F9","", 500 ,"" }, //Kael Suit
			{"CUP_U_C_Suit_01","", 500 ,"" }, //Suit
			{"CUP_U_C_Suit_02","", 500 ,"" }, //Suit
			{"rds_uniform_Villager2","", 200 ,"" },
			{"rds_uniform_Villager3","", 200 ,"" },
			{"rds_uniform_Villager4","", 200 ,"" },
			{"CUP_O_TKI_Khet_Jeans_02","", 500 ,"" }
        };
        headgear[] = {
            {"NONE", $STR_C_Remove_headgear, 0,"" },
			{"TRYK_H_headset2","", 120,"" },
            {"H_Bandanna_camo","", 120,"" },
            {"H_Bandanna_surfer","", 130,"" },
            {"H_Bandanna_khk","", 145,"" },
            {"H_Cap_blu","", 150,"" },
            {"H_Cap_grn","", 150,"" },
            {"H_Cap_grn_BI","", 150,"" },
            {"H_Cap_oli","", 150,"" },
            {"H_Cap_red","", 150,"" },
            {"H_Cap_tan","", 150,"" },
            {"H_Helmet_Skate","", 150,"" }, //Apex DLC
            {"H_Bandanna_gry","", 150,"" },
            {"H_Bandanna_sgg","", 160,"" },
            {"H_Bandanna_cbr","", 165,"" },
            {"H_StrawHat","", 225,"" },
            {"H_Hat_tan","", 265,"" },
            {"H_Hat_brown","", 276,"" },
            {"H_Hat_grey","", 280,"" },
            {"H_BandMask_blk", $STR_C_Civ_BandMask, 300,"" },
            {"H_Hat_blue","", 310,"" },
            {"H_Hat_checker","", 340,"" },
            {"H_Booniehat_tan","", 425,"" },
            {"H_Booniehat_grn","", 425,"" },
			{"ALE_H_Calot","", 500 ,"" },
			{"ALE_H_NewEra_Black","", 500 ,"" },
			{"ALE_H_NewEra_Cyan","", 500 ,"" },
			{"ALE_H_NewEra_Superman","", 500 ,"" },
			{"ALE_H_NewEra_Rouge","", 500 ,"" },
			{"ALE_H_NewEra_Monster","", 500 ,"" },
			{"ALE_H_Cowboy_Black","", 500 ,"" },
			{"ALE_H_Cowboy_White","", 500 ,"" },
			{"ALE_H_NewEra_Lakers","", 500 ,"" },
			{"ALE_H_NewEra_Redsox","", 500 ,"" },
			{"TRYK_R_CAP_BLK","", 500 ,"" },
			{"TRYK_r_cap_blk_Glasses","", 500 ,"" },
			{"TRYK_H_headsetcap_Glasses","", 500 ,"" },
			{"Kio_Pirate_Hat","", 500 ,"" },
			{"kio_skl_msk_red","", 500 ,"" },
			{"kio_skl_msk_black","", 500 ,"" },
			{"kio_skl_msk_p","", 500 ,"" },
			{"Kio_Spinning_Hat","", 500 ,"" },
			{"pop_gorra_negra","", 500 ,"" },
			{"pop_cowboy_brown","", 500 ,"" },
			{"pop_gorra_batman","", 500 ,"" },
			{"pop_gorra_creeper","", 500 ,"" },
			{"pop_gorra_deadpool","", 500 ,"" },
			{"pop_gorra_metropolis","", 500 ,"" },
			{"pop_gorra_cura","", 500 ,"" },
			{"pop_gorra_ss","", 500 ,"" },
			{"pop_mexicano","", 500 ,"" },
			{"POP_Cowboy_hat","", 500 ,"" },
			{"pop_mascara_2","", 500 ,"" },
			{"pop_mascara_5","", 500 ,"" },
			{"pop_mascara_17","", 500 ,"" },
			{"pop_mascara_23","", 500 ,"" },
			{"pop_palestino","", 500 ,"" },
			{"TRYK_UA_CAP","", 500 ,"" },
			{"TRYK_UA_CAP2R","", 500 ,"" },
			{"TRYK_H_Booniehat_JSDF","", 500 ,"" },
			{"TRYK_H_DELTAHELM_NV","", 500 ,"" },
			{"TRYK_H_Bandana_wig","", 500 ,"" },
			{"TRYK_H_wig","", 500 ,"" },
			{"TRYK_H_woolhat","", 500 ,"" },
			{"TRYK_H_woolhat_WH","", 500 ,"" },
			{"TRYK_H_woolhat_br","", 500 ,"" },
			{"TRYK_H_woolhat_cu","", 500 ,"" },
			{"TRYK_H_woolhat_tan","", 500 ,"" },
			{"H_Booniehat_khk","", 500 ,"" },
			{"H_Booniehat_indp","", 500 ,"" },
			{"H_Booniehat_mcamo","", 500 ,"" },
			{"H_Cap_red","", 500 ,"" },
			{"H_Cap_tan","", 500 ,"" },
			{"H_Cap_blk_CMMG","", 500 ,"" },
			{"H_Cap_surfer","", 500 ,"" },
			{"H_Bandanna_khk","", 500 ,"" },
			{"H_Bandanna_gry","", 500 ,"" },
			{"H_Beret_blk","", 500 ,"" },
			{"H_TurbanO_blk","", 500 ,"" },
			{"H_StrawHat","", 500 ,"" },
			{"H_Hat_brown","", 500 ,"" },
			{"H_Hat_grey","", 500 ,"" },
			{"H_Hat_tan","", 500 ,"" },
			{"H_RacingHelmet_1_F","", 500 ,"" },
			{"H_RacingHelmet_2_F","", 500 ,"" },
			{"H_RacingHelmet_3_F","", 500 ,"" },
			{"H_RacingHelmet_4_F","", 500 ,"" },
			{"H_RacingHelmet_1_blue_F","", 500 ,"" },
			{"H_RacingHelmet_1_green_F","", 500 ,"" },
			{"H_RacingHelmet_1_white_F","", 500 ,"" },
			{"arabian_Hat","", 500 ,"" },
			{"arabian_Hat2","", 500 ,"" },
			{"Payday_GeneralO","", 500 ,"" },
			{"Casque_Moto","", 500 ,"" },
			{"Masque_Bush","", 500 ,"" },
			{"Masque_Momie","", 500 ,"" },
			{"Masque_GdG","", 500 ,"" },
			{"Masque_Lion","", 500 ,"" },
			{"Masque_Mark","", 500 ,"" },
			{"rds_police_cap","", 500 ,"" },
			{"rds_worker_cap1","", 500 ,"" },
			{"rds_worker_cap4","", 500 ,"" },
			{"rds_Villager_cap1","", 500 ,"" },
			{"rds_Villager_cap2","", 500 ,"" },
			{"rds_Villager_cap4","", 500 ,"" },
			{"rds_Profiteer_cap3","", 500 ,"" },
			{"rds_Profiteer_cap4","", 500 ,"" },
			{"rds_Woodlander_cap2","", 500 ,"" },
			{"rds_Woodlander_cap3","", 500 ,"" },
			{"rds_Woodlander_cap4","", 500 ,"" },
			{"H_ALFR_Heist_Mask_4","", 500 ,"" },
			{"H_ALFR_Heist_Mask_6","", 500 ,"" },
			{"H_ALFR_Sheep_Mask","", 500 ,"" },
			{"H_ALFR_Dallas_Mask","", 500 ,"" },
			{"BHD_Protec_helmet","", 500 ,"" },
			{"BHD_Protec_helmet2","", 500 ,"" },
			{"BHD_Protec_helmet3","", 500 ,"" },
			{"EF_HOOD_KA_B","", 500 ,"" },
			{"EF_HAT_BK","", 500 ,"" },
			{"EF_FHAT_BK","", 500 ,"" },
			{"EF_HAT_PI","", 500 ,"" },
			{"EF_FHAT_PI","", 500 ,"" },
			{"EF_HAT_BW","", 500 ,"" },
			{"EF_FHAT_BW","", 500 ,"" },
			{"EF_HAT_CL","", 500 ,"" },
			{"EF_BNE_BK","", 500 ,"" },
			{"EF_BNE_BR","", 500 ,"" },
			{"EF_BNE_V","", 500 ,"" },
			{"EF_FBNE_BL","", 500 ,"" },
			{"EF_FBNE_BR","", 500 ,"" },
			{"EF_FBNE_R","", 500 ,"" },
			{"EF_FBNE_W","", 500 ,"" },
			{"EF_FSMGV","", 500 ,"" },
			{"EF_Fcap_UB","", 500 ,"" },
			{"EF_Fcap_TN","", 500 ,"" },
			{"EF_Fcap_O","", 500 ,"" },
			{"EF_FPKL_W","", 500 ,"" },
			{"EF_wig_DHB","", 500 ,"" },
			{"EF_wig_VSB","", 500 ,"" },
			{"EF_wig_VSSV","", 500 ,"" },
			{"EF_wig_VSBL","", 500 ,"" },
			{"EF_wig_VSBLE","", 500 ,"" },
			{"EF_wig_SBW","", 500 ,"" },
			{"EF_wig_SBLE","", 500 ,"" },
			{"EF_Long_wig_B","", 500 ,"" },
			{"EF_Long_wig_BW","", 500 ,"" },
			{"EF_Long_wig_BLE","", 500 ,"" },
			{"EF_Punk_wig_SB","", 500 ,"" },
			{"EF_Punk_wig_SB3","", 500 ,"" },
			{"EF_Punk_wig_SBL3","", 500 ,"" },
			{"EF_Punk_wig_B","", 500 ,"" },
			{"EF_FHcap_BK","", 500 ,"" },
			{"EF_FHcap_MG","", 500 ,"" },
			{"EF_FHcap_PP","", 500 ,"" },
			{"EF_FHcap_R","", 500 ,"" },
			{"EF_FHcap_W","", 500 ,"" },
			{"gorro_rojo","", 500 ,"" },
			{"gorro_violeta","", 500 ,"" },
			{"Afghan_02Hat","", 500 ,"" },
			{"Afghan_05Hat","", 500 ,"" },
			{"H_Helmet_Skate","", 500 ,"" },
			{"mgsr_headbag","", 500 ,"" },
			{"EF_HAT_BW","", 500 ,"" }
        };
        goggles[] = {
            {"NONE", $STR_C_Remove_goggles, 0,"" },
			{"Afghan_02Hat","Sombrero Arabe 2", 100 ,"" },		
			{"Afghan_03Hat","Sombrero Arabe 3", 100 ,"" }, 	
			{"Afghan_06Hat","Sombrero Arabe 4", 100 ,"" }, 
			{"CUP_H_FR_BandanaGreen","Bandana Verde", 100 ,"" },
			{"CUP_H_C_Beanie_01","Gorro Blanco", 100 ,"" }, 	
			{"CUP_H_C_Beanie_02","Gorro Marron", 100 ,"" }, 	
			{"CUP_H_C_Beret_04","Boina Antigua Marron", 100 ,"" }, 	
			{"CUP_H_C_Beret_01","Boina Antigua Negra", 100 ,"" }, 	
			{"CUP_H_C_Beret_03","Boina Antigua Patron", 100 ,"" }, 	
			{"CUP_H_PMC_Cap_Burberry","Gorra a Cuadros 1", 100 ,"" },			
			{"CUP_H_PMC_Cap_Back_Burberry","Gorra a Cuadros 2", 100 ,"" }, 	 	
			{"CUP_H_PMC_Cap_Grey","Gorra Gris 1", 100 ,"" }, 	
			{"CUP_H_PMC_Cap_Back_Grey","Gorra Gris 2", 100 ,"" }, 	
			{"CUP_H_PMC_Cap_Tan","Gorra Marron 1", 100 ,"" }, 	
			{"CUP_H_PMC_Cap_Back_Tan","Gorra Marron 2", 100 ,"" }, 	
			{"EF_Fcap_O","Gorra Chica Verde", 100 ,"" }, 	
			{"EF_Fcap_R","Gorra Chica Roja", 100 ,"" }, 	
			{"EF_Fcap_Surf","Gorra Chica Surf", 100 ,"" }, 	
			{"EF_Fcap_TN","Gorra Chica Marron", 100 ,"" }, 	
			{"CUP_H_NAPA_Fedora","Sombrero Indiana Jones", 100 ,"" }, 	
			{"H_Cap_blu","Gorra Azul", 100 ,"" }, 	
			{"H_Cap_blk","Gorra Negra", 100 ,"" }, 	
			{"H_Cap_oli","Gorra Oliva", 100 ,"" }, 	
			{"H_Cap_tan","Gorra Marron", 100 ,"" }, 	
			{"H_Cap_red","Gorra Roja", 100 ,"" }, 	
			{"H_Cap_surfer","Gorra Surfista", 100 ,"" }, 	
			{"H_Cap_grn","Gorra Verde", 100 ,"" }, 	
			{"pop_gorra_cyan","Gorra Cyan Los Angeles", 100 ,"" }, 	
			{"pop_gorra_redsox","Gorra Boston RedSox", 100 ,"" }, 	
			{"pop_gorra_lakers","Gorra Lakers", 100 ,"" }, 	
			{"pop_gorra_monster","Gorra Monster", 100 ,"" }, 	
			{"pop_gorra_superman","Gorra Superman", 100 ,"" }, 	
			{"pop_gorra_negra","Gorra Negra New York", 100 ,"" }, 	
			{"POP_Cowboy_hat","Sombrero CowBoy", 100 ,"" }, 	
			{"H_Orel_Kepi","Gorra Kepi", 100 ,"" }, 		
			{"Kio_Santa_Hat","Gorro Papa Noel", 100 ,"" }, 	
			{"H_Hat_checker","Sombrero a Cuadros", 100 ,"" }, 	
			{"H_Hat_blue","Sombrero a Cuadros Azul", 100 ,"" }, 	
			{"H_Hat_grey","Sombrero Gris", 100 ,"" }, 	
			{"H_Hat_brown","Sombrero Marron 1", 100 ,"" }, 	
			{"H_Hat_tan","Sombrero Marron 2", 100 ,"" }, 	
			{"H_StrawHat","Sombrero de Paja", 100 ,"" }, 	
			{"pop_mexicano","Sombrero Mexicano", 100 ,"" }, 	
			{"Kio_Spinning_Hat","Gorrocoptero", 100 ,"" }, 	
			{"CUP_H_TKI_Lungee_Open_01","Pañuelo Arabe 1", 100 ,"" }, 	
			{"CUP_H_TKI_Lungee_Open_04","Pañuelo Arabe 2", 100 ,"" }, 	
			{"CUP_H_TKI_Lungee_Open_05","Pañuelo Arabe 3", 100 ,"" }, 	
			{"CUP_H_TKI_Lungee_Open_06","Pañuelo Arabe 4", 100 ,"" }, 	
			{"CUP_H_TKI_Lungee_01","Pañuelo Arabe 5", 100 ,"" }, 	
			{"CUP_H_TKI_Lungee_05","Pañuelo Arabe 6", 100 ,"" }, 	
			{"CUP_H_TKI_Lungee_06","Pañuelo Arabe 7", 100 ,"" }, 	
			{"CUP_H_TKI_Pakol_2_04","Pañuelo Arabe 8", 100 ,"" }, 	
			{"CUP_H_TKI_Pakol_2_05","Pañuelo Arabe 9", 100 ,"" }, 	
			{"CUP_H_TKI_Pakol_2_06","Pañuelo Arabe 10", 100 ,"" }, 	
			{"CUP_H_TKI_Pakol_1_03","Pañuelo Arabe 11", 100 ,"" }, 	
			{"CUP_H_TKI_Pakol_1_04","Pañuelo Arabe 12", 100 ,"" }, 	
			{"CUP_H_TKI_Pakol_1_06","Pañuelo Arabe 13", 100 ,"" }, 	
			{"CUP_H_TKI_SkullCap_01","Pañuelo Arabe 14", 100 ,"" }, 	
			{"CUP_H_TKI_SkullCap_04","Pañuelo Arabe 15", 100 ,"" }, 	
			{"CUP_H_TKI_SkullCap_03","Pañuelo Arabe 16", 100 ,"" }, 	
			{"POP_Tophat","Sombrero de Copa", 100 ,"" }, 	
			{"TRYK_R_CAP_BLK","Gorra Negra Hacia Atras", 100 ,"" }, 	
			{"TRYK_R_CAP_TAN","Gorra Marron Hacia Atras", 100 ,"" }, 	
			{"TRYK_H_woolhat","Gorro Negro", 100 ,"" }, 	
			{"TRYK_H_woolhat_br","Gorro Marron", 100 ,"" }, 	
			{"TRYK_H_woolhat_cu","Gorro Verde", 100 ,"" }, 	
			{"CUP_H_C_Ushanka_03","Gorro Ruso Marron 1", 100 ,"" }, 
			{"CUP_H_C_Ushanka_04","Gorro Ruso Marron 2", 100 ,"" }, 					
			{"CUP_H_C_Ushanka_02","Gorro Ruso Verde", 100 ,"" }, 	
			{"CUP_H_C_Ushanka_01","Gorro Ruso Rojo", 100 ,"" }, 	
			{"kio_vfv_mask","Mascara Anonimous 1", 100 ,"" },	
			{"Masque_Anonymous","Mascara Anonymous 3", 100 ,"" }, 	
			{"kio_skl_msk_adc","Mascara Calavera Marihuana", 100 ,"" },			
			{"kio_skl_msk_black","Mascara Calavera Negra", 100 ,"" },
			{"kio_skl_msk_can","Mascara Calavera Canada", 100 ,"" }, 		
			{"kio_skl_msk_fran","Mascara Calavera francia", 100 ,"" }, 		
			{"kio_skl_msk_frost","Mascara Calavera Congelada", 100 ,"" }, 		
			{"kio_skl_msk_GOW","Mascara Calavera GoW", 100 ,"" }, 		
			{"kio_skl_msk_german","Mascara Calavera Alemania", 100 ,"" }, 		
			{"kio_skl_msk_grey","Mascara Calavera Gris", 100 ,"" }, 		
			{"kio_skl_msk_irish","Mascara Calavera Irlanda 1", 100 ,"" }, 				
			{"kio_skl_msk_nirish","Mascara Calavera Irlanda 2", 100 ,"" }, 				
			{"kio_skl_msk_o","Mascara Calavera Naranja", 100 ,"" }, 				
			{"kio_skl_msk_pun","Mascara Calavera Punisher", 100 ,"" }, 				
			{"kio_skl_msk_p","Mascara Calavera Morada", 100 ,"" }, 				
			{"kio_skl_msk_redranger","Mascara Calavera Power Ranger", 100 ,"" }, 				
			{"kio_skl_msk","Mascara Calavera Blanca y Negra", 100 ,"" }, 				
			{"kio_skl_msk_grn","Mascara Calavera verde y Negra", 100 ,"" }, 				
			{"kio_skl_msk_red","Mascara Calavera Roja y Negra", 100 ,"" }, 				
			{"kio_skl_msk_scot","mascara Calavera Escocia", 100 ,"" }, 				
			{"kio_skl_msk_UK","mascara Calavera UK", 100 ,"" }, 				
			{"kio_skl_msk_US","mascara Calavera US", 100 ,"" }, 				
			{"H_AntmanMask","Mascara AntMan", 100 ,"" }, 		
			{"H_AugustusMask","Mascara GoW", 100 ,"" }, 		
			{"H_BatmanMask","Mascara Batman", 100 ,"" }, 		
			{"H_BushMask","Mascara Presidente Bush", 100 ,"" }, 		
			{"H_BobaMask","Mascara La Empresa", 100 ,"" }, 					
			{"pop_robocop","Mascara RoboCop", 100 ,"" }, 		
			{"H_ClintonMask","Mascara Presidente Clinton", 100 ,"" }, 		
			{"H_Orel_Mask_Dead","Mascara Muerte", 100 ,"" }, 	
			{"H_DeadpoolMask","Mascara Deadpool", 100 ,"" }, 		
			{"H_FranklinMask","Mascara Presidente Franklin", 100 ,"" }, 		
			{"H_RAAMMask","Mascara General RAAM", 100 ,"" }, 		
			{"H_GrantMask","Mascara Presidente Grant", 100 ,"" }, 		
			{"H_HulkMask","Mascara Hulk", 100 ,"" }, 		
			{"H_JasonMask","Mascara Jason Voorhes", 100 ,"" }, 		
			{"H_LincolnMask","Mascara Presidente Lincoln", 100 ,"" }, 		
			{"Masque_Mempo","Mascara Mempo", 100 ,"" }, 		
			{"Masque_Alien1","Mascara Alien", 100 ,"" }, 		
			{"Masque_archNemesis","Mascara Arch Nemesis", 100 ,"" }, 		
			{"Masque_Arnold","Mascara Arnold", 100 ,"" }, 		
			{"Masque_Aubrey","Marcara Cerdo", 100 ,"" },
			{"Masque_Bonnie","Mascara Bonnie", 100 ,"" }, 		
			{"Masque_Chains","Mascara Payaso Chains", 100 ,"" }, 		
			{"Masque_Dallas","MAscara Payaso Dallas", 100 ,"" }, 		
			{"Masque_Hoxton","Mascara Payaso Hoxton", 100 ,"" }, 
			{"Masque_Wolfv2","Mascara Payaso Wolf", 100 ,"" }, 					
			{"Masque_Gombo","Mascara Payaso Gombo", 100 ,"" }, 		
			{"Masque_Incendiaire","Mascara Payaso Incendiare", 100 ,"" }, 		
			{"Masque_Macrilleuse","Mascara Payaso Pussy Destroller", 100 ,"" }, 		
			{"Masque_Smiley","Macars Payaso Smiley", 100 ,"" }, 		
			{"Masque_Clover","Mascara Payaso Clover", 100 ,"" }, 		
			{"Masque_Chuck","Mascara de Aguila", 100 ,"" }, 		
			{"Masque_Fish","Mascara de Pez", 100 ,"" }, 		
			{"Masque_GdG","Mascara Cara Feliz", 100 ,"" }, 		
			{"Masque_Hockey","Mascara Hockey", 100 ,"" }, 		
			{"Masque_Lion","Mascara de leon", 100 ,"" }, 		
			{"Masque_Mark","Mascara de Oso", 100 ,"" }, 		
			{"Masque_Momie","Mascara de Momia", 100 ,"" }, 		
			{"Masque_Optimiste","Mascara de Robot", 100 ,"" }, 		
			{"Masque_Orc","MAscara de Orco", 100 ,"" }, 		
			{"Masque_Religieuse","Mascara de Monja", 100 ,"" }, 		
			{"Masque_Santa","Mascara de Papa Noel", 100 ,"" }, 		
			{"Masque_speedRunner","Mascara de Speed Runner", 100 ,"" }, 		
			{"Masque_Unic","Mascara de Unicorio", 100 ,"" }, 		
			{"H_ObamaMask","·Mascara Obama", 100 ,"" }, 		
			{"H_PatriotMask","Mascara IronMan", 100 ,"" }, 		
			{"H_ScarecrowMask","Mascara Espantapajaros", 100 ,"" }, 		
			{"H_ShrekMask","Mascara Shrek", 100 ,"" }, 		
			{"H_SpidermanMask","Mascara de Spiderman", 100 ,"" }, 		
			{"H_SpongebobMask","Mascara de Bob Esponja", 100 ,"" }, 		
			{"H_SquidwardMask","MAscara de Calamardo", 100 ,"" }, 		
			{"H_UltronMask","Mascara Ultron", 100 ,"" }, 		
			{"H_GingerbreadMask","Mascara Galleta", 100 ,"" }, 		
			{"H_VenomMask","Mascara de Venom", 100 ,"" }, 		
			{"Kio_Hat","Cubreorejas Calentito", 100 ,"" }, 		
			{"BHD_Protec_helmet","Casco de Bici con Manoslibres", 100 ,"" }, 	
			{"H_RacingHelmet_1_yellow_F","Casco de Moto Amarillo", 100 ,"" }, 	
			{"H_RacingHelmet_1_blue_F","Casco de Moto Azul", 100 ,"" }, 	
			{"H_RacingHelmet_1_white_F","Casco de Moto Blanco", 100 ,"" }, 	
			{"H_RacingHelmet_1_red_F","Casco de Moto Rojo", 100 ,"" }, 	
			{"H_RacingHelmet_1_green_F","Casco de Moto Verde", 100 ,"" }, 
			{"H_RacingHelmet_1_orange_F","Casco de Moto Naranja", 100 ,"" }, 	
			{"H_RacingHelmet_1_black_F","Casco de Moto Negro", 100 ,"" }, 	
			{"H_RacingHelmet_3_F","Casco de Moto Dorado", 100 ,"" }, 	
			{"H_RacingHelmet_2_F","Casco de Moto BlueKing", 100 ,"" }, 	
			{"H_RacingHelmet_1_F","Casco de Moto Fuel", 100 ,"" }, 	
			{"H_RacingHelmet_4_F","Casco de Moto Vrana", 100 ,"" }, 	
			{"EF_Long_wig_B","Peluca Larga Negra", 100 ,"" }, 	
			{"EF_Long_wig_BLE","Peluca Larga Rubia", 100 ,"" }, 	
			{"EF_Long_wig_BL","Peluca Larga Castaña", 100 ,"" }, 	
			{"EF_Long_wig_BW","Peluca Larga Castaña Oscura", 100 ,"" }, 	
			{"EF_Punk_wig_B","Cresta Punk Negra", 100 ,"" }, 	
			{"EF_Punk_wig_BLE","Cresta Punk Rubia", 100 ,"" }, 	
			{"EF_Punk_wig_BL","Cresta Punk Castaña", 100 ,"" }, 	
			{"EF_Punk_wig_BW","Cresta Punk Castaña Oscura", 100 ,"" }, 	
			{"EF_Punk_wig_GL","Cresta Negra y Blanca", 100 ,"" }, 	
			{"POP_Mohawk","Cresta Mohawk", 100 ,"" },
			{"SFG_Tac_BeardD","", 500 ,"" },
			{"SFG_Tac_BeardG","", 500 ,"" },
			{"SFG_Tac_BeardO","", 500 ,"" },
			{"SFG_Tac_ChopsD","", 500 ,"" },
			{"SFG_Tac_smallBeardG","", 500 ,"" },
			{"TRYK_kio_balaclava_WH","", 500 ,"" },
			{"TRYK_kio_balaclava_BLK","", 500 ,"" },
			{"TRYK_Shemagh","", 500 ,"" },
			{"TRYK_Shemagh_ESS_G","", 500 ,"" },
			{"TRYK_Shemagh_ESS_WH","", 500 ,"" },
			{"TRYK_bandana_g","", 500 ,"" },
			{"G_Spectacles","", 500 ,"" },
			{"G_Shades_Black","", 500 ,"" },
			{"G_Shades_Green","", 500 ,"" },
			{"G_Squares","", 500 ,"" },
			{"G_Sport_Blackyellow","", 500 ,"" },
			{"G_Sport_Blackyellow","", 500 ,"" },
			{"G_Aviator","", 500 ,"" },
			{"G_Balaclava_blk","", 500 ,"" },
			{"G_Bandanna_blk","", 500 ,"" },
			{"G_Bandanna_tan","", 500 ,"" },
			{"G_Bandanna_shades","", 500 ,"" },
			{"G_Bandanna_sport","", 500 ,"" },
			{"G_Bandanna_aviator","", 500 ,"" },
			{"Payday_Cagoule","", 500 ,"" },
			{"EF_SC_W1","", 500 ,"" },
			{"EF_SC_MG1","", 500 ,"" },
			{"EF_SC_PP1","", 500 ,"" },
			{"EF_SC_MG2","", 500 ,"" },
			{"EF_FG2","", 500 ,"" },
			{"EF_RG1","", 500 ,"" },
			{"EF_AC1","", 500 ,"" },
			{"EF_AC2","", 500 ,"" },
			{"TRYK_Beard2","", 500 ,"" },
			{"TRYK_Beard_BL3","", 500 ,"" },
			{"TRYK_SBeard_Gr","", 500 ,"" },
			{"TRYK_SBeard_BW2","", 500 ,"" },
			{"TRYK_SBeard_BW4","", 500 ,"" },
			{"TRYK_SBeard_BW6","", 500 ,"" },
			{"G_Balaclava_TI_blk_F","", 500 ,"" },
			{"mgsr_eyepatch_goggles","", 500 ,"" },
			{"murshun_cigs_cig0","", 500 ,"" },
			{"murshun_cigs_cig1","", 500 ,"" },
			{"murshun_cigs_cig2","", 500 ,"" }
        };
        vests[] = {
            {"NONE", $STR_C_Remove_vests, 0,"" },
			{"CUP_V_OI_TKI_Jacket1_04","",250 ,"" },
			{"CUP_V_OI_TKI_Jacket1_06","",250 ,"" },
			{"CUP_V_OI_TKI_Jacket1_05","",250,""}
        };
        backpacks[] = {
            {"NONE", $STR_C_Remove_backpacks, 0,"" },
			{"CUP_B_AssaultPack_Black","Mochila Utilitaria 1",200 ,"" },
			{"CUP_B_AssaultPack_Coyote","Mochila Utlitaria 2",200 ,"" },
			{"B_AssaultPack_cbr","Mochila de Asalto pequeña 1",250 ,"" },
			{"B_AssaultPack_blk","Mochila de Asalto pequeña 2",250 ,"" },			
			{"B_FieldPack_cbr","Mochila de Campo",250 ,"" },
			{"mochila_pequena","Mochila Pequeña",290 ,"" },
			{"CUP_B_Bergen_BAF","Mochila de Asalto Mediana",250 ,"" },
			{"A3L_BergenMurica","Mochila verde",350 ,"" },
			{"B_Carryall_cbr","mochila de Viaje",400,"" }
        };
    };

    class cop {
        title ="STR_Shops_C_Police";
        conditions ="";
        side ="cop";
        uniforms[] = {
            {"NONE", $STR_C_Remove_uniforms, 0,"" },
            {"U_Rangemaster", $STR_C_Cop_uniforms, 25,"" },
            {"U_B_CombatUniform_mcam_tshirt","", 350,"call life_coplevel >= 1" },
            {"U_B_CombatUniform_mcam_worn","", 550,"call life_coplevel >= 2" },
            {"U_B_survival_uniform","", 1250,"call life_coplevel >= 1" }
        };
        headgear[] = {
            {"NONE", $STR_C_Remove_headgear, 0,"" },
            {"H_Cap_police","", 25,"" },
            {"H_Booniehat_mcamo","", 120,"call life_coplevel >= 1" },
            {"H_HelmetB_plain_mcamo","", 75,"call life_coplevel >= 1" },
            {"H_HelmetB_Enh_tna_F","", 80,"call life_coplevel >= 1" }, //Apex DLC
            {"H_Beret_blk_POLICE","", 50,"call life_coplevel >= 2" },
            {"H_MilCap_mcamo","", 100,"call life_coplevel >= 2" },
            {"H_MilCap_gen_F","", 1200,"call life_coplevel >= 2" }, //Apex DLC
            {"H_MilCap_tna_F","", 1200,"call life_coplevel >= 2" }, //Apex DLC
            {"H_MilCap_oucamo","", 1200,"call life_coplevel >= 2" }
        };
        goggles[] = {
            {"NONE", $STR_C_Remove_goggles, 0,"" },
            {"G_Squares","", 10,"" },
            {"G_Shades_Blue","", 20,"" },
            {"G_Sport_Blackred","", 20,"" },
            {"G_Sport_Checkered","", 20,"" },
            {"G_Sport_Blackyellow","", 20,"" },
            {"G_Sport_BlackWhite","", 20,"" },
            {"G_Shades_Black","", 25,"" },
            {"G_Lowprofile","", 30,"" },
            {"G_Combat","", 55,"" },
            {"G_Aviator","", 100,"" },
            {"G_Lady_Mirror","", 150,"" },
            {"G_Lady_Dark","", 150,"" },
            {"G_Lady_Blue","", 150,"" }
        };
        vests[] = {
            {"NONE", $STR_C_Remove_vests, 0,"" },
            {"V_Rangemaster_belt","", 800,"" },
            {"V_TacVest_blk_POLICE","", 1000,"call life_coplevel >= 1" },
            {"V_TacVest_gen_F","", 1000,"call life_coplevel >= 1" }, //Apex DLC
            {"V_PlateCarrier2_rgr","", 1500,"call life_coplevel >= 2" }
        };
        backpacks[] = {
            {"NONE", $STR_C_Remove_backpacks, 0,"" },
            {"B_FieldPack_cbr","", 500,"" },
            {"B_AssaultPack_cbr","", 700,"" },
            {"B_Kitbag_cbr","", 800,"" },
            {"B_Bergen_sgg","", 2500,"" },
            {"B_Carryall_cbr","", 3500,"" }
        };
    };

    class dive {
        title ="STR_Shops_C_Diving";
        conditions ="license_civ_dive";
        side ="civ";
        uniforms[] = {
            {"NONE", $STR_C_Remove_uniforms, 0,"" },
            {"U_B_Wetsuit","", 2000,"" }
        };
        headgear[] = {
            {"NONE", $STR_C_Remove_headgear, 0,"" }
        };
        goggles[] = {
            {"NONE", $STR_C_Remove_goggles, 0,"" },
            {"G_Diving","", 500,"" }
        };
        vests[] = {
            {"NONE", $STR_C_Remove_vests, 0,"" },
            {"V_RebreatherB","", 5000,"" }
        };
        backpacks[] = {
            {"NONE", $STR_C_Remove_backpacks, 0,"" }
        };
    };

    class gun_clothing {
        title ="STR_Shops_C_Gun";
        conditions ="license_civ_gun";
        side ="civ";
        uniforms[] = {
            {"NONE", $STR_C_Remove_uniforms, 0,"" }
        };
        headgear[] = {
            {"NONE", $STR_C_Remove_headgear, 0,"" }
        };
        goggles[] = {
            {"NONE", $STR_C_Remove_goggles, 0,"" }
        };
        vests[] = {
            {"NONE", $STR_C_Remove_vests, 0,"" },
            {"V_Rangemaster_belt","", 4900,"" }
        };
        backpacks[] = {
            {"NONE", $STR_C_Remove_backpacks, 0,"" }
        };
    };

    class gang_clothing {
        title ="STR_Shops_C_Gang";
        conditions ="life_in_gang";
        side ="civ";
        uniforms[] = {
            {"NONE", $STR_C_Remove_uniforms, 0,"" },
            {"POP_CHAW4_D4", "", 1000,"" },
            {"POP_CHAW4_D5", "", 1000,"" },
            {"POP_CHAW4_D6", "", 1000,"" },
            {"POP_CHAW4_D7", "", 1000,"" },
            {"TRYK_U_B_PCUHsW8", "", 1000,"" },
            {"TRYK_U_B_PCUHsW3", "", 1000,"" },
            {"TRYK_U_B_PCUHsW9", "", 1000,"" },
            {"TRYK_U_B_BLKBLK_CombatUniform", "", 1000,"" },
            {"TRYK_U_B_BLKBLK_R_CombatUniform", "", 1000,"" },
            {"TRYK_U_B_BLK_Tshirt", "", 1000,"" },
            {"TRYK_U_taki_BLK", "", 1000,"" }
        };
        headgear[] = {
            {"NONE", $STR_C_Remove_headgear, 0,"" },
			{"Afghan_02Hat","Sombrero Arabe 2", 100 ,"" },		
			{"Afghan_03Hat","Sombrero Arabe 3", 100 ,"" }, 	
			{"Afghan_06Hat","Sombrero Arabe 4", 100 ,"" }
        };
        goggles[] = {
            {"NONE", $STR_C_Remove_goggles, 0,"" }
        };
        vests[] = {
            {"NONE", $STR_C_Remove_vests, 0,"" },
            {"EF_SH_BK","", 1900,"" },
            {"EF_SH_BW","", 1900,"" },
            {"Specter_MBSS_PACA_BLK","", 1900,"" },
            {"Specter_RAV_BLK","", 1900,"" },
            {"TAC_HSG_AB_B","", 1900,"" },
            {"TAC_LBT_BL_BK","", 1900,"" },
            {"TAC_PBDFG2_B_1","", 1900,"" },
            {"EF_CTV2","", 1900,"" },
            {"TAC_FS_FOL_B","", 1900,"" },
			{"TAC_LBT_H_B","", 1900,"" },
			{"TAC_HGB_B","", 1900,"" },
			{"TAC_Jvest_B","", 1900,"" },
			{"TAC_Jvest_GR","", 1900,"" },
			{"TAC_Jvest_TN","", 1900,"" },
			{"TAC_V_Sheriff_BA_TB","", 1900,"" },
			{"TAC_V_Sheriff_BA_TB4","", 1900,"" }
			
        };
        backpacks[] = {
            {"NONE", $STR_C_Remove_backpacks, 0,"" },
            {"mochila_pequena","", 2000,"" },
            {"B_Carryall_khk","", 2000,"" },
            {"B_Parachute","", 2000,"" }
        };
    };

    class med_clothing {
        title ="STR_MAR_EMS_Clothing_Shop";
        conditions ="";
        side ="med";
        uniforms[] = {
            {"NONE", $STR_C_Remove_uniforms, 0,"" },
            {"U_Rangemaster", $STR_C_EMS_uniforms, 50,"" },
			{"SME","",50,"" },
			{"SME2","",50,"" },
			{"SME3","",50,"" },
			{"CRUZ_ROJA","",50,"" },
			{"SME2","",50,"" },
			{"U_B_Wetsuit","",100,"" },
			{"POP_CHAW2_D","",50,"" },
			{"rds_uniform_doctor","",50,"" },
			{"POP_CHAW4_D4","",50,"" },
			{"U_C_Driver_1_blue","",50,"" },
		    {"TRYK_OVERALL_SAGE_BLKboots_nk_blk","",50,"" }
        };
        headgear[] = {
            {"NONE", $STR_C_Remove_headgear, 0,"" },
			{"GORRA_CRUZROJA","",50,"" },
		    {"GORRA_SME","",50,"" },
			{"H_PilotHelmetHeli_O","",50,"" },
			{"H_RacingHelmet_1_blue_F","",50,"" },
			{"H_Orel_FireFighter","",85,"" },
			{"H_RacingHelmet_2_F","",85,"" }	
        };
        goggles[] = {
            {"NONE", $STR_C_Remove_goggles, 0,"" },
			{"Masque_Chirurgical","",25,"" },
			{"G_B_Diving","",20,"" },
			{"G_Sport_Blackred","",20,"" },
			{"G_Sport_Checkered","",20,"" },
			{"G_Sport_Blackyellow","",20,"" },
			{"G_Sport_BlackWhite","",20,"" },
			{"G_Squares","",75,"" },
			{"G_Aviator","",10,"" }		
        };
        vests[] = {
            {"NONE", $STR_C_Remove_vests, 0,"" },
			{"pop_chaleco_tela_auxiliar","",50,"" },
			{"pop_chaleco_tela_tecnico","",50,"" },
			{"pop_chaleco_tela_cirujano","",50,"" },
			{"pop_chaleco_tela_doctor","",50,"" },
			{"pop_chaleco_tela_medico","",50,"" },
			{"pop_chaleco_tela_supervisor","",50,"" },
			{"pop_chaleco_samurrefl2","",50,"" },
			{"pop_chaleco_samurrefl","",50,"" },
			{"pop_chaleco_tela_enfermero","",50,"" },
            {"pop_chaleco_tela_supervisor","",50,"" },
			{"Bombero: V_Firefighter","",50,"" },
			{"Respirador: V_RebreatherB","",50,"" },
			{"Bombero: V_Firefighter","",50,"" },
			{"pop_chaleco_tela_subjefe","",50,"" },
			{"pop_chaleco_tela_jefe","",50,"" }
        };
        backpacks[] = {
            {"NONE", $STR_C_Remove_backpacks, 0,"" },
			{"mochila_mediana","",100,"" },
			{"TAC_BP_Butt2RGM","",100,"" },
			{"TRYK_B_Medbag_BK","",100,"" },
			{"mochila_pequena","",850,"" }
        };
    };

    class reb {
        title ="STR_Shops_C_Rebel";
        conditions ="license_civ_rebel";
        side ="civ";
        uniforms[] = {
            {"NONE", $STR_C_Remove_uniforms, 0,"" },
            {"U_IG_Guerilla1_1","", 5000,"" },
            {"U_I_G_Story_Protagonist_F","", 7500,"" },
            {"U_I_G_resistanceLeader_F","", 11500,"" },
            {"U_IG_leader","", 15340,"" },
            {"U_O_PilotCoveralls","", 15610,"" },
            {"U_O_SpecopsUniform_ocamo","", 17500,"" },
            {"U_O_GhillieSuit","", 50000,"" },
            {"U_B_T_Soldier_F","", 50000,"" }, //Apex DLC
            {"U_I_C_Soldier_Bandit_1_F","", 50000,"" }, //Apex DLC
            {"U_I_C_Soldier_Bandit_2_F","", 51000,"" }, //Apex DLC
            {"U_I_C_Soldier_Bandit_3_F","", 50032,"" }, //Apex DLC
            {"U_I_C_Soldier_Bandit_4_F","", 50020,"" }, //Apex DLC
            {"U_I_C_Soldier_Bandit_5_F","", 50020,"" }, //Apex DLC
            {"U_I_C_Soldier_Camo_F","", 52000,"" } //Apex DLC
        };
        headgear[] = {
            {"NONE", $STR_C_Remove_headgear, 0,"" },
            {"H_Bandanna_camo","", 650,"" },
            {"H_ShemagOpen_khk","", 800,"" },
            {"H_ShemagOpen_tan","", 850,"" },
            {"H_Shemag_olive","", 850,"" },
            {"H_HelmetO_ocamo","", 2500,"" }
        };
        goggles[] = {
            {"NONE", $STR_C_Remove_goggles, 0,"" },
            {"G_Shades_Black","", 20,"" },
            {"G_Shades_Blue","", 20,"" },
            {"G_Sport_Blackred","", 25,"" },
            {"G_Sport_Checkered","", 25,"" },
            {"G_Sport_Blackyellow","", 25,"" },
            {"G_Sport_BlackWhite","", 25,"" },
            {"G_Lowprofile","", 30,"" },
            {"G_Squares","", 50,"" },
            {"G_Combat","", 125,"" },
            {"G_Balaclava_blk","", 150,"" },
            {"G_Balaclava_combat","", 150,"" },
            {"G_Balaclava_lowprofile","", 150,"" },
            {"G_Balaclava_oli","", 150,"" },
            {"G_Bandanna_aviator","", 150,"" },
            {"G_Bandanna_beast","", 150,"" },
            {"G_Bandanna_blk","", 150,"" },
            {"G_Bandanna_khk","", 150,"" },
            {"G_Bandanna_oli","", 150,"" },
            {"G_Bandanna_shades","", 150,"" },
            {"G_Bandanna_sport","", 150,"" },
            {"G_Bandanna_tan","", 150,"" }
        };
        vests[] = {
            {"NONE", $STR_C_Remove_vests, 0,"" },
            {"V_BandollierB_cbr","", 4500,"" },
            {"V_HarnessO_brn","", 7500,"" },
            {"V_TacVest_khk","", 12500,"" },
            {"V_TacChestrig_grn_F","", 17500,"" } //Apex DLC
        };
        backpacks[] = {
            {"NONE", $STR_C_Remove_backpacks, 0,"" },
            {"B_OutdoorPack_blk","", 500,"" },
            {"B_AssaultPack_khk","", 2000,"" },
            {"B_AssaultPack_dgtl","", 2000,"" },
            {"B_AssaultPack_rgr","", 2000,"" },
            {"B_AssaultPack_sgg","", 2000,"" },
            {"B_AssaultPack_blk","", 2000,"" },
            {"B_AssaultPack_cbr","", 2000,"" },
            {"B_AssaultPack_mcamo","", 2000,"" },
            {"B_TacticalPack_oli","", 2500,"" },
            {"B_Kitbag_mcamo","", 3500,"" },
            {"B_Kitbag_sgg","", 3500,"" },
            {"B_Kitbag_cbr","", 3500,"" },
            {"B_FieldPack_blk","", 5000,"" },
            {"B_FieldPack_ocamo","", 5000,"" },
            {"B_FieldPack_oucamo","", 5000,"" },
            {"B_Bergen_sgg","", 6500,"" },
            {"B_Bergen_mcamo","", 6500,"" },
            {"B_Bergen_rgr","", 6500,"" },
            {"B_Bergen_blk","", 6500,"" },
            {"B_Carryall_ocamo","", 7500,"" },
            {"B_Carryall_oucamo","", 7500,"" },
            {"B_Carryall_mcamo","", 7500,"" },
            {"B_Carryall_oli","", 7500,"" },
            {"B_Carryall_khk","", 7500,"" },
            {"B_Carryall_cbr","", 7500,"" }
        };
    };

    class kart {
        title ="STR_Shops_C_Kart";
        conditions ="";
        side ="civ";
        uniforms[] = {
            {"NONE", $STR_C_Remove_uniforms, 0,"" },
            {"U_C_Driver_1_black","", 1500,"" },
            {"U_C_Driver_1_blue","", 1500,"" },
            {"U_C_Driver_1_red","", 1500,"" },
            {"U_C_Driver_1_orange","", 1500,"" },
            {"U_C_Driver_1_green","", 1500,"" },
            {"U_C_Driver_1_white","", 1500,"" },
            {"U_C_Driver_1_yellow","", 1500,"" },
            {"U_C_Driver_2","", 3500,"" },
            {"U_C_Driver_1","", 3600,"" },
            {"U_C_Driver_3","", 3700,"" },
            {"U_C_Driver_4","", 3700,"" }
        };
        headgear[] = {
            {"NONE", $STR_C_Remove_headgear, 0,"" },
            {"H_RacingHelmet_1_black_F","", 1000,"" },
            {"H_RacingHelmet_1_red_F","", 1000,"" },
            {"H_RacingHelmet_1_white_F","", 1000,"" },
            {"H_RacingHelmet_1_blue_F","", 1000,"" },
            {"H_RacingHelmet_1_yellow_F","", 1000,"" },
            {"H_RacingHelmet_1_green_F","", 1000,"" },
            {"H_RacingHelmet_1_F","", 2500,"" },
            {"H_RacingHelmet_2_F","", 2500,"" },
            {"H_RacingHelmet_3_F","", 2500,"" },
            {"H_RacingHelmet_4_F","", 2500,"" }
        };
        goggles[] = {
            {"NONE", $STR_C_Remove_goggles, 0,"" }
        };
        vests[] = {
            {"NONE", $STR_C_Remove_vests, 0,"" }
        };
        backpacks[] = {
            {"NONE", $STR_C_Remove_backpacks, 0,"" }
        };
	};
	class life_donator {
        title ="tienda_donadores";
        conditions ="";
        side ="civ";
        uniforms[] = {
            {"NONE"										, $STR_C_Remove_uniforms,0,""},
			{"POP_CHAW4_D1"								,"",300,""},
			{"POP_CHAW4_D2"								,"",300,""},
			{"POP_CHAW4_D3"								,"",300,""},
			{"POP_CHAW4_D4"								,"",300,""},
			{"POP_CHAW4_D5"								,"",300,""},
			{"POP_CHAW4_D6"								,"",300,""},
			{"POP_CHAW4_D7"								,"",300,""},
			{"POP_CHAW4_D8"								,"",300,""},
			{"POP_CHAW3_D5"								,"",300,""},
			{"POP_CHAW3_D6"								,"",300,""},
			{"POP_CHAW_0_D"								,"",300,""},
			{"POP_CHAW_0_D1"							,"",300,""},
			{"POP_CHAW_0_D1M"							,"",300,""},
			{"POP_CHAW_0_D1M2"							,"",300,""},
			{"POP_CHAW_0_D1M3"							,"",300,""},
			{"POP_CHAW_1_D"								,"",300,""},
			{"POP_CHAW3_D"								,"",300,""},
			{"POP_CHAW3_D2"								,"",300,""},
			{"POP_CHAW3_D3"								,"",300,""},
			{"POP_CHAW3_D4"								,"",300,""},
			{"U_GirlSet3_uniform"						,"",300,""},
			{"A3LHandShirt"								,"",300,""},
			{"U_C_Polo_Mali"							,"",300,""},
			{"A3LPikaShirt"								,"",300,""},
			{"POP_Fracasado"							,"",300,""},
			{"POP_Mano"									,"",300,""},
			{"POP_Mario"								,"",300,""},
			{"Arabian_dress"							,"",300,""},
			{"CUP_U_C_Rocker_01"						,"",300,""},
			{"A3LTigerShirt"							,"",300,""},
			{"POP_BC"									,"",300,""},
			{"POP_OV"									,"",300,""},
			{"POP_RM"									,"",300,""},
			{"POP_Valen"								,"",300,""},
			{"Arabian_dress1"							,"",300,""},   
			{"POP_CHAW_0"								,"",300,""},
			{"POP_CHAW_1"								,"",300,""},
			{"POP_CHAW_2"								,"",300,""},
			{"POP_CHAW_3"								,"",300,""},
			{"POP_CHAW_4"								,"",300,""},
			{"POP_CHAW_5"								,"",300,""},
			{"EF_suit_1"								,"",300,""},
			{"EF_suit_2"								,"",300,""},
			{"EF_suit_3"								,"",300,""},
			{"EF_suit_4"								,"",300,""},
			{"EF_suit_5"								,"",300,""},
			{"EF_suit_6"								,"",300,""},
			{"TRYK_U_B_wh_OD_Rollup_CombatUniform"		,"",300,""},
			{"TRYK_shirts_DENIM_BK"						,"",300,""},
			{"TRYK_shirts_DENIM_od"						,"",300,""},
			{"TRYK_shirts_DENIM_WH"						,"",300,""},
			{"TRYK_shirts_DENIM_ylb_Sleeve"				,"",300,""},
			{"TRYK_shirts_BLK_PAD_BLU3"					,"",300,""},
			{"TRYK_shirts_BLK_PAD_RED2"					,"",300,""},
			{"TRYK_shirts_OD_PAD_YEL"					,"",300,""},
			{"TRYK_U_nohoodPcu_gry"						,"",300,""},
			{"TRYK_T_BLK_PAD"							,"",300,""},
			{"TRYK_T_OD_PAD"							,"",300,""},
			{"TRYK_T_TAN_PAD"							,"",300,""},
			{"TRYK_U_denim_hood_blk"					,"",300,""},
			{"TRYK_T_camo_tan"							,"",300,""},
			{"TRYK_U_B_BLK_T_BG_WH"						,"",300,""},
			{"TRYK_U_B_BLK_T_BK"						,"",300,""},
			{"TRYK_U_B_Denim_T_WH"						,"",300,""},
			{"U_BasicBodyICE123"						,"",300,""},
			{"rds_uniform_Profiteer1"					,"",300,""},
			{"rds_uniform_Profiteer2"					,"",300,""},
			{"rds_uniform_Profiteer3"					,"",300,""},
			{"rds_uniform_Profiteer4"					,"",300,""},
			{"rds_uniform_citizen1"						,"",300,""},
			{"rds_uniform_citizen2"						,"",300,""},
			{"rds_uniform_citizen3"						,"",300,""},
			{"rds_uniform_citizen4"						,"",300,""},
			{"rds_uniform_Woodlander1"					,"",300,""},
			{"rds_uniform_Woodlander2"					,"",300,""},
			{"rds_uniform_Woodlander3"					,"",300,""},
			{"rds_uniform_Woodlander4"					,"",300,""},
			{"rds_uniform_Worker1"						,"",300,""},
			{"rds_uniform_Worker2"						,"",300,""},
			{"rds_uniform_Worker3"						,"",300,""},
			{"rds_uniform_Worker4"						,"",300,""},
			{"rds_uniform_Villager1"					,"",300,""},
			{"rds_uniform_Villager2"					,"",300,""},
			{"rds_uniform_Villager3"					,"",300,""},
			{"rds_uniform_Villager4"					,"",300,""},
			{"TRYK_U_B_PCUGs_gry"						,"",300,""},
			{"TRYK_U_B_PCUGs_OD"						,"",300,""},
			{"TRYK_U_B_wh_blk_Rollup_CombatUniform"		,"",300,""},
			{"TRYK_SUITS_BLK_F"							,"",300,""},
			{"TRYK_SUITS_BR_F"							,"",300,""},
			{"TRYK_U_pad_hood_Cl_blk"					,"",300,""},
			{"TRYK_U_pad_hood_odBK"						,"",300,""},
			{"TRYK_U_B_BLK_Tshirt"						,"",800,""}, 
			{"TRYK_U_B_BLK"								,"",800,""},
			{"A3L_CivShirtDJ"							,"",300,""},
			{"A3L_CivShirtHollister"					,"",300,""},
			{"A3L_CivShirtVolcom"						,"",300,""},
			{"A3L_CivShirtVolcomMonster"				,"",300,""},
			{"A3LCloudShirt"							,"",300,""},
			{"A3LPikaShirt"								,"",300,""},
			{"woman2"									,"",300,""},
			{"woman3"									,"",300,""},
			{"woman4"									,"",300,""},
			{"U_NikosBody"								,"",300,""},
			{"U_IG_Guerilla2_2"							,"",300,""},
			{"U_NikosAgedBody"							,"",300,""},
			{"Arabian_dress1"							,"",300,""},
			{"Arabian_dress2"							,"",300,""},
			{"Arabian_dress4"							,"",300,""},
			{"Arabian_dress_black"						,"",300,""},
			{"Arabian_dress_brown"						,"",300,""},
			{"Arabian_dress_grey"						,"",300,""},
			{"U_ALR_PriestTren_mcam"					,"",300,""},
			{"POP_MarioPOP_Lecuesta"					,"",300,""},
			{"POP_GooglePOP_Sirena"						,"",300,""},
			{"POP_VivirPOP_Metro"						,"",300,""},
			{"POP_RMPOP_Valen"							,"",300,""},
			{"POP_BCPOP_OV"								,"",300,""},
			{"rds_uniform_citizen3"						,"",300,""},
			{"rds_uniform_Profiteer1"					,"",300,""},
			{"rds_uniform_Profiteer2"					,"",300,""},
			{"EF_FEM_3_3"								,"",300,""},
			{"EF_FEM_3_3LPB"							,"",300,""},
			{"EF_FEM_3_3LPBP"							,"",300,""},
			{"EF_FEM_3_3LPBR"							,"",300,""},
			{"EF_FEM_3_3LPBL2"							,"",300,""},
			{"EF_FEM_3_3LPBW2"							,"",300,""},
			{"EF_FEM_3_3LPB3"							,"",300,""},
			{"EF_FEM_3_3LPBP3"							,"",300,""},
			{"EF_FEM_4"									,"",300,""},
			{"EF_FEM_4_2LPBL"							,"",300,""},
			{"EF_FEM_4_2LPB2"							,"",300,""},
			{"EF_FEM_5"									,"",300,""},
			{"EF_FEM_6"									,"",300,""},
			{"EF_FEM_62"								,"",300,""},
			{"EF_FEM_7"									,"",300,""},
			{"EF_FEM_8"									,"",300,""},
			{"EF_FEM_4_72ADR"							,"",300,""},
			{"EF_suit_1"								,"",300,""},
			{"EF_suit_2"								,"",300,""},
			{"EF_suit_3"								,"",300,""},
			{"EF_suit_4"								,"",300,""},
			{"EF_suit_5"								,"",300,""},
			{"EF_suit_6"								,"",300,""},
			{"EF_HMARMY_1"								,"",300,""},
			{"EF_HM_LPB2"								,"",300,""},
			{"EF_HM_LPBL2"								,"",300,""},
			{"EF_HM_LPBW2"								,"",300,""},
			{"EF_FEM_3_5BP"								,"",300,""},
			{"EF_FEM_3_5RC"								,"",300,""},
			{"EF_FEM_3_5VP"								,"",300,""},
			{"EF_FEM_3_52VP"							,"",300,""},
			{"EF_FEM_3_76"								,"",300,""},
			{"EF_FEM_3_7R"								,"",300,""},
			{"EF_FEM_3_73R2"							,"",300,""},
			{"EF_FEM_4_4BP"								,"",300,""},
			{"EF_FEM_4_4RC"								,"",300,""},
			{"EF_FEM_4_4VP"								,"",300,""},
			{"EF_FEM_4_42RC"							,"",300,""},
			{"EF_FEM_4_74"								,"",300,""},
			{"EF_FEM_4_74R"								,"",300,""},
			{"EF_MX1"									,"",300,""},
			{"EF_M_jkt1"								,"",300,""},
			{"EF_M_jkt1_2"								,"",300,""},
			{"EF_M_jkt2"								,"",300,""},
			{"EF_M_jkt22"								,"",300,""},
			{"EF_M_jkt2_2"								,"",300,""},
			{"EF_M_jkt2_22"								,"",300,""},
			{"EF_M_jkt2_3"								,"",300,""},
			{"EF_M_jkt2_32"								,"",300,""},
			{"EF_M_jkt2_4"								,"",300,""},
			{"EF_M_jkt3mnw"								,"",300,""},
			{"EF_M_jkt32_2"								,"",300,""},
			{"EF_M_jkt4"								,"",300,""},
			{"EF_M_jkt42"								,"",300,""},
			{"POP_CHAW4_D"								,"",300,""},
			{"POP_CHAW4_D1"								,"",300,""},
			{"POP_CHAW4_D1"								,"",300,""},
			{"POP_CHAW4_D2"								,"",300,""},
			{"POP_CHAW4_D4"								,"",300,""},
			{"POP_CHAW4_D5"								,"",300,""},
			{"POP_CHAW4_D6"								,"",300,""},
			{"POP_CHAW4_D7"								,"",300,""},
			{"POP_CHAW5_motero"							,"",300,""},
			{"POP_CHAW5_D"								,"",300,""},
			{"POP_CHAW_0_D"								,"",300,""},
			{"POP_CHAW_0_D1M"							,"",300,""},
			{"POP_CHAW_0_D1M2"							,"",300,""},
			{"POP_CHAW3_D"								,"",300,""},
			{"POP_CHAW3_D1"								,"",300,""},
			{"POP_CHAW3_D2"								,"",300,""},
			{"POP_CHAW3_D5"								,"",300,""},
			{"U_Afghan03NH"								,"",300,""},
			{"TRYK_U_B_wh_blk_Rollup_CombatUniform"		,"",300,""},
			{"TRYK_U_B_BLK_T_WH"						,"",300,""},
			{"TRYK_U_B_BLK_T_BK"						,"",300,""},
			{"TRYK_U_B_RED_T_BR"						,"",300,""},
			{"TRYK_U_denim_jersey_blu"					,"",300,""},
			{"TRYK_shirts_PAD"							,"",300,""},
			{"TRYK_shirts_TAN_PAD"						,"",300,""},
			{"TRYK_shirts_BLK_PAD"						,"",300,""},
			{"TRYK_shirts_BLK_PAD_BLW"					,"",300,""},
			{"TRYK_shirts_BLK_PAD_RED2"					,"",300,""},
			{"TRYK_shirts_BLK_PAD_BLU3"					,"",300,""},
			{"TRYK_shirts_BLK_PAD_BL"					,"",300,""},
			{"TRYK_U_taki_wh"							,"",300,""},
			{"TRYK_U_taki_BL"							,"",300,""},
			{"TRYK_SUITS_BLK_F"							,"",300,""},
			{"TRYK_U_B_PCUHsW2"							,"",300,""},
			{"TRYK_U_B_PCUHsW3"							,"",300,""},
			{"TRYK_U_B_PCUHsW4"							,"",300,""},
			{"TRYK_U_B_PCUHsW5"							,"",300,""},
			{"TRYK_U_B_PCUHsW6"							,"",300,""},
			{"TRYK_U_B_PCUHsW7"							,"",300,""},
			{"TRYK_U_B_PCUHsW8"							,"",300,""},
			{"TRYK_U_B_PCUHsW9"							,"",300,""},
			{"U_I_C_Soldier_Bandit_2_F"					,"",300,""},
			{"U_I_C_Soldier_Bandit_5_F"					,"",300,""},
			{"A3L_Badoodlenoodleshirt"					,"",300,""},
			{"A3L_CivShirtOhBoy"						,"",300,""},
			{"A3L_CivShirtRelationships"				,"",300,""},
			{"mgsr_sneaksuit"							,"",300,""}
			
			
			
        };
        headgear[] = {
            {"NONE"							,$STR_C_Remove_headgear,0,""},
			{"H_KermitMask"				,"",150,""}, 
			{"H_HulkMask"			,"",150,""}, 
			{"H_GingerbreadMask"		,"",150,""},
			{"H_GrantMask"				,"",150,""},
			{"H_GuyFawkesMask"				,"",150,""},
			{"H_SpidermanMask"			,"",150,""},
			{"pop_gorra_bermu"				,"",150,""}, 
			{"pop_gorra_gustavo2"			,"",150,""}, 
			{"pop_gorra_adidaswoman"		,"",150,""},
			{"pop_gorra_batman"				,"",150,""},
			{"pop_gorra_ballas"				,"",150,""},
			{"pop_gorra_creeper"			,"",150,""},
			{"pop_gorra_deadpool"			,"",150,""},
			{"pop_gorra_grobe"				,"",150,""},
			{"pop_gorra_metropolis"			,"",150,""},
			{"pop_gorra_nike"				,"",150,""},
			{"pop_gorra_gustavo"			,"",150,""},
			{"pop_gorra_ss"					,"",150,""},
			{"pop_gorra_anto"				,"",150,""},
			{"gorro_rojo"					,"",150,""},
			{"gorro_azul"					,"",150,""},
			{"gorro_violeta"				,"",150,""},
			{"gorro_verde"					,"",150,""},
			{"pop_mascara_hannibal"			,"",150,""},		
			{"Payday_GeneralO"				,"",150,""},
			{"pop_palestino"				,"",150,""},
			{"Kio_Pirate_Hat"				,"",150,""},
			{"kio_skl_msk_blood"			,"",150,""},
			{"kio_skl_msk_fire"				,"",150,""},
			{"kio_skl_msk_weed"				,"",150,""},
			{"pop_corvus"					,"",150,""},
			{"Masque_forceAlpha"			,"",150,""},
			{"Masque_Metalhead"				,"",150,""},
			{"Casque_Moto"					,"",150,""},
			{"Kio_Afro_Hat"					,"",150,""},		  
			{"pop_mascara"					,"",150,""},		  
			{"pop_mascara_2"				,"",150,""},		  
			{"pop_mascara_3"				,"",150,""},		  
			{"pop_mascara_4"				,"",150,""},		  
			{"pop_mascara_5"				,"",150,""},		  
			{"pop_mascara_6"				,"",150,""},		  
			{"pop_mascara_7"				,"",150,""},		  
			{"pop_mascara_8"				,"",150,""},		  
			{"pop_mascara_9"				,"",150,""},		  
			{"pop_mascara_10"				,"",150,""},		  
			{"pop_mascara_11"				,"",150,""},		  
			{"pop_mascara_12"				,"",150,""},		  
			{"pop_mascara_13"				,"",150,""},		  
			{"pop_mascara_14"				,"",150,""},		  
			{"pop_mascara_15"				,"",150,""},		  
			{"pop_mascara_16"				,"",150,""},		  
			{"pop_mascara_17"				,"",150,""},		  
			{"pop_mascara_18"				,"",150,""},		  
			{"pop_mascara_19"				,"",150,""},		  
			{"pop_mascara_20"				,"",150,""},		  
			{"pop_mascara_21"				,"",150,""},		  
			{"pop_mascara_22"				,"",150,""},		  
			{"pop_mascara_23"				,"",150,""},		  
			{"pop_mascara_24"				,"",150,""},		  
			{"pop_mascara_25"				,"",150,""},		  
			{"pop_mascara_26"				,"",150,""},
			{"pop_robocop"					,"",150,""},
			{"kio_skl_msk_red"				,"",150,""},
			{"kio_skl_msk_grn"				,"",150,""},
			{"kio_skl_msk_fire"				,"",150,""},
			{"kio_skl_msk_weed"				,"",150,""},
			{"kio_skl_msk_frost"			,"",150,""},
			{"kio_skl_msk_pun"				,"",150,""},
			{"kio_skl_msk_adc"				,"",150,""},
			{"kio_skl_msk_blood"			,"",150,""},
			{"kio_skl_msk_redranger"		,"",150,""},
			{"kio_skl_msk_UK"				,"",150,""},
			{"kio_skl_msk_US"				,"",150,""},
			{"kio_skl_msk_black"			,"",150,""},
			{"kio_skl_msk_can"				,"",150,""},
			{"kio_skl_msk_german"			,"",150,""},
			{"kio_skl_msk_GOW"				,"",150,""},
			{"kio_skl_msk_grey"				,"",150,""},
			{"kio_skl_msk_irish"			,"",150,""},
			{"kio_skl_msk_nirish"			,"",150,""},
			{"kio_skl_msk_o"				,"",150,""},
			{"kio_skl_msk_p"				,"",150,""},
			{"kio_skl_msk_scot"				,"",150,""},
			{"kio_skl_msk_fran"				,"",150,""},
			{"rds_police_cap"				,"",150,""},
			{"rds_Woodlander_cap4"			,"",150,""},
			{"rds_Woodlander_cap1"			,"",150,""},
			{"rds_Woodlander_cap3"			,"",150,""},
			{"rds_Woodlander_cap2"			,"",150,""},
			{"rds_worker_cap1"				,"",150,""},
			{"rds_worker_cap2"				,"",150,""},
			{"rds_worker_cap3"				,"",150,""},
			{"rds_worker_cap4"				,"",150,""},
			{"Masque_Mempo"					,"",150,""},
			{"Masque_Metalhead"				,"",150,""},
			{"Masque_Mark"					,"",150,""},
			{"Masque_Orc"					,"",150,""},
			{"Masque_Lion"					,"",150,""},
			{"Masque_archNemesis"			,"",150,""},
			{"Masque_Optimiste"				,"",150,""},
			{"Masque_forceAlpha"			,"",150,""},
			{"pop_gorra_gustavo2"			,"",150,""},
			{"ALE_H_Calot"					,"",500,""},
			{"ALE_H_NewEra_Black"			,"",500,""},
			{"ALE_H_NewEra_Cyan"			,"",500,""},
			{"ALE_H_NewEra_Superman"		,"",500,""},
			{"ALE_H_NewEra_Rouge"			,"",500,""},
			{"ALE_H_NewEra_Monster"			,"",500,""},
			{"ALE_H_Cowboy_Brown"			,"",500,""},
			{"ALE_H_Cowboy_White"			,"",500,""},
			{"ALE_H_NewEra_Lakers"			,"",500,""},
			{"ALE_H_NewEra_Redsox"			,"",500,""},
			{"TRYK_R_CAP_BLK"				,"",500,""},
			{"TRYK_r_cap_tan_Glasses"		,"",500,""},
			{"TRYK_H_headsetcap_Glasses"	,"",500,""},
			{"TRYK_H_headsetcap_od_Glasses"	,"",500,""},
			{"Kio_Afro_Hat"					,"",500,""},
			{"TRYK_Kio_Balaclava"			,"",500,""},
			{"Kio_Capital_Hat"				,"",500,""},
			{"Kio_Hat"						,"",500,""},
			{"Kio_Pirate_Hat"				,"",500,""},
			{"kio_skl_msk"					,"",500,""},
			{"kio_skl_msk_red"				,"",500,""},
			{"kio_skl_msk_fire"				,"",500,""},
			{"kio_skl_msk_weed"				,"",500,""},
			{"kio_skl_msk_frost"			,"",500,""},
			{"kio_skl_msk_pun"				,"",500,""},
			{"kio_skl_msk_adc"				,"",500,""},
			{"kio_skl_msk_blood"			,"",500,""},
			{"kio_skl_msk_redranger"		,"",500,""},
			{"kio_skl_msk_UK"				,"",500,""},
			{"kio_skl_msk_US"				,"",500,""},
			{"kio_skl_msk_can"				,"",500,""},
			{"kio_skl_msk_german"			,"",500,""},
			{"kio_skl_msk_grey"				,"",500,""},
			{"kio_skl_msk_irish"			,"",500,""},
			{"kio_skl_msk_nirish"			,"",500,""},
			{"kio_skl_msk_o"				,"",500,""},
			{"kio_skl_msk_p"				,"",500,""},
			{"kio_skl_msk_scot"				,"",500,""},
			{"kio_skl_msk_fran"				,"",500,""},
			{"kio_vfv_mask"					,"",500,""},
			{"pop_gorra_negra"				,"",500,""},
			{"pop_gorra_cyan"				,"",500,""},
			{"pop_gorra_adidaswoman"		,"",500,""},
			{"pop_gorra_batman"				,"",500,""},
			{"pop_gorra_ballas"				,"",500,""},
			{"pop_gorra_creeper"			,"",500,""},
			{"pop_gorra_deadpool"			,"",500,""},
			{"pop_gorra_grobe"				,"",500,""},
			{"pop_gorra_metropolis"			,"",500,""},
			{"pop_gorra_gustavo"			,"",500,""},
			{"pop_gorra_ss"					,"",500,""},
			{"pop_gorra_anto"				,"",500,""},
			{"pop_corvus"					,"",500,""},
			{"POP_Cowboy_hat"				,"",500,""},
			{"pop_mascara"					,"",500,""},
			{"pop_mascara_2"				,"",500,""},
			{"pop_mascara_4"				,"",500,""},
			{"pop_mascara_5"				,"",500,""},
			{"pop_mascara_6"				,"",500,""},
			{"pop_mascara_7"				,"",500,""},
			{"pop_mascara_8"				,"",500,""},
			{"pop_mascara_9"				,"",500,""},
			{"pop_mascara_10"				,"",500,""},
			{"pop_mascara_11"				,"",500,""},
			{"pop_mascara_12"				,"",500,""},
			{"pop_mascara_13"				,"",500,""},
			{"pop_mascara_14"				,"",500,""},
			{"pop_mascara_15"				,"",500,""},
			{"pop_mascara_16"				,"",500,""},
			{"pop_mascara_17"				,"",500,""},
			{"pop_mascara_18"				,"",500,""},
			{"pop_mascara_19"				,"",500,""},
			{"pop_mascara_20"				,"",500,""},
			{"pop_mascara_21"				,"",500,""},
			{"pop_mascara_22"				,"",500,""},
			{"pop_mascara_23"				,"",500,""},
			{"pop_mascara_24"				,"",500,""},
			{"pop_mascara_25"				,"",500,""},
			{"pop_mascara_26"				,"",500,""},
			{"pop_mascara_hannibal"			,"",500,""},
			{"pop_mascara_c"				,"",500,""},
			{"POP_Mohawk"					,"",500,""},
			{"POP_Tophat"					,"",500,""},
			{"TRYK_UA_CAP"					,"",500,""},
			{"TRYK_UA_CAP2R"				,"",500,""},
			{"TAC_W_ghillie_O1"				,"",500,""},
			{"TRYK_H_DELTAHELM_NV"			,"",500,""},
			{"TRYK_H_wig"					,"",500,""},
			{"TRYK_H_woolhat_CW"			,"",500,""},
			{"H_Cap_brn_SPECOPS"			,"",500,""},
			{"H_Cap_surfer"					,"",500,""},
			{"H_Bandanna_surfer_blk"		,"",500,""},
			{"H_Bandanna_camo"				,"",500,""},
			{"H_Beret_blk"					,"",500,""},
			{"H_RacingHelmet_4_F"			,"",500,""},
			{"H_RacingHelmet_1_green_F"		,"",500,""},
			{"H_RacingHelmet_1_orange_F"	,"",500,""},
			{"arabian_Hat1"					,"",500,""},
			{"arabian_Hat2"					,"",500,""},
			{"Masque_Alien1"				,"",500,""},
			{"Masque_Anonymous"				,"",500,""},
			{"Masque_Chains"				,"",500,""},
			{"Payday_GeneralO"				,"",500,""},
			{"Casque_Moto"					,"",500,""},
			{"Masque_Clinton"				,"",500,""},
			{"Masque_speedRunner"			,"",500,""},
			{"Masque_Unic"					,"",500,""},
			{"Masque_Aubrey"				,"",500,""},
			{"Masque_Bonnie"				,"",500,""},
			{"Masque_archNemesis"			,"",500,""},
			{"Masque_Arnold"				,"",500,""},
			{"Masque_Chuck"					,"",500,""},
			{"Masque_Clover"				,"",500,""},
			{"Masque_Fish"					,"",500,""},
			{"Masque_Hockey"				,"",500,""},
			{"Masque_Metalhead"				,"",500,""},
			{"Masque_Smiley"				,"",500,""},
			{"Masque_Santa"					,"",500,""},
			{"Masque_Optimiste"				,"",500,""},
			{"Masque_forceAlpha"			,"",500,""},
			{"Masque_Incendiaire"			,"",500,""},
			{"Masque_Dallas"				,"",500,""},
			{"rds_police_cap"				,"",500,""},
			{"rds_worker_cap4"				,"",500,""},
			{"rds_Villager_cap2"			,"",500,""},
			{"rds_Villager_cap3"			,"",500,""},
			{"rds_Profiteer_cap1"			,"",500,""},
			{"rds_Profiteer_cap2"			,"",500,""},
			{"H_ALFR_Heist_Mask_1"			,"",500,""},
			{"H_ALFR_Heist_Mask_2"			,"",500,""},
			{"H_ALFR_Heist_Mask_3"			,"",500,""},
			{"H_ALFR_Heist_Mask_4"			,"",500,""},
			{"H_ALFR_Heist_Mask_5"			,"",500,""},
			{"H_ALFR_Heist_Mask_6"			,"",500,""},
			{"H_ALFR_Heist_Mask_7"			,"",500,""},
			{"H_ALFR_Sheep_Mask"			,"",500,""},
			{"EF_HAT_BK"					,"",500,""},
			{"EF_HAT_PI"					,"",500,""},
			{"EF_FHAT_BW"					,"",500,""},
			{"EF_FSMGV"						,"",500,""},
			{"EF_Fcap_B"					,"",500,""},
			{"EF_wig_DHB"					,"",500,""},
			{"EF_wig_VSB"					,"",500,""},
			{"EF_wig_VSSV"					,"",500,""},
			{"EF_wig_VSBW"					,"",500,""},
			{"EF_wig_VSBL"					,"",500,""},
			{"EF_wig_VSBLE"					,"",500,""},
			{"EF_wig_SB"					,"",500,""},
			{"EF_wig_SBLE"					,"",500,""},
			{"EF_Long_wig_B"				,"",500,""},
			{"EF_Punk_wig_SB"				,"",500,""},
			{"EF_Punk_wig_SBW"				,"",500,""},
			{"EF_Punk_wig_SB3"				,"",500,""},
			{"EF_Punk_wig_B"				,"",500,""},
			{"gorro_rojo"					,"",500,""},
			{"gorro_azul"					,"",500,""},
			{"gorro_verde"					,"",500,""},
			{"H_Helmet_Skate"				,"",500,""},
			{"mgsr_eyepatch"				,"",500,""},
			{"mgsr_headbag"					,"",500,""},
			{"EF_HAT_BW"					,"",500,""}
		    };
        goggles[] = {
            {"NONE"							,$STR_C_Remove_goggles,0,""},
			{"TRYK_kio_balaclavas"			,"",60,""},	
			{"Payday_Cagoule"				,"",60,""},	
			{"Masque_Solitaire"				,"",60,""},	
			{"mgsr_eyepatch_goggles"		,"",60,""},
			{"G_Spectacles_Tinted"			,"",500,""},
			{"G_Shades_Black"				,"",500,""},
			{"G_Shades_Green"				,"",500,""},
			{"G_Shades_Red"					,"",500,""},
			{"G_Squares"					,"",500,""},
			{"G_Sport_Blackyellow"			,"",500,""},
			{"G_Sport_Red"					,"",500,""},
			{"G_Aviator"					,"",500,""},
			{"G_Bandanna_blk"				,"",500,""},
			{"G_Bandanna_beast"				,"",500,""},
			{"G_Bandanna_shades"			,"",500,""},
			{"G_Sport_Blackred"				,"",500,""},
			{"Masque_Solitaire"				,"",500,""},
			{"Balaclava_Blk_Warthog"		,"",500,""},
			{"AJ_Mask_Standard"				,"",500,""},
			{"AJ_Mask_Teamlead"				,"",500,""},
			{"EF_SC_C1"						,"",500,""},
			{"EF_SC_CY1"					,"",500,""},
			{"EF_SC_P1"						,"",500,""},
			{"EF_SC_W2"						,"",500,""},
			{"EF_FG1"						,"",500,""},
			{"EF_FG21"						,"",500,""},
			{"EF_RG1"						,"",500,""},
			{"EF_AC1"						,"",500,""},
			{"EF_AC2"						,"",500,""},
			{"EF_AC3"						,"",500,""},
			{"EF_ACC1"						,"",500,""},
			{"EF_ACC2"						,"",500,""},
			{"EF_ACC3"						,"",500,""},
			{"EF_ACC4"						,"",500,""},
			{"TRYK_Beard_BL"				,"",500,""},
			{"TRYK_Beard_BK"				,"",500,""},
			{"TRYK_Beard_BK2"				,"",500,""},
			{"RYK_Beard_BK3"				,"",500,""},
			{"TRYK_Beard_BK4"				,"",500,""},
			{"TRYK_SBeard_BW"				,"",500,""},
			{"TRYK_SBeard_BK"				,"",500,""},
			{"TRYK_SBeard2"					,"",500,""},
			{"TRYK_SBeard_BL2"				,"",500,""},
			{"TRYK_SBeard_BW2"				,"",500,""},
			{"TRYK_SBeard_BK2"				,"",500,""},
			{"TRYK_SBeard_Gr2"				,"",500,""},
			{"TRYK_SBeard_BL3"				,"",500,""},
			{"TRYK_SBeard_BW3"				,"",500,""},
			{"TRYK_SBeard_BK3"				,"",500,""},
			{"TRYK_SBeard_BW4"				,"",500,""},
			{"TRYK_SBeard_BK4"				,"",500,""},
			{"TRYK_SBeard_Gr4"				,"",500,""},
			{"TRYK_SBeard_BK6"				,"",500,""},
			{"G_Balaclava_TI_tna_F"			,"",500,""},
			{"immersion_pops_pop0"			,"",500,""},
			{"mgsr_eyepatch_goggles"		,"",500,""},
			{"murshun_cigs_cig1"			,"",500,""},
			{"murshun_cigs_cig2"			,"",500,""},
			{"murshun_cigs_cig3"			,"",500,""},
			{"murshun_cigs_cig4"			,"",500,""}
			
        };
        vests[] = {
            {"NONE"							,$STR_C_Remove_vests,0,""},
			{"pop_chaleco_cmd_cmd_74"		,"",250,""}, 
			{"pop_chaleco_cmd_cmd_76"		,"",250,""}, 
			{"pop_chaleco_cmd_cmd_77"		,"",250,""},
			{"pop_chaleco_cmd_cmd_73"		,"",250,""},
			{"pop_chaleco_cmd_cmd_71"		,"",250,""},
			{"pop_chaleco_cmd_cmd_72"		,"",250,""},
			{"pop_chaleco_cmd_cmd_11"		,"",250,""},
			{"pop_chaleco_cmd_cmd_37"		,"",250,""},
			{"pop_chaleco_cmd_cmd_16"		,"",250,""},
			{"pop_chaleco_cmd_cmd_20"		,"",250,""},
			{"pop_chaleco_cmd_cmd_50"		,"",250,""},
			{"pop_chaleco_cmd_cmd_53"		,"",250,""},
			{"pop_chaleco_cmd_cmd_57"		,"",250,""},
			{"pop_chaleco_cmd_cmd_23"		,"",250,""},
			{"pop_chaleco_cmd_cmd_31"		,"",250,""},
			{"pop_chaleco_cmd_cmd_32"		,"",250,""},
			{"pop_chaleco_cmd_cmd_4"		,"",250,""},
			{"pop_chaleco_cmd_cmd_9"		,"",250,""},
			{"pop_moteros_cha_1"			,"",250,""},
			{"pop_moteros_cha_2"			,"",250,""},
			{"pop_moteros_cha_3"			,"",250,""},
			{"pop_moteros_cha_4"			,"",250,""},
			{"pop_moteros_cha_5"			,"",250,""},
			{"pop_moteros_cha_6"			,"",250,""},
			{"pop_moteros_cha_7"			,"",250,""},
			{"pop_moteros_cha_8"			,"",250,""},
			{"pop_moteros_cha_9"			,"",250,""},
			{"pop_moteros_cha_10"			,"",250,""},
			{"pop_moteros_cha_11"			,"",250,""},
			{"pop_moteros_cha_12"			,"",250,""},
			{"pop_moteros_cha_13"			,"",250,""},
			{"pop_moteros_cha_14"			,"",250,""},
			{"pop_moteros_cha_15"			,"",250,""},
			{"pop_moteros_cha_16"			,"",250,""},
			{"pop_moteros_cha_17"			,"",250,""},
			{"pop_moteros_cha_18"			,"",250,""},
			{"pop_moteros_cha_19"			,"",250,""},
			{"pop_moteros_cha_20"			,"",250,""},
			{"pop_moteros_cha_21"			,"",250,""},
			{"pop_moteros_cha_22"			,"",250,""},
			{"pop_moteros_cha_23"			,"",250,""},
			{"TAC_V_Sheriff_BA_TB"			,"",250,""},
			{"TAC_PBDFG2C_B_1"				,"",250,""},
			{"TAC_V_Sheriff_BA_TB2"			,"",250,""},
			{"TAC_PBDFG2CPL_BK"				,"",250,""},
			{"TRYK_V_Bulletproof_BLK"		,"",500,""},
			{"TRYK_V_Bulletproof_BL"		,"",500,""},
			{"V_HarnessO_brn"				,"",500,""},
			{"pop_chaleco_cmd_cmd_1"		,"",500,""},
			{"pop_chaleco_cmd_cmd_2"		,"",500,""},
			{"pop_chaleco_cmd_cmd_3"		,"",500,""},
			{"pop_chaleco_cmd_cmd_4"		,"",500,""},
			{"pop_chaleco_cmd_cmd_5"		,"",500,""},
			{"pop_chaleco_cmd_cmd_6"		,"",500,""},
			{"pop_chaleco_cmd_cmd_7"		,"",500,""},
			{"pop_chaleco_cmd_cmd_8"		,"",500,""},
			{"pop_chaleco_cmd_cmd_9"		,"",500,""},
			{"pop_chaleco_cmd_cmd_10"		,"",500,""},
			{"pop_chaleco_cmd_cmd_11"		,"",500,""},
			{"pop_chaleco_cmd_cmd_12"		,"",500,""},
			{"pop_chaleco_cmd_cmd_13"		,"",500,""},
			{"pop_chaleco_cmd_cmd_14"		,"",500,""},
			{"pop_chaleco_cmd_cmd_15"		,"",500,""},
			{"pop_chaleco_cmd_cmd_16"		,"",500,""},
			{"pop_chaleco_cmd_cmd_17"		,"",500,""},
			{"pop_chaleco_cmd_cmd_18"		,"",500,""},
			{"pop_chaleco_cmd_cmd_19"		,"",500,""},
			{"pop_chaleco_cmd_cmd_20"		,"",500,""},
			{"pop_chaleco_cmd_cmd_21"		,"",500,""},
			{"pop_chaleco_cmd_cmd_22"		,"",500,""},
			{"pop_chaleco_cmd_cmd_23"		,"",500,""},
			{"pop_chaleco_cmd_cmd_24"		,"",500,""},
			{"pop_chaleco_cmd_cmd_25"		,"",500,""},
			{"pop_chaleco_cmd_cmd_26"		,"",500,""},
			{"pop_chaleco_cmd_cmd_27"		,"",500,""},
			{"pop_chaleco_cmd_cmd_29"		,"",500,""},
			{"pop_chaleco_cmd_cmd_30"		,"",500,""},
			{"pop_chaleco_cmd_cmd_31"		,"",500,""},
			{"pop_chaleco_cmd_cmd_32"		,"",500,""},
			{"pop_chaleco_cmd_cmd_33"		,"",500,""},
			{"pop_chaleco_cmd_cmd_35"		,"",500,""},
			{"pop_chaleco_cmd_cmd_37"		,"",500,""},
			{"pop_chaleco_cmd_cmd_38"		,"",500,""},
			{"pop_chaleco_cmd_cmd_39"		,"",500,""},
			{"pop_chaleco_cmd_cmd_45"		,"",500,""},
			{"pop_chaleco_cmd_cmd_47"		,"",500,""},
			{"pop_chaleco_cmd_cmd_50"		,"",500,""},
			{"pop_chaleco_cmd_cmd_51"		,"",500,""},
			{"pop_chaleco_cmd_cmd_52"		,"",500,""},
			{"pop_chaleco_cmd_cmd_53"		,"",500,""},
			{"pop_chaleco_cmd_cmd_54"		,"",500,""},
			{"pop_chaleco_cmd_cmd_55"		,"",500,""},
			{"pop_chaleco_cmd_cmd_56"		,"",500,""},
			{"pop_chaleco_cmd_cmd_57"		,"",500,""},
			{"pop_chaleco_cmd_cmd_58"		,"",500,""},
			{"pop_chaleco_cmd_cmd_59"		,"",500,""},
			{"pop_chaleco_cmd_cmd_60"		,"",500,""},
			{"pop_chaleco_cmd_cmd_61"		,"",500,""},
			{"pop_chaleco_cmd_cmd_62"		,"",500,""},
			{"pop_chaleco_cmd_cmd_63"		,"",500,""},
			{"pop_chaleco_cmd_cmd_65"		,"",500,""},
			{"pop_chaleco_cmd_cmd_69"		,"",500,""},
			{"pop_chaleco_cmd_cmd_70"		,"",500,""},
			{"pop_chaleco_cmd_cmd_71"		,"",500,""},
			{"pop_chaleco_cmd_cmd_72"		,"",500,""},
			{"pop_chaleco_cmd_cmd_73"		,"",500,""},
			{"pop_chaleco_cmd_cmd_74"		,"",500,""},
			{"pop_chaleco_cmd_cmd_75"		,"",500,""},
			{"pop_chaleco_cmd_cmd_76"		,"",500,""},
			{"pop_chaleco_cmd_cmd_77"		,"",500,""},
			{"pop_moteros_cha_1"			,"",500,""},
			{"pop_moteros_cha_2"			,"",500,""},
			{"pop_moteros_cha_3"			,"",500,""},
			{"pop_moteros_cha_4"			,"",500,""},
			{"pop_moteros_cha_5"			,"",500,""},
			{"pop_moteros_cha_6"			,"",500,""},
			{"pop_moteros_cha_7"			,"",500,""},
			{"pop_moteros_cha_8"			,"",500,""},
			{"pop_moteros_cha_9"			,"",500,""},
			{"pop_moteros_cha_10"			,"",500,""},
			{"pop_moteros_cha_11"			,"",500,""},
			{"pop_moteros_cha_12"			,"",500,""},
			{"pop_moteros_cha_13"			,"",500,""},
			{"pop_moteros_cha_14"			,"",500,""},
			{"pop_moteros_cha_15"			,"",500,""},
			{"pop_moteros_cha_16"			,"",500,""},
			{"pop_moteros_cha_17"			,"",500,""},
			{"pop_moteros_cha_18"			,"",500,""},
			{"pop_moteros_cha_19"			,"",500,""},
			{"pop_moteros_cha_20"			,"",500,""},
			{"pop_moteros_cha_21"			,"",500,""},
			{"pop_moteros_cha_22"			,"",500,""},
			{"pop_moteros_cha_23"			,"",500,""},
			{"EF_MTK_Belt1"					,"",500,""},
			{"TAC_PBDFG2_B_1"				,"",500,""},
			{"TAC_PBDFG2_RG_1"				,"",500,""},
			{"TAC_PBDFG2_CY_1"				,"",500,""},
			{"TAC_PBDFG2C_B_1"				,"",500,""},
			{"TAC_PBDFG2C_RG_1"				,"",500,""},
			{"TRYK_V_harnes_TAN_L"			,"",500,""},
			{"TAC_Jvest_B"					,"",500,""},
			{"TAC_Jvest_GR"					,"",500,""},
			{"TAC_Jvest_U"					,"",500,""},
			{"TAC_Jvest_TN"					,"",500,""},
			{"mgsr_poncho_wet_vest"			,"",500,""},
			{"mgsr_poncho_dry_vest"			,"",500,""}
        };
        backpacks[] = {
            {"NONE"							,$STR_C_Remove_backpacks,0,""},
			{"B_AssaultPack_cbr"			,"",250,""},
		    {"B_AssaultPack_blk"			,"",250,""},
		    {"B_FieldPack_cbr"				,"",250,""},
		    {"mochila_pequena"				,"",250,""},
		    {"mochila_grande"				,"",300,""},
		    {"A3L_BergenMurica"				,"",250,""},
		    {"B_Carryall_cbr"				,"",250,""}
        };
    };
};

