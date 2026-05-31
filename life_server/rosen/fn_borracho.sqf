//Creado por Rosen Efecto Borracho

if(isNil (player getVariable "borracho")) then {
	player setVariable ["borracho",false];
	cborracho = 0;
	lborracho = random 10;
}
else {
	cborracho = cborracho + 1;
	if((cborracho > lborracho) and (player getVariable "borracho" == false))then {
		"dynamicBlur" ppEffectEnable true; 
		"dynamicBlur" ppEffectAdjust [5];
		"dynamicBlur" ppEffectCommit 1;
		player setVariable ["borracho",true];
		_c = 300;
		while{_c > 0} do {
			_c = _c - 1;
			if(_c == 5 || _c == 30 || _c == 60 || _c == 150 || _c == 220 || _c == 280) then {
				[] spawn ica_fnc_ragdoll;
			};
			sleep 1;
		};
		"dynamicBlur" ppEffectEnable false;
		cborracho = 0;
		player setVariable ["borracho",false];
	};
};