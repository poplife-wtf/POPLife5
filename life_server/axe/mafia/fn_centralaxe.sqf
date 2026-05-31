
/*
por: Icaruk

	idcs : 11995 - 12098
	
Falta 
	- Posiciones en el mapa
	- MP
	
	
	["menu"] spawn ica_fnc_centralaxe;
	["init"] spawn ica_fnc_centralaxe; // para inicializar el loop de posiciones en el mapa

*/


_param = param [0];
_grupo = group player;
	
if (_param isEqualTo "reset") exitWith {

arrCentralaxe = [
			"Mensaje de Mafia",
			["Extorsiones 1", 				"colorRed", []], 
			["Extorsiones 2", 				"colorWhite", []], 
			["Extorsiones 3", 				"colorYellow", []], 
			["Extorsiones 4", 				"colorYellow", []], 
			["Robos 1",  				"colorPink", []], 
			["Robos 2",  				"colorGreen", []], 
			["Robos 3",  				"colorBlue", []], 
			["Robos 4",  				"colorBlack", []], 
			["Farmeo Ilegal", 	 	"colorBlue", []], 
			["Farmeo Ilegal",  			"colorRed", []], 
			["Farmeo Ilegal",  			"colorRed", []], 
			["Farmeo Ilegal",  		"colorRed", []], 
			["Chino Farmer",  			"colorRed", []], 
			["Chino Farmer",  			"colorRed", []], 
			["Chino Farmer",  		"colorRed", []], 
			["Chino Farmer",  			"colorRed", []], 
			["",  		"colorRed", []], 
			["",  			"colorRed", []], 
			["",  			"colorRed", []], 
			["",  		"colorRed", []], 
			["",  	"colorRed", []], 
			["",  		"colorRed", []], 
			["",  					"colorRed", []], 
			["",  					"colorRed", []], 
			["",  					"colorRed", []], 
			["",  					"colorRed", []], 
			["",  					"colorRed", []], 
			["",  					"colorRed", []], 
			["",  					"colorRed", []], 
			["AxEisOnTop",  		"colorRed", []]
		];
	
	_grupo setVariable ["centralaxe",arrCentralaxe,true];
	closedialog 0;
};

arrCentralaxe = _grupo getVariable "centralaxe";

	if (isNil "arrCentralaxe") then {
		["reset"] call ica_fnc_centralaxe;
		sleep 1;
	};


