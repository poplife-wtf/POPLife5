
/*
por: Icaruk
	
	["initser"] spawn ica_fnc_pandemia;			// init servidor
	["initcli"] spawn ica_fnc_pandemia;			// init cliente
	
	["recolecta", "className"] spawn ica_fnc_pandemia;	// recolección de plantas
	
	["cura_h"] spawn ica_fnc_pandemia;			// abre menu
	["deteccion"] spawn ica_fnc_pandemia;		// detección con item
	["deteccion", true] spawn ica_fnc_pandemia; // detección en hospital
	
*/


_param = param [0];


if (_param  isEqualTo  "initser") exitWith {


	recetas_pandemia = [];
	_posiblesColores = ["roja", "verd", "azul", "amar", "rosa", "mora", "nara", "marr", "negr"];

	_rnd = {selectRandom _posiblesColores};
	
 	while {count recetas_pandemia < 9} do {
		recetas_pandemia pushBackUnique [call _rnd, call _rnd, call _rnd];
		
		sleep 0.05;
	};

	plantas_pandemia = []; 
			
			_class = [
				"pop_flower_roja",
				"pop_flower_verd",
				"pop_flower_azul",
				"pop_flower_amar",
				"pop_flower_rosa",
				"pop_flower_mora",
				"pop_flower_nara",
				"pop_flower_marr",
				"pop_flower_negr"
			];
			
			_ciudad = selectRandom [
				[8401.43,6443.08,0], //Metropolis
				[4872.96,2821.22,0], //Morrison
				[8401.43,6443.08,0], //New Horizon	
				[6539.86,3774.74,0]	//Diablos
			];

				{
					_pos = (selectBestPlaces [_ciudad, 800, "1 - (sea + 0.5) - houses - trees", 100, 1]) select 0 select 0; 
					_obj = _x createVehicle _pos;
					plantas_pandemia pushBack _obj;
				} forEach _class;

	
	while {true} do {
		
		sleep (60 * 15);
		
		_rnd = ceil random 100;
		
		if (_rnd > 75) then {
		
		if ({side _x  isEqualTo  INDEPENDENT} count playableUnits < 5) exitWith {};		
			

			enfermedad_pandemia = selectRandom [
				"infirmum",
				"labecula",	
				"amissio",	
				"tantibus"	
			];
			publicVariable "enfermedad_pandemia";
			
			if (_ciudad isEqualto [8401.43,6443.08,0]) then {ciudad_pandemia = "Metropolis"; publicVariable "ciudad_pandemia"};
			if (_ciudad isEqualto [4872.96,2821.22,0]) then {ciudad_pandemia = "Morrison"; publicVariable "ciudad_pandemia"};
			if (_ciudad isEqualto [8401.43,6443.08,0]) then {ciudad_pandemia = "NewHorizon"; publicVariable "ciudad_pandemia"};
			if (_ciudad isEqualto [6539.86,3774.74,0]) then {ciudad_pandemia = "Diablos"; publicVariable "ciudad_pandemia"};
			cura_pandemia = ceil random 9;
			publicVariable "cura_pandemia";
			
			_tioarr = nearestObjects [_ciudad, ["CAManBase"], 1000];
			_tio = _tioarr select 0;
			if(isNil "_tio") exitWith {};
			if(isNull _tio) exitWith {};			
			_tio setVariable ["enfermedad", enfermedad_pandemia, true];
			{profileNamespace setVariable ["enfermedad",enfermedad_pandemia]} remoteExec ["BIS_fnc_spawn",_tio];
			["enfermo", enfermedad_pandemia] remoteExec ["ica_fnc_pandemia", _tio];		
		};
	};
};



