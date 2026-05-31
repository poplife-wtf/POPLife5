// By FuRixX Lamborghini \\

[] spawn {

	_nombre = format ["FuRixX_MiPosicion_%1", round(random 10000)];
	_marcador = createMarkerLocal [_nombre, position player];
	_marcador setMarkerAlphaLocal 1;
	_marcador setMarkerTextLocal "";
	_marcador setMarkerTypeLocal "Select";
	_marcador setmarkerColorLocal "ColorRed";
	

	while {true} do {
		_marcador setMarkerPosLocal (getPosASL player);
		sleep 0.1;
	};

};

[] spawn {

	waitUntil{!isNull (findDisplay 46)};
	sleep 10;
	_paga = 500;

	switch (playerSide) do {
		case Civilian: {_paga = getNumber(missionConfigFile >> "Life_Settings" >> "paycheck_civ")};
		case Independent: {_paga = getNumber(missionConfigFile >> "Life_Settings" >> "paycheck_med")};
		case WEST: {_paga = getNumber(missionConfigFile >> "Life_Settings" >> "paycheck_cop")};
	};

	_paga = format ["%1", _paga];
	
	life_paycheck = compileFinal _paga;

};

// By FuRixX Lamborghini \\