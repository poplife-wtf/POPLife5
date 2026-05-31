// Creado por Rosen

if(life_is_arrested) then {
	if(pop_atmdin > 0) then {
		pop_atmdin = pop_atmdin - dinerodelitos;
		if(pop_atmdin < 0) then {
			pop_atmdin = 0;
		};
	};
};