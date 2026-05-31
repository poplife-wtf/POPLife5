/*
By: AxE

bla bla bla ... ahora es más divertido arar la tierra xD
Parte del sistema de Granjas POPV

*/

_param = _this select 0;
_veh = _this select 1;


if (_param isEqualTo "trabajo") exitWith {

if !(typeof (vehicle player) isEqualTo "pop_tractor") exitWith {

	[player,
	"Debes estar en tu tractor para empezar..", 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;

};

if !(uniform player in uniformesGranja) exitWith {
	[player,
	"No pareces estar vestido para el trabajo de campo ... mas bien para mesero o que se yo..", 
	"Granjas de Metropolis",
	"pop_tractor"
	] call ica_fnc_axeMsg;
};

/*_lvltl = "tl" call ica_fnc_expToLevel;
if (_lvltl < 1) exitWith { hint "Todo en esta vida tiene su ciencia, hasta el campo. Ve a la universidad."};*/
_trabajoIniciado = player getvariable ["trabajo_granjero_activo",0];

if ( _trabajoIniciado > 0) exitwith {};

player setvariable ["trabajo_granjero_activo",1];

_granjasCercanas = nearestObjects [player, listaGranjas, 100];
if (_granjasCercanas isEqualTo []) exitWith { [player,"No hay granjas cercanas que puedan pagarte por tu trabajo ... acude a alguna antes de iniciar tu trabajo.","Granjas de Morrison","pop_tractor"] call ica_fnc_axeMsg; };
granjaDeTrabajo = _granjasCercanas select 0;
if (isNull granjaDeTrabajo) exitWith {};//WaTaFuk ??

vehicle player removeaction accionIniciarTractor;
accionCobrarTractor = granjaDeTrabajo addaction ["Cobrar por tu trabajo de tractor ::.",{ ["cobrarTrabajo"] spawn ica_fnc_tractor} ];

player setvariable ["trabajo_granjero_activo",1];

	loop_tractor = true;
	_vehiculo = vehicle player;
	while {loop_tractor} do
	{
		if (!alive player OR isNull _vehiculo OR !alive _vehiculo OR player != driver _vehiculo) exitWith {hint "Has abandonado el vehiculo, este tramo no se te pagará.";loop_tractor = false;};
		if (player getVariable "metros2" > 50) exitWith {loop_tractor = false; 
		[player,
		format ["Excelente trabajo %1 ... Ya has trabajado suficiente... pasa a reclamar tu paga.",name player], 
		"Granjas de Morrison",
		"pop_tractor"
		] call ica_fnc_axeMsg;
		player setvariable ["pagar_granjero",1,true];
		};
		_posIni = getPos player;
		_distDrecorrido = 100;												
		_distancia = 0;
		_precioM = 0.04; 															

		disableSerialization;													
		5 cutRsc ["life_progress","PLAIN"];
		_upp = "Distancia de arado maxima: 150m2";
		_ui = uiNameSpace getVariable "life_progress";
		_progreso = _ui displayCtrl 38201; 
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%1",_upp]; 
		_progreso progressSetPosition 0.01;
		_cP = 0.01;
		
		while {loop_tractor} do
		{
		if (!alive player OR isNull _vehiculo OR !alive _vehiculo) exitWith {loop_tractor = false;};
		if (_distancia > _distDrecorrido) exitWith {loop_tractor = false;};
		if (vehicle player == player) exitWith {loop_tractor = false;hint "Te has bajando del tractor ... tendrás que devolverlo y volver a empezar."};			
		
		_class = "land_pop_huerto2"; 
		_parada = (nearestObjects [player, [_class], 7])select 0; 
		if (isNil {_parada} && isNil "accionpuesta") then {
			accionpuesta = true;
			accionarar = player addAction ["Arar y Surcar la Tierra",{
				waitTractor = true;
				0 spawn {
					sleep 5;
					waitTractor = nil;
				};
				if (surfaceType position player != "#huerta") exitWith {
				[
				player,
				"Este tipo de tierra no puede ser arada ... necesitas tierra de huerta.", 
				"Granjas de Morrison",
				"pop_tractor"
				] call ica_fnc_axeMsg;				
				
				};
				player removeAction accionarar;
				accionpuesta = nil;
				_tiempoespera = 5 + (round (random 20));
				[_tiempoespera, "Arando el cuadrado de tierra..."] spawn ica_fnc_barrita;
				sleep _tiempoespera;
				
				_piso = "land_pop_huerto2" createVehicleLocal [0,0,0];
				_piso attachTo [player,[0,0,0.05]];
				sleep 0.001;
				detach _piso;
				_piso spawn {
					sleep round (random [200,220,230]);
					deleteVehicle _this;
				};
				_metros2Gana = round (random [1,2,5]);
				_metros2 = (player getvariable ["metros2",0]) + _metros2Gana;
				[
				player,
				format ["Has surcado y arado correctamente %1 metros cuadrados, llevas en total %2 m2",_metros2Gana, _metros2], 
				"Granjas de Morrison",
				"pop_tractor"
				] call ica_fnc_axeMsg;
				player setvariable ["metros2",_metros2,true];
					if (player getVariable "metros2" > 25) exitWith {loop_tractor = false; 
						[player,
						format ["Excelente trabajo %1m ... Ya has trabajado suficiente... pasa a reclamar tu paga.",name player], 
						"Granjas de Morrison",
						"pop_tractor"
						] call ica_fnc_axeMsg;
						player setvariable ["pagar_granjero",1,true];
					};
				hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Metros Cuadrados Arados: %2 </t> ",["pop_tractor"] call ica_fnc_classToPic,_metros2];
			},nil,1.5,false,true,"","_paradax = (nearestObjects [player, [""land_pop_huerto2""], 7])select 0; isNil {_paradax} and isNil {waitTractor}"];
		};
		_i = 0; 
		sleep 0.1;
		_distancia = _posIni distance player;								
		_cP = _distancia / _distDrecorrido;
		_progreso progressSetPosition _cP;
		};
		5 cutText ["","PLAIN"]; 												
		if (!alive player OR isNull _vehiculo OR !alive _vehiculo) exitWith {};	
		
		[
			player,
			format ["Has recorrido %1m con el tractor ...y arado mas de 50m2 es suficiente por ahora, has ganado experiencia por ello y un muy merecido pago que podras reclamar en la granja",_distDrecorrido], 
			"Granjas de Morrison",
			"pop_tractor"
		] call ica_fnc_axeMsg;
		
		if (round (random 100) > 85) then {
			vehicle player setfuel (fuel vehicle player - 0.05);
			["exp",1] call ica_fnc_arrayexp;
			[format ["+ %1 de exp", 1]] call ica_fnc_infolog;
		};
	};



};

if (_param isEqualTo "cobrarTrabajo") exitWith {

if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno,por favor"};

if (isNil "granjaDeTrabajo" OR isNull granjaDeTrabajo) exitWith {hint "No se quien te dio el trabajo pero yo no te pagare por el."};//WaTaFuk ??
granjaDeTrabajo removeaction accionCobrarTractor;
granjaDeTrabajo = nil;
 
if ((player getvariable "pagar_granjero") isEqualTo 0) exitwith {		[player,
		"Ajam ... quieres un adelanto no ? ... muy bien ... si claro ... espera sentado.", 
		"Granjas de Morrison",
		"pop_tractor"
		] call ica_fnc_axeMsg;  };


   
    if ((player getvariable "pagar_granjero") > 0) exitwith {
		player setvariable ["pagar_granjero",0,true];	
		player setvariable ["metros2",0,true];
     	[player,
		"Claro que si !! un excelente trabajo ... aqui esta tu paga xD !.", 
		"Granjas de Morrison",
		"pop_tractor"
		] call ica_fnc_axeMsg;  
  
            ["pop_cajaalimentos", 15] call ica_fnc_item;	
			["+15 caja alimento"] call ica_fnc_infolog;
            
			_pago = (player getVariable "metros2") * 20;
            pop_din = pop_din + _pago;
			
		_organizacion = cursorTarget getVariable["controlado_por",grpNull];
		if(!isNull _organizacion) then 
		{ 
		[(round (_pago * 0.01)),_organizacion] call life_fnc_gangExtorsion;  
		};
		_lvl = cursorTarget getVariable ["negociolvl",0];
		_lvl = _lvl + 2;
		if (_lvl > 100) then {
		_lvl = 100;
		};
		cursorTarget setVariable ["negociolvl",_lvl, true];			
            ["exp",2] call ica_fnc_arrayexp;
			[format ["+ %1 de exp", 2]] call ica_fnc_infolog;
        player setvariable ["trabajo_granjero_activo",0,true];
        [format ["+ €%1",_pago]] call ica_fnc_infolog;
    };



};

if (_param isEqualTo "solicito") exitWith {
if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};
if (player getvariable ["tienetractor", false]) exitwith {hint "Ya has solicitado un tractor."};
    //if (!license_civ_driver) exitwith {hint "No tienes carnet de conducir B, no puedes conducir este tractor."};
    if (pop_din < 1500) exitwith {hint "La fianza del tractor son 1.500€"};
    pop_din = pop_din - 1500;
    _veh = "pop_tractor" createvehicle position player;

    clearMagazineCargoGlobal _veh;
    clearWeaponCargoGlobal _veh;
    clearItemCargoGlobal _veh;


    player setvariable ["pagar_granjero",0,true];
    _veh setvariable ["propietario",name player,true];
    


	accionIniciarTractor = _veh addAction["Empezar trabajo de granjero.", {["trabajo"] spawn ica_fnc_tractor}];


    player setvariable ["uniforme",uniform player,true];
    _uniforme = uniformesGranja call BIS_FNC_selectRandom;
	player adduniform _uniforme;
	player setvariable ["tienetractor", true, true];
	waituntil {isnull _veh OR damage _veh > 0.95};
	player setvariable ["tienetractor", nil, true];
 
};


if (_param isEqualTo "fianza") exitWith {


    if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};
    _veh = nearestObject [player, "pop_tractor"];
    if (isnil "_veh") exitwith {hint "No veo cerca ningún tractor."};
    if ((player distance _veh)>10) exitwith {hint "Acerca el tractor."};
    _propietario = _veh getvariable "propietario";
    if (name player != _propietario) exitwith {hint "Este tractor no esta registrado a tu nombre."};

    deletevehicle _veh;
    _uniforme = player getvariable "uniforme";
    player adduniform _uniforme;
    pop_din = pop_din + 1500;
    hint "Todo listo, el tractor está guardado en el garage, vuelve a por más trabajo cuando quieras.";
  
};