
private ["_vehiculo","_playersEnBus","_haciendoparada","_nbPlayerEntra","_posIni","_distDrecorrido","_distancia","_precioM","_upp","_ui","_progreso","_pgText","_cP","_nbPlayerSale","_gana","_salario","_strPlayerEntraBus","_elFulano"];
if (playerSide == WEST)exitWith{hint "Policia en autobus?";};
if (!license_civ_busetero) exitWith {hint "Amigo no tienes licencia para transporte público ... ";};
_haciendoparada = player getVariable "parada_bus_activa";
if (isNil "_haciendoparada") then {_haciendoparada = 0;};
if (_haciendoparada > 0) exitWith {hint "Y tu ?? No estabas haciendo ya una parada ? ... ";};


	_enServicio = false;
	if(player in BUS_Conductores) then
	{
		_enServicio = true;
	};

	if(!_enServicio) exitWith {hint "No has entrado en servicio aún, entonces a quien le pagarán los pasajeros por el servicio ? registrate en la empresa de transporte!";};
	bus_loop1 = true;
	if (enturnoBus) exitWith {};
	enturnoBus = true;	

	_vehiculo = vehicle player;

	if(player == driver _vehiculo) then {hint "Ya comienza vuestro turno !! Buen servicio.";};

	while {bus_loop1} do
	{
		if (!alive player OR isNull _vehiculo OR !alive _vehiculo OR player != driver _vehiculo) exitWith {hint "Has abandonado el vehiculo, este tramo no se te pagará.";bus_loop1 = false;};

		_playersEnBus = crew _vehiculo;

		_strPlayerEntraBus = format["Pasajeros transportados este tramo.<br/>"];

		{
			_elFulano = format["<t color='#BC1B1B'> %1 </t> <br/>", _x getVariable["realname",name _x]];
			_strPlayerEntraBus = _strPlayerEntraBus + _elFulano;  
		} forEach _playersEnBus;

		hintSilent parseText _strPlayerEntraBus;										

		_nbPlayerEntra = count _playersEnBus;  						
		_posIni = getPos player;
		_distDrecorrido = 500;										
		_distancia = 0;
		_precioM = 0.48; 											

		disableSerialization;													
		5 cutRsc ["life_progress","PLAIN"];
		_upp = "Debes recorrer para paga: 500m";
		_ui = uiNameSpace getVariable "life_progress";
		_progreso = _ui displayCtrl 38201; 
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%1",_upp]; 
		_progreso progressSetPosition 0.01;
		_cP = 0.01;
		while {bus_loop1} do
		{	
			if (!alive player OR isNull _vehiculo OR !alive _vehiculo) exitWith {bus_loop1 = false;};
			if (_distancia > _distDrecorrido) exitWith {
			
				bus_loop1 = false;

				if (!alive player OR isNull _vehiculo OR !alive _vehiculo) exitWith {};

				_nbPlayerSale = count crew _vehiculo;
				if(_nbPlayerSale >= _nbPlayerEntra) then {_gana = _nbPlayerEntra;}
				else {_gana = _nbPlayerSale;};

				_salario = _gana * (_distDrecorrido * _precioM);
				if (_salario > 2500) then {
				_salario = 2500;
				_gana = 2500;
				};
				pop_din = pop_din + _salario;
				["exp",1] call ica_fnc_arrayexp;
				hint format["Usted ha recorrido %1m con %2 passagero(s), Has ganado muy merecidamente $%3",_distDrecorrido,_gana - 1,_salario];
				enturnoBus = false;
			
			};
			if (vehicle player == player) exitWith {bus_loop1 = false;};

			/*accionparadabus = player addAction ["Hacer Parada de Bus",{
			player removeAction accionparadabus;
			[""] spawn ica_fnc_bus_paradeBuses;
			},nil,1.5,true,true,"","[""passshelter"",str (cursorObject)] call ica_fnc_inString"];*/

			_i = 0; 
			sleep 0.5;
			_distancia = _posIni distance player;						
			_cP = _distancia / _distDrecorrido;
			_progreso progressSetPosition _cP;

		};
		enturnoBus = false;
		5 cutText ["","PLAIN"]; 												

		
	};