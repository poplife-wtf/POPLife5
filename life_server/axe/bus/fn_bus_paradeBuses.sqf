private["_conductor","_auditor","_pagaxparada","_ui","_progress","_pgText","_cP","_paradaenuso","_pos"];

if (!license_civ_busetero) exitWith {hint "Amigo no tienes licencia para transporte público ... ";};
if !(isNil "enParadaDeBus") exitWith {hint "Ya estabas haciendo una parada ... terminala, o espera un tiempo."};
enParadaDeBus = true;
[] spawn {uisleep 120; enParadaDeBus = nil;};
//if(((typeOf vehicle player == "RDS_Civ_1") || (typeOf vehicle player =="RDS_Civ_2") || (typeOf vehicle player =="RDS_Bus"))) then //si es bus
//{
 player setvariable ["parada_bus_activa",1,true];
	_enServicio = false;
	if(player in BUS_Conductores) then
	{
		_enServicio = true;
	};
	// Aqui se pueden agregar excepciones que consideren para evitar
	//	if (COndicional) exitWith {hint "Tu eres tal cosa o tienes tal cosa entonces no puedes prestar el servicio pero almenos puedes manejar el bus";};
	
	if(!_enServicio) exitWith {hint "No has entrado en servicio aún, La empresa de transporte solo te pagara en paradas si te has reportado para el servicio.";};



_auditor = cursorObject; 
if (isNull _auditor) exitWith {hint "no estas cerca a una parada de autobus"};
if !(["passshelter",str (cursorObject)] call ica_fnc_inString) exitWith {hint "no estas cerca a una parada de autobus"};
_posparada = getPos (_auditor);
_metros =  player distance _posparada;
_conductor = player;

	if(side _conductor != civilian) exitWith { hint "Ni ems ni Policias pueden cobrar por parada de tranporte!" };
	
	if(_metros > 10) exitWith { hint "Necesitas estar almenos a 10 metros del auditor de transporte para que tome encuenta tu parada." };
_paradaenuso = _auditor getvariable ["parada_en_uso",0];	
	if (_paradaenuso > 0) exitWith { hint "Esta parada ya ha sido atendida!" };
	
	if (vehicle player == _conductor) exitWith { hint "Trabajas de Pie ?? Súbete a tu Bus Macho !! Venga !!" };

	if !(alive _conductor) exitWith {};

_auditor setvariable ["parada_en_uso",1,true];
_pagaxparada = 100 + round(random [1000,1500,2500]);

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Esperando en la parada por usuarios ...(1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
_terminaParada = 0; 

while{_terminaParada < 1} do{
sleep 0.85;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Esperando en la parada por usuarios ...(%1%2)",round(_cP * 100),"%"];
_Pos = position player; 		                
_markerbus = createMarker ["MarkerParadaBus", _Pos]; 		                
"MarkerParadaBus" setMarkerColor "ColorWEST";				                
"MarkerParadaBus" setMarkerText "Bus de Ruta Esperando en Parada";				                
"MarkerParadaBus" setMarkerType "c_car";
	
	if(_cP >= 1) then { _terminaParada = 1;};
	if(_conductor distance _auditor > 20.5) exitWith { };
	if!(alive _conductor) exitWith {};
};
	
if!(alive _conductor) exitWith { _auditor setvariable ["parada_en_uso",0,true]; deleteMarker "MarkerParadaBus";};

if(_conductor distance _auditor > 20.5) exitWith { deleteMarker "MarkerParadaBus"; 

	hint "Tenías que estar a menos de 20m de la parada de buses..."; 
	5 cutText ["","PLAIN"]; 
	_auditor setvariable ["parada_en_uso",0,true]; };
	5 cutText ["","PLAIN"];
	titleText[format["Gracias por la espera en esta parada has obtenido €%1, Puedes avanzar a la siguiente parada o recoger a algún renegado.",[_pagaxparada] call life_fnc_numberText],"PLAIN"];
	deleteMarker "MarkerParadaBus"; 
	_vehiculo = vehicle player;	
	_pasajeros = count crew _vehiculo;
	_multiplicador = _pasajeros * 1100;
pop_din = pop_din + _pagaxparada;
["exp",2] call ica_fnc_arrayexp;

sleep 100;
_auditor setvariable ["parada_en_uso",0,true];
 player setvariable ["parada_bus_activa",0,true]; 
