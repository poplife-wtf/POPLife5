_param = _this select 0;

if (_param isEqualTo "init") exitWith {

[[MISIONPOPTV, ["Empezar servicio de periodista",{["iniciar"] spawn ica_fnc_poptv;}]],"addAction",true,true] call BIS_fnc_MP;
[[MISIONPOPTV, ["Terminar servicio de periodista",{["terminar"] spawn ica_fnc_poptv;}]],"addAction",true,true] call BIS_fnc_MP;
[[MISIONPOPTV, ["Comprar uniforme y cámara - Coste: 250€",{["comprar"] spawn ica_fnc_poptv;}]],"addAction",true,true] call BIS_fnc_MP;

};


if (_param isEqualTo "iniciar") exitWith {
if (playerSide == WEST)exitWith{hint "Ya eres policía y tienes trabajo, acaparador!";};
if (player getVariable ["trabajo_poptv",false])exitWith{hint "Ya estás de servicio."};
if !(license_civ_periodista) exitWith {hint "No tienes la licencia de periodista oficial"};
	
player setVariable["trabajo_poptv", true,true];

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center"">PopTV News - </t><br/><t size=""1"">Estimado periodista, su labor es peligrosa y arriesgada pero muy necesaria, las personas de Metrópolis tienen derecho a la información.</t>";

("SUMARIO") hintC [
	_paraf,
	"Estás obligado a mantener el uniforme y la cámara mientras estés de servicio.",
	"Si incias transmisión en vivo no puedes pausarla o detenerla hasta acabada totalmente la misma.",
	"No puedes tomar partido, eres totalmente neutral. Tu deber es solo opinar.",
	(parseText "Para mas información, diríjase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
sleep 2;
if (isNil "pop_tv1") exitWith { pop_tv1 = player;publicVariable "pop_tv1"; 
		poptv_accionCamara1 = player addAction ["Iniciar Transmisión Satelital", {
		if (!((["Mr_Camera_News"] call ica_fnc_tengo) >= 1)) exitWith {hint "Adivina qué te hace falta... Ah, sí! es un cámara."};
		null = [[monitor1,monitor2,monitor3],["pop_tv1","pop_tv2","pop_tv3"]] execVM "\AxE\feedInit.sqf";
		}];
};
if (isNil "pop_tv2") exitWith { pop_tv2 = player;publicVariable "pop_tv2"; 
		poptv_accionCamara2 = player addAction ["Iniciar Transmisión Satelital", {
		if (!((["Mr_Camera_News"] call ica_fnc_tengo) >= 1)) exitWith {hint "Adivina qué te hace falta... Ah, sí! es un cámara."};
		null = [[monitor1,monitor2,monitor3],["pop_tv1","pop_tv2","pop_tv3"]] execVM "\AxE\feedInit.sqf";
		}];
};
if (isNil "pop_tv3") exitWith { pop_tv3 = player;publicVariable "pop_tv3"; 
		poptv_accionCamara3 = player addAction ["Iniciar Transmisión Satelital", {
		if (!((["Mr_Camera_News"] call ica_fnc_tengo) >= 1)) exitWith {hint "Adivina qué te hace falta... Ah, sí! es un cámara."};
		null = [[monitor1,monitor2,monitor3],["pop_tv1","pop_tv2","pop_tv3"]] execVM "\AxE\feedInit.sqf";
		}];
};
hint "No hay más cupos disponibles para periodistas POPTV. Solo se permiten 3.";
};



if (_param isEqualTo "terminar") exitWith {
if (playerSide == WEST)exitWith{hint "Ya eres policía y tienes trabajo, acaparador!";};
if !(player getVariable ["trabajo_poptv",false])exitWith{hint "No estás de servicio..."};

player setVariable["trabajo_poptv", false,true];
  

titleText["Servicio finalizado, puedes seguir con tu vida.", "PLAIN"];

if !(isNil {poptv_accionCamara1}) then {
pop_tv1 = ObjNull;
null = [[monitor1,monitor2,monitor3],["pop_tv1","pop_tv2","pop_tv3"]] execVM "\AxE\feedInit.sqf";
player removeAction poptv_accionCamara1;
};
if !(isNil {poptv_accionCamara2}) then {
pop_tv2 = ObjNull;
null = [[monitor1,monitor2,monitor3],["pop_tv1","pop_tv2","pop_tv3"]] execVM "\AxE\feedInit.sqf";
player removeAction poptv_accionCamara2;
};
if !(isNil {poptv_accionCamara3}) then {
pop_tv3 = ObjNull;
null = [[monitor1,monitor2,monitor3],["pop_tv1","pop_tv2","pop_tv3"]] execVM "\AxE\feedInit.sqf";
player removeAction poptv_accionCamara3;
};
};


if (_param isEqualTo "comprar") exitWith {
if (playerSide == WEST)exitWith{hint "Ya eres policía y tienes trabajo, acaparador!";};
if !(player getVariable ["trabajo_poptv",false])exitWith{hint "No estás de servicio."};


  if (pop_din < 250) exitwith {hint "El uniforme y arma reglamentaria cuestan 250€"};
  pop_din = pop_din - 250;


removeAllWeapons player;
removeAllItems player;

removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "POPTV_Pop";
player addVest "V_Press_F";
player addBackpack "mochila_mediana";
player addItemToBackpack "Tape_F";
player addHeadgear "H_Cap_press";
player addGoggles "TAC_PMC_ID_W2";
player addWeapon "Mr_Camera_News";



  	

titleText["Uniforme y cámara comprados y equipados.", "PLAIN"];

};