if (_param isEqualTo "menu") exitWith {

	disableSerialization;
	createDialog "centralaxe";

	_ui = uiNamespace getVariable "centralaxe";
	centralaxe_selec = nil;
	
	_cabeceraEditarMensaje = _ui displayCtrl 11996;
	
	_nombreMafia = 	_ui displayCtrl 9999;
	_msgDia = 	_ui displayCtrl 12000;
	_listaSG =	_ui displayCtrl 12003;
	_entrada =	_ui displayCtrl 12004; 
	_entrada2 =	_ui displayCtrl 11997; 
	_selCol =	_ui displayCtrl 12005;
	_boton =	_ui displayCtrl 12007; 
	_boton1 =	_ui displayCtrl 11999; 
	_boton2 =	_ui displayCtrl 11998; 
	_boton3 =	_ui displayCtrl 13999; 
	
	_boton3 ButtonSetAction '["reset"] call ica_fnc_centralaxe';
	
	_struct = parseText format ["<t align='center'>%1</t>", life_gangName];
	_nombreMafia ctrlSetStructuredText _struct;

	// Fila 1
	_txt1 = 	_ui displayCtrl 12009;
	_lis1 = 	_ui displayCtrl 12010;
	_bot1 = 	_ui displayCtrl 12011;
	_txt2 = 	_ui displayCtrl 12012;
	_lis2 = 	_ui displayCtrl 12013;
	_bot2 = 	_ui displayCtrl 12014;
	_txt3 = 	_ui displayCtrl 12015;
	_lis3 = 	_ui displayCtrl 12016;
	_bot3 = 	_ui displayCtrl 12017;

	// Fila 2
	_txt4 = 	_ui displayCtrl 12018;
	_lis4 = 	_ui displayCtrl 12019;
	_bot4 = 	_ui displayCtrl 12020;
	_txt5 = 	_ui displayCtrl 12021;
	_lis5 = 	_ui displayCtrl 12022;
	_bot5 = 	_ui displayCtrl 12023;
	_txt6 = 	_ui displayCtrl 12024;
	_lis6 = 	_ui displayCtrl 12025;
	_bot6 = 	_ui displayCtrl 12026;

	// Fila 3
	_txt7 = 	_ui displayCtrl 12027;
	_lis7 = 	_ui displayCtrl 12028;
	_bot7 = 	_ui displayCtrl 12029;
	_txt8 = 	_ui displayCtrl 12030;
	_lis8 = 	_ui displayCtrl 12031;
	_bot8 = 	_ui displayCtrl 12032;
	_txt9 = 	_ui displayCtrl 12033;
	_lis9 = 	_ui displayCtrl 12034;
	_bot9 = 	_ui displayCtrl 12035;

	// Fila 4
	_txt10 = 	_ui displayCtrl 12036;
	_lis10 = 	_ui displayCtrl 12037;
	_bot10 = 	_ui displayCtrl 12038;
	_txt11 = 	_ui displayCtrl 12039;
	_lis11 = 	_ui displayCtrl 12040;
	_bot11 = 	_ui displayCtrl 12041;
	_txt12 = 	_ui displayCtrl 12042;
	_lis12 = 	_ui displayCtrl 12043;
	_bot12 = 	_ui displayCtrl 12044;

	// Fila 5
	_txt13 = 	_ui displayCtrl 12045;
	_lis13 = 	_ui displayCtrl 12046;
	_bot13 = 	_ui displayCtrl 12047;
	_txt14 = 	_ui displayCtrl 12048;
	_lis14 = 	_ui displayCtrl 12049;
	_bot14 = 	_ui displayCtrl 12050;
	_txt15 = 	_ui displayCtrl 12051;
	_lis15 = 	_ui displayCtrl 12052;
	_bot15 = 	_ui displayCtrl 12053;

	// Fila 6
	_txt16 = 	_ui displayCtrl 12054;
	_lis16 = 	_ui displayCtrl 12055;
	_bot16 = 	_ui displayCtrl 12056;
	_txt17 = 	_ui displayCtrl 12057;
	_lis17 = 	_ui displayCtrl 12058;
	_bot17 = 	_ui displayCtrl 12059;
	_txt18 = 	_ui displayCtrl 12060;
	_lis18 = 	_ui displayCtrl 12061;
	_bot18 = 	_ui displayCtrl 12062;

	// Fila 7
	_txt19 = 	_ui displayCtrl 12063;
	_lis19 = 	_ui displayCtrl 12064;
	_bot19 = 	_ui displayCtrl 12065;
	_txt20 = 	_ui displayCtrl 12066;
	_lis20 = 	_ui displayCtrl 12067;
	_bot20 = 	_ui displayCtrl 12068;
	_txt21 = 	_ui displayCtrl 12069;
	_lis21 = 	_ui displayCtrl 12070;
	_bot21 = 	_ui displayCtrl 12071;

	// Fila 8
	_txt22 = 	_ui displayCtrl 12072;
	_lis22 = 	_ui displayCtrl 12073;
	_bot22 = 	_ui displayCtrl 12074;
	_txt23 = 	_ui displayCtrl 12075;
	_lis23 = 	_ui displayCtrl 12076;
	_bot23 = 	_ui displayCtrl 12077;
	_txt24 = 	_ui displayCtrl 12078;
	_lis24 = 	_ui displayCtrl 12079;
	_bot24 = 	_ui displayCtrl 12080;

	// Fila 9
	_txt25 = 	_ui displayCtrl 12081;
	_lis25 = 	_ui displayCtrl 12082;
	_bot25 = 	_ui displayCtrl 12083;
	_txt26 = 	_ui displayCtrl 12084;
	_lis26 = 	_ui displayCtrl 12085;
	_bot26 = 	_ui displayCtrl 12086;
	_txt27 = 	_ui displayCtrl 12087;
	_lis27 = 	_ui displayCtrl 12088;
	_bot27 = 	_ui displayCtrl 12089;

	// Fila 10
	_txt28 = 	_ui displayCtrl 12090;
	_lis28 = 	_ui displayCtrl 12091;
	_bot28 = 	_ui displayCtrl 12092;
	_txt29 = 	_ui displayCtrl 12093;
	_lis29 = 	_ui displayCtrl 12094;
	_bot29 = 	_ui displayCtrl 12095;
	_txt30 = 	_ui displayCtrl 12096;
	_lis30 = 	_ui displayCtrl 12097;
	_bot30 = 	_ui displayCtrl 12098;


	_botones = [
		_bot1, _bot2,  _bot3, _bot4, _bot5, _bot6, _bot7, _bot8, _bot9, _bot10,
		_bot11, _bot12, _bot13, _bot14, _bot15, _bot16, _bot17, _bot18, _bot19,	_bot20,
		_bot21, _bot22, _bot23, _bot24, _bot25, _bot26, _bot27, _bot28, _bot29, _bot30
	];

	_textos = [
		_txt1, _txt2,  _txt3, _txt4, _txt5, _txt6, _txt7, _txt8, _txt9, _txt10,
		_txt11, _txt12, _txt13, _txt14, _txt15, _txt16, _txt17, _txt18, _txt19, _txt20,
		_txt21, _txt22, _txt23, _txt24, _txt25, _txt26, _txt27, _txt28, _txt29, _txt30
	];

	_listas = [
		_lis1, _lis2,  _lis3, _lis4, _lis5, _lis6, _lis7, _lis8, _lis9, _lis10,
		_lis11, _lis12, _lis13, _lis14, _lis15, _lis16, _lis17, _lis18, _lis19, _lis20,
		_lis21, _lis22, _lis23, _lis24, _lis25, _lis26, _lis27, _lis28, _lis29, _lis30
	];

	_colores = [
		["Rojo", 		"colorRed", 	"#(argb,8,8,3)color(1,0,0,1)"],
		["Amarillo", 	"colorYellow", 	"#(argb,8,8,3)color(1,1,0,1)"],
		["Verde", 		"colorGreen", 	"#(argb,8,8,3)color(0,1,0,1)"], 
		["Azul", 		"colorBlue", 	"#(argb,8,8,3)color(0,0,1,1)"],
		["Rosa", 		"colorPink", 	"#(argb,8,8,3)color(1,0,1,1)"],
		["Negro", 		"colorBlack", 	"#(argb,8,8,3)color(0,0,0,1)"],
		["Blanco", 		"colorWhite", 	"#(argb,8,8,3)color(1,1,1,1)"]
	];
	
	
	// Config botones check y demás
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
		
		_x ctrlAddEventHandler ["ButtonClick", {
			["selec", _this select 0] call ica_fnc_centralaxe
		}];
		
	} forEach _botones;
	
	
	

	_msgDia ctrlSetStructuredText parseText format ["<t size='1.1' align='center'>%1</t>", arrCentralaxe select 0]; // mensaje del día
	_entrada2 ctrlSetText (arrCentralaxe select 0);

	
	// Relleno grupos
	for "_i" from 0 to 29 do {
		
		// Nombre
		(_textos select _i) ctrlSetStructuredText parseText format ["<t size='1.1' align='center'>%1</t>", (arrCentralaxe select (_i + 1) select 0)];
		
		
		// Color
		_color = switch (arrCentralaxe select (_i + 1) select 1) do { // convierto string de color a RGBA
			case "colorRed": 	{[1, 0, 0, 1]};
			case "colorYellow": {[1, 1, 0, 1]};	
			case "colorGreen": 	{[0, 1, 0, 1]};	
			case "colorBlue": 	{[0, 0, 1, 1]};	
			case "colorPink": 	{[1, 0, 1, 1]};
			case "colorBlack": 	{[0, 0, 0, 1]};		
			case "colorWhite": 	{[1, 1, 1, 1]};
			
			default {[1, 1, 1, 1]};
		};
		
		(_textos select _i) ctrlSetBackgroundColor _color;
		
		
		
		// Personas
		{
		
			if (isNull _x OR !(alive _x) OR !(isPlayer _x)) then {} else {
				
				(_listas select _i) lbAdd (_x getVariable ["realname",name _x]); 
			
			};
			
		} forEach (arrCentralaxe select (_i + 1) select 2); // personas
	};
	
	// relleno panel de colores
	{
		_selCol lbAdd (_x select 0);
		_selCol lbSetData [_forEachIndex, _x select 1];
		_selCol lbSetPicture [_forEachIndex, _x select 2];
		_selCol lbSetPictureColor [_forEachIndex, [1,1,1,1]];
		_selCol lbSetPictureColorSelected [_forEachIndex, [1,1,1,1]];
	} forEach _colores;
	
	
	// Acción del botón de aplicar grupo
	_boton1 ctrlAddEventHandler ["ButtonClick", {
		
		_ui = uiNamespace getVariable "centralaxe";
		_entrada = _ui displayCtrl 12004;
		_selCol = _ui displayCtrl 12005;
		_txt1 = 	_ui displayCtrl 12009;
		_txt2 = 	_ui displayCtrl 12012;
		_txt3 = 	_ui displayCtrl 12015;
		_txt4 = 	_ui displayCtrl 12018;
		_txt5 = 	_ui displayCtrl 12021;
		_txt6 = 	_ui displayCtrl 12024;
		_txt7 = 	_ui displayCtrl 12027;
		_txt8 = 	_ui displayCtrl 12030;
		_txt9 = 	_ui displayCtrl 12033;
		_txt10 = 	_ui displayCtrl 12036;
		_txt11 = 	_ui displayCtrl 12039;
		_txt12 = 	_ui displayCtrl 12042;
		_txt13 = 	_ui displayCtrl 12045;
		_txt14 = 	_ui displayCtrl 12048;
		_txt15 = 	_ui displayCtrl 12051;
		_txt16 = 	_ui displayCtrl 12054;
		_txt17 = 	_ui displayCtrl 12057;
		_txt18 = 	_ui displayCtrl 12060;
		_txt19 = 	_ui displayCtrl 12063;
		_txt20 = 	_ui displayCtrl 12066;
		_txt21 = 	_ui displayCtrl 12069;
		_txt22 = 	_ui displayCtrl 12072;
		_txt23 = 	_ui displayCtrl 12075;
		_txt24 = 	_ui displayCtrl 12078;
		_txt25 = 	_ui displayCtrl 12081;
		_txt26 = 	_ui displayCtrl 12084;
		_txt27 = 	_ui displayCtrl 12087;
		_txt28 = 	_ui displayCtrl 12090;
		_txt29 = 	_ui displayCtrl 12093;
		_txt30 = 	_ui displayCtrl 12096;	
		
		
		if (isNil "centralaxe_selec") exitWith {hint "No has seleccionado un grupo"};
		
		
		// Actualizo texto
		_ctrl = call compile (format ["_txt%1", centralaxe_selec]);
		
		_struct = parseText format ["<t align='center'>%1</t>", ctrlText _entrada];
		(arrCentralaxe select centralaxe_selec) set [0, ctrlText _entrada]; // lo meto en el array
		_ctrl ctrlSetStructuredText _struct;
		_grupo setVariable ["centralaxe",arrCentralaxe,true];
		
		// Actualizo color
		_idxLista = lbCurSel _selCol;
		_color = (_selCol lbData _idxLista);
		
		(arrCentralaxe select centralaxe_selec) set [1, _color];
		_grupo setVariable ["centralaxe",arrCentralaxe,true];
		
		["act"] call ica_fnc_centralaxe;
		
	}];
	
	
	// Acción del botón de aplicar mensaje
	_boton2 ctrlAddEventHandler ["ButtonClick", {
		
		_ui = uiNamespace getVariable "centralaxe";
		_entrada = _ui displayCtrl 11997;
		_msgDia = _ui displayCtrl 12000;

	
		_struct = parseText format ["<t size='1.1' align='center'>%1</t>", ctrlText _entrada];
		
		arrCentralaxe set [0, ctrlText _entrada]; // lo pongo en el array
		_msgDia ctrlSetStructuredText _struct; // lo pongo en el ctrl visualmente
		_grupo setVariable ["centralaxe",arrCentralaxe,true];
		
		
	}];	
	
	
	// Configuro permisos
	_UIDsPermitidas = []; // ["_SP_PLAYER_"];
	_nivelx = player getVariable ["mafia_rango",life_gangrank];
	
	if (_nivelx  < 2) then {
		
		_fondoDer = _ui displayCtrl 12006; // fondo de la derecha
		_cabeceraSinGrupo = _ui displayCtrl 11995; // cabecera "Sin grupo:"
		_cabeceraEditar = _ui displayCtrl 11996; // cabecera "Editar:"
		_cabeceraEditarMdB = _ui displayCtrl 12002; // cabecera "Editar mensaje de bienvenida:"
		
		
		// Desactivo y oculto cosas
		{
			_x ctrlSetFade 1;
			_x ctrlEnable false;
			_x ctrlCommit 0;			
		} forEach [_entrada, _entrada2, _boton1, _boton2, _cabeceraEditarMensaje, _cabeceraEditar, _cabeceraEditarMdB, _selCol];
		
		
		// Ajusto tamaño del fondo derecho
		_fondoDer ctrlSetPosition [ctrlPosition _cabeceraSinGrupo select 0, ctrlPosition _cabeceraSinGrupo select 1, ctrlPosition _cabeceraSinGrupo select 2, (ctrlPosition _listaSG select 3) + (ctrlPosition _cabeceraSinGrupo select 3)]; // x, y, w, h
		_fondoDer ctrlCommit 0.2;
		
	};
	
	
	
	// centralaxe_selec = 1; // empieza desde el 1
	// ["selec", _bot1] call ica_fnc_centralaxe; // selecciono el primer grupo manualmente
	["act"] call ica_fnc_centralaxe; // actualizo todo
	
};



