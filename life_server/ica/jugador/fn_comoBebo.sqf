
/*
Script de la misión Desolation creado por Icaruk
	["init"] call ica_fnc_comoBebo;
	["como", 10] call ica_fnc_comoBebo;
	["bebo", 10] call ica_fnc_comoBebo;
	["todo", 10] call ica_fnc_comoBebo;
	["como", 10, "pop_p_clasica"] call ica_fnc_comoBebo;
	["todo", 10, "pop_p_clasica"] call ica_fnc_comoBebo;
*/

private ["_n", "_item"];

_param = _this select 0;

_h = life_hunger;
_s = life_thirst;

if (_param isEqualTo "init") exitWith {

	if (isNil {_h}) then { life_hunger = 100; };
	if (_h > 100) then { life_thirst = 100; };
	if (isNil {_s}) then { life_thirst = 100; };
	if (_s > 100) then { life_thirst = 100; };
	
	[] spawn { // Agua al andar
	_max = 200;
	_sup = "sup" call ica_fnc_expToLevel;

	if(_sup>=1)then{

		_max = 400;

	}else{

	_max = 200;// son 400m (100/3) = 20 * 0.4 = 13.3km aguantará andando

	};
		
		_andado = 0;
		_ultimaPos = (getPos player select 0) + (getPos player select 1);

		while {true} do {
			sleep 2;
			if (!alive player) then {
				_andado = 0;
			} else {
				_estoy = (getPos player select 0) + (getPos player select 1);
				if ((_estoy != _ultimaPos) && (vehicle player == player)) then {
					_andado = _andado + 1;
					if (_andado == _max) then	{
						_andado = 0;
						if ((player distance (getMarkerPos "jail_marker")) > 120) then {
							profileNamespace setVariable ["hearb", (life_hunger) - 3];
							life_hunger = life_hunger - 3;
							call life_fnc_hudUpdate;
						};
					};
				};
				_ultimaPos = (getPos player select 0) + (getPos player select 1);
			};
		};
	};

	[] spawn { // Agua
		while {true} do {


				_sup = "sup" call ica_fnc_expToLevel;

				if(_sup>=1)then{

				sleep 120; // aguantas 1.85min

				}else{

				sleep 60; // aguantas 1.85min

				};
			
			if ((player distance (getMarkerPos "jail_marker")) > 120) then {
				profileNamespace setVariable ["fois", (life_thirst) - 0.55];
				life_thirst = life_thirst - 0.55;
				call life_fnc_hudUpdate;
			};

			if ((life_thirst) <= 0) then {
				[] spawn {
					while {true} do {
						if ((life_thirst) > 0) exitWith {};
						player setDamage ((getDammage player) + 0.02);
						_str = ["Debería beber algo", "Tengo sed", "Estoy sediento", "Tendo da boca seca"] call BIS_fnc_selectRandom;
						titleText [_str, "PLAIN DOWN", 0.6];
						sleep 10;
					};
				};
			};
		};
	};
	

[] spawn { // Comida
	while {true} do {


	_sup = "sup" call ica_fnc_expToLevel;

	if(_sup>=2)then{

		sleep 160; // aguantas 1.85min

		}else{

		sleep 80; // aguantas 1.85min

		};
			if ((player distance (getMarkerPos "jail_marker")) > 120) then {
				profileNamespace setVariable ["hearb", (life_hunger) - 0.4];
				life_hunger = life_hunger - 0.4;
				call life_fnc_hudUpdate;
			};
			if ((life_hunger) <= 5) then {
				call ica_fnc_ragdoll;
				hint "Te mareas porque llevas mucho tiempo sin comer. El doctor te recomienda comer algo pronto...";
			};
			if ((life_hunger) <= 0) then {
				[] spawn {
					while {true} do {
						if ((life_hunger) > 0) exitWith {};
						player setDamage ((getDammage player) + 0.02);
						_str = ["Debería de comer algo", "Tengo hambre", "Estoy hambriento", "Mi estómago ruge, violentamente"] call BIS_fnc_selectRandom;
						titleText [_str, "PLAIN DOWN", 0.6];
						sleep 10;
					};
				};
			};
		};
	};

};


_n = _this select 1;
_item = _this select 2;
if (!isNil {_item}) then {
	_item spawn {sleep 0.1; player removeItem _this};
};

if (isNil {_h}) then { profileNamespace setVariable ["fois", 100] };
if (_h > 100) then { profileNamespace setVariable ["fois", 100] };
if (isNil {_s}) then { profileNamespace setVariable ["hearb", 100] };
if (_s > 100) then { profileNamespace setVariable ["hearb", 100] };

// if ((skillquepido) > X) then {_n = _n * 1.3}; // creo que era un 30% lo que te daba de más al tener skill y comer o beber
/*
 if !((player getVariable "organos") select 2) then { // tengo el estómago jodido
	_n = 1;
	hint "Siento un fuerte dolor en el estómago... no puedo comer ni beber :S";
 };
*/
if (_param isEqualTo "como") exitWith {
	life_hunger = life_hunger + _n;
	profileNamespace setVariable ["hearb", (life_hunger) + _n];
	if ((life_thirst) > 100) then { profileNamespace setVariable ["hearb", 100] };
	if (vehicle player == player) then {player playMoveNow "CL3_anim_eat"};
	[] call life_fnc_hudUpdate;
};

if (_param isEqualTo "bebo") exitWith {
	life_thirst = life_thirst + _n;
	profileNamespace setVariable ["fois", (life_thirst) + _n];
	if (life_hunger > 100) then { life_hunger = 100 };
	if (vehicle player == player) then {player playMoveNow "CL3_anim_eat"};
	["play3d", "jugadorBeber", player,1,80] call ica_fnc_SFX;
	[] call life_fnc_hudUpdate;
};
if (_param isEqualTo "todo") exitWith {
	life_thirst = life_thirst + _n;
	if (life_thirst > 100) then { life_thirst = 100 };
	life_hunger = life_hunger + _n;
	if (life_hunger > 100) then { life_hunger = 100 };
	if (vehicle player == player) then {player playMoveNow "CL3_anim_eat"};
	["play3d", "jugadorComer", player,1,80] call ica_fnc_SFX;
	[] call life_fnc_hudUpdate;
};
