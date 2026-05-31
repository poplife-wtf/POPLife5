/*

~~Adamuz Systems~~

Sistema de fuegos artificiales

[objeto desde donde se lanza] spawn ica_fnc_adafuegos; 

*/


_lanzador = _this select 0;

_h = 200 + (random 100); 	
_ro = random 1;
_ve = random 1;
_bl = random 1;

_firsound = ["firework1","firework2","firework3"] call BIS_fnc_selectRandom;
_firflut = ["fluier1","fluier2","fluier3","fluier4","fluier5","fluier6","fluier7"] call BIS_fnc_selectRandom;

_explotador = "xcam_wood_invisiramp2m15" createvehiclelocal [(getpos _lanzador) select 0, (getpos _lanzador) select 1, _h];

_lanzador say3D _firflut;
_nul1 = "CMflare_Chaff_Ammo" createvehiclelocal [(getpos _lanzador) select 0,(getpos _lanzador) select 1, (getpos _lanzador) select 2];  
_nul1 setVelocity [(random 10) -5,(random 10)-5, 300]; 

sleep 3;
_sparks_handler = [_explotador,_ro,_ve,_bl, _h] execvm "ALfireworks\alias_sparks.sqf";

sleep 0.5;

_nul = [_explotador,_ro,_ve,_bl, _h] execvm "ALfireworks\alias_lumina.sqf";
	
waitUntil {scriptDone _sparks_handler};

_explotador say3D _firsound;	
deletevehicle _explotador;
deletevehicle _nul1;
		
	