private [
	"_msgDia", "_listaSG", "_entrada", "_entrada2", "_selCol", "_boton", "_boton1", "_boton2",
	"_txt1", "_lis1", "_bot1",
	"_txt2", "_lis2", "_bot2",
	"_txt3", "_lis3", "_bot3",
	"_txt4", "_lis4", "_bot4",
	"_txt5", "_lis5", "_bot5",
	"_txt6", "_lis6", "_bot6",
	"_txt7", "_lis7", "_bot7",
	"_txt8", "_lis8", "_bot8",
	"_txt9", "_lis9", "_bot9",
	"_txt9", "_lis9", "_bot9",
	"_txt10", "_lis10", "_bot10",
	"_txt11", "_lis11", "_bot11",
	"_txt12", "_lis12", "_bot12",
	"_txt13", "_lis13", "_bot13",
	"_txt14", "_lis14", "_bot14",
	"_txt15", "_lis15", "_bot15",
	"_txt16", "_lis16", "_bot16",
	"_txt17", "_lis17", "_bot17",
	"_txt18", "_lis18", "_bot18",
	"_txt19", "_lis19", "_bot19",
	"_txt20", "_lis20", "_bot20",
	"_txt21", "_lis21", "_bot21",
	"_txt22", "_lis22", "_bot22",
	"_txt23", "_lis23", "_bot23",
	"_txt24", "_lis24", "_bot24",
	"_txt25", "_lis25", "_bot25",
	"_txt26", "_lis26", "_bot26",
	"_txt27", "_lis27", "_bot27",
	"_txt28", "_lis28", "_bot28",
	"_txt29", "_lis29", "_bot29",
	"_txt30", "_lis30", "_bot30",
	
	"_textos", "_listas"
];


