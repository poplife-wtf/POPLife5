
/*
Cámaras de seguridad por Icaruk
	["menu"] call ica_fnc_camaras;
*/

_param = _this select 0;

// (findDisplay 46) displayAddEventHandler ["KeyDown", "hint format ['%1', _this select 1]; "];


if (!isNil {DDoS}) exitWith {hint "Server is under attack"};

if (_param  isEqualTo  "init") exitWith {
	
	ica_fnc_vercam = {
		[_this select 0] spawn {
			_obj = _this select 0;
			
			_cam = "camera" camCreate (getpos _obj);
			_cam setDir (getDir _obj);
			_pitch = (_obj call BIS_fnc_getpitchbank) select 0;
			[_cam, _pitch, 0] call BIS_fnc_setpitchbank;
			
			_cam cameraEffect ["INTERNAL", "BACK"];
			
			if (((date select 3) >= 20) OR ((date select 3) < 6)) then [{
				camUseNVG true},{camUseNVG false;
			}];
			
			private ["_ppColor"];
			_ppColor = ppEffectCreate ["colorCorrections", 1999];
			_ppColor ppEffectEnable true;
			_ppColor ppEffectAdjust [1.1, 0.2, 0, [1,1,1,0], [1,1,1,0], [1,1,1,0]];  
			_ppColor ppEffectCommit 0;

			private ["_ppGrain"];
			_ppGrain = ppEffectCreate ["filmGrain", 2012];
			_ppGrain ppEffectEnable true;
			_ppGrain ppEffectAdjust [0.3, 1, 1, 0, 1];
			_ppGrain ppEffectCommit 0;

			
			titleText ["Pulsa espacio para salir", "PLAIN", 0.3];
			
			obj = _obj;
			cam = _cam;
			ppColor = _ppColor;
			ppGrain = _ppGrain;
			
			finCam = (findDisplay 46) displayAddEventHandler ["KeyDown",
				"if ((_this select 1)  isEqualTo  57) then {
					(findDisplay 46) displayRemoveEventHandler ['KeyDown', finCam];
					ppEffectDestroy ppColor;
					ppEffectDestroy ppGrain;
					obj cameraEffect ['TERMINATE', 'BACK'];
					camDestroy cam;
					obj = nil;
					cam = nil;
					ppColor = nil;
					ppGrain = nil;
					
					['menu'] call ica_fnc_camaras;
				}; false"
			];
		};
	};
	

	
	//Land_HandyCam_F
 camComisaria1 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camComisaria1 setvariable ["persistent", true, true];
    camComisaria1 setPosATL [8871.98,6729.86,23.2171];
    camComisaria1 setdir 223;
    [camComisaria1, -26, 0] call BIS_fnc_setpitchbank;
    camComisaria1 enableSimulation false;
   
    camComisaria2 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camComisaria2 setvariable ["persistent", true, true];
    camComisaria2 setPosATL [4762.58,2783.46,8.57635];
    camComisaria2 setdir 213;
    [camComisaria2, -21, 0] call BIS_fnc_setpitchbank;
    camComisaria2 enableSimulation false;
 
    camComisaria3 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camComisaria3 setvariable ["persistent", true, true];
    camComisaria3 setPosATL [3033.9,8536.4,8.67883];
    camComisaria3 setdir 66;
    [camComisaria3, -16, 0] call BIS_fnc_setpitchbank;
    camComisaria3 enableSimulation false;
   
    camHospital = "pop_camara" createVehicleLocal (getMarkerPos "");
    camHospital setvariable ["persistent", true, true];
    camHospital setPosATL [8031.18,6693.25,20.704];
    camHospital setdir 147;
    [camHospital, -23, 0] call BIS_fnc_setpitchbank;
    camHospital enableSimulation false;
   
    camAlcalde1 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camAlcalde1 setvariable ["persistent", true, true];
    camAlcalde1 setPosATL [8055.16,5227.7,36.9861];
    camAlcalde1 setdir 134;
    [camAlcalde1, -17, 0] call BIS_fnc_setpitchbank;
    camAlcalde1 enableSimulation false;
   
    camAlcalde2 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camAlcalde2 setvariable ["persistent", true, true];
    camAlcalde2 setPosATL [8213.27,5173.81,13.3121];
    camAlcalde2 setdir 240;
    [camAlcalde2, -18, 0] call BIS_fnc_setpitchbank;
    camAlcalde2 enableSimulation false;
   
    camGaraje = "pop_camara" createVehicleLocal (getMarkerPos "");
    camGaraje setvariable ["persistent", true, true];
    camGaraje setPosATL [8733.91,6324.41,12.8215];
    camGaraje setdir 287;
    [camGaraje, -13, 0] call BIS_fnc_setpitchbank;
    camGaraje enableSimulation false;
   
    camJoyeria = "pop_camara" createVehicleLocal (getMarkerPos "");
    camJoyeria setvariable ["persistent", true, true];
    camJoyeria setPosATL [2492.08,8615.8,10.1399];
    camJoyeria setdir 339;
    [camJoyeria, -8, 0] call BIS_fnc_setpitchbank;
    camJoyeria enableSimulation false;
   
    camAlmacen1 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camAlmacen1 setvariable ["persistent", true, true];
    camAlmacen1 setPosATL [8145.2,6672.3,7.09127];
    camAlmacen1 setdir 330;
    [camAlmacen1, -5, 0] call BIS_fnc_setpitchbank;
    camAlmacen1 enableSimulation false;
   
    camAlmacen2 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camAlmacen2 setvariable ["persistent", true, true];
    camAlmacen2 setPosATL [4566.79,2641.39,6.50021];
    camAlmacen2 setdir 268;
    [camAlmacen2, -8, 0] call BIS_fnc_setpitchbank;
    camAlmacen2 enableSimulation false;
   
    camConcesionario = "pop_camara" createVehicleLocal (getMarkerPos "");
    camConcesionario setvariable ["persistent", true, true];
    camConcesionario setPosATL [8760.05,6848.33,11.7];
    camConcesionario setdir 225;
    [camConcesionario, -13, 0] call BIS_fnc_setpitchbank;
    camConcesionario enableSimulation false;
   
    camSubastalia1 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camSubastalia1 setvariable ["persistent", true, true];
    camSubastalia1 setPosATL [6872.19,8403.21,39.2899];
    camSubastalia1 setdir 156;
    [camSubastalia1, -26, 0] call BIS_fnc_setpitchbank;
    camSubastalia1 enableSimulation false;
   
    camSubastalia2 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camSubastalia2 setvariable ["persistent", true, true];
    camSubastalia2 setPosATL [6920.99,8370.06,12.9219];
    camSubastalia2 setdir 241;
    [camSubastalia2, -6, 0] call BIS_fnc_setpitchbank;
    camSubastalia2 enableSimulation false;
   
    camSubastalia3 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camSubastalia3 setvariable ["persistent", true, true];
    camSubastalia3 setPosATL [6989.87,8297.49,47.6126];
    camSubastalia3 setdir 58;
    [camSubastalia3, -19, 0] call BIS_fnc_setpitchbank;
    camSubastalia3 enableSimulation false;
   
    camPlataforma1 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camPlataforma1 enableSimulation false;
    camPlataforma1 setvariable ["persistent", true, true];
    camPlataforma1 = "camera" camCreate (getposATL camPlataforma1);
    camPlataforma1 setPosASL [6232.73,3813.51,58.2951];
    camPlataforma1 setdir 225;
    [camPlataforma1, -26, 0] call BIS_fnc_setpitchbank;
 
    camPlataforma2 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camPlataforma2 setvariable ["persistent", true, true];
    camPlataforma2 enableSimulation false;
    camPlataforma2 = "camera" camCreate (getposATL camPlataforma2);
    camPlataforma2 setPosASL [5445.46,1022.76,24.1213];
    camPlataforma2 setdir 56;
    [camPlataforma2, -10, 0] call BIS_fnc_setpitchbank;
   
    camCorazol1 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camCorazol1 setvariable ["persistent", true, true];
    camCorazol1 setPosATL [5032.27,4888.41,7.70929];
    camCorazol1 setdir 356;
    [camCorazol1, -20, 0] call BIS_fnc_setpitchbank;
    camCorazol1 enableSimulation false;
   
    camCorazol2 = "pop_camara" createVehicleLocal (getMarkerPos "");
    camCorazol2 setvariable ["persistent", true, true];
    camCorazol2 enableSimulation false;
    camCorazol2 = "camera" camCreate (getposATL camCorazol2);
    camCorazol2 setPosATL [5048.31,4951.45,3.50888];
    camCorazol2 setdir 217;
    [camCorazol2, -3, 0] call BIS_fnc_setpitchbank;
	
	
	systemChat "Cámaras cargadas";
};

