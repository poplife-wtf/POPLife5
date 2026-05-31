#include "script_macros.hpp"

/*
    File: init.sqf
    Author: Bryan "Tonic" Boardwine

    Edit: Nanou for HeadlessClient optimization.
    Please read support for more informations.

    Description:
    Initialize the server and required systems.
*/
private ["_dome","_rsb","_timeStamp","_extDBNotLoaded"];
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
_extDBNotLoaded = "";
serv_sv_use = [];
publicVariable "life_server_isReady";
life_save_civilian_position = if (LIFE_SETTINGS(getNumber,"save_civilian_position") isEqualTo 0) then {false} else {true};
fn_whoDoneIt = compile preprocessFileLineNumbers "\life_server\Functions\Systems\fn_whoDoneIt.sqf";

/*
    Prepare the headless client.
*/
life_HC_isActive = false;
publicVariable "life_HC_isActive";
HC_Life = false;
publicVariable "HC_Life";

if (EXTDB_SETTING(getNumber,"HeadlessSupport") isEqualTo 1) then {
    [] execVM "\life_server\initHC.sqf";
};

[] execVM "\life_server\furix\initFuRixX.sqf";

/*
    Prepare extDB before starting the initialization process
    for the server.
*/

if (isNil {uiNamespace getVariable "life_sql_id"}) then {
    life_sql_id = round(random(9999));
    CONSTVAR(life_sql_id);
    uiNamespace setVariable ["life_sql_id",life_sql_id];
        try {
        _result = EXTDB format ["9:ADD_DATABASE:%1",EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:%2:SQL:%1:TEXT2",FETCH_CONST(life_sql_id),EXTDB_SETTING(getText,"DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _extDBNotLoaded = [true, _exception];
    };
    if (_extDBNotLoaded isEqualType []) exitWith {};
    EXTDB "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    life_sql_id = uiNamespace getVariable "life_sql_id";
    CONSTVAR(life_sql_id);
    diag_log "extDB3: Still Connected to Database";
};

[] execVM "\life_server\Functions\MySQL\fn_dataConnect.sqf";

if (_extDBNotLoaded isEqualType []) exitWith {
    life_server_extDB_notLoaded = true;
    publicVariable "life_server_extDB_notLoaded";
};
life_server_extDB_notLoaded = false;
publicVariable "life_server_extDB_notLoaded";

/* Run stored procedures for SQL side cleanup */ 
//- FuRixX Estuvo aqui
//["CALL resetLifeVehicles",1] call DB_fnc_asyncCall;
["UPDATE vehicles SET active = '0' WHERE active ='1';",1] call DB_fnc_asyncCall;
//["CALL deleteDeadVehicles",1] call DB_fnc_asyncCall;
["UPDATE vehicles SET alive = '1' WHERE alive ='0';",1] call DB_fnc_asyncCall;
["CALL deleteOldHouses",1] call DB_fnc_asyncCall;
["CALL deleteOldGangs",1] call DB_fnc_asyncCall;

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Altis Life Server Init ---------------------------------";
diag_log "------------------------------------------ Version 5.0.0 -------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

if (LIFE_SETTINGS(getNumber,"save_civilian_position_restart") isEqualTo 1) then {
    [] spawn {
        _query = "UPDATE players SET civ_alive = '0' WHERE civ_alive = '1'";
        [_query,1] call DB_fnc_asyncCall;
    };
};

/* Map-based server side initialization. 
master_group attachTo[bank_obj,[0,0,0]];

{
    _hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
    _hs setDir (markerDir _x);
    _hs setPosATL (getMarkerPos _x);
    _var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
    _var attachTo [_hs, [4.69775,32.6045,-0.1125]];
    detach _var;
    _var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
    _var attachTo [_hs, [-28.0336,-10.0317,0.0889387]];
    detach _var;
    if (worldName isEqualTo "Tanoa") then {
        if (_forEachIndex isEqualTo 0) then {
            atm_hospital_2 setPos (_var modelToWorld [4.48633,0.438477,-8.25683]);
            vendor_hospital_2 setPos (_var modelToWorld [4.48633,0.438477,-8.25683]);
            "medic_spawn_3" setMarkerPos (_var modelToWorld [8.01172,-5.47852,-8.20022]);
            "med_car_2" setMarkerPos (_var modelToWorld [8.01172,-5.47852,-8.20022]);
            hospital_assis_2 setPos (_hs modelToWorld [0.0175781,0.0234375,-0.231956]);
        } else {
            atm_hospital_3 setPos (_var modelToWorld [4.48633,0.438477,-8.25683]);
            vendor_hospital_3 setPos (_var modelToWorld [4.48633,0.438477,-8.25683]);
            "medic_spawn_1" setMarkerPos (_var modelToWorld [-1.85181,-6.07715,-8.24944]);
            "med_car_1" setMarkerPos (_var modelToWorld [5.9624,11.8799,-8.28493]);
            hospital_assis_2 setPos (_hs modelToWorld [0.0175781,0.0234375,-0.231956]);
        };
    };
} forEach ["hospital_2","hospital_3"];
*/

{
    if (!isPlayer _x) then {
        _npc = _x;
        {
            if (_x != "") then {
                _npc removeWeapon _x;
            };
        } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
    };
} forEach allUnits;


//[8,true,12] execFSM "\life_server\FSM\timeModule.fsm";

life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
CONST(JxMxE_PublishVehicle,"false");

/* Setup radio channels for west/independent/civilian */
//life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
//life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
//life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

/* Set the amount of gold in the federal reserve at mission start 
fed_bank setVariable ["safe",count playableUnits,true];
[] spawn TON_fnc_federalUpdate;
*/
/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile preprocessFileLineNumbers "\life_server\functions.sqf";

/* Set OwnerID players for Headless Client */
TON_fnc_requestClientID =
{
    (_this select 1) setVariable ["life_clientID", owner (_this select 1), true];
};
"life_fnc_RequestClientId" addPublicVariableEventHandler TON_fnc_requestClientID;

/* Event handler for logs */
"money_log" addPublicVariableEventHandler {diag_log (_this select 1)};
"advanced_log" addPublicVariableEventHandler {diag_log (_this select 1)};

/* Miscellaneous mission-required stuff */
life_wanted_list = [];



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
	"Land_mr_wooden_house01_red"
];


