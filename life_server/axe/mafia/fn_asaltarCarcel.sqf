//by quickskill 
//player selectWeapon "pop_hacha_F";
//asaltar carcel tienes k ir en este orden :)
// ["abrirBarrera1"] spawn ica_fnc_asaltarCarcel;

_param = _this select 0;

if(_param isEqualTo "queAbrir")exitWith{


	_carcel = player nearObjects ["Land_MainSection", 75];
	

	if( str _carcel =="[]" )exitWith{
		hint "No estas cerca de la carcel";
	};

	_carcel = _carcel select 0;

	// que abrimos

	if(player distance _carcel > 65 and player distance _carcel < 75 )exitWith{

		["abrirBarrera1"] spawn ica_fnc_asaltarCarcel;
		
	};



	if(player distance _carcel > 58 and player distance _carcel < 59.5 )exitWith{

		["abrirBarrera2"] spawn ica_fnc_asaltarCarcel;
		
	};


	if(player distance _carcel > 19 and player distance _carcel < 20 )exitWith{

			
		["abrirBarrera3"] spawn ica_fnc_asaltarCarcel;
		
	};


	if(player distance _carcel > 15.8 and player distance _carcel < 16.1 )exitWith{

		
		["abrirPuerta1"] spawn ica_fnc_asaltarCarcel;
		
	};

	if(player distance _carcel > 13.9 and player distance _carcel < 14.5 )exitWith{

			
		["abrirPuerta2"] spawn ica_fnc_asaltarCarcel;

		["abrirPuerta3"] spawn ica_fnc_asaltarCarcel;
		
	};

	if(player distance _carcel > 2.5 and player distance _carcel < 3 )exitWith{


		["abrirPuerta4"] spawn ica_fnc_asaltarCarcel;
		
	};

	if(player distance _carcel > 0.5 and player distance _carcel < 1.3 )exitWith{


		["abrirPuerta5"] spawn ica_fnc_asaltarCarcel;
		
	};




};


if (_param isEqualTo "abrirBarrera1") exitWith {


	_puerta = nearestObject [position player, "Land_Gate_C"];

	_launcherWeaponEquipada = currentWeapon player;

	if( _launcherWeaponEquipada!="MeleeCrowbar" ) exitWith{
		hint "Necesitas una palanca para forzar la puerta."; 
	};


	[3, "Forzando barrera ..."] spawn ica_fnc_barrita;
	_anim = "GestureSwing";
	_sonidosPegar = ["pop_animaciones\sounds\Swing.wav","pop_animaciones\sounds\BaseBat1.wav"] call BIS_fnc_selectRandom;
	playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50];
	[player,"Sledge_swing"] remoteExec ["life_fnc_animSync",-2];

	_sonidosPegar = ["pop_animaciones\sounds\Swing.wav","pop_animaciones\sounds\BaseBat1.wav"] call BIS_fnc_selectRandom;
	playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50];  

	sleep 3;   


	_puerta animate ["GateDoor_3", 1];  
};


if (_param isEqualTo "abrirBarrera2") exitWith{


	_puerta = nearestObject [position player, "Land_Gate_C"];

	_launcherWeaponEquipada = currentWeapon player;
	if( _launcherWeaponEquipada!="MeleeCrowbar" ) exitWith{
		hint "Necesitas una palanca para forzar la puerta."; 
	};
	if(player distance _carcel > 5)exitWith{
		hint "No estás cerca de la puerta.";
	};
	[3, "Forzando barrera..."] spawn ica_fnc_barrita;
	_anim = "GestureSwing";
	_sonidosPegar = ["pop_animaciones\sounds\Swing.wav","pop_animaciones\sounds\BaseBat1.wav"] call BIS_fnc_selectRandom;
	playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50];
	player playActionNow _anim;
	[[player,_anim],"life_fnc_animSync",nil,false] call life_fnc_MP;
	_sonidosPegar = ["pop_animaciones\sounds\Swing.wav","pop_animaciones\sounds\BaseBat1.wav"] call BIS_fnc_selectRandom;
	playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50];  
	sleep 3;   
	_puerta animate ["GateDoor_3", 1];  // 5 posiciones 0 cerradp 6 abierto del todo

};

if (_param isEqualTo "abrirBarrera3") exitWith{


	_puerta = nearestObject [position player, "Land_GateB"];

	_launcherWeaponEquipada = currentWeapon player;

	if( _launcherWeaponEquipada!="MeleeCrowbar" ) exitWith{
		hint "Necesitas una palanca para forzar la puerta"; 
	};


	[3, "Forzando barrera..."] spawn ica_fnc_barrita;
	_anim = "GestureSwing";
	_sonidosPegar = ["pop_animaciones\sounds\Swing.wav","pop_animaciones\sounds\BaseBat1.wav"] call BIS_fnc_selectRandom;
	playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50];
	[player,"Sledge_swing"] remoteExec ["life_fnc_animSync",-2];

	_sonidosPegar = ["pop_animaciones\sounds\Swing.wav","pop_animaciones\sounds\BaseBat1.wav"] call BIS_fnc_selectRandom;
	playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50]; 

	sleep 3;   


	_puerta animate ["GateDoor_3", -1.6];  
};



