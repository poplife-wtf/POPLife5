
/*
Sistema de experiencia
by: Icaruk edited by quick

experiencia = [1234,12,1000,0,0,0,0,0,0,0,0,0,0,0]
["menu"] call ica_fnc_exp;
*/

if (count experiencia > 1) then {
//[format[" ---> pongo exp en perfil exp14 %1",experiencia], player] call ica_fnc_axeLog;
profileNamespace setVariable ["a6614x6614307e",experiencia];
};
_param = _this select 0;

if (_param == "menu") exitWith {
	_idxRama = _this select 1;
	
	disableSerialization;
	createDialog "experiencia";
	_ui = uiNameSpace getVariable "experiencia";
	_listaRamas = (_ui displayCtrl 6043);
	_listaHab = (_ui displayCtrl 6044);
	_info = (_ui displayCtrl 6045);
	_sp = (_ui displayCtrl 6046);
	_energ = (_ui displayCtrl 6047);
	_boton = (_ui displayCtrl 6048);
	_listaRamas ctrlSetEventHandler ["LBSelChanged", "['rellena'] call ica_fnc_exp; "];	
	_listaHab ctrlSetEventHandler ["LBSelChanged", "['informa'] call ica_fnc_exp; "];	
	_boton ctrlEnable false;
	
	_ramas = ["Profesiones","Ilegal","Crafteo", "Medicina", "Superviviencia","Combate","Talentos","Bajos Fondos", "Crimen", "Terrorismo"];
	_data = ["tl", "ti", "cra", "med","sup","com","tal", "baj", "cri", "ter"];
	_value = [experiencia select 3, experiencia select 4, experiencia select 5, experiencia select 6, experiencia select 7, experiencia select 8,
			experiencia select 9, experiencia select 10, experiencia select 11, experiencia select 12, experiencia select 13];
	_maxLvl = [11, 6, 11, 5, 5, 7, 8, 8, 8 ,9];
	_ruta = "\pop_icons\ico\";
	_icono = ["tl", "ti", "cra", "med","sup","com","tal", "baj", "cri", "ter"];

	_idx = 0;
	lbClear _listaRamas;
	while {_idx < (count _ramas)} do {
		_listaRamas lbAdd format ["%1  (%2/%3)", _ramas select _idx, _value select _idx, _maxLvl select _idx];
		_listaRamas lbSetData [_idx, _data select _idx];
		_listaRamas lbSetValue [_idx, (_value select _idx)];
		_listaRamas lbSetPicture [_idx, _ruta + (_icono select _idx)];
		
		if ((_value select _idx) == (_maxLvl select _idx)) then {
			_listaRamas lbSetColor [_idx, [1, 0.7, 0.05, 1]];
		};
		
		_idx = _idx + 1;
	};
	if (!isNil {_idxRama}) then {
		_listaRamas lbSetCurSel _idxRama;
	} else {
		_listaRamas lbSetCurSel -1;
	};
};

