
/*
Robo al concesionario por Icaruk
	["init"] spawn ica_fnc_roboConcesionario
	["entrego"] spawn ica_fnc_roboConcesionario
*/

_param = _this select 0;
_class = ["pop_488GT3Civil","pop_laferrari_negro"];


if (_param isEqualTo "robo") exitWith {

		  if (("baj" call ica_fnc_expToLevel) < 2) exitWith {
            titleText["No sabes robar...", "PLAIN"];
		};

	if ({side _x == WEST} count playableUnits < 4) exitWith {hint "Tienen que estar al menos 4 policias conectados, si no no es divertido."};
	
	_next = HW getVariable ["robosPeque",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo menor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosPeque",(time + (15 * 60)),true];
	
	private "_veh";
	_veh = (nearestObjects [player, _class, 4]) select 0;
	if (isNil {_veh}) exitWith {hint "Estás demasiado lejos"};
	if (isNil {_veh getVariable "robable"}) exitWith {};

	["menu", 0.92, "concesionario"] call ica_fnc_ganzua;
};

if (_param isEqualTo "entrego") exitWith {

	private "_veh";
	if ((player distance carshop1_1_1_2) > 3) exitWith {hint "¡Psssst, acércate + loko!"; };
	if ((count (nearestObjects [getPos carshop1_1_1_2, ["Man"], 4])) > 1) exitWith {
		hint "Ye loko aquí no kiero mobidas, tieneh ke estar tú sólo para negociá conmigo.";
	};

	_veh = (nearestObjects [player, _class, 4]) select 0;
	if (isNil {_veh}) exitWith {hint "Estás demasiado lejos o no hay  ningún vehículo"};

	if (_veh getVariable "robable") then {
		deleteVehicle _veh;

		_din = 10000;
		hint format ["K wapo loko, ls alerones tan to wapos con esto me boy a barraka en cerocoma. \n\nAkí tiens tu parte: %1€", _din];
		pop_din = pop_din + _din;
		["envio", player, 50, 60*20] call ica_fnc_bloqueoDinero;

	} else {
		hint "Balla mierda de koxe loko";
	};

};



