/*
Minijuego para picar, hay que pulsar el botón cuando la barra que se llena y que se vacía rápidamente esté a tope
by: Icaruk

["menu", "hierro"] spawn ica_fnc_picando;
*/

_param = _this select 0;

if (_param isEqualTo "pica") exitWith {

	_mena = cursorObject;
	if (_mena isEqualTo player) exitWith {};
	_mineral = _this select 1;	
	//_min = "tl" call ica_fnc_expToLevel;
	if ((!license_civ_minero) && _mineral != "carcel") exitWith {hint "No tienes los conocimientos necesarios para hacer esto"};
	
    if (!isNil {picandomenas}) exitWith {hint "Tan rápido cansa ..." };
    [] spawn {
        picandomenas = true;
        sleep 1.2 + round (random 1);
        picandomenas = nil;
    };	

	if!((secondaryWeapon player)=="pop_pico_h" OR (secondaryWeapon player) == "pop_pala_h") exitWith{
	hint "Adivina que te falta ? eso !!... un pico o pala .. en las manos..."; 
	};
	
	if (isNull _mena) exitWith {hint "Que quieres practicar ? mejor apunta a una mena"};
	if (!(["mena",str cursorObject] call ica_fnc_inString)) exitWith {hint "Esto no parece una mena para picar"};
	
	
	playSound3D ["pop_animaciones\sounds\Swing.wav", player, false, getPosASL player, 1, 1, 50];
	[player,"Sledge_swing"] remoteExec ["life_fnc_animSync",-2];
	sleep 1;
	if (isNil "hapicado") then {hapicado = 0};
	hapicado = hapicado + 1;
	_rdmtope = selectRandom [
				4,
				6,	
				2,	
				7,
				8,
				11
			];
	if (hapicado > _rdmtope) then {
	hapicado = 0;
	if (_mineral == "carcel") exitWith {["pico"] spawn ica_fnc_trabajoCarcel};
	_class = format ["pop_%1_r", _mineral];
	[_class, 1 + floor random 2] call ica_fnc_item;
	[format ["+1 %1", _mineral]] call ica_fnc_infolog;
	_tocapelotas = floor (random 300); 
	if (_tocapelotas < 1) then {
		["pop_pico_h", -1] call ica_fnc_item;
		titleText ["has roto el pico manazas", "PLAIN"];
	}; 
		};
};