if (_param == "rellena") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "experiencia";
	_listaRamas = (_ui displayCtrl 6043);
	_listaHab = (_ui displayCtrl 6044);
	_info = (_ui displayCtrl 6045);
	_sp = (_ui displayCtrl 6046);
	_energ = (_ui displayCtrl 6047);
	_boton = (_ui displayCtrl 6048);

	_idxLista = lbCurSel 6043;
	_rama = _listaRamas lbData _idxLista;
	_miNivelRama = _listaRamas lbValue _idxLista;

	if (_rama == "") exitWith {};
	
	if (_rama isEqualTo "tl") then {

		_habilidades = ["Agricultor","Basurero","Pescador","Minero","Transportista","Piloto","Tesorero","SeguridadP", "Mecanico","Taxista","Busetero"];
		_dataHab = ["tl1", "tl2", "tl3", "tl4", "tl5", "tl6", "tl7","tl8","tl9","tl10","tl11"];

		_idx = 0;
		lbClear _listaHab;
		while {_idx < (count _habilidades)} do {
			_listaHab lbAdd format [(_habilidades select _idx)];
			_listaHab lbSetData [_idx, (_dataHab select _idx)];
			if !(call compile format ["license_civ_%1",_habilidades select _idx]) then {
				_listaHab lbSetColor [_idx, [0.7,0.7,0.7,0.6]];
			} else {
				_listaHab lbSetColor [_idx, [0,0.9,0.1,1]];
			};
			
			_idx = _idx + 1;
		};
		
	} else {

		_habilidades = switch (_rama) do {

				case "ti": {["Comprar contactos","Plantar Cannabis","Transporte de Droga","Transporte de Armas","Transporte de Drogas maritimo",
							 "Transporte de Drogas aereo"]};

				case "cra": {["Ropa","Chalecos","Mochilas", "Mascaras", "Herramientas de ladron", "Chalecos Antibalas","Ropa Molona","Herramientas de crimen","Bombas","Misc","Constructor" ]};
				
				case "med": {["Curso Vendaje", "Vendas el doble de rapido",	"Analgésico", "Anestésico", "Doctor Honoris Causa"]};
			
				case "sup": {[	"Necesitas menos comida","Necesitas menos agua","Regeneras sangre","Duro de matar","Hombre de hierro"]};
				case "com": {[	"Curso defensa personal","Curso tiro 1","Curso tiro 2","Curso tiro 3","Curso tiro 4","Curso tiro 5","Tirador de Elite"]};
				case "tal": {[	"Mecanico","Ahorrador","Conductor Experto","Houdini","Como pez en el Agua","Maraton"]};

				case "baj": {["Curso de cerrajero","Curso realizar hurtos","Curso de Hacker nivel 1","Curso de Hacker nivel 2",
							"Acceso a ropa militar","Acceso a chalecos antibalas","Acceso a pistolas","Acceso a pistolas automaticas"]};

				case "cri": {["Comprar Contactos","Acceso a ropa de  mafioso","Acceso a chalecos de mafioso","Curso de Grandes Robos","Curso de Grandes Robos 2",
							"Acceso a armas mafioso","Acceso al arsenal mafioso","Sexto Sentido"]};

				case "ter": {["Comprar Contactos","Acceso a ropa terrorista","Acceso a chalecos terrorista","Curso de explosivos",
							"Acceso a chaleco bomba","Acceso a furgoneta bomba","Acceso a missiones terroristas","Acceso a armas terroristas",
							"Acceso al arsenal terrorista"]};
			};
		_dataHab = switch (_rama) do {
			case "cra": {["cra1", "cra2", "cra3", "cra4", "cra5", "cra6", "cra7", "cra8", "cra9", "cra10", "cra11"]};
			case "med": {["med1", "med2", "med3", "med4","med5"]};
			case "ti": {["ti1", "ti2", "ti3", "ti4", "ti5", "ti6", "ti7"]};
			case "tal": {["tal1", "tal2", "tal3", "tal4", "tal5", "tal6"]};
			case "sup": {["sup1", "sup2", "sup3", "sup4","sup5"]};
			case "com": {["com1", "com2", "com3","com4","com5","com6","com7"]};
			case "baj": {["baj1", "baj2", "baj3", "baj4", "baj5", "baj6", "baj7", "baj8"]};
			case "cri": {["cri1", "cri2", "cri3", "cri4", "cri5", "cri6", "cri7","cri8"]};
			case "ter": {["ter1", "ter2", "ter3", "ter4", "ter5", "ter6", "ter7", "ter8","ter9"]};
		
		};
		
		_idx = 0;
		lbClear _listaHab;
		while {_idx < (count _habilidades)} do {
			_listaHab lbAdd format [(_habilidades select _idx)];
			_listaHab lbSetData [_idx, (_dataHab select _idx)];
			if (_miNivelRama < _idx + 1) then {
				_listaHab lbSetColor [_idx, [0.7,0.7,0.7,0.6]];
			} else {
				_listaHab lbSetColor [_idx, [0,0.9,0.1,1]];
			};
			
			_idx = _idx + 1;
		};	
	
	};
	
	_listaHab lbSetCurSel -1;
	_info ctrlSetStructuredText parseText "";
	_sp ctrlSetStructuredText parseText "";
	_energ ctrlSetStructuredText parseText "";
};