disableSerialization;
if (!isNil {uiNamespace getVariable "centralaxe"}) then {
	
	
	_ui = uiNamespace getVariable "centralaxe";

	_cabeceraEditarMensaje = _ui displayCtrl 11996;
	
	
	_msgDia = 	_ui displayCtrl 12000;
	_listaSG =	_ui displayCtrl 12003;
	_entrada =	_ui displayCtrl 12004; // entrada grupo
	_entrada2 =	_ui displayCtrl 11997; // entrada mensaje
	_selCol =	_ui displayCtrl 12005;
	_boton =	_ui displayCtrl 12007; // unirse
	_boton1 =	_ui displayCtrl 11999; // edit grupo
	_boton2 =	_ui displayCtrl 11998; // edit mensaje
	_boton3 =	_ui displayCtrl 13999; // reset	
	
	if (playerside isEqualTo WEST) then {
		_boton3 ButtonSetAction '["resetP"] call ica_fnc_centralaxe';
	} else {
		_boton3 ButtonSetAction '["resetM"] call ica_fnc_centralaxe';
	};
	
	// Fila 1
	_txt1 = 	_ui displayCtrl 12009;
	_lis1 = 	_ui displayCtrl 12010;
	_bot1 = 	_ui displayCtrl 12011;
	_txt2 = 	_ui displayCtrl 12012;
	_lis2 = 	_ui displayCtrl 12013;
	_bot2 = 	_ui displayCtrl 12014;
	_txt3 = 	_ui displayCtrl 12015;
	_lis3 = 	_ui displayCtrl 12016;
	_bot3 = 	_ui displayCtrl 12017;

	// Fila 2
	_txt4 = 	_ui displayCtrl 12018;
	_lis4 = 	_ui displayCtrl 12019;
	_bot4 = 	_ui displayCtrl 12020;
	_txt5 = 	_ui displayCtrl 12021;
	_lis5 = 	_ui displayCtrl 12022;
	_bot5 = 	_ui displayCtrl 12023;
	_txt6 = 	_ui displayCtrl 12024;
	_lis6 = 	_ui displayCtrl 12025;
	_bot6 = 	_ui displayCtrl 12026;

	// Fila 3
	_txt7 = 	_ui displayCtrl 12027;
	_lis7 = 	_ui displayCtrl 12028;
	_bot7 = 	_ui displayCtrl 12029;
	_txt8 = 	_ui displayCtrl 12030;
	_lis8 = 	_ui displayCtrl 12031;
	_bot8 = 	_ui displayCtrl 12032;
	_txt9 = 	_ui displayCtrl 12033;
	_lis9 = 	_ui displayCtrl 12034;
	_bot9 = 	_ui displayCtrl 12035;

	// Fila 4
	_txt10 = 	_ui displayCtrl 12036;
	_lis10 = 	_ui displayCtrl 12037;
	_bot10 = 	_ui displayCtrl 12038;
	_txt11 = 	_ui displayCtrl 12039;
	_lis11 = 	_ui displayCtrl 12040;
	_bot11 = 	_ui displayCtrl 12041;
	_txt12 = 	_ui displayCtrl 12042;
	_lis12 = 	_ui displayCtrl 12043;
	_bot12 = 	_ui displayCtrl 12044;

	// Fila 5
	_txt13 = 	_ui displayCtrl 12045;
	_lis13 = 	_ui displayCtrl 12046;
	_bot13 = 	_ui displayCtrl 12047;
	_txt14 = 	_ui displayCtrl 12048;
	_lis14 = 	_ui displayCtrl 12049;
	_bot14 = 	_ui displayCtrl 12050;
	_txt15 = 	_ui displayCtrl 12051;
	_lis15 = 	_ui displayCtrl 12052;
	_bot15 = 	_ui displayCtrl 12053;

	// Fila 6
	_txt16 = 	_ui displayCtrl 12054;
	_lis16 = 	_ui displayCtrl 12055;
	_bot16 = 	_ui displayCtrl 12056;
	_txt17 = 	_ui displayCtrl 12057;
	_lis17 = 	_ui displayCtrl 12058;
	_bot17 = 	_ui displayCtrl 12059;
	_txt18 = 	_ui displayCtrl 12060;
	_lis18 = 	_ui displayCtrl 12061;
	_bot18 = 	_ui displayCtrl 12062;

	// Fila 7
	_txt19 = 	_ui displayCtrl 12063;
	_lis19 = 	_ui displayCtrl 12064;
	_bot19 = 	_ui displayCtrl 12065;
	_txt20 = 	_ui displayCtrl 12066;
	_lis20 = 	_ui displayCtrl 12067;
	_bot20 = 	_ui displayCtrl 12068;
	_txt21 = 	_ui displayCtrl 12069;
	_lis21 = 	_ui displayCtrl 12070;
	_bot21 = 	_ui displayCtrl 12071;

	// Fila 8
	_txt22 = 	_ui displayCtrl 12072;
	_lis22 = 	_ui displayCtrl 12073;
	_bot22 = 	_ui displayCtrl 12074;
	_txt23 = 	_ui displayCtrl 12075;
	_lis23 = 	_ui displayCtrl 12076;
	_bot23 = 	_ui displayCtrl 12077;
	_txt24 = 	_ui displayCtrl 12078;
	_lis24 = 	_ui displayCtrl 12079;
	_bot24 = 	_ui displayCtrl 12080;

	// Fila 9
	_txt25 = 	_ui displayCtrl 12081;
	_lis25 = 	_ui displayCtrl 12082;
	_bot25 = 	_ui displayCtrl 12083;
	_txt26 = 	_ui displayCtrl 12084;
	_lis26 = 	_ui displayCtrl 12085;
	_bot26 = 	_ui displayCtrl 12086;
	_txt27 = 	_ui displayCtrl 12087;
	_lis27 = 	_ui displayCtrl 12088;
	_bot27 = 	_ui displayCtrl 12089;

	// Fila 10
	_txt28 = 	_ui displayCtrl 12090;
	_lis28 = 	_ui displayCtrl 12091;
	_bot28 = 	_ui displayCtrl 12092;
	_txt29 = 	_ui displayCtrl 12093;
	_lis29 = 	_ui displayCtrl 12094;
	_bot29 = 	_ui displayCtrl 12095;
	_txt30 = 	_ui displayCtrl 12096;
	_lis30 = 	_ui displayCtrl 12097;
	_bot30 = 	_ui displayCtrl 12098;


	_botones = [
		_bot1,
		_bot2, 
		_bot3,
		_bot4,
		_bot5,
		_bot6,
		_bot7,
		_bot8,
		_bot9,
		_bot10,
		_bot11,
		_bot12,
		_bot13,
		_bot14,
		_bot15,
		_bot16,
		_bot17,
		_bot18,
		_bot19,
		_bot20,
		_bot21,
		_bot22,
		_bot23,
		_bot24,
		_bot25,
		_bot26,
		_bot27,
		_bot28,
		_bot29,
		_bot30
	];

	_textos = [
		_txt1,
		_txt2, 
		_txt3,
		_txt4,
		_txt5,
		_txt6,
		_txt7,
		_txt8,
		_txt9,
		_txt10,
		_txt11,
		_txt12,
		_txt13,
		_txt14,
		_txt15,
		_txt16,
		_txt17,
		_txt18,
		_txt19,
		_txt20,
		_txt21,
		_txt22,
		_txt23,
		_txt24,
		_txt25,
		_txt26,
		_txt27,
		_txt28,
		_txt29,
		_txt30
	];

	_listas = [
		_lis1,
		_lis2, 
		_lis3,
		_lis4,
		_lis5,
		_lis6,
		_lis7,
		_lis8,
		_lis9,
		_lis10,
		_lis11,
		_lis12,
		_lis13,
		_lis14,
		_lis15,
		_lis16,
		_lis17,
		_lis18,
		_lis19,
		_lis20,
		_lis21,
		_lis22,
		_lis23,
		_lis24,
		_lis25,
		_lis26,
		_lis27,
		_lis28,
		_lis29,
		_lis30
	];	
};