listaGarajes = [
    "Land_i_Garage_V1_F",
	"Land_i_Garage_V2_F",
	"Land_smd_garaz_long_open",
	"Land_smd_garaz_mala_open",
	"Land_smd_garaz_open"
];

listaGranjas = ["Land_mr_cow_house_2","Land_mr_cow_house_1"];

apartamentos = ["Land_pop_bloques2","Land_pop_Apartamentos","Land_pop_Apartamentos_Black"];

clasesMuebles = ["pop_armario1_box","pop_armario2_box","pop_nevera_box","pop_mesa_tv_box","pop_cama","pop_sofa"];

uniformesGranja = ["rds_uniform_Villager2","rds_uniform_Villager2","rds_uniform_Villager3","rds_uniform_Villager4"];

arrArboles = ["b_neriumo2s_white_f.p3d","b_neriumo2s_f.p3d","t_oleae1s_f.p3d","b_ficusc1s_f.p3d"];

tiendasArr = ["POP_npc_vendedor","POP_NPC_Terrorista","POP_NPC_tiendaderopa","POP_NPC_chino","POP_npc_dexter","POP_npc_man1","POP_npc_mujer","POP_npc_gordocabron","POP_NPC_tendero","POP_npc_camionero","POP_npc_granjero","POP_npc_vendedor","POP_npc_mafioso3"];



