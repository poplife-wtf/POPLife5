
/*
por: Icaruk
	["menu"] call ica_fnc_mensajesica;
*/

muestrame = {
	{
		_x ctrlShow true; _x ctrlEnable true; _x ctrlSetFade 0; _x ctrlCommit 0.5;
	} forEach _this ;
};
escondeme = {
	{
		_x ctrlShow false; _x ctrlEnable false; _x ctrlSetFade 1; _x ctrlCommit 0.5;
	} forEach _this ;
};

_param = _this select 0;

if (_param isEqualTo "recibo") exitWith {
	if (isDedicated) exitWith {};
	
	_de = name (_this select 1);
	_texto = _this select 2;
	_paraAdmin = param [3, false];
	_leoMensajeDeApagado = _this select 4;
	
	if (
		((["pop_note"] call ica_fnc_tengo) == 0) AND
		((["pop_iphone"] call ica_fnc_tengo) == 0) AND
		((["pop_nokia"] call ica_fnc_tengo) == 0)
		AND !_paraAdmin AND
		_leoMensajeDeApagado
	) exitWith {
		//["Ese teléfono está apagado o fuera de cobertura", "hint", _this select 1, false, false] call BIS_fnc_MP;
		//[["play", "MSG_SndMsgNotify3", player], "ica_fnc_SFX", _this select 1, false, false] call BIS_fnc_MP;
		["movilapagado", "ica_fnc_mensajesica", _this select 1, false, false] call BIS_fnc_MP;
	};
	
	if ((_paraAdmin) AND ((call life_adminlevel) < 1)) exitWith {};
	
	If ( _texto find "(A todos los policías)" >= 0 OR _texto find "(A todos los EMS)" >= 0 ) Then {
		["play", "MSG_SndMsgRecibir2", player] call ica_fnc_SFX ;
	} else {
		If ( _texto find "(A todos los admin)" >= 0 ) Then {
			["play", "MSG_SndMsgRecibir3", player] call ica_fnc_SFX ;
		} else {
			["play", "MSG_SndMsgRecibir1", player] call ica_fnc_SFX ;
		};
	};
	
	hint parsetext format ["<t size='1.5' color='#F7FE2E'>Mensaje de %1: <br/><br/></t>%2 ", _de, _texto];

	_miArr = profileNamespace getVariable "arraySMS";
	_miArr pushBack [_de, _texto];
	reverse _miArr;
	_miArr resize 30;
	reverse _miArr;
	profileNamespace setVariable ["arraySMS", _miArr];
};

if (_param == "movilapagado") exitWith {
	hint "Ese teléfono está apagado o fuera de cobertura";
	["play", "MSG_SndMsgNotify3", player] call ica_fnc_SFX ;
};


if (_param == "menu") then {
	disableSerialization;
	createDialog "mensajesica";
}; 


_ui = 30109;
_lista 		= findDisplay 30109 displayCtrl 7080;
_desplegable= findDisplay 30109 displayCtrl 7081;
_entrada 	= findDisplay 30109 displayCtrl 7082;
_boton 		= findDisplay 30109 displayCtrl 7083;

_imgRepli 	= findDisplay 30109 displayCtrl 1209;
_imgBack 	= findDisplay 30109 displayCtrl 1201;
_imgMsg 	= findDisplay 30109 displayCtrl 1202;
_imgCont 	= findDisplay 30109 displayCtrl 1203;
_imgCop 	= findDisplay 30109 displayCtrl 1204;
_imgEMS 	= findDisplay 30109 displayCtrl 1205;
_imgPriv 	= findDisplay 30109 displayCtrl 1207;
_imgTaxi 	= findDisplay 30109 displayCtrl 1206;
_imgAdmin 	= findDisplay 30109 displayCtrl 1208;

_butRepli 	= findDisplay 30109 displayCtrl 1602;
_butBack 	= findDisplay 30109 displayCtrl 1601;
_butMsg 	= findDisplay 30109 displayCtrl 1603;
_butCont 	= findDisplay 30109 displayCtrl 1604;
_butCop 	= findDisplay 30109 displayCtrl 1605;
_butEMS 	= findDisplay 30109 displayCtrl 1606;
_butPriv 	= findDisplay 30109 displayCtrl 1608;
_butTaxi 	= findDisplay 30109 displayCtrl 1607;
_butAdmin 	= findDisplay 30109 displayCtrl 1609;
_Tapa 		= findDisplay 30109 displayCtrl 2200;


