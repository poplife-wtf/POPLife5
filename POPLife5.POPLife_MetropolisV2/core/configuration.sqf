#include "..\script_macros.hpp"
/*
    File: configuration.sqf
    Author:

    Description:
    Master Life Configuration File
    This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = objNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = objNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
tawvd_addon_disable = true;
life_god = false;
life_frozen = false;
life_save_gear = [];
life_container_activeObj = objNull;
life_disable_getIn = false;
life_disable_getOut = false;
life_admin_debug = false;
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];
life_civ_position = [];
life_markers = false;
life_canpay_bail = true;
camaraHud = false;
estadoHud = true;
modoCombate = false;
apartamentoNo = 0;
/* AxE Taxis !*/
axe_TaxiLlamado = false;
axe_TaxiTrabajando = false;
//Multiplicador Descuento Donadores - cambiar a 0.7
Desc = 1;
granjaActual = objNull;
life_fadeSound = false;
Vision_distancia = 500;
pop_mecanico = false;
temporadaDcaza = false;
granjaNegocio = false;
roboApto = 0;
BUS_Conductores = [];
life_in_gang = false;
casaDeMafia = objNull;

loop_paga_granja = false;
loop_paga_negocio = false;
tiempoPagaGranja = 1;
tiempoPagaNegocio = 1;
mercancia_rosario_tomada = 0;
life_drug_level = 0;
life_alcohol_level = 0;
life_used_drug = [0,0,0,0];
life_smoking = false;
life_drug_withdrawl = false;
life_cocaine_effect = 0;
life_heroin_effect = 0;
life_meth_effect = 0;
life_crank_effect = 0;
life_addiction = [0,0,0,0];

//Settings
life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast",true];
life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = profileNamespace getVariable ["life_viewDistanceFoot",1250];
life_settings_viewDistanceCar = profileNamespace getVariable ["life_viewDistanceCar",1250];
life_settings_viewDistanceAir = profileNamespace getVariable ["life_viewDistanceAir",1250];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_is_alive = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
pop_din = 0;
comfort = 0;

life_istazed = false;
life_isknocked = false;
life_vehicles = [];

inRace = false;
life_racers = [];
raceDone = false;
cinturon = false;
apostado = false;
objetos_prohibidos = ["cup_hgun_ballisticshield_armed","cup_hgun_microuzi","cup_smg_mp5a5","hgun_pdw2000_f","cup_srifle_vssvintorez","cup_arifle_aks74u","cup_smg_bizon","cup_smg_evo","smg_02_f","arifle_sdar_f","cup_srifle_vssvintorez","cup_arifle_cz805_a2","arifle_katiba_c_f","arifle_mxc_black_f","cup_sgun_m1014","cup_sgun_saiga12k","cup_srifle_cz550","cup_srifle_m40a3","cup_arifle_m4a1_black","cup_arifle_mk16_std","cup_arifle_fnfal","cup_arifle_m16a4_base","cup_launch_rpg7v","cup_arifle_ak47","cup_arifle_akm","cup_srifle_mk12spr","cup_arifle_g36c","cup_hgun_ballisticshield_armed","cup_arifle_g36a","cup_arifle_g36k",
"rh_muzi","r3f_mp5a5","c1987_mp7","c1987_mp7_ucp","cl987_mp7","c1987_mp7_folded2","c1987_mp7_nwu","ag_mp9_peq","ag_mp9_wcam","pop_thomson","hlc_smg_mp510","rh_sbr9","hlc_rifle_ak12","hlc_rifle_aek971worn","rh_m4_ris_m","r3f_famas_surb_hg","r3f_famas_g2","rh_hk416c","rh_hk416s","rh_m4m","rh_m4sbr","rh_m4sbr_b","rh_m4sbr_g","rh_m4_moe","rh_m4_des","rh_m4_tg","rh_m4_wdl","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_aku12","r3f_hk416m_hg_des","rh_m16a4","rh_m4","mochila_grande", "hlc_rifle_bcmjack"];
comprando = true;
jugando = false;
//modo Combate on-off
modoCombate = false;
//mensajes
mensaje = true;
//DNI and Badge
showing_documentation = false;
//Previsualización de Coches
Life_Preview_3D_Vehicle_cam = objNull;
Life_Preview_3D_Vehicle_object = objNull;
//ruleta
axe_ruleta_apuestas = [];
axe_apuesta_actual = 0;
fudra_permitido = false;
fudra_activado = false;
pop_mecanico = false;
coche_gps = objNull;
detective = false;
cavando = false;
efsa = false;
multa_cobrada = false;
axe_checodupeo = false;
axe_cargadupeo = 0;
movil_hc = false;
axe_itemCreado = false;
axe_itemPuesto = false;
sincronizo = true;
terroristasEA = [];
AccionesEsposado = [];
BOMBATERMINADA = true;
enturnoBus = false;