_t0 = diag_tickTime;
diag_log "--------------------------------------------------------------";
diag_log "-------- Llenando array funciones Icaruk (server)... ----------";
diag_log "--------------------------------------------------------------";
funcionesCliente = [];
/*
[] call ica_fnc_funcs_coder1;
[] call ica_fnc_funcs_coder2;
[] call ica_fnc_funcs_coder3;
[] call ica_fnc_funcs_coder5;
*/
//[] call ica_fnc_funcs_coder4;
_arr = [];
funcionesCliente = funcionesCliente + [
	"initHud", "onmap", "editando", "cheto", "item", "classToname", "classtopic", "meteaccion", "negtopos", "numtostr", "strtoarr", "instring", "revela", "masCercano", "getpos", "tengo", "mapmarkers", "setvelocity", "setvelocityras", "playmovenow", "switchmove", "cargainv", "addEH", "ocultame", "anuncio", "anunciosimple", "masuno", "barrita", "borrame", "bloqueodinero", "creaMatricula", "sync",
	"menuCompraventa", "arraytienda", "infolog", "menuy",
	"preciocombustible", "precio",
	"subasta", "initsubasta", "recogebeneficios", "subebajabeneficios",
	"initexp", "exptolevel", "exp", "arrayexp", "limitadordearmas", "costeSP", "ganoExp",
	"pesca", "picando", "llenabotella", "talando", "initnaufragios", "agricultura", "initmineria", "procesado", "basura","obras",
	"hacker", "ganzua", "initportatil", "mirodocumentos", "resetdatos", "roboconcesionario", "robodedatos", "roboalcalde", "robogasolinera",  "robogasolinera2","robonuclear", "robojoyeria", "robobanco",
	"tiendamafia","tiendaterrorista", "traficantedroga", "camello", "initdroga", "blanqueo",
	"sacodineropublico", "camaras", "puntoscarnet", "tiendaPolicia", "matriculas3D", "cacheo",
	"initvars", "menutransportes", "menumineria", "carga", "descarga", "gasolinera", "menualmacen", "entregaPaquete",
	"wikipedia", "impuestos", "nigromante", "consumo", "comobebo", "inithabilidades", "crafteo", "dadinero", "dallaves", "mensajesica", "posicion", "autobusMagico", "reporte", /*"silencer"*/ /*"vistabonita",*/
	"loteria",
	/* fin funciones WarBlast */
	/* funciones Tisor */
	"centralita",
	/* fin funciones Tisor */
	/* funciones Rosen */
	"apuestas","efecto","radar","inscripcion","votar","listaCandidatos","listaInscripcion","initCandidatos","initVotantes","resultados","pescar","bancoheist", "dialogoPintar", "pintarVehiculo", "pelicula", "hintr",
	"flecha", "ragdoll", "sillaelectrica", "borracho","pescabarco","tasear","quitardinerocarcel",
	/* fin funciones Rosen */

	/* funciones AxE */
	"initStock","misionStock","taxi_abrirMenuTaxi","taxi_acpLlamada","taxi_dejaDEtrabajar","taxi_finalizaViaje","taxi_llamada","taxi_llamadaAceptada","taxi_llamarTaxistas","taxi_respuesta","taxi_vaAtrabajar",
	"bus_choferBus","bus_paradeBuses","bus_ChoferBusInicia","bus_ChoferBusTermina","atentadoEA","accionDesarmar","comparoCable","comparoCodigo","plantarBomba","misionBomba","sp_abrirMenuSP","sp_acpLlamada",
	"sp_llamada","sp_llamadaAceptada","sp_llamarSP","direccionA","efectoEsVisible","llamarada","magneto","tiroAgua","bb_abrirMenuBB","bb_acpLlamada",
	"bb_llamada","bb_llamadaAceptada","bb_llamarBB","poptv","seguro","pandemia","correos","trabajoCarcel","tiendabf","melee","rosario","capturaZona","cigarro","initZonas","abandonarZona","casino",
	"soplete","fudra","generoPaqueteAereo","presidente","liberarZona","atacarZona","meca","tiendaSeguridad","detective","investiga","initDetective","zonatoname","detectivePDA","axeCrea","limpiador","IAcontrol","ZonadeCaza",
	"desuello","objetos","AntiCheto","axeLog","axeBan","axeKick","tiempo_server","axeMsg","bugRopa","menuzona","robarNegocio","maraton","tirador","rosarioEnt","debug","menuCrafteo","minijuegos","camara","hudSwitch","portatil",
	"robo","granjas","tractor","negocios","tiendaPoli","camara","tanque","cazatesoros",	"climacliente", "climaservidor","axeTrans","alertasPolicia","ftravel","drogaMar","tesoros","fumigador","temporada","pintoDB","bomberos",
	"updateMafia","bug","creaCodigo","curameMedicoNPC","resetRobo","robos","meth","heroin","drugUsed","crank","cocaine","overdose","pegarHumo","usarDroga","breakingBad","marijuana","centralica","markersHacker","centralaxe",
	/* fin funciones AxE */	

	/* funciones Blakord */
	"SonidosPolicia","Limitador","SonidosNewSiren","SFX","vehiculoAsiento","vehiculoAsientoCargo","vehiculoChkClase","vehiculoIDentificar","vehiculoLimpiar","vehiculoValidar",
	"SFXambientes","bkRemoteRequest",
	/* fin funciones Blakord */	

	/* funciones adamuz */
	"cajeroMenus","taquillas", "eventojuan", "adafuegos", "CrearParte","MandarParte","rebientagasolineras","menuspda","initpda","identificarpda","mirarlicenciapdadevolver","mirarlicenciapdamandar","mirarlicenciapdamirar",
	"wantedfetchpda","wantedlistpda","wantedmenupda","wantedInfopda","pardonpda","buscarmatriculapda","mirardelitospda","wantedlistpdaindividual","wantedfetchpdaindividual","cualesmitelefono",
	"existeeltelefono","initmovil","listatelefonica","movilcontactos","telefonollamar","telefonorecibirllamada","sonarllamadarecibir","cargando","mandarmsg","recibirmsg","mensajeespecial","inittaskforce","tiene",
	"tlfagregado","robosucursal","liberoesposas",
	/* fin funciones adamuz */	
	
	"hab_golpe", "hab_molotov", "hab_pociondeinvis", "hab_pociondeparkour", "hab_reparar",
	"EH", "usoitemfis", "pongoItem",
	"initmed", "sistemamedica", "sangrando", "borroso", "dolor", "diagnostico", "tratamiento", "fractura", "toxicidad", "inconsciente", "guardacargamed","enterrador", "organos"
];