if (_param isEqualTo "menu") exitWith {
	MyCellPhoneSelect = [];
	//_ui = uiNamespace getVariable "mensajesica";

	_butRepli 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'msg' ; ['goreply'] call ica_fnc_mensajesica; ";
	_butBack 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'bac' ; ['actualizo'] call ica_fnc_mensajesica; ";
	_butMsg 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'msg' ; ['actualizo'] call ica_fnc_mensajesica; ";
	_butCont 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'con' ; ['actualizo'] call ica_fnc_mensajesica; ";
	_butCop 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'cop' ; ['actualizo'] call ica_fnc_mensajesica; ";
	_butEMS 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'ems' ; ['actualizo'] call ica_fnc_mensajesica; ";
	_butPriv 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'sec' ; ['actualizo'] call ica_fnc_mensajesica; ";
	_butTaxi 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'tax' ; ['actualizo'] call ica_fnc_mensajesica; ";
	_butAdmin 	buttonSetAction " ['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; movilModo = 'adm' ; ['actualizo'] call ica_fnc_mensajesica; ";

	_imgRepli ctrlShow false; _butRepli ctrlShow false; _butRepli ctrlEnable false;
	_imgBack ctrlShow false; _butBack ctrlShow false; _butBack ctrlEnable false;
	_boton ctrlShow false; _boton ctrlEnable false;
	_entrada ctrlShow false; _entrada ctrlEnable false;
	_lista ctrlShow false;
	[_Tapa] call escondeme ;
	
	["play", "MSG_SndMsgClick4", player] call ica_fnc_SFX;
	//ctrlDelete _Tapa;

	_lista ctrlSetEventHandler ["LBSelChanged", "['play', 'MSG_SndClickBoton1', player] call ica_fnc_SFX ; ['miniactualizo'] call ica_fnc_mensajesica; "];
	//_desplegable ctrlSetEventHandler ["LBSelChanged", "['actualizo'] call ica_fnc_mensajesica; "];
	//_entrada ctrlSetEventHandler ["Char", "['actualizo'] call ica_fnc_mensajesica; "];
	//_modosDespl = ["Mis mensajes", "Mensaje privado", "Policía", "EMS", "Admin", "taxi", "seguridad privada"];
	// _idx = 0;
	// while {_idx < count _modosDespl} do {
		// _desplegable lbAdd (_modosDespl select _idx);
		// _desplegable lbSetData [_idx, (_modosDespl select _idx)];
		// _idx = _idx + 1;
	// };
	
};

