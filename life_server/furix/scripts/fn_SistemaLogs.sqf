// By FuRixX Lamborghini \\

_variables = [
	["pop_din", 25000],
	["pop_atmdin", 50000]
];

Checker = {

	_variable = _this select 0;
	_nombrevar = _this select 1;
	_valor = _this select 2;

	[_variable, _nombrevar, _valor] spawn {

		_variable = _this select 0;
		_nombrevar = _this select 1;
		_valor = _this select 2;

		while {true} do {

			FuRixX_EnviarLog = "";
			
			_inicial = call _variable; 
			sleep 5;
			_despues = call _variable; 
			_diferencia = _despues - _inicial;

			if (_diferencia > _valor) then {
				FuRixX_EnviarLog = format [':arrow_right: La variable "__%1__" del usuario **%2** (`%3`) ha aumentado bruscamente de **%4** a **%5**', _nombrevar, name player, getPlayerUID player, _inicial, _despues];
				publicVariableServer "FuRixX_EnviarLog";
			};
		};

	};

};

waitUntil{!isNull findDisplay 46};
waitUntil{!isNil "pop_din"};
waitUntil{([] call FuRixX_fnc_TiempoConectado) > 0.2};
waitUntil {life_session_completed};


{

	if (!isNil (_x select 0)) then {
		_variable = compile (_x select 0);
		[_variable, _x select 0, _x select 1] spawn Checker;
	} else {
		FuRixX_EnviarLog = format [':arrow_right: La variable _%1_ no está definida en el usuario **%2** (`%3`)', _x select 0, name player, getPlayerUID player];
		publicVariableServer "FuRixX_EnviarLog";
	};
	

} forEach _variables;

// By FuRixX Lamborghini \\