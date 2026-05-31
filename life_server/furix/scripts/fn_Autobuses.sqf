
_Modo = _this select 0;

if (isNil "_Modo") exitWith {
hint "ERROR \n Debe introducir un parámetro de ejecución";
titleText ["By FuRixX Lamborghini", "PLAIN DOWN"];
};

switch (_Modo) do {
	case "Init": {
						

			FuRixX_Bus_Paradas = 0;
			TotalPagaFuRixX = 0;
			objetos = nearestObjects [player, [], 2000];
			cuenta = count objetos;
			cuenta = cuenta - 1;
			FuRixXBusResultado = [];
							
			progressLoadingScreen 30;
			
			while {cuenta > 0} do {
	
				hintSilent "Buscando Paradas...";
				_seleccion = objetos select cuenta;	
				_Nombreparada = (str _seleccion) splitString " .";
				_FinalNombre = _Nombreparada select 1;
				_NoSeguir = 0;
				if (isNil "_FinalNombre") then {
				_NoSeguir = 1;
				};
				if (_NoSeguir == 0) then {
				if (_FinalNombre == "tob_passshelter") then {FuRixXBusResultado pushBack _seleccion};	
				};
				cuenta = cuenta - 1;								
			};
			
	_paradasEncontradas = count FuRixXBusResultado;
	progressLoadingScreen 100;
	endLoadingScreen;
	hint format ["%1 paradas encontradas", _paradasEncontradas];	
	[parseText "<t font='PuristaBold' size='1.6'>Creado Por</t><br />FuRixX Lamborghini", [1.45,0.2,1,1],10,5,1,0] spawn BIS_fnc_textTiles; 	
		
	sleep 2;
	["Buscar"] spawn FuRixX_fnc_Autobuses;
		
};
	
	case "Buscar": {		
		if (isNil "FuRixXBusResultado") exitWith {hint "Error, primero debes buscar paradas"};
		
		_numero = selectRandom [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];
		FuRixXBusParadaSeleccionada = selectRandom FuRixXBusResultado;
		_PosicionParada = getPos FuRixXBusParadaSeleccionada;
		_DistanciaParada = round (player distance _PosicionParada);
		_Paga = _DistanciaParada * 0.6;
		
		hint "VE A LA PARADA MARCADA EN EL MAPA";
				
		
		_nombre = format ["Parada%1",_numero];
		_marcador = createMarkerLocal [_nombre, _PosicionParada];
		_marcador setMarkerTypeLocal "pop_autobus_icon";
		_marcador setMarkerSizeLocal [1,1];
		_marcador setMarkerTextLocal "PARADA";
		
		waitUntil {player distance _PosicionParada < 20};
		hint "Posicionate delante de la parada y deten el autobus";
		waitUntil {player distance _PosicionParada < 6};
		waitUntil {speed player == 0};		
		deleteMarker _marcador;
		hint "Los pasajeros de esta parada han entrado";
		
		
		TotalPagaFuRixX = TotalPagaFuRixX + _Paga; 
		FuRixX_Bus_Paradas = FuRixX_Bus_Paradas + 1;
		
		if (vehicle player != FuRixX_Bus) then {
		hint "Solo puedes recoger personas con el bus que te di, esta parada no la cobras";
		TotalPagaFuRixX = TotalPagaFuRixX - _Paga; 
		FuRixX_Bus_Paradas = FuRixX_Bus_Paradas - 1;
		};
		
		if (FuRixX_Bus_Paradas >= 10) exitWith {
		
			sleep 1;
			_mensaje = format ["Has terminado tu jornada, puede cobrar en la oficina o continuar trabajando y su paga seguirá aumentado, de momento tiene %1€ asegurados. ¿Quiere continuar trabajando?", TotalPagaFuRixX];
			_resultado = [_mensaje, "By FuRixX Lamborghini", true, true] call BIS_fnc_guiMessage;
			
			waitUntil {!isNil "_resultado"};
			FuRixX_Bus_Paradas = 0;
			
			if (_resultado) then {
				["Buscar"] spawn FuRixX_fnc_Autobuses;
			} else {
			deleteVehicle FuRixXBusFlecha;
			["FuRixXFlechaBus", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			};		
		};
		
		sleep 1;
		["Buscar"] spawn FuRixX_fnc_Autobuses;
		
	};
	
	Case "Empezar": 
	{
		if (side player != Civilian) exitWith {};
		_precio = 5000;
		if (pop_din < _precio) exitWith {hint format ["Necesitas %1€ para el prestamo del bus",_precio]};
		
		startLoadingScreen ["Cargando paradas... -- Script by FuRixX Lamborghini"];
		
		_MarcadoresCerca = ["Test1","Test2"];
		
		{
			if ((getMarkerPos _x) distance player < 300) then {
			_MarcadoresCerca pushBack _x;
			};
			
		} forEach allMapMarkers;
				
		_MarcadoresEncontradosFuRixX = count _MarcadoresCerca;
		_MarcadoresEncontradosFuRixX = _MarcadoresEncontradosFuRixX - 1;
			
		while {true} do {
			_seleccion = _MarcadoresCerca select _MarcadoresEncontradosFuRixX;
			_Prefijo = _seleccion splitString "_";
					
			if ("BusSpawn" in _Prefijo) exitWith {
						FuRixXBusSpawn = _seleccion;
			};
		};
		
		_CochesCerca = getPos (nearestObject [player, "Car"]);
		if ((getMarkerPos FuRixXBusSpawn)  distance _CochesCerca < 7) exitWith {hint "Hay un vehiculo cerca, no se pudo sacar su autobus"};
		
		
		pop_din = pop_din - _precio;
		_BusAleatorio = selectRandom ["pop_bus_p","pop_bus_p_jaune","pop_bus_p_grise","pop_bus_p_bleufonce","pop_bus_p_violet","pop_bus_p_noir","pop_bus_p_violet"];
		_Direccion = markerDir FuRixXBusSpawn;
		FuRixX_Bus = _BusAleatorio createVehicle getMarkerPos FuRixXBusSpawn;
		FuRixX_Bus setDir _Direccion;
		["Init"] spawn FuRixX_fnc_Autobuses;
		player moveInDriver FuRixX_Bus;
		["Flecha"] spawn FuRixX_fnc_Autobuses;
	};
	
	case "Flecha": 
	{
		FuRixXBusFlecha = "Sign_Arrow_Direction_Blue_F" createVehicleLocal (position FuRixX_Bus);
		FuRixXBusFlecha attachTo [FuRixX_Bus, [0,0,2.8]];

		["FuRixXFlechaBus", "onEachFrame", {
			_bus = _this select 0;
			FuRixXBusFlecha = _this select 1;
			_direccion = ((position _bus) vectorFromTo (position FuRixXBusParadaSeleccionada));	
			FuRixXBusFlecha setDir ((_direccion select 0) atan2 (_direccion select 1)) - (getDir _bus);
			if(isNull FuRixX_Bus) then { deleteVehicle FuRixXBusFlecha};
		}, [FuRixX_Bus, FuRixXBusFlecha]] call BIS_fnc_addStackedEventHandler;
	
	};
	
	case "Cobrar": {
		if (isNil "TotalPagaFuRixX") exitWith {hint "Si no trabajas no cobras"};
		if (TotalPagaFuRixX == 0) exitWith {hint "Si no trabajas no cobras"};
		if (isNil "FuRixX_Bus") exitWith {hint "Has explotado el bus, te quedas sin paga"};
		if (player distance FuRixX_Bus > 10) exitWith {hint "El bus no esta cerca, damelo o no cobras"};
		hint "Aqui tienes tu paga";
		deleteVehicle FuRixX_Bus;
		pop_din = pop_din + TotalPagaFuRixX;
		TotalPagaFuRixX = 0;
		FuRixX_Bus_Paradas = 0;
	
	};
	
	default {
	hint "ERROR \n El parámetro introducido no es válido";
	titleText ["By FuRixX Lamborghini", "PLAIN DOWN"];
	};
	

};