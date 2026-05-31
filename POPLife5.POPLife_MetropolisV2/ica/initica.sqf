/*
	por: Icaruk
*/

if (isServer) exitWith {}; // esto es para clientes


//0 spawn ica_fnc_climaCliente;
waitUntil {!isNil {experiencia}};
diag_log "################# AxE DEBUG #######################";
diag_log format["# Initica # %1", experiencia];
arrayInfo = ["", "", "", "", "", "", "", "", " POPLIFE", " v4"];
0 spawn ica_fnc_initExp;
0 spawn ica_fnc_impuestos;
["init"] call ica_fnc_comoBebo;
0 spawn ica_fnc_consumo;
//["comprobador"] spawn ica_fnc_roboNuclear;
//0 spawn ica_fnc_durodematar;
0 spawn ica_fnc_tirador;
["init"] call ica_fnc_camaras;
0 spawn ica_fnc_EH;
call ica_fnc_matriculas3D;

if (isNil {profileNamespace getVariable "arraySMS"}) then {
	_arr = []; _arr resize 30;
	profileNamespace setVariable ["arraySMS", _arr];
};

waitUntil {!isNull (uiNamespace getVariable "HUDica")};

[] call ica_fnc_initHabilidades;


arrayInfo = ["", "", "", "", "", "", "", "", "* Pop Life", "* v.server"];
if (isNil {profileNamespace getVariable "arraySMS"}) then {
	_arr = []; _arr resize 30;
	profileNamespace setVariable ["arraySMS", _arr];
};

waitUntil {!isNull (uiNamespace getVariable "HUDica")};

player addAction ["", {
	call ica_fnc_limitadorDeArmas
}, "", 0, false, true, "DefaultAction", "isNil 'puedoDisparar' "];

["recibo"] call ica_fnc_bloqueoDinero;
	
0 spawn ica_fnc_mapMarkers;


["loop"] spawn ica_fnc_posicion;

waitUntil {!isNil {heNacido}};

// ["El parche 2.06.1 contiene un cambio importante. Consulta el changelog en el foro."] spawn BIS_fnc_guiMessage;

_var = profileNameSpace getVariable "furixradical";
if(isNil {_var}) then {
	[] execVM "presentacion.sqf";
};

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
if (_this select 1 == 2) exitWith {
	[] spawn {
	waitUntil {!isNull (findDisplay 602)};
	hint "Inventario Bloqueado, abrelo con el teclado un par de veces para desbloquear ... ";
	closeDialog 0;
	sleep 1;
	waitUntil {!isNull (findDisplay 602)};
	closeDialog 0;
		};
};
  if (_this select 1 == 0 && player distance [(getPos cursorObject) select 0, (getPos cursorObject) select 1, 0] < 2 && ((["_t_",str cursorObject] call ica_fnc_inString) OR (["t_",str cursorObject] call ica_fnc_inString)) && (secondaryWeapon player)=="pop_hacha_f") exitWith {[] spawn ica_fnc_talando};
  if (_this select 1 == 0 && stance player isEqualTo "CROUCH" && (secondaryWeapon player)=="pop_pala_h") exitWith {[] spawn ica_fnc_tesoros};
  if (_this select 1 == 0 && player distance [(getPos cursorObject) select 0, (getPos cursorObject) select 1, 0] < 10 && (["mena",str cursorObject] call ica_fnc_inString) && (secondaryWeapon player)=="pop_pico_h") exitWith {
  _mineral = "";
  switch (cursorObject) do
	{ 
	case menaHierro :
		{
		_mineral = "hierro";
		};
	case menaCobre :
		{
		_mineral = "cobre";
		};
	case menaOro :
		{
		_mineral = "oro";
		};	
	case menaPlatino :
		{
		_mineral = "platino";
		};
	case menaCarbon :
		{
		_mineral = "carbon";
		};
	case menaCarbon_1 :
		{
		_mineral = "carcel";
		};			
	case menaArena :
		{
		_mineral = "arena";
		};					
	};
  ["pica",_mineral] spawn ica_fnc_picando;
 };
 if (_this select 1 == 0 && player distance [(getPos cursorObject) select 0, (getPos cursorObject) select 1, 0] < 10 && (["mena",str cursorObject] call ica_fnc_inString) && (secondaryWeapon player)=="pop_pala_h") exitWith {
 if (cursorObject == menaArena) then {  ["pica","arena"] spawn ica_fnc_picando};
 };
  if (_this select 1 == 0 && player distance [(getPos cursorObject) select 0, (getPos cursorObject) select 1, 0] < 12 && (cursorObject isKindOf "Car") && (primaryWeapon player)=="pop_extintor" && (damage cursorObject) > 0.9) exitWith {cursorObject setVariable ["apagado",1,true];[player,player,1] spawn ica_fnc_tiroAgua};
