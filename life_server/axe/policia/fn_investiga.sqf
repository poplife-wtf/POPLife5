/*

Detectives muy detectivezcos papi.

By AxE ... you know izi pizi.

*/
_pic1 = ["pop_cinturon_p1"] call ica_fnc_classToPic;
if (isNil {investigado}) exitWith {hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>UDEV: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Debes iniciar la investigación desde comisaria primero </t>",_pic1]; investigado = nil; publicVariable "investigado"	};

	_buscado = investigado;
	
	{if(getPlayerUID _x == _uid) then {_buscado = _x};} foreach allPlayers;
	
	if (isNull _buscado) exitWith {hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>UDEV: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> El sospechoso no se encuentra ahora mismo en la ciudad </t>",_pic1];	investigado = nil; publicVariable "investigado"};
	if (player == _buscado ) exitWith {hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>UDEV: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Te quieres buscar a ti mismo ? muy bien .. muy bien </t>",_pic1]; investigado = nil; publicVariable "investigado"};

	//_buscado = player;
	_nombre = name _buscado;
	_tio = _buscado;
	_grados = 180;
	_altura = 2.3;
	_distCam = 3.4;
	
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
	[str ("Investigación en Sitio"), str(_nombre), str(date select 1) + "." + str(date select 2) + "." + str(date select 0)] spawn BIS_fnc_infoText;
	titleFadeOut 9;
	sleep 6;
	_radio = player distance _buscado;
	_radio = _radio + round (random 500);
	_sec2 = format ["Al parecer han visto al sospechoso en una zona a unos %1 metros",_radio];
	titleText [_sec2,"PLAIN"];
	titleFadeOut 9;
	sleep 6;
	_investiga = _buscado getVariable ["investigando",0];
	_cochec = typeof vehicle _buscado;
	_nomcoche = [_cochec] call ica_fnc_classToName;
	_coord1 = mapGridPosition (position _buscado);
	if (_investiga > 16) then {
		if (vehicle _buscado != _buscado) then {
	_sec3 = format ["Según te informan el buscado esta en coordenadas %1 y van en un coche %2",_coord1, _nomcoche];
	titleText [_sec3,"PLAIN"];
	titleFadeOut 14;
	sleep 12;
			}else{
	_sec3 = format ["Según te informan el buscado esta en coordenadas %1",_coord1];
	titleText [_sec3,"PLAIN"];
	titleFadeOut 14;
	sleep 12;
			};
		};

	if (_investiga > 10) then {	
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
	
	sleep 2;
	titleText ["", "BLACK OUT", 0.5];
	sleep 1;
	titleCut ["", "BLACK FADED", 999];
	
	camDetective cameraEffect ["terminate","back"];
	camDestroy camDetective;
	camDetective = nil;
	titleText ["Esa es toda la información que pudiste recoger en esta zona.","PLAIN"];
	titleFadeOut 11;
	sleep 9;

	};
	sleep 3;
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;  

	titleCut ["", "BLACK IN", 5];	
	investigado = _buscado;
	publicVariable "investigado";
	_buscado setVariable ["investigando",((_buscado getVariable ["investigando",0]) + 1),true];
	