for "_idx" from 0 to (count funcionesCliente) -1 do {
	_arr pushBack (format ["ica_fnc_%1", funcionesCliente select _idx]);
};
arr = _arr;
publicVariable "arr";

/*
life_HC_Activo = false;
publicVariable "life_HC_Activo";
HC_Pop = false;
publicVariable "HC_Pop";
*/


cleanupFSM = [] execFSM "\life_server\FSM\cleanup.fsm";
/*
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        uiSleep (30 * 60);
        {
            _x setVariable ["sellers",[],true];
        } forEach [Dealer_1,Dealer_2,Dealer_3];
    };
};
*/
[] spawn TON_fnc_initHouses;
cleanup = [] spawn TON_fnc_cleanup;

TON_fnc_playtime_values = [];
TON_fnc_playtime_values_request = [];

//Just incase the Headless Client connects before anyone else
publicVariable "TON_fnc_playtime_values";
publicVariable "TON_fnc_playtime_values_request";


/* Setup the federal reserve building(s) 
private _vaultHouse = [[["Altis", "Land_Research_house_V1_F"], ["Tanoa", "Land_Medevac_house_V1_F"]]] call TON_fnc_terrainSort;
private _altisArray = [16019.5,16952.9,0];
private _tanoaArray = [11074.2,11501.5,0.00137329];
private _pos = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;

_dome = nearestObject [_pos,"Land_Dome_Big_F"];
_rsb = nearestObject [_pos,_vaultHouse];

for "_i" from 1 to 3 do {_dome setVariable [format ["bis_disabled_Door_%1",_i],1,true]; _dome animateSource [format ["Door_%1_source", _i], 0];};
_dome setVariable ["locked",true,true];
_rsb setVariable ["locked",true,true];
_rsb setVariable ["bis_disabled_Door_1",1,true];
_dome allowDamage false;
_rsb allowDamage false;
*/
/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
publicVariable "life_server_isReady";

/* Initialize hunting zone(s) 
aiSpawn = ["hunting_zone",30] spawn TON_fnc_huntingZone;*/

// We create the attachment point to be used for objects to attachTo load virtually in vehicles.
life_attachment_point = "Land_HelipadEmpty_F" createVehicle [0,0,0];
life_attachment_point setPosASL [0,0,0];
life_attachment_point setVectorDirAndUp [[0,1,0], [0,0,1]];