if (_param  isEqualTo  "enfermo") exitWith {
	
	_enfermedad = param [1];
	if (isNil "_enfermedad") exitWith {};
	if (playerSide  isEqualTo  independent) exitWith {};
	if (uniform player isEqualTo "POP_CHAW2_D") exitWith {};
	_arrSintomas = switch (_enfermedad) do {
		case "infirmum": 	{["mareo", "tos", "temblor"]};
		case "labecula": 	{["luzmolesta", "desmayo", "sangrados"]};
		case "amissio": 	{["borroso", "desmayo", "fracturas"]};
		case "tantibus": 	{["tos", "temblor", "alucinacion"]};
		
	};
	
	
	while {true} do {
	
		if (playerSide  isEqualTo  independent) exitWith {};
		if (goggles player isEqualTo "Masque_Chirurgical") exitWith {};
		if (isNil {player getVariable "enfermedad"}) exitWith {};
		if (!alive player) exitWith {
			player setVariable ["enfermedad", nil, true];
		};
		
		// síntoma
		_sintoma = selectRandom _arrSintomas;
		["sintoma", _sintoma] call ica_fnc_pandemia;
		
		
		// contagio
		if ((ceil random 100) < 15) then { // tiro los dados
			
			_tio = nearestObjects [player, ["CAManBase"], 7]; // array de personas cercanas
			if (count _tio > 0) then { // si hay alguien, hago random
				_tio = selectRandom _tio;
			};
			
			_enfermedad = player getVariable ["enfermedad",nil]; // mi enfermedad
			
			// le contagio
			_tio setVariable ["enfermedad", _enfermedad, true]; 
			["enfermo", _enfermedad] remoteExec ["ica_fnc_pandemia", _tio];			
			
		};
		
		sleep round (random 100 + (60 * 5));	
	};	
	
};



if (_param  isEqualTo  "sintoma") exitWith {

	_sintoma = param [1];
	
	switch (_sintoma) do {
		
		case "mareo": {
			
			if (vehicle player != player) then {				// Dentro de veh
				addCamShake [7, 15, 0.2];
				setCamShakeParams [0, 0.5, 2, 3.5, true];
			};
			if (isNull objectParent player) then {				// A pata
				addCamShake [20, 15, 0.2];						// fuerza, dur, freq
				setCamShakeParams [0.05, 2.5, 2.5, 4, true]; 	// pos, ver, hor, lat, interpol
			};
		};
		
		case "temblor": {
			addCamShake [0.7, 20, 15];
			setCamShakeParams [0, 0.5, 0.5, 0.5, true];				
		};

		case "borroso": {

			private _fx = ppEffectCreate ["DynamicBlur", 10];
			_fx ppEffectEnable true;
			_fx ppEffectAdjust [1.1];
			_fx ppEffectCommit 2;
			
			sleep 2;
			
			_fx ppEffectAdjust [0.8];
			_fx ppEffectCommit 2;
			
			sleep 2;
			
			_fx ppEffectAdjust [0.6];
			_fx ppEffectCommit 2;
			
			sleep 2;
			
			_fx ppEffectAdjust [0.4];
			_fx ppEffectCommit 2;
			
			sleep 2;
			
			_fx ppEffectAdjust [0.1];
			_fx ppEffectCommit 2;
			
			sleep 2;
			
			ppEffectDestroy _fx;
		};
		
		case "tos": {
			
			addCamShake [5, 4, 4];
			setCamShakeParams [0, 10, 1, 0.7, true];
			_tipo = ["tos1", "tos2", "tos3", "tos4"] call BIS_fnc_selectRandom;
			[[player, _tipo], "life_fnc_say3D",true,false,false] call BIS_fnc_MP;	
		};

		case "desmayo": {
		[player, true] spawn ica_fnc_inconsciente;	
		};

		case "alucinacion": {
			
			private _fx = ppEffectCreate ["ChromAberration", 10];
			_fx ppEffectEnable true;
			_fx ppEffectAdjust [0.125, 0.125, true]; 
			_fx ppEffectCommit 2;
			
			sleep 6;
			
			_fx ppEffectAdjust [0.05, 0.005, true]; 
			_fx ppEffectCommit 5;
			
			sleep 4;
			
			ppEffectDestroy _fx;		
		};

		case "luzmolesta": {
	private _fx = ppEffectCreate ["colorCorrections", 10]; 
   _fx ppEffectEnable true; 
   _fx ppEffectAdjust [ 
    1, 0.75, 0,  
    [0.8,0.9,1,-0.1],  
    [1,1,1,2.2],  
    [-0.5,0,-1,5] 
   ]; 
   _fx ppEffectCommit 5;  
 
   sleep 5; 
    
   _fx ppEffectAdjust [ 
    1, 0.75, 0,  
    [0.8,0.9,1,-0.1],  
    [1,1,1,1],  
    [-0.5,0,-1,5] 
   ]; 
   _fx ppEffectCommit 5; 
    
   sleep 5; 
   _fx ppEffectEnable true; 
   _fx ppEffectAdjust [ 
    1, 0.75, 0,  
    [0.8,0.9,1,-0.1],  
    [1,1,1,2.2],  
    [-0.5,0,-1,5] 
   ]; 
   _fx ppEffectCommit 5;  
   sleep 5;    
   ppEffectDestroy _fx; 		
		};
		
		
	case "sangrados": {
			
		_rndsangrado = selectRandom [
			"cabeza",
			"pecho"
		];	
			[player, _rndsangrado] spawn ica_fnc_sangrando;	
	};

	case "fracturas": {
		_damageRLeg = (player getHitPointDamage "HitRightLeg") + (((player getvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]]) select 4) + 1);
		[player, _damageRLeg, "leg_r" , "bullet"] call ace_medical_fnc_addDamageToUnit;			

	};

};



