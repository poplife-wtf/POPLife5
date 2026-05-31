//FUDRA Para la policia
// Asi evitamos desmadres de crimenes cuando matan a toda la maya.

_p = _this select 0;


if (_p == "init") exitWith {

[NPC_POLICIA_DEVOLVER_ARMAS, [" .:: Inciar Rol de Detective ::.", {["init"] call ica_fnc_initDetective},nil,1,true,true,"","(call life_coplevel) >= 4"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" .:: Finalizar Investigación ::.", {["finish"] call ica_fnc_initDetective},nil,1,true,true,"","detective"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" Equipamento Detective 1 ", {player setUnitLoadOut [[],[],["RH_p226s","","RH_M6X","",["RH_15Rnd_9x19_SIG",15],[],""],["POP_CHAW4_D6",[["pop_esposas",2,1]]],["CUP_V_C_Police_Holster",[["RH_15Rnd_9x19_SIG",3,15],["pop_vendas_c",17,1]]],["mochila_mediana",[["pop_Ganzua",1,1],["RH_15Rnd_9x19_SIG",15,15],["pop_vendas_c",3,1],["pop_kiwi",5,1],["pop_esposas",4,1],["pop_csi",1,1],["pop_iphone",1,1]]],"CUP_H_C_Beret_01","G_EWK_Glasses_Cig1",[],["ItemMap","ItemGPS","","ItemCompass","Itemwatch",""]]},nil,1,true,true,"","detective"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" Equipamento Detective 2 ", {player setUnitLoadOut [[],[],["RH_m9","","RH_M6X","",["RH_15Rnd_9x19_M9",15],[],""],["POP_CHAW4_D5",[["pop_esposas",2,1]]],["EF_BLT_M1B",[]],["mochila_mediana",[["pop_Ganzua",1,1],["pop_vendas_c",3,1],["pop_kiwi",5,1],["pop_esposas",4,1],["pop_csi",1,1],["pop_iphone",1,1],["RH_15Rnd_9x19_M9",17,15]]],"H_Beret_blk","G_EWK_Glasses_Cig1",[],["ItemMap","ItemGPS","","ItemCompass","Itemwatch",""]]},nil,1,true,true,"","detective"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" FUDRA .:: Asalto Geo ::.", {["ageo"] call ica_fnc_fudra},nil,1,true,true,""," (call life_coplevel) >= 6"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" FUDRA .:: Sniper Geo ::.", {["fgeo"] call ica_fnc_fudra},nil,1,true,true,""," (call life_coplevel) >= 6"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" FUDRA .:: Asalto UEI ::.", {["auei"] call ica_fnc_fudra},nil,1,true,true,""," (call life_coplevel) >= 6"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" FUDRA .:: Sniper UEI ::.", {["fuei"] call ica_fnc_fudra},nil,1,true,true,""," (call life_coplevel) >= 6"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" AntiExplosivos .::", {["explo"] call ica_fnc_fudra},nil,1,true,true,""," (call life_coplevel) >= 2"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" Control de Masas .::", {["control"] call ica_fnc_fudra},nil,1,true,true,""," (call life_coplevel) >= 4"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" FUDRA .:: Helicoptero de Asalto ::.", {["heli"] call ica_fnc_fudra},nil,1,true,true,""," (call life_coplevel) >= 6"]] remoteExec ["addAction", 0,true];
[NPC_POLICIA_DEVOLVER_ARMAS, [" FUDRA .:: Vehiculo Blindado ::.", {["veh"] call ica_fnc_fudra},nil,1,true,true,""," (call life_coplevel) >= 6"]] remoteExec ["addAction", 0,true];

};

if (_p == "ageo") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 6) exitWith {hint "No eres un miembro FUDRA."};
	if !(fudra_permitido) exitWith {hint "Aun no se ha activado el Comando Fudra"};

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Asalto GEO - Equipo FUDRA </t><br/><t size=""1"">- Lo mejor de lo Mejor - Fuerza Unica de Despliegue Rapido.</t>";