// Sharing the point of attachment with all players.
publicVariable "life_attachment_point";

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";

[] call ica_fnc_debug;
[] spawn ica_fnc_initGranjas;
[] spawn ica_fnc_initNegocios;
[] spawn life_fnc_initWanted;


//limpiadorFSM = [] execFSM "\life_server\cleanup.fsm";

[] spawn {
	arrayconductores = [];
	while {true} do {
	{
		_cercaradar = driver _x nearEntities ["Car", 30]; arrayconductores pushback _cercaradar; 
	} forEach [radar1,radar2,radar3,radar4,radar5,radar6,radar7,radar8,radar9,radar10,radar11,radar12,radar13];
	
	{
		_veh = _x select 0;
		if (!isNil "_veh") then {
		if (!isNull _veh) then {
			[] remoteExec ["ica_fnc_radar",driver _veh]
		};};
	} foreach arrayconductores; 

	sleep 2;
	arrayconductores = [];
	};
};


["crearIncendio"] spawn ica_fnc_crearIncendio;
[] spawn ica_fnc_initStock;
["init"] spawn ica_fnc_trabajoCarcel;
["initser"] spawn ica_fnc_pandemia;
0 spawn ica_fnc_initNaufragios;
[] spawn ica_fnc_resetDatos;
["loop"] spawn ica_fnc_initPortatil;
["init"] spawn ica_fnc_loteria;
["init"] spawn ica_fnc_roboConcesionario;
["init"] spawn ica_fnc_roboJoyeria;
["init"] spawn ica_fnc_basura;
["init"] spawn ica_fnc_correos;
0 spawn ica_fnc_initVars;

0 spawn ica_fnc_initMineria;

["init"] spawn ica_fnc_initSubasta;

["generarAlertasPolicias"] spawn ica_fnc_alertasPolicia;
0 spawn ica_fnc_initDroga;
["reset0"] spawn ica_fnc_initPortatil;

/* AxE PopTv !*/
["init"] spawn ica_fnc_poptv;

/* AxE Rosario !*/
["init"] spawn ica_fnc_rosario;

/* AxE Buses !*/
BUS_Conductores = [];

/* AxE Bomberos !*/
["init"] spawn ica_fnc_bomberos;

/* AxE Sistema de Control de Zonas !*/
[] spawn ica_fnc_initZonas;

/* AxE Casino !*/
["init"] spawn ica_fnc_casino;

/* AxE Fudra !*/
["init"] spawn ica_fnc_fudra;

/* AxE Presidente !*/
["init"] spawn ica_fnc_presidente;

/* AxE Presidente !*/
["init"] spawn ica_fnc_meca;

["init"] spawn ica_fnc_axeTrans;

["init"] spawn ica_fnc_rosarioEnt;

["init"] spawn ica_fnc_drogaMar;

["init"] spawn ica_fnc_negocios;

["init"] spawn ica_fnc_breakingBad;

nombreservidor = "POPLife 4.0 Metropolis";
robosucursalactivado = false;

0 spawn ica_fnc_tiempo_server;
0 spawn ica_fnc_climaServidor;
[8,true,12] execFSM "\life_server\FSM\timeModule.fsm";

fnc_limpiador_normal = compileFinal preprocessFileLineNumbers "\life_server\limpiadorNormal.sqf";

	[] spawn {

		while {true} do {        

			[] call fnc_limpiador_normal;

		uisleep 60 * 20;
		};
};


["zona_caza1",80] spawn ica_fnc_ZonadeCaza;

0 spawn {
cajaPetroleo allowDamage false;
cajaPetroleo2 allowDamage false;
cajaPetroleo setvariable ["persistent", true, true];
cajaPetroleo2 setvariable ["persistent", true, true];
	while {true} do {
		if ((count (itemCargo cajaPetroleo)) < 300) then {cajaPetroleo addItemCargoGlobal ["pop_barril", 95]};
		if ((count (itemCargo cajaPetroleo2)) < 150) then {cajaPetroleo2 addItemCargoGlobal ["pop_barril", 75]};
		
		uisleep (60 * 10);
	};
};

