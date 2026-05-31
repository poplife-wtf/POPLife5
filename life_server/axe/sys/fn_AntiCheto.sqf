/*
POP Antichetos 9000.
By AxE && Icaruk

 
Para sacar whitelist de loops actuales y adicionar:
 
    asd = [];
    {
        asd pushBack (_x select 1);
    } forEach diag_activeSQFScripts;

	poner en el monitor la variable asd y agregar al array _WLsqf.
 
*/

if (!hasInterface) then {}; //No kickes al HC nene.
 
_WLsqf = ["POP_base\vehiculos\scripts\fn_sirenas.sqf","ivory_data\scripts\spoiler.sqf","Quiet_voiture_1\Quiet_base\Quiet_heure\Quiet_heure.sqf","Jonzie_Code\functions\Universal_Cars\Random_Skins.sqf","BloodSplatter\Scripts\Preload.sqf","POP_Opel_Insignia_Camuflado\radar.sqf","pop_c4_picasso\velocimetro.sqf","pop_c4_picasso_cnp\?velocimetro.sqf","mm_bank\script\mic\VaultOpen.sqf","mm_bank\script\mic\VaultOpen.sqf","mm_bank\script\mic\VaultOpen.sqf","POP_base\vehiculos\scripts\fn_sirenasems.sqf","IVORY_R8SPYDER\scripts\clock.sqf","","","R3F_Armes\script\R3F_FELIN_client_porteur_SIT_COMDE.sqf","R3F_Armes\script\R3F_FELIN_client_telemetre.sqf","R3F_Armes\script\R3F_FELIN_client_camera.sqf","KA_weapon_functions\clientInit.sqf","KA_weapon_functions\scripts\fn_boltAction_postInit.sqf","mpmissions\__CUR_MP.Jackson_County\core\functions\fn_escInterupt.sqf","","","life_server\ica\jugador\fn_impuestos.sqf","life_server\ica\jugador\fn_comoBebo.sqf","life_server\ica\jugador\fn_comoBebo.sqf","life_server\ica\jugador\fn_comoBebo.sqf","life_server\ica\jugador\fn_comoBebo.sqf","life_server\ica\jugador\fn_initHabilidades.sqf","life_server\ica\jugador\fn_consumo.sqf","life_server\ica\robos\fn_roboNuclear.sqf","life_server\ica\inventario\fn_EH.sqf","life_server\ica\exp\fn_initExp.sqf","life_server\ica\jugador\fn_posicion.sqf","life_server\ica\sistemaMedicaruk\fn_organos.sqf","life_server\ica\fn_initHUD.sqf","life_server\ica\fn_initHUD.sqf","life_server\ica\funciones\fn_bloqueoDinero.sqf","mpmissions\__CUR_MP.Jackson_County\ica\initica.sqf","life_server\rosen\fn_radar.sqf","mpmissions\__CUR_MP.Jackson_County\ica\initica.sqf","mpmissions\__CUR_MP.Jackson_County\BW_LoadCalc\functions\fn_GEARMONITOR.sqf","POP_base\vehiculos\scripts\fn_sirenas.sqf","POP_Opel_Insignia_Camuflado\radar.sqf","mpmissions\__CUR_MP.Jackson_County\BW_LoadCalc\functions\fn_GEARMONITOR.sqf","A3\functions_f\GUI\fn_AAN.sqf","shounka_a3_brinks_banque\Scripts\lightbar.sqf","pop_c4_picasso\velocimetro.sqf","life_server\quickskill\quickHabilidades\fn_superviviente.sqf","life_server\ica\funciones\fn_sync.sqf","life_server\ica\exp\fn_initExp.sqf","life_server\ica\jugador\fn_posicion.sqf","life_server\ica\fn_initHUD.sqf","life_server\ica\fn_initHUD.sqf","life_server\ica\sistemaMedicaruk\fn_dolor.sqf","life_server\ica\funciones\fn_bloqueoDinero.sqf","task_force_radio\functions\fn_radioReplaceProcess.sqf","task_force_radio\functions\fn_sessionTracker.sqf","mpmissions\__CUR_MP.Jackson_County\core\functions\fn_escInterupt.sqf","","mpmissions\__CUR_MP.Jackson_County\ica\initica.sqf","life_server\ica\jugador\fn_impuestos.sqf","life_server\ica\jugador\fn_comoBebo.sqf","life_server\ica\jugador\fn_comoBebo.sqf","life_server\ica\jugador\fn_comoBebo.sqf","life_server\ica\jugador\fn_comoBebo.sqf","life_server\ica\jugador\fn_initHabilidades.sqf","life_server\ica\jugador\fn_consumo.sqf","life_server\ica\robos\fn_roboNuclear.sqf","life_server\ica\exp\fn_initExp.sqf","life_server\ica\inventario\fn_EH.sqf","life_server\ica\fn_initHUD.sqf","life_server\ica\fn_initHUD.sqf","life_server\ica\jugador\fn_posicion.sqf","life_server\ica\sistemaMedicaruk\fn_dolor.sqf","life_server\ica\sistemaMedicaruk\fn_organos.sqf","life_server\ica\jugador\fn_nigromante.sqf","life_server\axe\sys\fn_AntiCheto.sqf"];

