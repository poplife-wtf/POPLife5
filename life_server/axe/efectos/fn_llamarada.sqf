// Efecto de llamarada.

_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_duracion = 10;

if (isNull _target || _duracion < 0) exitWith {};


_pos = (ASLtoATL visiblePositionASL _target);
_isVisible = [_pos, _duracion] call ica_fnc_efectoEsVisible;

if (!_isVisible) exitWith {};

[_target, 1, 0.1] spawn ica_fnc_magneto;

_fuente = "#particlesource" createVehicle _pos;
_fuente setParticleClass "ObjectDestructionFire1Smallx";
_fuente setDropInterval 0.075;
_fuente attachTo [_target];

_fuente2 = "#particlesource" createVehicleLocal _pos;
_fuente2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 48, 1], "", "Billboard", 1, 5, [0, 0, 0],
[0, 0, 0.5], 0, 1.277, 1, 0.025, [2, 2, 2, 2], [[0, 0, 0, 0.7],[0, 0, 0, 0.5], [0, 0, 0, 0.25], [1, 1, 1, 0]],
[0.2], 1, 0.04, "", "", _target];
_fuente2 setParticleRandom [2, [0.3, 0.3, 0.3], [1.5, 1.5, 1], 20, 0.2, [0, 0, 0, 0.1], 0, 0, 360];
_fuente2 setDropInterval 0.075;
_fuente2 attachTo [_target];

_escala = 0.1;

_fuente3  = "#particlesource" createvehiclelocal _pos;
_fuente3 setParticleCircle [0, [0, 0, 0]];
_fuente3 setParticleRandom [0.2, [15 * _escala, 15 * _escala, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
_fuente3 setDropInterval 0.04;
_fuente3 attachTo [player];

_fuente3 setParticleParams
[
	["\A3\data_f\ParticleEffects\Universal\Refract",1, 0, 1, 0],						
	"",																		
	"Billboard",															
	1,																		
	2,																	
	[0, 0, 0],															
	[30 * _escala, 30 * _escala, 0],										
	0,																	
	3,																	
	3,																	
	0.1,																
	[5 * _escala, 60 * _escala],											
	[[1, 1, 1, 0.5], [1, 1, 1, 0.3],  [1, 1, 1, 0]],		
	[1],					  												
	0,																		
	0,																		
	"",																		
	"",																		
	_target																	
];	

Sleep _duracion;

deleteVehicle _fuente;	
deleteVehicle _fuente2;	
deleteVehicle _fuente3;	