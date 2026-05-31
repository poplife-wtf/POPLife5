
/*
por: Icaruk mod By AxE
	0 spawn ica_fnc_initVars;
*/


economia = ["SELECT prices FROM market WHERE id=1",2,true] call DB_fnc_asyncCall;
diag_log format["Resultado economia: %1", economia];
waitUntil {!isNil {economia}};
economia = economia select 0 select 0;
//[[[1000,565,213,788,1000,933,0,738,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,200,200,200,200,200,200,45,4,4,0,39,0,0,0,-14,-19,-18,0]]]
//[903,47,314,44,850,708,16,55,904,904,904,904,904,904,904,904,904,904,904,904,904,904,904,904,133,115,115,115,115,115,4,3,2,3,0,1,1,3,0,0,0,0]
_vars = [
	"alm1Ali", "alm1Agu", "alm1Com", "alm1Mad", "alm2Ali", "alm2Agu", "alm2Com", "alm2Mad",
	"des1Ali", "des1Agu", "des1Com", "des1Mad", "des2Ali", "des2Agu", "des2Com", "des2Mad", 
	"des3Ali", "des3Agu", "des3Com", "des3Mad", "des4Ali", "des4Agu", "des4Com", "des4Mad", 
	"minAre", "minCar", "minCob", "minHie", "minOro", "minPla",
	"traf1Mar", "traf1Her", "traf1Coc", "traf1Met", "traf2Mar", "traf2Her", "traf2Coc", "traf2Met",
	"camMar", "camHer", "camCoc", "camMet"
];

_idx = 0;
while {_idx < (count _vars)} do {
	missionNamespace setVariable [(_vars select _idx), economia select _idx];	
	_idx = _idx + 1;
};

_vars spawn {
	_vars = _this;
	while {true} do {
		sleep (60 * 55);
		
		_idx = 0;
		while {_idx < (count _vars)} do {
			_new = missionNamespace getVariable (_vars select _idx);
			economia set [_idx, _new];
			_idx = _idx + 1;
		};	
		_query = format ["UPDATE market SET prices='%1' WHERE id='1'",economia];
        _thread = [_query,1] call DB_fnc_asyncCall;
	};
};

/*
// almacenes
alm1Ali = 0;
alm1Agu = 0;
alm1Com = 0;
alm1Mad = 0;
alm2Ali = 0;
alm2Agu = 0;
alm2Com = 0;
alm2Mad = 0;

// descargas
_inicio = 0;
des1Ali = _inicio;
des1Agu = _inicio;
des1Com = _inicio;
des1Mad = _inicio;
des2Ali = _inicio;
des2Agu = _inicio;
des2Com = _inicio;
des2Mad = _inicio;
des3Ali = _inicio;
des3Agu = _inicio;
des3Com = _inicio;
des3Mad = _inicio;
des4Ali = _inicio;
des4Agu = _inicio;
des4Com = _inicio;
des4Mad = _inicio;

//mineria
_inicioMineria = 0;
minAre = _inicioMineria;
minCar = _inicioMineria;
minCob = _inicioMineria;
minHie = _inicioMineria;
minOro = _inicioMineria;
minPla = _inicioMineria;

//drogas
traf1Mar = 0;
traf2Mar = 0;
traf1Her = 0;
traf2Her = 0;
traf1Coc = 0;
traf2Coc = 0;
traf1Met = 0;
traf2Met = 0;
camMar = 0;
camHer = 0;
camCoc = 0;
camMet = 0;
*/

// init de cosas


