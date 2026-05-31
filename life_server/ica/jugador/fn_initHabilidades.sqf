
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