_armaactual = currentWeapon player;
_armasm = ["MeleeKatana","MeleePickaxe","MeleeHammer","MeleeHammer2","MeleeCrowbar","MeleeClub","pop_navaja","pop_porra_h"];   
if (_this select 1 isEqualTo 0 && !modoCombate && (isNull objectParent player) && _armaactual isEqualto "pop_navaja" && !dialog && ((typeOf cursorObject) in ["Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F"]) && (!alive cursorObject)) then {
    [cursorObject] spawn ica_fnc_desuello;
  };
  if (_this select 1 == 0 && modoCombate && (vehicle player == player) && _armaactual in _armasm && !dialog) then {
    ["pegar",_armaactual] spawn ica_fnc_melee;
  };

  if (_this select 1 == 0 && modoCombate && (vehicle player == player) && _armaactual isEqualTo "" && !dialog) then {
	["pego"] spawn ica_fnc_atacar;
  };
  
  if (_this select 1 == 0 && (vehicle player == player) && _armaactual isEqualTo "soplete" && !dialog && typeof cursorObject == "Land_GateB" && player distance cursorObject < 2.1) then {
unidad_soplete = player;
[unidad_soplete] remoteExec ["ica_fnc_soplete",0];
};

}];

player setvariable ["parada_bus_activa",0,true];
player setvariable ["transportando_mercancia_stock",0,true];

0 cutFadeOut 2;

0 spawn {
	uisleep 2;
	while {sincronizo} do {
		sleep (60 * 4) + round (random 120);
		call ica_fnc_sync;
	};
};

_enfermedad = profileNamespace getVariable "enfermedad";
if !(isNil {_enfermedad}) then {			
	player setVariable ["enfermedad", _enfermedad, true];
	["enfermo", _enfermedad] remoteExec ["ica_fnc_pandemia", player];
};


[] call ica_fnc_debug;

player setVariable ["uso_casa",true,true];

_tiempoT = profileNamespace getVariable "axeTtiempo";

if !(isNil "_tiempoT") then {
	if (_tiempoT > 0) then {
		["loop"] spawn ica_fnc_axeTrans;
	};
};

[] spawn
{
	waitUntil { life_session_completed };
	for "_i" from 0 to (count life_addiction)-1 do
	{
		_new = life_addiction select _i;
		if (_new > 0) then
		{
			_new = _new - 0.02;
			if (_new < 0) then { _new = 0; };
			life_addiction set [_i, _new];
			if (_new > 0 && (time - (life_used_drug select _i)) > 600) then
			{
				switch (true) do
				{
					case (_new > 0.4): { systemChat "..:: Tiemblas mucho ::."; life_drug_withdrawl = false; };
					case (_new > 0.6): { systemChat "..:: Tienes una crisis Existencialista ::.."; life_drug_withdrawl = false; };
					case (_new > 0.9):
					{
						systemChat "..:: Te sientes ansioso y tiemblas mucho ... Necesitas tu droga! ::..";
						if (!life_drug_withdrawl) then { [] spawn { while {life_drug_withdrawl} do { resetCamShake; addCamShake [1, 4, 10]; sleep 3.5; }; resetCamShake; } };
						life_drug_withdrawl = true;
					};
				};
			};
		};
	};
	sleep 240;
	life_drug_level = life_drug_level - 0.05;
	if (life_drug_level < 0) then { life_drug_level = 0; };

};	