if (_param == "informa") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "experiencia";
	_listaRamas = (_ui displayCtrl 6043);
	_listaHab = (_ui displayCtrl 6044);
	_info = (_ui displayCtrl 6045);
	_sp = (_ui displayCtrl 6046);
	_energ = (_ui displayCtrl 6047);
	_boton = (_ui displayCtrl 6048);

	_idxLista = lbCurSel 6044;
	_habilidad = _listaHab lbData _idxLista;
    _rama = _listaRamas lbData (lbCurSel 6043); // pillo el data de listaRamas
	
	if ((lbCurSel 6044) == -1) exitWith {};
	
	private ["_txt", "_spReq", "_energReq"];
	_txt = switch (_habilidad) do {
    
        case "tl1": {"Puedes trabajar como agicultor, un hombre rudo que soporta el sol."};
        case "tl2": {"Puedes trabajar como basurero, por algo se empieza en la vida."};
        case "tl3": {"Puedes trabajar como pescador, cuidado con los piratas."};
        case "tl4": {"Puedes trabajar como minero, aunque tengas que lavarte la cara al llegar a casa."};
        case "tl5": {"Puedes trabajar como transportista, y visitar los clubes, ya sabemos cuales."};
        case "tl6": {"Puedes trabajar como piloto, y tener bonitas azafatas a tu alrededor."};
        case "tl7": {"Puedes trabajar como buscador de tesoros, moneditas ricas ricas."};
        case "tl8": {"Puedes trabajar como seguridad privada, se nota que te gustan las porras duras."};
        case "tl9": {"Puedes trabajar como Mecanico, Podras tunear todos los coches."};
        case "tl10": {"Puedes trabajar como taxista, puedes recoger a los civiles."};
        case "tl11": {"Puedes trabajar como autobusero, esperemos que no seas un loco al volante."};
       
        case "cra1": {"Puedes fabricar ropa. Más te vale ser original."};
        case "cra2": {"Puedes fabricar un chaleco de carga. Ojo que esto no protege."};
        case "cra3": {"Puedes fabricar una mochila grande. Aquí cabe un cadáver entero."};
        case "cra4": {"Puedes fabricar máscaras, todo buen payaso necesita al menos una."};
        case "cra5": {"Puedes fabricar herramientas para robar, lo malo no es robar, es que te pillen."};
        case "cra6": {"Puedes fabricar chalecos antibalas, por si la cosa se pone chunga."};
        case "cra7": {"Puedes fabricar ropa militar, no está mal para esconderse en los arbustos."};
        case "cra8": {"Puedes fabricar herramientas de crimen, ¿dispuesto a matar?"};
        case "cra9": {"Puedes fabricar bombas, no está mal si eres fan de King Africa."};
        case "cra10": {"Puedes fabricar todos los objetos de la categoria Misc"};
        case "cra11": {"Puedes construir cosas interesantes, muy interesantes."};		
		
        case "med1": {"Puedes usar vendas, algo muy básico."};
        case "med2": {"Puedes vendar el doble de rápido, hay que taponar las tuberías rápido."};
        case "med3": {"Puedes usar tramadol."};
        case "med4": {"Puedes usar morfina. Para daños en general."};
        case "med5": {"Eres un medico profesional capaz de hacer todo lo relacionado con la medicina"};
 
        case "ti1": {"Tener contactos es bueno, hasta en el infierno."};
        case "ti2": {"Puedes plantar Cannabis, y luego fumarlo."};
        case "ti3": {"Puedes llegar muy lejos vendiendo esa harina importada."};
        case "ti4": {"Llevar armas es tu fuerte, pero con amor."};
        case "ti5": {"Tu imperio droguero se expande, ahora también por el agua."};
        case "ti6": {"Tienes todo un emporio, incluso desde los cielos controlas el reparto."};
 
        case "sup1": {"Tu metabolismo es más lento, necesitas comer menos."};
        case "sup2": {"Necesitas menos agua, ya ni sudas ni meas."};    
        case "sup3": {"Puedes regenerar sangre."};
        case "sup4": {"Te regeneras, no por completo ... pero si lo suficiente para seguir dando caña."};
        case "sup5": {"Ya no te rompes ni los brazos ni las piernas."};

		case "com1": {"Ya sabes pelear, y defenderte."};
        case "com2": {"Podrás usar las armas cortas."};    
        case "com3": {"Puedes usar todo tipo de armas."};
        case "com4": {"Curso profesional de manejo de pistolas."};
        case "com5": {"Curso profesional de manejo de subfusiles."};
        case "com6": {"Curso profesional de manejo de fusiles."};
        case "com7": {"Curso de tirador experto."};
       
		case "tal1": {"Reparas el doble de rápido y el kit te puede durar más."};
        case "tal2": {"Consumes la mitad de gasolina, ahora no tendrás que rellenar el depósito seguido."};    
        case "tal3": {"Tienes conocimientos para usar el nitro, para escapar de situaciones complicadas."};
        case "tal4": {"Tienes posibilidades de quitarte las esposas, eres Houdini."};
        case "tal5": {"(Tecla C) Te mueves como pez en el agua ... en el agua ..."};
        case "tal6": {"(Tecla C) Patitas paq las quero!... y sin fumarte el primero ."};
    

        case "baj1": {"Ahora eres cerrajero, ya puedes abrir casas."};
        case "baj2": {"Puedes realizar hurtos."};
        case "baj3": {"Ya sabes abrir el navegador, y vulnerar seguridades."};
        case "baj4": {"Ahora puedes buscar más vulnerabilidadesm eres todo un hacker."};       
        case "baj5": {"Ropa militar, solo te va a hacer falta la tienda de campaña, también chalecos antibalas."};
        case "baj6": {"Ya puedes acceder a los chalecos antibalas"};
        case "baj7": {"Ahora puedes acceder a armas, un buen ataque empieza por una buena defensa."};
        case "baj8": {"Ahora puedes acceder a armas automáticas, mucho mejor, ¿no?"};
       
        case "cri1": {"Puedes comprar contactos, la vida es más fácil si se tienen enchufes."};
        case "cri2": {"Tienes acceso a la ropa de mafia."};    
        case "cri3": {"Tienes acceso a los chalecos de mafia."};     
        case "cri4": {"Puedes hacer grandes robos."};
        case "cri5": {"Puedes hacer todos los grandes robos"};
        case "cri6": {"Puedes comprar armas de mafia."};
        case "cri7": {"Puedes acceso al arsenal mafioso."};
        case "cri8": {"Tienes un sexto sentido ... siempre que te disparen ... lastima que no para las mujeres."};
 
        case "ter1": {"Puedes comprar contactos terroristas, son la bomba."};
        case "ter2": {"Puedes comprar ropa terrorista."};
        case "ter3": {"Ahora puedes adquirir chalecos de terrorista (no son explosivos)."};
        case "ter4": {"Tienes acceso para tener explosivos."};
        case "ter5": {"Con esta habilidad puedes comprar chalecos bomba, ¡cómo te gusta esa dinamita!"};
        case "ter6": {"Con tus nuevos conocimientos eres capaz de comprar furgonetas bomba."};
        case "ter7": {"Puedes misiones de terrorista."};
        case "ter8": {"Puedes acceder a las armas cortas de terrorista"};
        case "ter9": {"Puedes acceder a todo el arsenal terrorista."};

	};	
	
	_spReq = ["sp", _habilidad] call ica_fnc_costeSP;
	_energReq = ["ene", _habilidad] call ica_fnc_costeSP;
	
	puedoAprender = true;
	_varSP = experiencia select 1;
	_varEnergia = experiencia select 2;
	_norm = "<t size='0.8' color='#FFFF00'>%1</t>";
	_roj = "<t size='1' color='#FF0000' align='center'>%1</t>";
	_ver = "<t size='1' color='#2EFE2E' align='center'>%1</t>";
	_txt1 = format [_norm, _txt];
	_txt2 = if (_spReq > _varSP) then {puedoAprender = false; format [_roj, format ["- SP %1/%2", _varSP, _spReq]]} else {format [_ver, format ["- SP %1/%2", _varSP, _spReq]]};
	_txt3 = if (_energReq > _varEnergia) then {puedoAprender = false; format [_roj, format ["- Energía %1/%2", _varEnergia, _energReq]]} else {format [_ver, format ["- Energía %1/%2", _varEnergia, _energReq]]};
	_txtfinal = _txt1 + _txt2 + _txt3;
	_info ctrlSetStructuredText parseText _txtfinal;
	//_sp ctrlSetStructuredText parseText _txt2;
	//_energ ctrlSetStructuredText parseText _txt3;

	rama = _rama;	
	spReq = _spReq;
	energReq = _energReq;
	habilidadx = _habilidad;
	
	_boton ctrlEnable true;
	_boton buttonSetAction '
		["aprende", rama, spReq, energReq, habilidadx] spawn ica_fnc_exp;
	';
};