if (_param == "miniactualizo") exitWith {
	player globalChat "miniactu";
	player globalChat movilModo;
	if (movilModo == "msg") then {
		player globalChat "mini en mis mensajes";
		[_imgRepli,_butRepli] call muestrame ;
		[_boton] call escondeme ;
		_entrada ctrlSetText format ["Mensaje de %1: - %2 ", _lista lbText (lbCurSel _lista), [_lista lbData (lbCurSel _lista), "<br/>", " "] call CBA_fnc_replace ];
		MyCellPhoneSelect = [_lista lbText (lbCurSel _lista),nil,_lista lbData (lbCurSel _lista];
		// _boton buttonSetAction ' ["envio", movilModo, MyCellPhoneSelect select 0] call ica_fnc_mensajesica; ' ;
		// _boton ctrlSetText format ["RE A %1",MyCellPhoneSelect select 0] ;
	} else {
		player globalChat "mini en contactos";
		MyCellPhoneSelect = [_lista lbText (lbCurSel _lista),_lista lbData (lbCurSel _lista,nil];
		_boton buttonSetAction ' ["envio", movilModo, MyCellPhoneSelect select 1] call ica_fnc_mensajesica; ' ;
		_boton ctrlSetText format ["ENVIAR A %1",MyCellPhoneSelect select 0] ;
	};
};

if (_param == "goreply") exitWith {
	_entrada ctrlSetText "";
	_boton ctrlSetText format ["RE A %1",_lista lbText (lbCurSel _lista)] ;
	[_boton] call muestrame ;
	ctrlSetFocus _entrada ;
};


if (_param == "actualizo") exitWith {
	_ctrlShowArray = [];
	_ctrlHideArray = [];

	If ( movilModo == "con" OR movilModo == "msg" ) Then {
		_ctrlShowArray = [_imgBack,_butBack,_lista,_entrada];
		_ctrlHideArray = [_imgMsg,_imgCont,_imgCop,_imgEMS,_imgPriv,_imgTaxi,_imgAdmin,_butMsg,_butCont,_butCop,_butEMS,_butPriv,_butTaxi,_butAdmin,_imgRepli,_butRepli];
		If ( movilModo == "msg" ) Then {
			//_ctrlShowArray pushBack _imgRepli,_butRepli;
			_ctrlHideArray pushBack _boton;
			_boton ctrlSetText "RESPONDER" ;
		} Else {
			_entrada ctrlSetText "";
			//_ctrlHideArray pushBack _imgRepli,_butRepli;
			_ctrlShowArray pushBack _boton;
			_boton ctrlSetText "NUEVO MENSAJE" ;
		};
	};
	If ( movilModo == "cop" OR movilModo == "ems" OR movilModo == "adm" OR movilModo == "tax" OR movilModo == "sec" ) Then {
		_entrada ctrlSetText "";
		_ctrlShowArray = [_imgMsg,_imgCont,_imgCop,_boton,_entrada,_imgEMS,_imgPriv,_imgTaxi,_imgAdmin,_butMsg,_butCont,_butCop,_butEMS,_butPriv,_butTaxi,_butAdmin];
		_ctrlHideArray = [_imgBack,_butBack,_imgRepli,_butRepli,_lista];
		switch (movilModo) do {
			case "cop": { _boton ctrlSetText "ENVIAR A POLICIA" };
			case "ems": { _boton ctrlSetText "ENVIAR A EMS" };
			case "adm": { _boton ctrlSetText "ENVIAR A ADMINISTRADOR" };
			case "tax": { _boton ctrlSetText "ENVIAR A TAXI" };
			case "sec": { _boton ctrlSetText "ENVIAR A S. PRIVADA" };
		};
	};
	If ( movilModo == "bac" ) Then {
		_ctrlShowArray = [_imgMsg,_imgCont,_imgCop,_imgEMS,_imgPriv,_imgTaxi,_imgAdmin,_butMsg,_butCont,_butCop,_butEMS,_butPriv,_butTaxi,_butAdmin];
		_ctrlHideArray = [_imgBack,_butBack,_imgRepli,_butRepli,_lista,_entrada,_boton];
		_boton ctrlSetText "ENVIAR" ;
	};

	_ctrlShowArray call muestrame ;
	_ctrlHideArray call escondeme ;

	//movilModo = toLower (lbData [7081, (lbCurSel 7081)]);
	// texto = ctrlText 7082; // se come el último caracter

	movilIsReply = false;



	if (movilModo == "msg") then {
		movilIsReply = true;

		lbClear _lista;
		_misMensajes = profilenamespace getVariable "arraySMS";
		reverse _misMensajes;

		_idx = 0;
		while {_idx < count _misMensajes} do {
			_lista lbAdd (_misMensajes select _idx select 0);
			_lista lbSetData [(lbSize _lista) -1, _misMensajes select _idx select 1];
			_idx = _idx + 1;
		};
		if (lbCurSel _lista != -1) then {
			_mens = (_misMensajes select (lbCurSel _lista));
			MyCellPhoneSelect = [_mens select 0,nil,_mens select 1];
			//hint parsetext format ["<t size='1.5' color='#F7FE2E'>Mensaje de %1: <br/><br/></t>%2 ", _mens select 0, _mens select 1];
			//_entrada ctrlSetText format ["<t size='1.5' color='#F7FE2E'>Mensaje de %1: <br/><br/></t>%2 ", _mens select 0, _mens select 1];
			//_entrada ctrlSetStructuredText format ["<t size='1.5' color='#F7FE2E'>Mensaje de %1: <br/><br/></t>%2 ", _mens select 0, _mens select 1];
			//_entrada ctrlSetText format ["Mensaje de %1: - %2 ", _lista lbText (lbCurSel _lista), [_lista lbData (lbCurSel _lista), "<br/>", " "] call CBA_fnc_replace ];
			["miniactualizo"] call ica_fnc_mensajesica;
		};
		reverse _misMensajes;

	};



	if (movilModo == "con") then {
		lbClear _lista;
		{
			if (alive _x && _x != player) then {
				_tipo = switch (side _x) do {
					case west: {"Pol"};
					case civilian: {"Civ"};
					case independent: {"Med"};
					case east: {"OP"};
				};
				_lista lbAdd ( format ["%1 (%2)", _x getVariable ["realname", name _x], _tipo] );
				_lista lbSetData [(lbSize _lista) -1, str (_x)];
			};
		} foreach playableUnits;

		lbSort [_lista, "ASC"];

		if (lbCurSel _lista != -1) then {
			MyCellPhoneSelect = [_lista lbText (lbCurSel _lista),_lista lbData (lbCurSel _lista,nil];
			["miniactualizo"] call ica_fnc_mensajesica;
		};

	};
	quien = switch (movilModo) do {
		case "con": { MyCellPhoneSelect select 1 };
		case "msg": { MyCellPhoneSelect select 0 };
		case "cop": {WEST};
		case "ems": {INDEPENDENT};
		case "adm": {true};
		case "tax": {true};
		case "sec": {true};
	};

	_boton buttonSetAction ' ["envio", movilModo, quien] call ica_fnc_mensajesica; ' ;
	//movilModo = nil;
};

if (_param == "envio") exitWith {
	_modo = toLower (_this select 1);
	_quien = _this select 2;
	If ( movilIsReply ) Then {
		{
			If ( name _x == _quien ) exitWith { _quien = _x ; hint str _quien }; 
		} foreach playableUnits;
	};
	_quien = if ((typeName _quien) == "STRING") then {call compile format ["%1", _quien]} else {_quien};
	texto = ctrlText _entrada;
	
	if (_modo isEqualTo "") exitWith { ["play", "MSG_SndMsgNotify3", player] call ica_fnc_SFX ; hint "No se ha podido enviar el mensaje"};
	if (!(_modo isEqualTo "adm") AND (!isNil {DDoS})) exitWith { ["play", "MSG_SndMsgNotify3", player] call ica_fnc_SFX ; hint "Parece que no funciona..."};
	
	private ["_fuera", "_leoMensajeDeApagado"];
	if (_modo isEqualTo "con") then {
		_leoMensajeDeApagado = true;
		if (isNil {_quien}) then {
			["play", "MSG_SndMsgNotify3", player] call ica_fnc_SFX ;
			hint "Destinatario inválido";
			_fuera = true;
		};
	};
	if (!isNil {_fuera}) exitWith {};
	
	if (_modo isEqualTo "cop") then {
		texto = "(A todos los policías)<br/>" + texto;
	};
	if (_modo isEqualTo "ems") then {
		texto = "(A todos los EMS)<br/>" + texto;
	};
	if (_modo isEqualTo "adm") then {
		texto = "(A todos los admin)<br/>" + texto;
	};
	if (_modo isEqualTo "tax") exitWith {
		0 spawn ica_fnc_taxi_llamada;
	};
	if (_modo isEqualTo "sec") exitWith {
		0 spawn ica_fnc_sp_llamada;
	};	
	if (isNil {_leoMensajeDeApagado}) then {_leoMensajeDeApagado = false};
	
	if (typeName _quien == "BOOL") exitWith {
		["play", "MSG_SndMsgRecibir4", player] call ica_fnc_SFX ; 
		[["recibo", player, texto, true, _leoMensajeDeApagado], "ica_fnc_mensajesica", true, false, false] call life_fnc_MP;
		closeDialog 0;
	};
	
	["play", "MSG_SndMsgRecibir4", player] call ica_fnc_SFX ; 
	[["recibo", player, texto, false, _leoMensajeDeApagado], "ica_fnc_mensajesica", _quien, false, false] call life_fnc_MP;
	closeDialog 0;
}; 


// DEBUG
/*
0 spawn {
	while {true} do {
		hint format ["Tienes seleccionado a %1", lbData [7080, (lbCurSel 7080)]];
		sleep 1;
	};
};
*/