if (_param isEqualTo "selec") exitWith {
	
	_idx = parseNumber ((ctrlClassName (_this select 1)) select [1, 4]); // elimino la primera letra: "l1b" --> "1b" // "l30b" --> "30b" y parseNumber
	_ctrl = call compile (format ["_txt%1", _idx]);
	_lista = call compile (format ["_lis%1", _idx]);
	
	
	_verde = [0.45, 1, 0, 0.4];
	
	
	
	if (isNil "centralaxe_selec") exitWith {
		centralaxe_selec = _idx;
		
		// Pinto mi selección de verde
		// _ctrl ctrlSetBackgroundColor _verde;	// ni puto caso me hace	

		// PENDIENTE if (tengo permisos)
		["act"] call ica_fnc_centralaxe;		
	};
	
	
	
	if (centralaxe_selec == _idx) then { // he vuelto a hacer click en la misma
		
		// centralaxe_selec = nil;
		
		// Pinto mi selección de negro
		_ctrl ctrlSetBackgroundColor [0,0,0,1];
		
	} else { // he hecho click en otra

		// Pinto mi antigua selección de negro
		(call compile (format ["_txt%1", centralaxe_selec])) ctrlSetBackgroundColor [0,0,0,1];
		
		// Pinto mi selección de verde
		// _ctrl ctrlSetBackgroundColor _verde;
		_lista ctrlSetBackgroundColor _verde;

		
		centralaxe_selec = _idx; // actualizo variable de lo que tengo seleccionado
	};





	// Coloco el lbCurSel que corresponde según el color del grupo
	_ui = uiNamespace getVariable "centralaxe";
	_selCol = _ui displayCtrl 12005;

	_colorActual = (arrCentralaxe select _idx select 1);
	
	_n = switch (_colorActual) do {
		case "colorRed": 	{0};
		case "colorYellow": {1};	
		case "colorGreen": 	{2};	
		case "colorBlue": 	{3};	
		case "colorPink": 	{4};
		case "colorBlack": 	{5};		
		case "colorWhite": 	{6};
		
		default {5};
	};
	
	_selCol lbSetCurSel _n;	

	
	
	["act"] call ica_fnc_centralaxe;
	
	
};



