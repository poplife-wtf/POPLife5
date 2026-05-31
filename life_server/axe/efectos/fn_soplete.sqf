
// Efecto de soldadura para abrir puertas.
 
_unit = _this select 0; 
if ((player distance _unit) > 100) exitWith {};
    if (!isNil {soldando}) exitWith {};
    [] spawn {
        soldando = true;
        sleep 5;
        soldando = nil;
    };
_int = 0.1;  
life_num = 5; 
  cursorObject setVariable ["puerta_abierta",(cursorObject getVariable ["puerta_abierta",0]) + 1,true];
  _rdm = floor random [25,35,40];
  if ((cursorObject getVariable ["puerta_abierta",0]) >= _rdm ) then {
  cursorObject animate ["GateDoor_3", -1.6];
  };
  [[player, "soplete"], "life_fnc_say3D",true,false,false] call BIS_fnc_MP;
while{life_num > 0 && typeof cursorObject  isEqualTo  "Land_GateB" && _unit distance cursorObject < 2.1} do { 
 _pos = (ASLtoATL visiblePositionASL _unit);  
 _smoke = "#particlesource" createVehicleLocal _pos;   
 _smoke setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0],   "",    "Billboard",    0.5,    0.5,    [0,0,0],   [0, 0.2, -0.2],    1, 1.275, 1, 0.2,    [0, 0.2,0],    [[0.4,0.4,1, 0.1], [1,1,1, 0.01], [1,1,1, 0]],    [1000],    1,    0.04,    "",    "",    _smoke];    
 _smoke setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];    
 _smoke setDropInterval 0.001;     
 _smoke attachto [_unit,[0,0.15,0.25], "lefthand"];  
 

	 _particle1 = "#particlesource" createVehicleLocal _pos;	
		_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [0, [0.05, 0.05, 0.05], [0.05, 0.05, 0.05], 0.1, 0.01, [0, 0, 0, 0], 0, 0];
		_particle1 setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.15, [0, 0, 0], [0, 0, 0], 0.5, 10, 7.9, 0.075, [0.0004, 0.0015], [[1, 1, 1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 0.1, 0.05, "", "", _particle1];
		_particle1 setDropInterval 0.05;
		_particle1 attachto [_unit,[0,0.15,0.25], "lefthand"];

	 _particle2 = "#particlesource" createVehicleLocal _pos;			
		_particle2 setParticleCircle [0, [0, 0, 0]];
		_particle2 setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 0.25, [0, 0, 0], [0, 0, 0], 0, 2, 1, 0.075, [0.1, 0.1], [[253, 250, 255, 1], [250, 252, 255, 1],[215, 50, 9, 0.79],[253, 250, 255, 1]], [0.08], 1, 0, "", "", _particle2];
		_particle2 setDropInterval 0.1;
		_particle2 attachto [_unit,[0,0.15,0.25], "lefthand"];
		
_li = "#lightpoint" createVehicleLocal _pos;
_li setLightBrightness 0.08;
_li setLightAmbient [1,0.28,0.05];
_li setLightColor [1,0.28,0.05];
_li lightAttachObject [_unit,[0,0.15,0.25]];	

_escala = 0.1;

_fuente3  = "#particlesource" createVehicleLocal _pos;
_fuente3 setParticleCircle [0, [0, 0, 0]];
_fuente3 setParticleRandom [0.2, [15 * _escala, 15 * _escala, 0], [0, 0, 0], 1, 0.5, [0, 0, 0, 0], 0, 0];
_fuente3 setDropInterval 0.04;
_fuente3 attachto [_unit,[0,0.15,0.25], "lefthand"];

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
	_fuente3																	
];	
 
 
 sleep 1; 

 life_num = life_num - 1; 
 deletevehicle _smoke;
 deletevehicle _particle1; 
 deletevehicle _particle2; 
 deletevehicle _li;   
 deletevehicle _fuente3;     
  
 
 
 
 
}; 
 