if (_param isEqualTo "aprende") exitWith {
	disableSerialization;
	_ui = uiNameSpace getVariable "experiencia";
	_listaRamas = (_ui displayCtrl 6043);
	_boton = (_ui displayCtrl 6048);
	
	_idxLista = lbCurSel 6044;
	_miNivelRama = _listaRamas lbValue (lbCurSel 6043); // pillo valor de mi nivel en el idx de listaRamas
	_rama = _this select 1;
	_spReq = _this select 2;
	_energReq = _this select 3;
	_hab = _this select 4;
	_din = 1500 * _spReq;
		if ((npc_presidente getVariable ["decreto",0]) == 4) then {
		_din = 1000 * _spReq;
	};
	
	//diag_log format ["debug exp : %1, %2 , %3 ,%4",_idxLista,_miNivelRama,_rama,_hab];
	
	if !(puedoAprender) exitWith {hint "No reúnes los requisitos."};
	if (pop_din < _din) exitWith {hint format ["Por cada SP que gastes tienes que pagar 1500€ \nAhora necesitas %1€", _din]};
	pop_din = pop_din - _din;
	

	if (_rama isEqualTo "tl") then {
		
		switch (_hab) do {
		case "tl1" : {_handle = ["","","","Agricultor"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl2" : {_handle = ["","","","basurero"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl3" : {_handle = ["","","","pescador"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl4" : {_handle = ["","","","minero"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl5" : {_handle = ["","","","transportista"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl6" : {_handle = ["","","","piloto"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl7" : {_handle = ["","","","tesorero"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl8" : {_handle = ["","","","seguridadp"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl9" : {_handle = ["","","","mecanico"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl10" : {_handle = ["","","","taxista"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		case "tl11" : {_handle = ["","","","busetero"] spawn life_fnc_buyLicense;waitUntil {scriptDone _handle}};
		};
		
	}else{
	
		if (_idxLista > _miNivelRama) exitWith {hint "Tienes que aprender todas las habilidades anteriores para poder aprender esta."};
		if (_idxLista < _miNivelRama) exitWith {hint "Ya has aprendido eso"};	
		
	};
	// comprobador distancia universidad & Profesiones legales sin tener que aprendr el anterior
	["sp", - _spReq] spawn ica_fnc_arrayExp;
	["ene", - _energReq] spawn ica_fnc_arrayExp;
	[_rama, 1] call ica_fnc_arrayExp;
	[format ["- %1 SP", _spReq]] call ica_fnc_infolog;
	[format ["- %1 energía", _energReq]] call ica_fnc_infolog;
	["+ ¡Nueva habilidad!"] call ica_fnc_infolog;

	closeDialog 0;
	["menu", lbCurSel 6043] call ica_fnc_exp;
};