if (_param isEqualTo "act") exitWith {
	
	
	if (!isNil "centralaxe_selec") then {
		_nomG = arrCentralaxe select centralaxe_selec select 0;
		_personas = arrCentralaxe select centralaxe_selec select 2;
		
		
		// Actualizo info botón
		if (player in _personas) then {
			_boton ctrlSetText format ["DEJAR %1", _nomG];
			_boton ButtonSetAction '["pulso", false] call ica_fnc_centralaxe';	
		} else {
			_boton ctrlSetText format ["UNIRSE A %1", _nomG];
			_boton ButtonSetAction '["pulso", true] call ica_fnc_centralaxe';
		};
		
		
		// Pongo en el rscEdit el nombre del grupo seleccionado
		_entrada ctrlSetText _nomG;
		
	};


	
	// Aplico transparencia a las cabeceras
	{
		_x ctrlSetFade 0.5;
		_x ctrlCommit 0.3;
	} forEach (_textos);
	
	
	// Quito transparencia de la cabecera del grupo que he seleccionado
	if (!isNil "centralaxe_selec") then {
		_ctrl = call compile (format ["_txt%1", centralaxe_selec]);
		_ctrl ctrlSetFade 0;
		_ctrl ctrlCommit 0.3;		
	};
	
	
	
	// Actualizo info de los grupos
	{lbClear _x} forEach _listas;
	
	for "_i" from 0 to 29 do {
		
		// Nombre
		(_textos select _i) ctrlSetStructuredText parseText format ["<t size='1.1' align='center'>%1</t>", (arrCentralaxe select (_i + 1) select 0)];
		
		
		// Color
		_color = switch (arrCentralaxe select (_i + 1) select 1) do { // convierto string de color a RGBA
			case "colorRed": 	{[1, 0.15, 0.15, 1]};
			case "colorYellow": {[0.8, 0.8, 0, 1]};	
			case "colorGreen": 	{[0, 0.9, 0.2, 1]};	
			case "colorBlue": 	{[0, 0.8, 0.9, 1]};	
			case "colorPink": 	{[1, 0, 1, 1]};
			case "colorBlack": 	{[0, 0, 0, 1]};		
			case "colorWhite": 	{[1, 1, 1, 0.5]};
			
			default {[1, 1, 1, 0.5]};
		};
		
		(_textos select _i) ctrlSetBackgroundColor _color;		
		
		// Personas
		{
		
			if (isNull _x OR !(alive _x) OR !(isPlayer _x)) then {} else {
				
				(_listas select _i) lbAdd (_x getVariable ["realname",name _x]); 
			
			};

		} forEach (arrCentralaxe select (_i + 1) select 2); // personas
	};	

	
	// Actualizo gente sin grupo
	lbClear _listaSG;
	
	_arrTodos = [];
	for "_i" from 1 to (count arrCentralaxe)-1 do { // Saco lista de toda la peña metida en grupo
		_arrTodos append (arrCentralaxe select _i select 2);
	};
	
	
	{
		if ((side _x) isEqualTo (side player)) then { // si es de mi SIDE
			if !(_x in _arrTodos) then { // si está sin grupo (no grupo de arma, en el array de la centralaxe)
				_listaSG lbAdd (_x getVariable ["realname",name _x]);
			};
		};
	} forEach allPlayers;

	
	
	
	// PENDIENTE if (tengo permisos)

	// seleccionar color
	
	
};