("Fuerza Unica de Despliegue Rapido") hintC [
	_paraf,
	"Esta es una fuerza de tarea especial para intervenciones rapidas en situaciones especificas:",
	"Este equipamento puede ser usado en Asalto al Banco, Casino, Banco Nacional o Alcalce, Todo tipo de Atentados y en Casos excepcionales en los que todos los miembros de la policia sean dados de baja por criminales comunes.",	
	"Esta totalmente prohibido patrullar o portar esta equipacion para situaciones ajenas a las mencionadas anteriormente.",
	"Los miembros FUDRA estan autorizados a volver a zonas donde hayan muerto solo en el caso de que no haya mas policia disponible.",
	(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

fudra_inv = getUnitLoadout player;
	
removeAllWeapons player;
removeUniform player;
removeVest player;
 
player forceAddUniform "GEO_Pop";
for "_i" from 1 to 3 do {player addItemToUniform "CUP_30Rnd_556x45_G36";};
for "_i" from 1 to 3 do {player addItemToUniform "RH_15Rnd_9x19_SIG";};
player addVest "GEO_CHALECO";
player addBackpack "mochila_mediana";
for "_i" from 1 to 20 do {player addItemToBackpack "CUP_30Rnd_556x45_G36";};
for "_i" from 1 to 10 do {player addItemToBackpack "RH_15Rnd_9x19_SIG";};
player addHeadgear "CASCO_GEO";
player addGoggles "G_Balaclava_blk";
 
player addWeapon "CUP_arifle_G36K";
player addPrimaryWeaponItem "CUP_muzzle_snds_G36_black";
player addWeapon "RH_p226";
player addHandgunItem "RH_M6X";
fudra_activado = true;
//player enableFatigue false;
sleep 2700;
hint "Has alcanzado el tiempo máximo permitido para Fudra. Equipamento restablecido";
player setUnitLoadout fudra_inv;
fudra_activado = false;
player enableFatigue true;
	
};

if (_p == "auei") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 6) exitWith {hint "No eres un miembro FUDRA."};
	

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Asalto UEI - Equipo FUDRA </t><br/><t size=""1"">- Lo mejor de lo Mejor - Fuerza Unica de Despliegue Rapido.</t>";

("Fuerza Unica de Despliegue Rapido") hintC [
	_paraf,
	"Esta es una fuerza de tarea especial para intervenciones rapidas en situaciones especificas:",
	"Este equipamento puede ser usado en Asalto al Banco, Casino, Banco Nacional o Alcalce, Todo tipo de Atentados y en Casos excepcionales en los que todos los miembros de la policia sean dados de baja por criminales comunes.",	
	"Esta totalmente prohibido patrullar o portar esta equipacion para situaciones ajenas a las mencionadas anteriormente.",
	"Los miembros FUDRA estan autorizados a volver a zonas donde hayan muerto solo en el caso de que no haya mas policia disponible.",
	(parseText "Se te retirara la ropa y chalecos que tengas ... Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

fudra_inv = getUnitLoadout player;
	
removeAllWeapons player;
removeUniform player;
removeVest player;
 
player forceAddUniform "UEI_Pop";
for "_i" from 1 to 3 do {player addItemToUniform "CUP_30Rnd_556x45_G36";};
for "_i" from 1 to 3 do {player addItemToUniform "RH_15Rnd_9x19_SIG";};
player addVest "UEI_CHALECO";
player addBackpack "mochila_mediana";
for "_i" from 1 to 20 do {player addItemToBackpack "CUP_30Rnd_556x45_G36";};
for "_i" from 1 to 10 do {player addItemToBackpack "RH_15Rnd_9x19_SIG";};
player addHeadgear "CASCO_GEO";
player addGoggles "G_Balaclava_blk";
 
comment "Add weapons";
player addWeapon "CUP_arifle_G36K";
player addPrimaryWeaponItem "CUP_muzzle_snds_G36_black";
player addWeapon "RH_p226";
player addHandgunItem "RH_M6X";
fudra_activado = true;
//player enableFatigue false;
sleep 2700;
hint "Has alcanzado el tiempo máximo permitido para Fudra. Equipamento restablecido";
player setUnitLoadout fudra_inv;
fudra_activado = false;
player enableFatigue true;	
};	

if (_p == "fgeo") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 6) exitWith {hint "No eres un miembro FUDRA."};
	

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Francotirador Geo - Equipo FUDRA </t><br/><t size=""1"">- Lo mejor de lo Mejor - Fuerza Unica de Despliegue Rapido.</t>";

