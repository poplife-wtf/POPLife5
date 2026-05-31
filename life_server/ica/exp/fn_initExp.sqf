
/*
por: Icaruk
	0 spawn ica_fnc_initExp;
*/

if (typeName experiencia == "STRING") then {experiencia = call compile format ["%1", experiencia]};

_primera = profileNamespace getVariable "a6614x6614307e";

if (isNil "_primera") then {
profileNamespace setVariable ["a6614x6614307e",[100,1,0,0,0,0,0,0,0,0,0,0,0,0]];
};


if ((experiencia select 0) <= 100) then { // soy nivel 0
		[format[" ---> # initexp # soy nivel cero exp:%1",experiencia], player] call ica_fnc_axeLog;
	experiencia set [0, 100]; // me pongo nivel 1
	experiencia set [1, 1]; // y pongo 1 SP
};

if (count experiencia < 1) then {
[format[" ---> pillo exp de perfil initExp10 %1",experiencia], player] call ica_fnc_axeLog;
experiencia = profileNamespace getVariable "a6614x6614307e";
};

_nivel = [] call ica_fnc_expToLevel;

_SPgastados = 0;

_ramas = ["tl","ti", "cra","med","sup",	"com", "tal","baj", "cri", "ter"];
_maxLvl = [11, 6, 11, 5, 5, 7, 8, 8, 8 ,9];

_idx = 0;
while {_idx < (count _ramas)} do {
	// saco mi nivel de la rama
	_nivelhab = (_ramas select _idx) call ica_fnc_expToLevel;
	
	// saco cuántos SP me han costado esos niveles
	for "_x" from 1 to _nivelhab do {
		_hab = format ["%1%2", _ramas select _idx, _x];
		_SPgastados = _SPgastados + (["sp", _hab] call ica_fnc_costeSP);
	};

	// doy la vuelta
	_idx = _idx + 1;
};


if (_nivel >= _SPgastados) then { // todo bien
	_SP = _nivel - _SPgastados;
	experiencia set [1, _SP]; // pongo los SP
} else { // algo va mal, hacemos reset de SP
		[format[" ---> hago reset gratis algo va mal %1 deberia hacer reset",experiencia], player] call ica_fnc_axeLog;
	["resetgratis"] call ica_fnc_arrayExp;
};

0 spawn {
	while {true} do {
		sleep (60 * 2); // 5/min 10/2min 300/h 900/3h
		
		_e = (experiencia select 2);
		if (_e < 1000) then {
			["ene", 10] call ica_fnc_arrayExp;
			if (_e > 1000) then {experiencia set [2, 1000]};
		};
	};
};

if ((side player == WEST) OR (side player == INDEPENDENT)) then {
	miTurno = 0;
	
	0 spawn {
		while {true} do {
			if (({side _x == CIVILIAN} count (nearestObjects [player, ["Man"], 10])) >= 1) then {["exp", 1] call ica_fnc_arrayExp};
			
			if ((player distance ([campolicia1, campolicia2, campolicia4] call ica_fnc_masCercano)) < 4) then {
				["exp", round random 5] call ica_fnc_arrayExp;
			};
		
			miTurno = miTurno + 1;
			
			sleep 360;
		};
	};
};