if (_param  isEqualTo  "deteccion") exitWith {
	
	_hospital = param [1, false];
	

	
	_tio = (nearestObjects [player getpos [2.8, getDir player], ["CAManBase"], 3]) select 0;

	
	
	if (isNil {_tio}) exitWith {hint "El paciente no es"};
	if (isNull _tio) exitWith {hint "El paciente no existe"};
	
	["pop_prob_inv", -1] call ica_fnc_item;
	_t = 16;
	[_t, "Analizando"] spawn ica_fnc_barrita;
	
	
	// --- mov cam
	
	titleText ["", "BLACK OUT", 0.5];
	sleep 0.6;
	titleText ["", "BLACK IN", 1.6];
	
	
	// empiezo rotación
	_idx = 0;
	_grados = 360;
	_altura = 2;
	_distCam = 1.5;	

		// coloco cam inicial
	_posCam = [(_tio getPos [_distCam, _grados]) select 0, (_tio getPos [_distCam, _grados]) select 1, _altura];
	camPandemia = "camera" camCreate _posCam;
	camPandemia camSetTarget [getPos _tio select 0, getPos _tio select 1, _altura];
	camPandemia camCommit 0;
	
	showCinemaBorder false;
	camPandemia cameraEffect ["INTERNAL", "BACK"];

	
	while {_t > 0} do {
		
		_grados = _grados - 90;
		_altura = _altura - 0.4;
		
		_posCam = [(_tio getPos [_distCam, _grados]) select 0, (_tio getPos [_distCam, _grados]) select 1, _altura];
		camPandemia camsetPos _posCam;
		camPandemia camSetTarget [getPos _tio select 0, getPos _tio select 1, _altura];
		camPandemia camCommit 4;
		
		_t = _t - 4;
		
		sleep 4;
	};

	titleText ["", "BLACK OUT", 0.5];
	sleep 0.6;
	titleText ["", "BLACK IN", 1.6];
	
	camPandemia cameraEffect ["terminate","back"];
	camDestroy camPandemia;
	camPandemia = nil;

	// --- fin mov cam
	
	
	_str = if (_hospital) then {
		if (isNil {_tio getVariable "enfermedad"}) then {
			format ["<br/><t size='1.9' color='#FE9A2E'>Resultados del test completo:</t><br/>----------<br/><br/><t size='1.3' color='#80FF00'>El paciente no tiene ningún tipo de enfermedad contagiosa.</t><br/><br/>"];
		} else {		
			format ["<br/><t size='1.9' color='#FE9A2E'>Resultados del test completo:</t><br/>----------<br/><br/><t size='1.3' color='#FF0000'>El paciente está contagiado con %1.</t><br/><br/>", _tio getVariable "enfermedad"];			
		}
	} else {
		if (isNil {_tio getVariable "enfermedad"}) then {
			format ["<br/><t size='1.9' color='#FE9A2E'>Resultados del test:</t><br/>----------<br/><br/><t size='1.3' color='#80FF00'>El paciente no tiene ningún tipo de enfermedad contagiosa.</t><br/><br/>"];
		} else {		

			format ["<br/><t size='1.9' color='#FE9A2E'>Resultados del test:</t><br/>----------<br/><br/><t size='1.3' color='#FF0000'>El paciente tiene algún tipo de enfermedad contagiosa, se requiere un test en un hospital para obtener más información.</t><br/><br/>"];
		}		
	};
	
	_str2 = if (_hospital) then {
		if (isNil {_tio getVariable "enfermedad"}) then {
			false
		} else {		
			true		
		}
	} else {
		if (isNil {_tio getVariable "enfermedad"}) then {
			false
		} else {		

			true
		}		
	};
	
	hint parseText _str;
	sleep 10;
	hint format ["Se han visto plantas medicinales por ultima vez en los alrededores de %1", ciudad_pandemia];
	
};



