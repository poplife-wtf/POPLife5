
private "_asesino";
_asesino = _this select 1;

	if (_asesino in terroristasEA) then {
	victimasEA = victimasEA + 1;
	publicVariable "victimasEA";
	systemChat format ["Has sido victima del Terror..."];
	};
	
