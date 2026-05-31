/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

*/
private ["_admin"];
_tipo = _this select 0;
_admin = false;
if (_tipo isEqualTo "mandar") exitwith
{
	_msg = _this select 1;
	_numquien = _this select 2;
	if (_numquien select [0, 5] isEqualTo "admin") then {_admin = true; _numquien = _numquien select [5, 15];};
		
	if (_numquien isEqualTo "112") exitWith {
		if (player getvariable ["msgemergencias", false]) exitwith {hint "No puedes mandar mensajes a emergencias tan continuamente. Debes esperar un rato..."};
		if (({side _x isEqualTo INDEPENDENT} count playableUnits > 0) OR ({side _x isEqualTo WEST} count playableUnits > 0)) then 
		{
			[["emer", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn",WEST];
			[["emer", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn",INDEPENDENT];
			['mensajes', 'samsung'] spawn ica_fnc_initmovil;
			player setvariable ["msgemergencias", true, true];
			sleep (60 * 5);
			player setvariable ["msgemergencias", false, true];
		} else {hint "No hay efectivos de emergencias actualmente disponibles"};
		enviando = nil;		
	};
	
	if (_numquien isEqualTo "091") exitWith {
		if (({side _x isEqualTo WEST} count playableUnits > 0)) then 
		{
			[["policia", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn",WEST];
			['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		} else {hint "No hay efectivos policiales actualmente disponibles"};	
		enviando = nil;
	};
	
	if (_numquien isEqualTo "061") exitWith {
		if ({side _x isEqualTo INDEPENDENT} count playableUnits > 0) then 
		{
			[["ems", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn",INDEPENDENT];
			['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		} else {hint "No hay efectivos medicos actualmente disponibles"};
        enviando = nil;		
	};
	
	if (_numquien isEqualTo "080") exitWith {
		if ({side _x isEqualTo INDEPENDENT} count playableUnits > 0) then 
		{
			[["bomberos", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn",INDEPENDENT];
			['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		} else {hint "No hay efectivos de bomberos actualmente disponibles"};	
		enviando = nil;
	};
	
	if (_numquien isEqualTo "040") exitWith {
		[["taxis", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn", -2];
		['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		0 spawn ica_fnc_taxi_llamada;
		enviando = nil;
	};
	
	if (_numquien isEqualTo "035") exitWith {
		[["seg", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn", -2];
		['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		enviando = nil;
	};
	
	if (_numquien isEqualTo "999") exitWith {
		[["admin", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn", -2];
		['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		enviando = nil;
	};
	
	if (_numquien isEqualTo "popfonica") exitWith {
		[["popfonica", _msg, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn", -2];
		['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		enviando = nil;
	};
	
	if (_numquien isEqualTo "glob") exitWith {
		if (player getvariable ["coolmsgglob", false]) exitwith {hint "Debes esperar 1 minuto para volver a mandar un mensaje global"};
		_msg2 =  format ["<br/><t color='#f40b0b' size='2' shadow='1'shadowColor='#b7bfd6'>~ADMINISTRACION~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'><br/></t>%1 ", _msg];
		[[_msg2], {hint parsetext (_this select 0)}] remoteExec ["BIS_fnc_spawn", -2];
		[[_msg], {[6, format ["<t color='#f40b0b' size='1.25' shadow='1'shadowColor='#b7bfd6'>ADMINISTRACION INFORMA: </t><t color='#faff00' size='0' shadow='1'shadowColor='#f61010'></t>%1 ", _this select 0]] spawn life_fnc_broadcast}] remoteExec ["BIS_fnc_spawn", -2];  
		
		player setvariable ["coolmsgglob", true, true];
		['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		enviando = nil;
		sleep (60 * 10);
		player setvariable ["coolmsgglob", nil, false];
	};
	
	if (_numquien isEqualTo "globems") exitWith {
		if (player getvariable ["coolmsgglob", false]) exitwith {hint "Debes esperar 10 minutos para volver a mandar un mensaje global"};
		_msg2 =  parsetext format ["<br/><t color='#189c1b' size='2' shadow='1'shadowColor='#b7bfd6'>~EMS INFORMA~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'><br/></t>%1 ", _msg];
		[[_msg2], {hint (_this select 0)}] remoteExec ["BIS_fnc_spawn", -2];
		[[_msg], {[6, format ["<t color='#189c1b' size='1.25' shadow='1'shadowColor='#b7bfd6'>EMS INFORMA: </t><t color='#faff00' size='0' shadow='1'shadowColor='#f61010'></t>%1 ", _this select 0]] spawn life_fnc_broadcast}] remoteExec ["BIS_fnc_spawn", -2];  
		player setvariable ["coolmsgglob", true, true];
		_var = format ["AUTOMATICO: %1 Ha mandado un mensaje global (EMS)", name player];
		[["admin", _var, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn", -2];
		['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		enviando = nil;
		sleep (60 * 5);
		player setvariable ["coolmsgglob", nil, false];
	};
	
	if (_numquien isEqualTo "globpolicia") exitWith {
		if (player getvariable ["coolmsgglob", false]) exitwith {hint "Debes esperar 10 minutos para volver a mandar un mensaje global"};
		_msg2 =  parsetext format ["<br/><t color='#084aff' size='2' shadow='1'shadowColor='#b7bfd6'>~POLICIA INFORMA~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'><br/></t>%1 ", _msg];
		[[_msg2], {hint (_this select 0)}] remoteExec ["BIS_fnc_spawn", -2];
		[[_msg], {[6, format ["<t color='#084aff' size='1.25' shadow='1'shadowColor='#b7bfd6'>POLICIA INFORMA: </t><t color='#faff00' size='0' shadow='1'shadowColor='#f61010'></t>%1 ", _this select 0]] spawn life_fnc_broadcast}] remoteExec ["BIS_fnc_spawn", -2];  
		player setvariable ["coolmsgglob", true, true];
		_var = format ["AUTOMATICO: %1 Ha mandado un mensaje global (POLICIA)", name player];
		[["admin", _var, player],{[_this select 0, _this select 1, _this select 2] spawn ica_fnc_mensajeespecial}] remoteExec ["BIS_fnc_spawn", -2];
		['mensajes', 'samsung'] spawn ica_fnc_initmovil;
		enviando = nil;
		sleep (60 * 10);
		player setvariable ["coolmsgglob", nil, false];
	};
	
	if (_numquien isEqualTo "000") exitWith {}; 
	if (_numquien isEqualTo "") exitWith {}; 	
		
	if (_admin) exitwith 
	{
		_aquien = ([_numquien] call ica_fnc_existeeltelefono);

		if (_msg isEqualTo "") exitwith {Hint "Debes escribir algo en el mensaje para poder mandarlo"};
		if (isnull (_aquien)) exitwith {hint "Imposible enviar el mensaje. Intantalo más tarde..."};

		[_msg, player, true] remoteexec ["ica_fnc_recibirmsg", _aquien];
		
		_msg2 =  parsetext format ["<br/><t color='#f40b0b' size='2' shadow='1'shadowColor='#c93c3c'>~ADMINISTRACION~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'><br/></t>%1 ", _msg];
		[[_msg2], {hint (_this select 0)}] remoteExec ["BIS_fnc_spawn", _aquien];
		enviando = nil;
	};	
	
	_aquien = ([_numquien] call ica_fnc_existeeltelefono);
	if (_numquien isEqualTo ([player] call ica_fnc_cualesmitelefono)) exitwith {hint "A ver, que estas solo, si... pero no hace falta mandarte mensajes a ti mismo..."};

	if (_msg isEqualTo "") exitwith {Hint "Debes escribir algo en el mensaje para poder mandarlo"};
	if (count _msg < 3) exitwith {Hint "Tu mensaje es muy corto. Escribe algo mas..."};
	if (isnull (_aquien)) exitwith {hint "Imposible enviar el mensaje. Intantalo más tarde..."};
	if (!(alive (_aquien)) OR (isnull (_aquien))) exitwith {hint "Error al enviar el mensaje. El telefono esta apagado o fuera de cobertura..."};

	[_msg, player, false] remoteexec ["ica_fnc_recibirmsg", _aquien];
	enviando = nil;
};

if (_tipo isEqualTo "devolver") exitwith
{
	hint "El telefono está apagado o fuera de cobertura";
	['mensajes', 'samsung'] spawn ica_fnc_initmovil;	
	enviando = nil;
};
enviando = nil;