_t = round (random [10,20,30]); // tiempo de comprobación

 
while {_t > 0} do {
   
    _sqf = diag_activeSQFScripts;
   
    {  
   
        _fileName = _x select 1;
       
        if !(_fileName in _WLsqf) then {
		
			if (_fileName isEqualTo "A3\ui_f\scripts\GUI\RscDebugConsole.sqf") exitWith {
				if (call life_adminlevel < 4) exitWith {
				disableUserInput true;
				[player] call ica_fnc_axeKick;
				};
			};
			
			if ((["MAD\NSS_AC\",_fileName] call ica_fnc_inString) or (["mcc_sandbox_mod\",_fileName] call ica_fnc_inString)) then {
				if (call life_adminlevel < 4) exitWith {
				["NSS o MCC_sandbox detectados",player,_fileName] call ica_fnc_axeLog;
				disableUserInput true;
				[player] call ica_fnc_axeKick;
				};
			};
		
			if ( (["life_server\",_fileName] call ica_fnc_inString) or (["mpmissions\__CUR_MP.Jackson_County\",_fileName] call ica_fnc_inString) or (["task_force_radio\",_fileName] call ica_fnc_inString) or (["axe_hc\",_fileName] call ica_fnc_inString) or (["A3\functions_f\",_fileName] call ica_fnc_inString) or (["A3\ui_f\",_fileName] call ica_fnc_inString) or (["A3\ui_f\",_fileName] call ica_fnc_inString)) then {} else {
				//disableUserInput true;
				//[[player],{hint format ["POP AntiCheto: El jugador %1 ejecuta scripts o addons no autorizados !! Reporta a un administrador",name (_this select 0)]}] remoteExec ["BIS_fnc_spawn",-2];	
				["Mod o Script sospechoso siendo usado",player,_fileName] call ica_fnc_axeLog;
			
				//[player] call ica_fnc_axeKick;
			};

	

        };
       
       
    } forEach _sqf;
   
   
    _t = _t - 5;
    uisleep 5;
};

uiSleep round (random 9); // tiempo de retardo

 if (call life_adminlevel < 1) then {
	comprobadorCheto = [] spawn {
		while {true} do {
			
			if (dialog) then {
					if !(isNull (findDisplay 316000)) then {
						disableUserInput true;
						0 spawn {
							_t2 = 1;
							while {_t2 > 0} do {
								closeDialog 0;
								_t2 = _t2 - 0.2;
								sleep 0.2;
							};
						};
					[[player],{hint format ["POP AntiCheto: El jugador %1 ejecuta scripts o addons no autorizados !! Reporta a un administrador",name (_this select 0)]}] remoteExec ["BIS_fnc_spawn",-2];	
					["Consola detectada en usuario no Autorizado",player,_fileName] call ica_fnc_axeLog;
					[player] call ica_fnc_axeKick;
					};
			};
			uiSleep round (random [4,8,12]);
		}; 
	};
 }; 