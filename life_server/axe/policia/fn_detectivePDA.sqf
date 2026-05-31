/*

Detectives muy detectivezcos papi.

By AxE ... you know izi pizi.

*/

_pic1 = ["pop_cinturon_p1"] call ica_fnc_classToPic;
if !(detective) exitWith {hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>UDEV: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Ya hay una investigación en curso, finalizala primero </t>",_pic1];	};
if !(isNil {investigado}) exitWith {hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>UDEV: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Ya hay una investigación en curso, finalizala primero </t>",_pic1];	};

_param = param [0];

if (_param == "init") exitWith {

private["_display","_list","_uid"];
disableSerialization;

if (isnull (findDisplay 777)) exitWith {};

_display = findDisplay 777;
_list = _display displayCtrl 3023;
_data = lbData[3022,(lbCurSel 3022)];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {};
if(typeName _data != "ARRAY") exitWith {};
if(count _data == 0) exitWith {};



	["briefing",_data] spawn ica_fnc_detective;
	
};	


if (_param == "briefing") exitWith {

	_param2 = param [1];
	_buscado = objNull;
	_uid = _param2 select 1;
	
	{if(getPlayerUID _x == _uid) then {_buscado = _x};} foreach allPlayers;
	
	if (isNull _buscado) exitWith {hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>UDEV: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> El sospechoso no se encuentra ahora mismo en la ciudad </t>",_pic1];	};
	if (player == _buscado ) exitWith {hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>UDEV: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Te quieres buscar a ti mismo ? muy bien .. muy bien </t>",_pic1];};

//_buscado = player;
_nombre = name _buscado;
_chaleco = vest _buscado;
_ropa = uniform _buscado;
_casco = headGear _buscado;
_mochila = backPack _buscado;
_geta = face _buscado;
	
_grupoIA = createGroup CIVILIAN;
clonHandler = "I_Soldier_AAA_F" createUnit [ [9717.07,10034.5,0.00143814] , _grupoIA ,"clon = this;",0.8,"CAPTAIN"];
clon setPosATL [9717.07,10034.5,0.337828];
removeAllWeapons clon;
removeallassigneditems clon;
removeallcontainers clon;
removeuniform clon;
removevest clon;
removebackpack clon;
removeHeadgear clon;
clon addBackPack _mochila;
clon forceAddUniform _ropa;
clon addVest _chaleco;
clon addHeadgear _casco;
clon setFace _geta;
clon doWatch [9717.61,10030.2,0.323391];
clon setDir 180;
clon allowDamage false;
[clon, "STAND_U1", "FULL"] call BIS_fnc_ambientAnim;
clon call BIS_fnc_ambientAnim__terminate;
clon enableSimulation false;
	_tio = clon;
	_grados = 180;
	_altura = 1.7;
	_distCam = 1.4;
	
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectCommit 5;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [6];   
	Sleep 3;
	titleText ["", "BLACK OUT", 0.5];
	sleep 1;
	titleCut ["", "BLACK FADED", 999];
	
	waitUntil{!(isNil "BIS_fnc_init")};
	[str ("... UDEV - CONFIDENCIAL ..."), str(_nombre), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;
	titleFadeOut 9;
	sleep 6;
	_radio = player distance _buscado;
	_radio = _radio + round (random 500);
	_sec2 = format ["Los Últimos informes de inteligencia ubican al sospechoso en un radio no mayor a %1 metros",_radio];
	titleText [_sec2,"PLAIN"];
	titleFadeOut 9;
	sleep 6;
	_casastio = _buscado getVariable ["casas",[]];
	_compruebo = _casastio select 0;
	
	if !(isNil {_compruebo}) then {
		if (count _casastio > 1) then {
	_coord1 = mapGridPosition _casastio select 0;
	_coord2 = mapGridPosition _casastio select 1;
	_sec3 = format ["Tenemos ubicadas las casas del investigado en coordenadas %1 y %2",_coord1, _coord2];
	titleText [_sec3,"PLAIN DOWN"];
	titleFadeOut 14;
	sleep 12;
			}else{
	_coord1 = mapGridPosition _casastio select 0;
	_sec3 = format ["Tenemos ubicada las casa del investigado en coordenadas %1",_coord1];
	titleText [_sec3,"PLAIN DOWN"];
	titleFadeOut 14;
	sleep 12;
			};
		};

	_mafia = _buscado getVariable ["mafia",nil];
	if !(isNil "_mafia") then {
	_sec4 = format ["Tenemos información NO CONFIRMADA de que el investigado pertenece a la organización Criminal conocida como: %1",_mafia];
	titleText [_sec4,"PLAIN"];
	titleFadeOut 14;
	sleep 12;	
	};
	
	_rango = _buscado getVariable ["mafia_rango",nil];
	if !(isNil "_rango") then {
	if (_rango > 3) then {
	titleText ["Tenemos información NO CONFIRMADA de que el investigado tiene un ALTO Rango en esta Organización y por lo cual se declara Objetivo de ALTO Valor","PLAIN DOWN"];
	} else {
	titleText ["Tenemos información NO CONFIRMADA de que el investigado tiene es un simple lacayo en esta Organización y por lo cual se declara Objetivo de Bajo Valor","PLAIN DOWN"];	
	};
	titleFadeOut 14;
	sleep 12;	
	};
	
	_zona = _buscado getVariable ["mafia_zona",nil];
	if !(isNil "_zona") then {
	_zonaname = [_zona] call ica_fnc_zonatoname;
	_sec5 = format ["La ya mencionada organización según investigaciones anteriores ejerce bastante presencia en la zona de %1",_zonaname];
	titleText [_sec5,"PLAIN"];
	titleFadeOut 14;
	sleep 12;	
	};

	titleText ["Accediendo al sistema de archivos multimedia ...","PLAIN DOWN"];
	titleFadeOut 7;
	sleep 6;	

	
	
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;  

	_posCam = [(_tio getPos [_distCam, _grados]) select 0, (_tio getPos [_distCam, _grados]) select 1, _altura];
	camDetective = "camera" camCreate _posCam;
	camDetective camSetTarget [getPos _tio select 0, getPos _tio select 1, _altura];
	camDetective camCommit 0;
	titleCut ["", "BLACK IN", 5];	
	showCinemaBorder false;
	camDetective cameraEffect ["INTERNAL", "BACK"];
	
	sleep 15;
	titleText ["", "BLACK OUT", 0.5];
	sleep 1;
	titleCut ["", "BLACK FADED", 999];
	
	camDetective cameraEffect ["terminate","back"];
	camDestroy camDetective;
	camDetective = nil;
	deletevehicle clon;
	deleteGroup _grupoIA;
	titleText ["Debes ir a investigar a los bares y bajos fondos ... de encubierto para obtener más pistas sobre su paradero, reunir pruebas contundentes y Capturarlo.","PLAIN"];
	titleFadeOut 11;
	sleep 9;

	sleep 3;
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;  

	titleCut ["", "BLACK IN", 5];
	
	investigado = _buscado;
	{hint "Un amigo tuyo en la policia te indica que el cuerpo de detectives te esta buscando ... no puedes abandonar la ciudad ni irte a dormir ... Si te pillan solo te procesarán por lo que tengas en su sistema de información no te llevarán a juicio, deberias entregarte."} remoteExec ["BIS_fnc_spawn",investigado];
	publicVariable "investigado";
	_buscado setVariable ["investigando",1,true];
	
};	