if (_param  isEqualTo  "cura") exitWith {
	
	_quienes = nearestObjects [player, ["Man"], 3] - [player];
	
	if (count _quienes isEqualTo 0) exitWith {hint "No hay nadie cerca..."};
	if (count _quienes > 1) exitwith {hint "Hay mucha gente cerca..."};
	_tio = _quienes select 0;
	if (isNull _tio) exitWith {hint "No hay ningún paciente"};
	
	_item = param [1];
	
	if ([_item] call ica_fnc_tengo < 1) exitWith {hint "No tienes la vacuna adecuada"};
	
	_nombre = [_item] call ica_fnc_classtoname;
	[_item,-1] call ica_fnc_item;
	//player removeitem _item;
	[format ["-1 %1", _nombre]] call ica_fnc_infolog;
	hint format ["Has aplicado la %1 sobre el paciente", _nombre];
	_nItem = _item select [10, 2]; // "pop_vacuna1" ---> "1"
	_nItem = parsenumber _nItem;
	_dif = abs (_nItem - cura_pandemia) ;
	
	_efectividad = 95 - (_dif * 10);
	

	[10, "Aplicando Vacuna"] spawn ica_fnc_barrita;
	sleep 10;
	if ((ceil random 100) > _efectividad) exitWith { hint "Esta vacuna parece no tener la suficiente eficiencia en este paciente, prueba otra vez o haz otra...."}; // fracaso
	_tio setVariable ["enfermedad", nil, true];	
	{profileNamespace setVariable ["enfermedad",nil]} remoteExec ["BIS_fnc_spawn",_tio];
	hint format ["Has curado al paciente!! La receta para esta vacuna resulta ser la Vacuna %1\nPuede que alguna vez falle... Pero esta es la buena 100%", _nItem];
	["exp", 10] call ica_fnc_arrayExp; 
};

if (_param  isEqualTo  "cura_h") exitWith {
	
	//if (true) exitwith {hint "Desactivado. Usa el analisis de virus..."};
	if !(playerSide isEqualTo independent) exitWith {hint "Solo asisto a profesionales de la salud"};

	_tio = (nearestObjects [player, ["Man"], 5]) select 0;
	
	if (isNull _tio) exitWith {hint "No hay ningún paciente"};
	
		if (isNil {_tio getVariable "enfermedad"}) exitWith {
			hint "El paciente no tiene ningún tipo de enfermedad contagiosa";
		};

		hint "Especialista Epidemiologico: Dale esto y que me llame en la mañana ... ya esta curado.";
		
	_tio setVariable ["enfermedad", nil, true];	
	{profileNamespace setVariable ["enfermedad",nil]} remoteExec ["BIS_fnc_spawn",_tio];
	

};