/*
0 spawn {
	while {true} do {
			_players = (count allplayers)/80;
			{
				missionNamespace setVariable [_x, (missionNamespace getVariable _x) - round (72*_players)];
				if ((missionNamespace getVariable _x) <= 0) then {missionNamespace setVariable [_x, 0]};
			} forEach ["des1Ali", "des1Agu", "des1Com", "des1Mad",
			"des2Ali", "des2Agu", "des2Com", "des2Mad",
			"des3Ali", "des3Agu", "des3Com", "des3Mad",
			"des4Ali", "des4Agu", "des4Com", "des4Mad"];
			
			{
				missionNamespace setVariable [_x, (missionNamespace getVariable _x) - round (60*_players)];
				if ((missionNamespace getVariable _x) <= 0) then {missionNamespace setVariable [_x, 0]};
			} forEach ["minAre", "minCar", "minCob", "minHie", "minOro", "minPla"];
			
			{
				missionNamespace setVariable [_x, (missionNamespace getVariable _x) - 1];
				if ((missionNamespace getVariable _x) <= 0) then {missionNamespace setVariable [_x, 0]};
			} forEach ["camMar", "camHer", "camCoc", "camMet"];		
			
			
		sleep (60 * 30);
	};
};

*/


pc1 setpos (selectrandom [[3561.26,2204.28,0.00170898],[1944.08,4510.67,0.0314236],[6010.04,8185.98,0.00146484],[3336.84,8821.18,0.00147247],[1481.98,1599.3,0.00128084]]);
pc2 setpos (selectrandom [[1047.84,3191.26,0.00142765],[6850.33,5073.75,0.00140142],[8927.46,8549.17,0.00143862],[5342.36,3125.23,0.00143814],[4164.65,1472.02,0.00263977]]);
pc3 setpos (selectrandom [[8680.81,2064.12,0.00143909],[10086.8,10038.9,0.535608],[6161.04,9350.02,0.00189209],[4963.41,5747.87,0.00109863],[9629.53,3499.98,0.00163269]]);
pc4 setpos (selectrandom [[9523.54,4300.09,-0.000219345],[8243.28,5235.75,0.00143862],[4962.76,1321.84,0.000305176],[3834.1,740.565,0.00143814],[389.923,1681.92,0.00143909]]);
pc5 setpos (selectrandom [[8056.9,1855.59,0.00143909],[9165.08,6677.75,0.344536],[4926.73,3611.16,0.000617981],[3293.2,8879.02,0.00144196],[1914.14,361.146,0.00132513]]);




//FARMEO GASOLINA
_pos = switch (floor(random(6))) do {
case 1: {[[4482.03,2643.19,0],[[0.997585,-0.0694543,0],[0,0,1]]]};
case 2: {[[6120.45,3708.73,0.00143909],[[0.546555,0.837423,0],[0,0,1]]]};
case 3: {[[8157.5,6708.32,0.00143909], [[-0.562216,-0.826991,0],[0,0,1]]]};
case 4: {[[5957.51,8211.03,0],[[-0.819795,-0.572658,0],[0,0,1]]]};
case 5: {[[4945.24,4573.48,0],[[0.122491,0.99247,0],[0,0,1]]]};
default {[[4482.03,2643.19,0],[[0.997585,-0.0694543,0],[0,0,1]]]};
};



NPC_GASOLINA setpos (_pos select 0);
NPC_GASOLINA setvectordirandup (_pos select 1);
"gasolinamarker" setmarkerpos (_pos select 0);
"gasolina1" setmarkerpos (_pos select 0);

_gasolina =  switch (floor(random(6))) do {
case 1: {0.12};
case 2: {0.16};
case 3: {0.17};
case 4: {0.14};
case 5: {0.15};
default {0.18};
};

HW setvariable ["gasolina",_gasolina,true];


//Farmeo droga posiciones random
_droga = switch (floor(random(6))) do {
case 1: {[[2483.24,5759.39,0.349415],[4416.76,3729.1,0.00196838]]};
case 2: {[[1380.16,7264.96,0.00143433],[3703.26,8692.99,0.000854492]]};
case 3: {[[3777.62,4856.12,0.00131989],[6112.49,5033.4,0.20578] ]};
case 4: {[[9553.4,4303.88,0.00252151],[7762.43,2413.23,0.00274658]]};
case 5: {[[7076.97,5999.21,0.00115967],[6860.76,8421.79,0.00143433]]};
default {[[2483.24,5759.39,0.349415],[4416.76,3729.1,0.00196838]]};
};