if (_param  isEqualTo  "menu") exitWith {
	if (!isNil {DDoS}) exitWith {hint "Parece que no funciona..."};
	if (("baj" call ica_fnc_expToLevel) < 3) exitWith {hint "Si no sabes, no toques."};
	
	disableSerialization;
	createDialog "camaras";
	_ui = uiNameSpace getVariable "camaras";
	_lista = (_ui displayCtrl 5063);	
	_lista ctrlSetEventHandler ["LBSelChanged", "['sel', ((uiNameSpace getVariable 'camaras') displayCtrl 5063) lbData (lbCurSel 5063)] call ica_fnc_camaras; "];
	
	_nom = ["Comisaría 1", "Comisaría 2", "Comisaría 3", "Hospital", "Alcalde 1", "Alcalde 2", "Garaje", "Joyería", "Almacén 1", "Almacén 2", "Concesionario", "Subastalia 1", "Subastalia 2", "Subastalia 3", "Plataforma petrolífera 1", "Banco", "Metropolis 1", "Metropolis 2", "Salir"];
	_data = ["camComisaria1", "camComisaria2", "camComisaria3", "camHospital", "camAlcalde1", "camAlcalde2", "camGaraje", "camJoyeria", "camAlmacen1", "camAlmacen2", "camConcesionario", "camSubastalia1", "camSubastalia2", "camSubastalia3", "camPlataforma1", "camPlataforma2", "camCorazol1", "camCorazol2", ""];
	
	lbClear _lista;
	_idx = 0;
	while {_idx < (count _nom)} do { // pongo en la lista las ramas
		_lista lbAdd (_nom select _idx);
		_lista lbSetData [_idx, _data select _idx];
		_idx = _idx + 1;
	};
	_lista lbSetColor [(count _nom) - 1, [1, 0.2, 0.2, 1]]; // rojo
};

if (_param  isEqualTo  "sel") exitWith {
	_obj = missionNamespace getVariable (_this select 1);
	
	if (!isNil {_obj}) then {
		[_obj] call ica_fnc_verCam;
		closeDialog 0;
	} else {
		closeDialog 0;
		closeDialog 0;
	};
};