if (_param  isEqualTo  "recolecta") exitWith {
	sleep 1;
	if (side player != INDEPENDENT) exitwith {hint "Si no sabes no toques..."};
	_plantax = param [1];
	player playmove "AinvPknlMstpSnonWrflDr_medic4";
	hint "Recolectando plantas medicinales...";
	_class = typeof _plantax;
	
	_item = format ["%1_inv", _class];
	_cant =  1 + (round random 5);
	if !(player canAdd [_item, _cant]) exitwith {hint "No tienes espacio..."};
	if (_item isEqualTo "_inv") exitwith {};
	[_item, _cant] call ica_fnc_item;
	_nombre = [_item] call ica_fnc_classtoname;
	[format ["+%1 %2",_cant, _nombre]] call ica_fnc_infolog;
	deletevehicle _plantax;
};



if (_param  isEqualTo  "menu") exitWith {

  if !(side player  isEqualTo  INDEPENDENT) exitWith { hint "Esto es solo para profesionales epidemiológicos";};

	disableSerialization;
	
	createDialog "pandemia";
	_ui = uiNamespace getVariable "pandemia";
	
	_cabecera = _ui displayCtrl 15000;
	_fondo    = _ui displayCtrl 15001;
	_boton    = _ui displayCtrl 15002;
	
	_slot1    = _ui displayCtrl 15003;
	_slot2    = _ui displayCtrl 15004;
	_slot3    = _ui displayCtrl 15005;
	
	_h1       = _ui displayCtrl 15006;
	_h2       = _ui displayCtrl 15007;
	_h3       = _ui displayCtrl 15008;
	_h4       = _ui displayCtrl 15009;
	_h5       = _ui displayCtrl 15010;
	_h6       = _ui displayCtrl 15011;
	_h7       = _ui displayCtrl 15012;
	_h8       = _ui displayCtrl 15013;
	_h9       = _ui displayCtrl 15014;
	
	_b1       = _ui displayCtrl 15015;
	_b2       = _ui displayCtrl 15016;
	_b3       = _ui displayCtrl 15017;
	_b4       = _ui displayCtrl 15018;
	_b5       = _ui displayCtrl 15019;
	_b6       = _ui displayCtrl 15020;
	_b7       = _ui displayCtrl 15021;
	_b8       = _ui displayCtrl 15022;
	_b9       = _ui displayCtrl 15023;
	
	_p1		  = _ui displayCtrl 15024;
	_p2		  = _ui displayCtrl 15025;
	_p3		  = _ui displayCtrl 15026;
	_p4		  = _ui displayCtrl 15027;


	{
		_x ctrlSetText "#(argb,8,8,3)color(0,0,0,0.6)";
	} forEach [_slot1, _slot2, _slot3];

	_pic1 = ["pop_flower_roja_inv"] call ica_fnc_classToPic;
	_pic2 = ["pop_flower_verd_inv"] call ica_fnc_classToPic;
	_pic3 = ["pop_flower_azul_inv"] call ica_fnc_classToPic;
	_pic4 = ["pop_flower_amar_inv"] call ica_fnc_classToPic;	
	_pic5 = ["pop_flower_mora_inv"] call ica_fnc_classToPic;
	_pic6 = ["pop_flower_nara_inv"] call ica_fnc_classToPic;
	_pic7 = ["pop_flower_marr_inv"] call ica_fnc_classToPic;	
	_pic8 = ["pop_flower_negr_inv"] call ica_fnc_classToPic;	
	_pic9 = ["pop_flower_rosa_inv"] call ica_fnc_classToPic;
	
	_h1 ctrlSetText _pic1;
	_h2 ctrlSetText _pic2;
	_h3 ctrlSetText _pic3;
	_h4 ctrlSetText _pic4;
	_h5 ctrlSetText _pic5;
	_h6 ctrlSetText _pic6;
	_h7 ctrlSetText _pic7;
	_h8 ctrlSetText _pic8;
	_h9 ctrlSetText _pic9;

	seleccionados_pandemia = [];
	mezcla_pandemia = [];
	

	_posFondo = ctrlPosition _fondo;
	_posBoton = ctrlPosition _boton;
	posH1 = ctrlPosition _h1;
	posH2 = ctrlPosition _h2;
	posH3 = ctrlPosition _h3;
	posH4 = ctrlPosition _h4;
	posH5 = ctrlPosition _h5;
	posH6 = ctrlPosition _h6;
	posH7 = ctrlPosition _h7;
	posH8 = ctrlPosition _h8;
	posH9 = ctrlPosition _h9;
	posSlot1 = ctrlPosition _slot1;
	posSlot2 = ctrlPosition _slot2;
	posSlot3 = ctrlPosition _slot3;
	

	{
		_x ctrlSetPosition [(ctrlPosition _x) select 0, (ctrlPosition _x) select 1, 0, (ctrlPosition _x) select 3];
		_x ctrlCommit 0;		
	} forEach [_fondo, _boton];
	
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
	} forEach [_h1, _h2, _h3, _h4, _h5, _h6, _h7, _h8, _h9];
	

	_fondo ctrlSetPosition _posFondo;
	_boton ctrlSetPosition _posBoton;
	{_x ctrlCommit 0.6} forEach [_fondo, _boton];
	
	

	

	_boton buttonSetAction '["reset"] spawn ica_fnc_pandemia; ';
	_p1 ctrlSetEventHandler ["MouseButtonDown", "['eligeEnfermedad', 0] spawn ica_fnc_pandemia; "];
	_p2 ctrlSetEventHandler ["MouseButtonDown", "['eligeEnfermedad', 1] spawn ica_fnc_pandemia; "];
	_p3 ctrlSetEventHandler ["MouseButtonDown", "['eligeEnfermedad', 2] spawn ica_fnc_pandemia; "];
	_p4 ctrlSetEventHandler ["MouseButtonDown", "['eligeEnfermedad', 3] spawn ica_fnc_pandemia; "];
	
};