("Fuerza Unica de Despliegue Rapido") hintC [
	_paraf,
	"Esta es una fuerza de tarea especial para intervenciones rapidas en situaciones especificas:",
	"Este equipamento puede ser usado en Asalto al Banco, Casino, Banco Nacional o Alcalce, Todo tipo de Atentados y en Casos excepcionales en los que todos los miembros de la policia sean dados de baja por criminales comunes.",	
	"Esta totalmente prohibido patrullar o portar esta equipacion para situaciones ajenas a las mencionadas anteriormente.",
	"Los miembros FUDRA estan autorizados a volver a zonas donde hayan muerto solo en el caso de que no haya mas policia disponible.",
	(parseText "Se te retirara la ropa y chalecos que tengas ... Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

fudra_inv = getUnitLoadout player;
	
removeAllWeapons player;
removeUniform player;
removeVest player;
 
player forceAddUniform "GEO_Pop";
for "_i" from 1 to 3 do {player addItemToUniform "RH_15Rnd_9x19_SIG";};
for "_i" from 1 to 3 do {player addItemToUniform "7Rnd_408_Mag";};
player addVest "GEO_CHALECO";
player addBackpack "mochila_mediana";
for "_i" from 1 to 10 do {player addItemToBackpack "7Rnd_408_Mag";};
player addHeadgear "CASCO_GEO";
player addGoggles "G_Balaclava_blk";

player addWeapon "srifle_LRR_F";
player addWeapon "RH_p226";
player addHandgunItem "RH_M6X";
fudra_activado = true;
//player enableFatigue false;
sleep 2700;
hint "Has alcanzado el tiempo máximo permitido para Fudra. Equipamento restablecido";
player setUnitLoadout fudra_inv;
fudra_activado = false;
player enableFatigue true;
};


if (_p == "fuei") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 6) exitWith {hint "No eres un miembro FUDRA."};
	

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Francotirador UEI - Equipo FUDRA </t><br/><t size=""1"">- Lo mejor de lo Mejor - Fuerza Unica de Despliegue Rapido.</t>";

("Fuerza Unica de Despliegue Rapido") hintC [
	_paraf,
	"Esta es una fuerza de tarea especial para intervenciones rapidas en situaciones especificas:",
	"Este equipamento puede ser usado en Asalto al Banco, Casino, Banco Nacional o Alcalce, Todo tipo de Atentados y en Casos excepcionales en los que todos los miembros de la policia sean dados de baja por criminales comunes.",	
	"Esta totalmente prohibido patrullar o portar esta equipacion para situaciones ajenas a las mencionadas anteriormente.",
	"Los miembros FUDRA estan autorizados a volver a zonas donde hayan muerto solo en el caso de que no haya mas policia disponible.",
	(parseText "Se te retirara la ropa y chalecos que tengas ... Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

fudra_inv = getUnitLoadout player;
	
removeAllWeapons player;
removeUniform player;
removeVest player;

player forceAddUniform "UEI_Pop";
for "_i" from 1 to 3 do {player addItemToUniform "RH_15Rnd_9x19_SIG";};
for "_i" from 1 to 3 do {player addItemToUniform "hlc_20rnd_762x51_b_G3";};
player addVest "UEI_CHALECO";
player addBackpack "mochila_mediana";
for "_i" from 1 to 10 do {player addItemToBackpack "7Rnd_408_Mag";};
player addHeadgear "CASCO_GEO";
player addGoggles "G_Balaclava_blk";
player addWeapon "srifle_LRR_F";
player addPrimaryWeaponItem "optic_AMS";
player addWeapon "RH_p226";
player addHandgunItem "RH_M6X";
fudra_activado = true;
//player enableFatigue false;
sleep 2700;
hint "Has alcanzado el tiempo máximo permitido para Fudra. Equipamento restablecido";
player setUnitLoadout fudra_inv;
fudra_activado = false;
player enableFatigue true;

	
};

if (_p == "heli") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 6) exitWith {hint "No eres un miembro FUDRA."};
	

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Helicoptero de Asalto - Equipo FUDRA </t><br/><t size=""1"">- Lo mejor de lo Mejor - Fuerza Unica de Despliegue Rapido.</t>";

