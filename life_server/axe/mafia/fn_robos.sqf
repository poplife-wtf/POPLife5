/*

By AxE.

*/ 

_param = _this select 0;

if (_param isEqualTo "robarFarmacia") exitWith {

_aQuien = NPC_FARMACIA_1;

_sePuedeRobar = _aQuien getVariable ["robable",false];
_loEstanRobando = _aQuien getVariable ["robandolo",false];

if ({side _x == WEST} count playableUnits < 2) exitWith {hint "Tienen que estar al menos 3 policias conectados, sino corres el riesgo de que se tome justicia por cuenta propia y te salga el tiro por la culata ... quieres probar ?."};

if (side player == WEST) exitWith {hint "Puto policía corrupto, ¡se lo voy a decir a todo el mundo!"}; // eres poli
	if ((primaryWeapon player == "") AND (handgunWeapon player == "")) exitWith {
		[player,"Que quieres tu ??? Robar ? a mi ? con que ? una polla ! ahora te muestro la mía...", 
		"Atraco al Negocio"] call ica_fnc_axeMsg;
	};
	_count = player ammo handgunWeapon player;
	if (_count < 6) exitWith {
		[player,"Que quieres tu ??? Robarme ? a mi ? con que ? una polla ! ahora te muestro la mía...", 
		"Atraco a la Farmacia"] call ica_fnc_axeMsg;
	};

if !(_sePuedeRobar)exitWith{ hint "Ya han robado hace poco."; };
if (_loEstanRobando)exitWith{ hint "Ya están robando! Ayuda a tu amigo!"; };

	_next = HW getVariable ["robosPeque",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo menor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosPeque",(time + (15 * 60)),true];

[10, "Aviso - Robo", [1,0,0], 1.5, "Están robando la farmacia.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];

  _darLoot = true;
 _time = 220;

[getPlayerUID player,profileName,"211"] remoteExec ["life_fnc_wantedAdd",2];

  _aQuien setvariable ["robandolo",true,true];

	while {_time > 0} do {

		_metros =  _aQuien  distance player;
		[_aQuien, "alarmcar"] remoteExec ["life_fnc_say3D",0];

		sleep 2;
		_time = _time - 2;
		hintSilent parseText format["<img size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Robando farmacia: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Distancia %1/70m <br/>Tiempo restante: %2</t>",[((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros)];

		if !(alive player) then {_time = 0;_darLoot = false;};

		if(_metros > 50 )then{

			[player,"Buen intento pero te has alejado demasiado de la zona.", 
			"Rosario Enterprise","RH_m9"] call ica_fnc_axeMsg;


			_aQuien setvariable ["robable",false,true];
			_aQuien setvariable ["robandolo",false,true];
			_darLoot = false;

			_time = 0;

		};

		if (_time <= 0 ) then {


			_aQuien setvariable ["robable",false,true];
			_aQuien setvariable ["robandolo",false,true];
			_time = 0;

		};

	};


	if(_darLoot)then{
	
		[player,"Coge el botín y ya sabes cagando leches!", 
		"Rosario Enterprise","RH_m9"] call ica_fnc_axeMsg;

		_cajaLoot =  "Box_NATO_Wps_F" createVehicle [0,0,0];
		_cajaLoot allowDamage false;   
		_cajaLoot setPosATL [7942.54,6570.32,0.00143909];

		clearMagazineCargoGlobal _cajaLoot;
		clearItemCargoGlobal _cajaLoot;
		clearWeaponCargoGlobal _cajaLoot; 

		_cajaLoot addItemCargoGlobal ["POP_CHAW2_D", 1];
		_cajaLoot addItemCargoGlobal ["pop_sosa", round (random [4,6,8])];
		_cajaLoot addItemCargoGlobal ["pop_hci", round (random [4,6,8])];
		_cajaLoot addItemCargoGlobal ["pop_muriatico", round (random [4,6,8])];
		_cajaLoot addItemCargoGlobal ["pop_neodimio", round (random [4,6,8])];



		pop_din = pop_din + 2000 + round random 1000;

		[_cajaLoot, 120] spawn ica_fnc_borrame;


	};

	[_aQuien] spawn {
		_aQuien = _this select 0;
		sleep (60 * 25);
		_aQuien setvariable ["robable",true,true];
    };
    
};