private ["_cabecera", "_fondo", "_boton", "_slot1", "_slot2", "_slot3", "_h1", "_h2", "_h3", "_h4", "_h5", "_h6", "_h7", "_h8", "_h9", "_b1", "_b2", "_b3", "_b4", "_b5", "_b6", "_b7", "_b8", "_b9", "_p1", "_p2", "_p3", "_p4"];
if (dialog) then {
	
	disableSerialization;
	_ui = uiNamespace getVariable "pandemia";
	
	_cabecera = _ui displayCtrl 15000;
	_fondo    = _ui displayCtrl 15001;
	_boton    = _ui displayCtrl 15002;
	
	_slot1    = _ui displayCtrl 15003;
	_slot2    = _ui displayCtrl 15004;
	_slot3    = _ui displayCtrl 15005;
	
	_h1       = _ui displayCtrl 15006;
	_h2       = _ui displayCtrl 15007;
	_h3       = _ui displayCtrl 15008;
	_h4       = _ui displayCtrl 15009;
	_h5       = _ui displayCtrl 15010;
	_h6       = _ui displayCtrl 15011;
	_h7       = _ui displayCtrl 15012;
	_h8       = _ui displayCtrl 15013;
	_h9       = _ui displayCtrl 15014;
	
	_b1       = _ui displayCtrl 15015;
	_b2       = _ui displayCtrl 15016;
	_b3       = _ui displayCtrl 15017;
	_b4       = _ui displayCtrl 15018;
	_b5       = _ui displayCtrl 15019;
	_b6       = _ui displayCtrl 15020;
	_b7       = _ui displayCtrl 15021;
	_b8       = _ui displayCtrl 15022;
	_b9       = _ui displayCtrl 15023;
	
	_p1		  = _ui displayCtrl 15024;
	_p2		  = _ui displayCtrl 15025;
	_p3		  = _ui displayCtrl 15026;
	_p4		  = _ui displayCtrl 15027;
};



if (_param  isEqualTo  "fade") exitWith {
	
	_ctrl = param [1];
	_entro = param [2, true];
	
	if (_entro) then {
		
		_ctrl = switch (_ctrl) do { // paso de hitbox a visual
			case _b1: {_h1};
			case _b2: {_h2};
			case _b3: {_h3};
			case _b4: {_h4};
			case _b5: {_h5};
			case _b6: {_h6};
			case _b7: {_h7};
			case _b8: {_h8};
			case _b9: {_h9};
		};
		
		_ctrl ctrlSetFade 0;
		_ctrl ctrlCommit 0.3;
		
	} else {
		
		{
			_x ctrlSetFade 0.8;
			_x ctrlCommit 0.3
		} forEach [_h1, _h2, _h3, _h4, _h5, _h6, _h7, _h8, _h9] - seleccionados_pandemia;	
	
	};
};