listaCasas = [
    "Land_i_House_Big_02_V1_F",
	"Land_i_House_Big_02_V2_F",
	"Land_i_House_Big_02_V3_F",
	"Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V2_F",
	"Land_i_House_Big_01_V3_F",
	"Land_i_House_Small_01_V1_F",
	"Land_i_House_Small_01_V2_F",
	"Land_i_House_Small_01_V3_F",
	"Land_i_House_Small_02_V1_F",
	"Land_i_House_Small_02_V2_F",
	"Land_i_House_Small_02_V3_F",
	"Land_i_House_Small_03_V1_F",
	"Land_i_Stone_HouseSmall_V2_F",
	"Land_i_Stone_HouseSmall_V1_F",
	"Land_i_Stone_HouseSmall_V3_F",
	"Land_smd_budova3_open",
	"Land_smd_dum_olezlina_open",
	"Land_smd_sara_zluty_statek_in",
	"Land_smd_hospoda_mesto",
	"Land_smd_dum_olez_istan2_maly_open",
	"Land_smd_dum_olez_istan2_open",
	"Land_smd_dum_mesto_in_open",
	"Land_smd_dum_olez_istan1_open2",
	"Land_smd_cihlovej_dum_mini",
	"Land_smd_house_y_open",
	"Land_smd_dum_olez_istan1_open",
	"Land_smd_budova4_in",
	"Land_HouseB",
	"Land_HouseA",
	"land_pop_chalet",
	"Land_HouseC1_L",
	"Land_Home6b_DED_Home6b_01_F",
	"Land_Home3r_DED_Home3r_01_F",
	"Land_HouseDoubleAL",
	"Land_HouseDoubleAL2",
	"Land_smd_budova2_open",
	"Land_Ranch_DED_Ranch_01_F",
	"Land_Ranch_DED_Ranch_02_F",
	"Land_pop_Apartamentos",
	"land_pop_caravana",
	"Land_pop_eurobldg_02",
	"Land_Ranch_DED_Ranch_02_F",
	"Land_pop_eurobldg_05",
	"Land_pop_eurobldg_11",
	"Land_pop_eurobldg_08",
	"land_POP_Mansion_4",
	"Land_pop_eurobldg_01",
	"Land_pop_eurobldg_04",
	"Land_pop_eurobldg_12",
	"Land_pop_eurobldg_07",
	"land_pop_caravana1",
	"land_pop_caravana2",
	"land_pop_caravana",
	"Land_pop_bloques2",
	"Land_pop_Apartamentos",
	"Land_pop_Apartamentos_Black",
	"Land_HouseB1",
	"Land_pop_bloques2",
	"Land_mr_wooden_house01_red",
	"Land_pop_duplex1",
	"land_pop_mansion",
	"land_modern6",
	"Land_pop_mansion_deluxe"
];


listaGarajes = [
    "Land_i_Garage_V1_F",
	"Land_i_Garage_V2_F",
	"Land_smd_garaz_long_open",
	"Land_smd_garaz_mala_open",
	"Land_smd_garaz_open"
];

listaGranjas = ["Land_mr_cow_house_2","Land_mr_cow_house_1"];

apartamentos = ["Land_pop_bloques2","Land_pop_Apartamentos","Land_pop_Apartamentos_Black","Land_pop_bloques1","Land_pop_bloques1"];

clasesMuebles = ["pop_armario1_box","pop_armario2_box","pop_nevera_box","pop_mesa_tv_box","pop_cama","pop_sofa"];

uniformesGranja = ["rds_uniform_Villager2","rds_uniform_Villager2","rds_uniform_Villager3","rds_uniform_Villager4"];

arrArboles = ["b_neriumo2s_white_f.p3d","b_neriumo2s_f.p3d","t_oleae1s_f.p3d","b_ficusc1s_f.p3d"];

tiendasArr = ["POP_npc_vendedor","POP_NPC_tiendaderopa","POP_NPC_chino","POP_npc_man1","POP_npc_mujer","POP_NPC_tendero","POP_npc_vendedor"];

/*
    Master Array of items?
*/
//Setup variable inv vars.
{
    missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
    _varName = getText(_x >> "variable");
    _sideFlag = getText(_x >> "side");

    missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

codigo1 = [];
codigo2 = [];
codigo3 = [];