("Fuerza Unica de Despliegue Rapido") hintC [
	_paraf,
	"Este helicoptero NO PODRA SER UTILIZADO para Espotear o ver posiciones del enemigo ... Solo para transporte ... entrada por salida, aterrizar de inmediato o explotara.:",
	(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

heli_fudra = "O_Heli_Light_02_unarmed_F" createvehicle [8490.54,6957.66,0.00143909];
clearMagazineCargoGlobal heli_fudra;
clearItemCargoGlobal heli_fudra;
clearWeaponCargoGlobal heli_fudra; 

life_vehicles pushBack heli_fudra;
[[getPlayerUID player,playerSide, heli_fudra, 1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;

heli_fudra setVariable ["selections", []];
heli_fudra setVariable ["gethit", []];
heli_fudra addEventHandler
[
	"HandleDamage",
	{
		heli_fudra = _this select 0;
		_selections = heli_fudra getVariable ["selections", []];
		_gethit = heli_fudra getVariable ["gethit", []];
		_selection = _this select 1;
		if !(_selection in _selections) then
		{
			_selections set [count _selections, _selection];
			_gethit set [count _gethit, 0];
		};
		_i = _selections find _selection;
		_olddamage = _gethit select _i;
		_damage = _olddamage + ((_this select 2) - _olddamage) * 0.5;
		_gethit set [_i, _damage];
		_damage;
	}
];

sleep 2700;
hint "Has alcanzado el tiempo máximo permitido para Fudra. Helicoptero destruido para evitar que caiga en manos enemigas.";
heli_fudra setDamage 1;


	
};


if (_p == "veh") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 6) exitWith {hint "No eres un miembro FUDRA."};
	

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> Vehiculo de Asalto - Equipo FUDRA </t><br/><t size=""1"">- Lo mejor de lo Mejor - Fuerza Unica de Despliegue Rapido.</t>";

("Fuerza Unica de Despliegue Rapido") hintC [
	_paraf,
	"Este vehiculo NO PODRA SER UTILIZADO para Espotear o ver posiciones del enemigo ... Solo para transporte ... entrada por salida, entrar a la zona y salir de inmediato o explotara.:",
	(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

veh_fudra = "pop_InsurgentCivil" createvehicle [8490.54,6957.66,0.00143909];
clearMagazineCargoGlobal veh_fudra;
clearItemCargoGlobal veh_fudra;
clearWeaponCargoGlobal veh_fudra; 

life_vehicles pushBack veh_fudra;
[[getPlayerUID player,playerSide, veh_fudra, 1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;

veh_fudra setVariable ["selections", []];
veh_fudra setVariable ["gethit", []];
veh_fudra addEventHandler
[
	"HandleDamage",
	{
		veh_fudra = _this select 0;
		_selections = veh_fudra getVariable ["selections", []];
		_gethit = veh_fudra getVariable ["gethit", []];
		_selection = _this select 1;
		if !(_selection in _selections) then
		{
			_selections set [count _selections, _selection];
			_gethit set [count _gethit, 0];
		};
		_i = _selections find _selection;
		_olddamage = _gethit select _i;
		_damage = _olddamage + ((_this select 2) - _olddamage) * 0.5;
		_gethit set [_i, _damage];
		_damage;
	}
];

sleep 2700;
hint "Has alcanzado el tiempo máximo permitido para Fudra. Blindado destruido para evitar que caiga en manos enemigas.";
veh_fudra setDamage 1;


	
};


if (_p == "explo") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 2) exitWith {hint "No tienes el rango necesario."};
	

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> AntiExplosivos </t><br/><t size=""1"">- La vida es solo un regalo que ofrecer a los que servimos.</t>";

("División anti-Explosivos") hintC [
	_paraf,
	"Equipamento necesario para desactivar todo tipo de explosivos, incluyendo Bombas, C4 y Chalecos Explosivos.",
	(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

fudra_inv = getUnitLoadout player;
	
removeAllWeapons player;
removeUniform player;
removeVest player;

player setUnitLoadout [[],[],["R3F_PAMAS","","","",["R3F_15Rnd_9x19_PAMAS",15],[],""],["U_bombsuit",[["26_cartridge",5,10],["pop_vendas_c",4,1],["pop_esposas",1,1]]],["pop_chaleco_polcient",[]],["mochila_mediana",[["R3F_15Rnd_9x19_PAMAS",14,15],["pop_vendas_c",4,1],["pop_llaves",1,1],["pop_esposas",3,1],[["Taser_26","","","",[],[],""],1]]],"H_Bombsuit_Helmet","",[],["ItemMap","ItemGPS","","ItemCompass","Itemwatch",""]];

fudra_activado = true;

		accion_desarmar = player addAction ["Desarmar Chaleco Bomba",{
		player removeAction accion_desarmar;
		[100, "Desarmando ..."] spawn ica_fnc_barrita;
		sleep 100;
		cursorTarget setVariable["kamicaze", false,true]
		},"", 4, false, true, "", "vest cursorTarget == ""pop_chaleco_terro1"""];
		



sleep 2700;
hint "Has alcanzado el tiempo máximo permitido para Antiexplosivos.";
fudra_activado = false;

player setUnitLoadout fudra_inv;
	
};




if (_p == "control") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 4) exitWith {hint "No tienes el rango necesario."};
	

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> AntiExplosivos </t><br/><t size=""1"">- Control de Antisociales y Tácticas de Intervención Cerradas.</t>";

("División anti-Explosivos") hintC [
	_paraf,
	"Equipamento necesario para Asaltar y controlar masas en zonas Cerradas.",
	(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

fudra_inv = getUnitLoadout player;
	
removeAllWeapons player;
removeUniform player;
removeVest player;

player setUnitLoadout [["CUP_hgun_BallisticShield_Armed","","","",["CUP_15Rnd_9x19_M9",13],[],""],[],[],["CNP3_Pop",[["CUP_1Rnd_SMOKE_GP25_M",8,1],["CUP_FlareWhite_GP25_M",2,1],["SmokeShell",4,1]]],["S_VHO_PV_OD1",[["CUP_1Rnd_SMOKE_GP25_M",3,1],["CUP_FlareWhite_GP25_M",6,1],["SmokeShell",1,1]]],["mochila_mediana",[["pop_vendas_c",8,1],["pop_llaves",1,1],["pop_esposas",4,1],["26_cartridge",5,10],["SmokeShell",4,1],["CUP_15Rnd_9x19_M9",15,15],["CUP_IlumFlareWhite_GP25_M",5,1],[["Taser_26","","","",[],[],""],1],[["pop_porra_h","","","",[],[],""],1],[["CUP_glaunch_6G30","","","",[],[],""],1]]],"TAC_SF10H","",[],["ItemMap","ItemGPS","","ItemCompass","Itemwatch",""]];

fudra_activado = true;

sleep 2700;
hint "Has alcanzado el tiempo máximo permitido para Control de Masas.";
fudra_activado = false;

player setUnitLoadout fudra_inv;
	
};