if (_param  isEqualTo  "eligeEnfermedad") exitWith {
	
	_nEnfermedad = param [1];
	
	_ctrl = switch (_nEnfermedad) do {
		case 0: {_p1};
		case 1: {_p2};
		case 2: {_p3};
		case 3: {_p4};
	};
	
	_posp4 = ctrlPosition _p4;
	
	{
		_x ctrlSetPosition [-1, ctrlPosition _x select 1, ctrlPosition _x select 2, ctrlPosition _x select 3];
		_x ctrlCommit 0.8;
	} forEach ([_p1, _p2, _p3, _p4] - [_ctrl]);
	
	_ctrl ctrlSetPosition _posp4;
	_ctrl ctrlCommit 0.8;
	
	enfermedadElegida_pandemia = toLower (ctrlText _ctrl);
	
	{
		_x ctrlSetEventHandler ["MouseButtonDown", "['click', _this select 0] spawn ica_fnc_pandemia; "];
		_x ctrlSetEventHandler ["MouseEnter", "['fade', _this select 0] spawn ica_fnc_pandemia; "];
		_x ctrlSetEventHandler ["MouseExit", "['fade', nil, false] spawn ica_fnc_pandemia; "];
	} forEach [_b1, _b2, _b3, _b4, _b5, _b6, _b7, _b8, _b9];
	
	{
		_x ctrlSetFade 0.8;
		_x ctrlCommit 0.6;
		
		sleep 0.1;
	} forEach [_h1, _h2, _h3, _h4, _h5, _h6, _h7, _h8, _h9];	

};



