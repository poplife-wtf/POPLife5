
/*
por: Icaruk
	call ica_fnc_initHabilidades;



[] spawn { // Medicina (regeneracion)
	while {true} do {
		_med = "sup" call ica_fnc_expToLevel;
		
		if (_med >= 3) then {
			if (damage player > 0.1) then {
			player setDamage ((damage player) - 0.08);
			};
		};

		sleep (60 * 1);	
	};
};
*/
_sup = "sup" call ica_fnc_expToLevel;

if (_sup >= 4) then {
player setvariable ["fuerte",true,true];
};

0 spawn {
	while {true} do {
		sleep 60;
		_med = "sup" call ica_fnc_expToLevel;
		if ((player getvariable "ace_medical_bloodVolume") < 80 && _med >= 3) then {
		player setVariable ["ace_medical_bloodVolume", ((player getvariable "ace_medical_bloodVolume") + 20), true];[player] call ACE_medical_fnc_handleUnitVitals; 

		};
	};
};