if (_param isEqualTo "pulso") exitWith {
	
	_modo = param [1]; // true = me uno, false = me salgo
	

	if (_modo) then { // me uno
		
		if (!isNil "centralaxe_enGrupo") then { // ya estoy en grupo y me quiero unir a otro
			(arrCentralaxe select centralaxe_enGrupo select 2) deleteAt ((arrCentralaxe select centralaxe_enGrupo select 2) find player); // me salgo de mi grupo
			_grupo setVariable ["centralaxe",arrCentralaxe,true];
		};
		
		if (!isNil "centralaxe_selec") then {
			centralaxe_enGrupo = centralaxe_selec;
			(arrCentralaxe select centralaxe_selec select 2) pushBack player;
			_grupo setVariable ["centralaxe",arrCentralaxe,true];
		};
	
		
	
	} else { // me salgo
	
		centralaxe_enGrupo = nil;
		
		if (isNil "centralaxe_selec") exitWith {hint "Primero tienes que seleccionar el grupo que quieres dejar."};
		(arrCentralaxe select centralaxe_selec select 2) deleteAt ((arrCentralaxe select centralaxe_selec select 2) find player);
		
		_grupo setVariable ["centralaxe",arrCentralaxe,true];
		
	};
	
	["act"] call ica_fnc_centralaxe;
};



