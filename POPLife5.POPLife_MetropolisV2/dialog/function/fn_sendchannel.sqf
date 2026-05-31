/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.
	
	
	Anuncio anónimo por: Icaruk
	
	se llama con:
		["anonimo"] call des_fnc_sendChannel;
*/

// ------------------------ Inicio parte Icaruk

_param = param [0, nil]; // lo llamo con ["anonimo"] call life_fnc_sendChannel;

if (!isNil {_param}) exitWith {
	uiNamespace setVariable ["anuncioAnonimo", nil];
	
	private "_str";
	
	disableSerialization;
	waitUntil {!isnull (findDisplay 9000)};

	_din = 2500;
	if ( pop_din < _din ) exitWith {hint format ["No tienes suficiente dinero, necesitas  %1", _din]};
	
	if !(life_channel_send) exitWith {hint "Tienes que esperar 10 minutos entre un anuncio y otro."};
	pop_din = pop_din - _din;

	_str = ctrlText 9001;
	
	// Empiezo encriptado del nombre del jugador
	_nombre = toLower name player; // todo  minúsculas
	_arrNombre = toArray _nombre;
	
	_arrFin = [];
	
	_rnd = 1 + round random 15;
	
	for "_i" from 0 to (count _arrNombre)-1 do {
		_sel = _arrNombre select _i;
		if (_sel  isEqualTo  241) then {_sel = 110}; // cambio la Ñ por la N

		_suma = _sel + _rnd;
		if (_suma > 122) then {_suma = _suma - 26}; // si paso de la Z empiezo desde la A
		
		_arrFin pushBack _suma;
	};
	
	_arrFin set [0, (_arrFin select 0) - 32]; // Pongo la primera en mayúsculas
	_nombre = toString _arrFin; // Junto todo y lo paso a string
	
	
	[6,format ["Anuncio de %1: %2", _nombre,_str]] remoteExec ["life_fnc_broadcast",0];
	life_channel_send = false;

	[] spawn
	{
		sleep 600;
		life_channel_send = true;
	};
};



// ------------------------  Fin parte Icaruk



private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if ( pop_din < 600 ) exitWith { systemChat "No tienes €600!"; };
//if ( playerSide != civilian ) exitWith { systemChat "Tu dois etre civile!"; }; // Hint if not civilian
if !( life_channel_send ) exitWith { systemChat "Gracias espere 10 minutos antes de enviar un mensaje diferente!"; }; //Gives Player the Hint to Wait 10 mins
pop_din = pop_din - 600;

_message = ctrlText 9001;
[6,format ["Anuncio de %1: %2",name player,_message]] remoteExec ["life_fnc_broadcast",0];
life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};