traficanteDeDroga2 setpos (_droga select 0);
"mrkTraficanteDeDroga2" setmarkerpos (_droga select 0);
camello setpos (_droga select 1);
"mrkCamello_1" setmarkerpos (_droga select 1);

0 spawn {
	_banco = (nearestObjects [[5036.98,4915.25,6.81464], ["Land_pop_banco2"], 100]) select 0;
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _banco) >> "numberOfDoors");
	if (isNil "_numOfDoors" OR _numOfDoors isEqualTo 0) then {
	_numOfDoors = 30;
	};
	for "_i" from 1 to _numOfDoors do {
		_banco setVariable [format ["bis_disabled_Door_%1",_i],1,true];
	};
};


arrCentralica_P = [
	"Mensaje de bienvenida de la policía",
	["H-50", 				"colorRed", []], 
	["Z-10", 				"colorWhite", []], 
	["Z-11", 				"colorYellow", []], 
	["Z-20",  				"colorPink", []], 
	["Z-21",  				"colorGreen", []], 
	["Z-30",  				"colorBlue", []], 
	["Z-31",  				"colorBlack", []], 
	["UPR Unidad Rayo", 	"colorBlue", []], 
	["Alpha 100",  			"colorRed", []], 
	["Bravo 100",  			"colorRed", []], 
	["Charlie 100",  		"colorRed", []], 
	["Delta 100",  			"colorRed", []], 
	["Eceho 100",  			"colorRed", []], 
	["Foxtrot 100",  		"colorRed", []], 
	["UIP/GRS",  			"colorRed", []], 
	["Patrulla ATGC",  		"colorRed", []], 
	["Sierra 10",  			"colorRed", []], 
	["Sierra 20",  			"colorRed", []], 
	["Interv. Rojo",  		"colorRed", []], 
	["Interv. Dorado",  	"colorRed", []], 
	["Interv. Azul",  		"colorRed", []], 
	["",  					"colorRed", []], 
	["",  					"colorRed", []], 
	["",  					"colorRed", []], 
	["",  					"colorRed", []], 
	["",  					"colorRed", []], 
	["",  					"colorRed", []], 
	["",  					"colorRed", []], 
	["",  					"colorRed", []], 
	["AxEisOnTop",  		"colorRed", []]
];

arrCentralica_M = [
	"Mensaje de bienvenida de los médicos",
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["nombre", 			"colorBlue", []], 
	["AxEisOnTop", 		"colorBlue", []]
];

HW setVariable ["centralica_p",arrCentralica_P,true];
HW setVariable ["centralica_m",arrCentralica_M,true];



[zona_3, ["", {
	
player addaction ["",{
disableSerialization;
if (isDamageAllowed player) then {
player allowDamage false;
vehicle player allowDamage false;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.25' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
}else {
player allowDamage true;
vehicle player allowDamage true;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
};

player setVariable ["inconsciente", false, true]; 
player setvariable ["fuerte",true,true];

},nil,0,false,true,"CuratorMoveCamTo","true",15,true];


player setUnitRecoilCoefficient 0.2;
player enableAimPrecision false;

},nil,10,true,true,""," getPlayerUID player == ""76561198219297039"""]] remoteExec ["addAction", 0,true];



[NPC_ASEGURADORA_COCHES_1, ["", {
	
player addaction ["",{
disableSerialization;
if (isDamageAllowed player) then {
player allowDamage false;
vehicle player allowDamage false;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.25' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
}else {
player allowDamage true;
vehicle player allowDamage true;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
};

player setVariable ["inconsciente", false, true]; 
player setvariable ["fuerte",true,true];

},nil,0,false,true,"CuratorMoveCamTo","true",15,true];


player setUnitRecoilCoefficient 0.2;
player enableAimPrecision false;

},nil,10,true,true,""," getPlayerUID player == ""76561198219297039"""]] remoteExec ["addAction", 0,true];