if (_param  isEqualTo  "click") exitWith {
	
	if (count seleccionados_pandemia > 3) exitWith {};
	
	_ctrl = param [1];

	_ctrl = switch (_ctrl) do { // paso de hitbox a visual
		case _b1: {_h1};
		case _b2: {_h2};
		case _b3: {_h3};
		case _b4: {_h4};
		case _b5: {_h5};
		case _b6: {_h6};
		case _b7: {_h7};
		case _b8: {_h8};
		case _b9: {_h9};
	};
	
	// selecciono slot
	_arrSlots = [_slot1, _slot2, _slot3];
	_slot = _arrSlots select (count seleccionados_pandemia);

	// animo
	_ctrl ctrlSetPosition (ctrlPosition _slot);
	_ctrl ctrlSetFade 0;
	_ctrl ctrlCommit 0.7;

	// hint format ["select %1\narray %2", count seleccionados_pandemia, seleccionados_pandemia];
	
	// sumo
	seleccionados_pandemia pushBack _ctrl;
	_color = switch (_ctrl) do { // paso de visual a color
		case _h1: {"roja"};
		case _h2: {"verd"};
		case _h3: {"azul"};
		case _h4: {"amar"};
		case _h5: {"mora"};
		case _h6: {"nara"};
		case _h7: {"marr"};
		case _h8: {"negr"};
		case _h9: {"rosa"};
	};
	mezcla_pandemia pushBack _color;
	
	// inicio mezcla
	if (count seleccionados_pandemia >= 3) then {
		
		waitUntil {ctrlCommitted _ctrl}; // espero a que se anime el último ingrediente
		
		_ing1 = seleccionados_pandemia select 0;
		_ing2 = seleccionados_pandemia select 1;
		_ing3 = seleccionados_pandemia select 2;
		
		_ing1 ctrlSetPosition (posSlot2); // muevo slot1 y 3 al centro mientras se desvanecen
		_ing1 ctrlSetFade 1;
		_ing3 ctrlSetPosition (posSlot2);
		_ing3 ctrlSetFade 1;
		{_x ctrlCommit 10} forEach [_ing1, _ing3];
		
		sleep 5;
		if (isNil {uiNamespace getVariable "pandemia"}) exitWith {};
		if (count seleccionados_pandemia  isEqualTo  0) exitWith {};
		
		_ing2 ctrlSetFade 1; // desvanezco slot2
		_ing2 ctrlCommit 2;
		
		sleep 2;
		if (isNil {uiNamespace getVariable "pandemia"}) exitWith {};
		if (count seleccionados_pandemia  isEqualTo  0) exitWith {};
		
		_aborto = false;
		// resto items
		{
			_str = format ["pop_flower_%1_inv", _x];
			if (([_str] call ica_fnc_tengo) < 1) exitWith {_aborto = true; hint "Te falta un tipo de planta";closedialog 0;};
			player removeitem _str;
			//[_str, -1] call ica_fnc_item;
			_nombre = [_str] call ica_fnc_classtoname;
			[format ["-1 %1", _nombre]] call ica_fnc_infolog;
		} forEach mezcla_pandemia;
		sleep 1;
		if (_aborto) exitWith {/*hint "Hubo un error al fabricar la vacuna"*/};
		
		
		// pido la enfermedad que hay actualmente
		[player, ["enfermedad_pandemia"]] call ica_fnc_varToServer;
		waitUntil {recibido};
		private ["_nVacuna"];
		_nVacuna = 1 + (round random 9);
		// la comparo con la que he elegido
		if (enfermedad_pandemia != enfermedadElegida_pandemia) then
		{
			_nVacuna = 1 + round (random 9); // esta es la que tiene 0% eficacia, ahora es aleatoria
		} else 
		{
			if (isnil "cura_pandemia") then {_nVacuna = 1 + (round random 10); cura_pandemia = 1 + (round (random 9))};
			if !(isnil "cura_pandemia") then {_nVacuna = cura_pandemia;};
		};
		
		// añado item		
		_item = format ["pop_vacuna%1", _nVacuna];
		_can = 1 + (ceil random 5);
		
		if !(player canAdd ["pop_vacuna1", _can]) exitwith 
		{
			hint format ["No tienes espacio\nHabias seleccionado la pandemia : %1\nHabias seleccionado los ingredientes: %2, %3, %4", enfermedadElegida_pandemia, mezcla_pandemia select 0, mezcla_pandemia select 1, mezcla_pandemia select 2];
			closedialog 0;
			{
				_str = format ["pop_flower_%1_inv", _x];
				player additem _str;
				_nombre = [_str] call ica_fnc_classtoname;
				[format ["+1 %1", _nombre]] call ica_fnc_infolog;
			} forEach mezcla_pandemia;
		};
		[_item, _can] call ica_fnc_item;
		_nombre = [_item] call ica_fnc_classtoname;
		[format ["+%2 %1", _nombre, _can]] call ica_fnc_infolog;
		
		
		// acabo animación
		_ing2 ctrlSetFade 0; // aparece slot2
		_ing2 ctrlSetText ([_item] call ica_fnc_classToPic);
		_ing2 ctrlCommit 3;
		
		sleep 4;
		if (isNil {uiNamespace getVariable "pandemia"}) exitWith {};
		if (count seleccionados_pandemia  isEqualTo  0) exitWith {};
		
		// PENDIENTE ¿dar exp y dinero?
		
		closeDialog 0;
		enfermedadElegida_pandemia = nil;
	};
	
};



if (_param  isEqualTo  "reset") exitWith {
	
	seleccionados_pandemia = [];
	mezcla_pandemia = [];
	
	_arrCtrls = [_h1, _h2, _h3, _h4, _h5, _h6, _h7, _h8, _h9];
	_arrPosCtrls = [posH1, posH2, posH3, posH4, posH5, posH6, posH7, posH8, posH9];
	closedialog 0;
	sleep 0.25;
	["menu"] spawn ica_fnc_pandemia; 
	enfermedadElegida_pandemia = nil;
	
	
	/*for "_i" from 0 to (count _arrCtrls)-1 do {
		_ctrl = _arrCtrls select _i;
		_ctrl ctrlSetPosition (_arrPosCtrls select _i);
		_ctrl ctrlCommit 0.7;
	};*/

};