if (_param isEqualTo "init") exitWith {
	
	
	// Loop para obtener jugadores a mostrar en el mapa
	0 spawn {
		
		ci_mostrandoMapa = true; 	// si ponemos esto a nil para el loop
		ci_listaGente = ["colorRed", [], "colorYellow", [], "colorGreen", [], "colorBlue", [], "colorPink", [], "colorBlack", [], "colorWhite", []]; // para almacenar jugadores dentro de cada grupo de color
		
	
		while {!isNil "ci_mostrandoMapa"} do {
			
			for "_i" from 1 to (count arrCentralaxe)-1 do {
				_grupo = arrCentralaxe select _i; // arrBando tiene elementos como este --> ["NombreGrupo", "colorRed", [tio1, tio2...]]
				_color = _grupo select 1;
				_arrGente = _grupo select 2;
				
				_idx = switch (_color) do { // elijo posición en el array según el color
					case "colorRed": 	{0};
					case "colorYellow": {1};	
					case "colorGreen": 	{2};	
					case "colorBlue": 	{3};	
					case "colorPink": 	{4};
					case "colorBlack": 	{5};		
					case "colorWhite": 	{6};
					
					default {6};
				};
				

				if (count _arrGente > 0) then { // si hay alguien en el grupo
					ci_listaGente set [_idx, (ci_listaGente select _idx) + _arrGente]; // meto a todo el grupo en su color
				};
			};
			
			
			sleep 20;
			
			ci_listaGente = nil;
			
		};		
	};
	
	
	// Loop para actualizar posiciones
	0 spawn {
		
		// ci_listaGente sería --->  ["colorRed", [], "colorYellow", [], "colorGreen", [], "colorBlue", [], "colorPink", [], "colorBlack", [], "colorWhite", []];
		
		
		_fnc_creamrk = {
			// _mrk = [obj, "colorRed"] call _fnc_creamrk;
			
			private _obj = param [0];
			private _color = param [1];
			
			private _mrk = createMarkerLocal [str _obj, getPos _obj];
			
			_mrk setMarkerTypeLocal "mil_triangle";
			_mrk setMarkerPosLocal getPos _obj;
			_mrk setMarkerSizeLocal [1,1];
			
			private _nom = name _obj;
			_mrk setMarkerTextLocal format ["%1", _nom];
			_mrk setMarkerColorLocal _color;
			
			_mrk
		};
		
		
		
		while {!isNil "ci_mostrandoMapa"} do {
			
			for "_i" from 0 to (count ci_listaGente)-1 do {
				
				_color = ci_listaGente select _i;
				_arrGente = ci_listaGente select (_i + 1);
				
				
				{
					
					
				} forEach _arrGente;
				
			
			_i = _i + 2;
			sleep 1;
			
		};

	}; // spawn -.-!
	
	
	
	}; // Aqui termina el pto spawn pto icaruk

};