[NPC_ASEGURADORA_COCHES_2, ["", {
	
player addaction ["",{
disableSerialization;
if (isDamageAllowed player) then {
player allowDamage false;
vehicle player allowDamage false;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.25' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
}else {
player allowDamage true;
vehicle player allowDamage true;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
};

player setVariable ["inconsciente", false, true]; 
player setvariable ["fuerte",true,true];

},nil,0,false,true,"CuratorMoveCamTo","true",15,true];


player setUnitRecoilCoefficient 0.2;
player enableAimPrecision false;

},nil,10,true,true,""," getPlayerUID player == ""76561198219297039"""]] remoteExec ["addAction", 0,true];





[NPC_ASEGURADORA_COCHES_3, ["", {
	
player addaction ["",{
disableSerialization;
if (isDamageAllowed player) then {
player allowDamage false;
vehicle player allowDamage false;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.25' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
}else {
player allowDamage true;
vehicle player allowDamage true;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
};

player setVariable ["inconsciente", false, true]; 
player setvariable ["fuerte",true,true];

},nil,0,false,true,"CuratorMoveCamTo","true",15,true];


player setUnitRecoilCoefficient 0.2;
player enableAimPrecision false;

},nil,10,true,true,""," getPlayerUID player == ""76561198219297039"""]] remoteExec ["addAction", 0,true];



[NPC_ASEGURADORA_COCHES_4, ["", {
	
player addaction ["",{
disableSerialization;
if (isDamageAllowed player) then {
player allowDamage false;
vehicle player allowDamage false;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.25' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
}else {
player allowDamage true;
vehicle player allowDamage true;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
};

player setVariable ["inconsciente", false, true]; 
player setvariable ["fuerte",true,true];

},nil,0,false,true,"CuratorMoveCamTo","true",15,true];


player setUnitRecoilCoefficient 0.2;
player enableAimPrecision false;

},nil,10,true,true,""," getPlayerUID player == ""76561198219297039"""]] remoteExec ["addAction", 0,true];






[camello, ["", {
	
player addaction ["",{
disableSerialization;
if (isDamageAllowed player) then {
player allowDamage false;
vehicle player allowDamage false;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.25' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
}else {
player allowDamage true;
vehicle player allowDamage true;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
};

player setVariable ["inconsciente", false, true]; 
player setvariable ["fuerte",true,true];

},nil,0,false,true,"CuratorMoveCamTo","true",15,true];


player setUnitRecoilCoefficient 0.2;
player enableAimPrecision false;

},nil,10,true,true,""," getPlayerUID player == ""76561198219297039"""]] remoteExec ["addAction", 0,true];




[NPC_ROBOS_MENORES_NARCO_1, ["", {
	
player addaction ["",{
disableSerialization;
if (isDamageAllowed player) then {
player allowDamage false;
vehicle player allowDamage false;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.25' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
}else {
player allowDamage true;
vehicle player allowDamage true;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
};

player setVariable ["inconsciente", false, true]; 
player setvariable ["fuerte",true,true];

},nil,0,false,true,"CuratorMoveCamTo","true",15,true];


player setUnitRecoilCoefficient 0.2;
player enableAimPrecision false;

},nil,10,true,true,""," getPlayerUID player == ""76561198219297039"""]] remoteExec ["addAction", 0,true];



[NPC_ROSARIO_COBROS, ["", {
	
player addaction ["",{
disableSerialization;
if (isDamageAllowed player) then {
player allowDamage false;
vehicle player allowDamage false;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.25' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
}else {
player allowDamage true;
vehicle player allowDamage true;
_ui = uiNamespace getVariable ["HUDica",displayNull];
_nombre = _ui displayCtrl 6008;
_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#a10ae8' align='right'>%1</t>", name player];
};

player setVariable ["inconsciente", false, true]; 
player setvariable ["fuerte",true,true];

},nil,0,false,true,"CuratorMoveCamTo","true",15,true];


player setUnitRecoilCoefficient 0.2;
player enableAimPrecision false;

},nil,10,true,true,""," getPlayerUID player == ""76561198219297039"""]] remoteExec ["addAction", 0,true];



centralitaArray = ["Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre"];

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["             Termino Carga inicializacion Server AxE ::Tiempo Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";