if (_param isEqualTo "abrirPuerta1") exitWith { 

	_puerta = player nearObjects ["Land_MainSection", 75];
	_puerta = _puerta select 0;

	_hgWeapon= currentWeapon player; 
	if !(_hgWeapon=="hakiador_puertas")exitWith{

		hint "Equipate el hackiador de puertas";

	};

	//aviso a la poli
	[10, "Aviso ", [1,0,0], 1.5, "Están asaltando la carcel.", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];

	//alarma
	[]spawn{
	  for "_i" from 1 to 4 do {

     [_veh, "alarmcar"] remoteExec ["life_fnc_say3D",0];

      sleep 2;

    };
	};

	_timeHack = round random 20;
	_posMe = getPos player;
	_hackiado= true;
	[_timeHack, "Hackeando puerta..."] spawn ica_fnc_barrita;

	while{_timeHack >= 0}do{
		_timeHack= _timeHack -1;
		sleep 1;
		if(_posMe distance getPos player > 2) then {
			_hackiado= false;
			_timeHack= 0;
		};
	};

	if !(_hackiado)exitWith {
		hint "Te has movido y cancelaste el hackeo...";
	};


	if(_hackiado)then{
		hint "Puerta hackiada";
		_puerta animate ["Door7", 1];
	};
};


if (_param isEqualTo "abrirPuerta2") exitWith {

	
	_puerta = player nearObjects ["Land_MainSection", 75];
	_puerta = _puerta select 0;


	_hgWeapon= currentWeapon player; 
	if !(_hgWeapon=="hakiador_puertas")exitWith{

		hint "Equípate el hackeador de puertas.";

	};


	_timeHack = round random 20;
	_posMe = getPos player;
	_hackiado= true;
	[_timeHack, "Hackeando puerta..."] spawn ica_fnc_barrita;

while {_timeHack >= 0}do{
		_timeHack= _timeHack -1;
		sleep 1;
		if(_posMe distance getPos player > 2) then {
			_hackiado= false;
			_timeHack= 0;
		};
	};
	if !(_hackiado)exitWith {
		hint "Te has movido y cancelaste el hackeo...";
	};

	if(_hackiado)then{
		hint "Puerta hackeada.";
		_puerta animate ["Door4", 1];
	};

};

if (_param isEqualTo "abrirPuerta3") exitWith {

	
	_puerta = player nearObjects ["Land_MainSection", 75];
	_puerta = _puerta select 0;


	_hgWeapon= currentWeapon player; 
	if !(_hgWeapon=="hakiador_puertas")exitWith{

		hint "Equípate el hackeador de puertas.";

	};

	_timeHack = round random 20;
	_posMe = getPos player;
	_hackiado= true;
	[_timeHack, "Hackeando puerta..."] spawn ica_fnc_barrita;

	while {_timeHack >= 0}do{
		_timeHack= _timeHack -1;
		sleep 1;
		if(_posMe distance getPos player > 2) then {
			_hackiado= false;
			_timeHack= 0;
		};
	};

	if !(_hackiado)exitWith {
		hint "Te has movido y cancelaste el hackeo...";
	};


	if(_hackiado)then{
		hint "Puerta hackeada.";
		_puerta animate ["Door10", 1];
	};

};




if (_param isEqualTo "abrirPuerta4") exitWith{

	
		_puerta = player nearObjects ["Land_MainSection", 75];
	_puerta = _puerta select 0;

	_hgWeapon= currentWeapon player; 
	if !(_hgWeapon=="hakiador_puertas")exitWith{

		hint "Equípate el hackeador de puertas.";

	};
	_timeHack = round random 20;
	_posMe = getPos player;
	_hackiado= true;
	[_timeHack, "Hackeando puerta..."] spawn ica_fnc_barrita;

	while {_timeHack >= 0}do{
		_timeHack= _timeHack -1;
		sleep 1;
		if(_posMe distance getPos player > 2) then {
			_hackiado= false;
			_timeHack= 0;
		};
	};

	if !(_hackiado)exitWith {
		hint "Te has movido y cancelaste el hackeo...";
	};

	if(_hackiado)then{
		hint "Puerta hackeada";
		_puerta animate ["Door12", 1];
	};
};

if (_param isEqualTo "abrirPuerta5") exitWith{


	_puerta = player nearObjects ["Land_MainSection", 75];
	_puerta = _puerta select 0;

	_hgWeapon= currentWeapon player; 
	if !(_hgWeapon=="hakiador_puertas")exitWith{

		hint "Equípate el hackeador de puertas.";

	};

	_timeHack = round random 20;
	_posMe = getPos player;
	_hackiado= true;
	[_timeHack, "Hackeando puerta..."] spawn ica_fnc_barrita;

while {_timeHack >= 0}do{
		_timeHack= _timeHack -1;
		sleep 1;
		if(_posMe distance getPos player > 2) then {
			_hackiado= false;
			_timeHack= 0;
		};
	};

	if !(_hackiado)exitWith {
		hint "Te has movido y cancelaste el hackeo...";
	};


	if(_hackiado)then{
		hint "Puerta hackeada";
		_puerta animate ["Door14", 1];
	};
};