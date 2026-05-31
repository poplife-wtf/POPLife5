
_p = _this select 0;


if (_p == "init") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 3) exitWith {hint "No tienes el Rango de policia suficiente."};

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> UDEV Confidencial </t><br/><t size=""1"">- Cuerpo de Detectives de Metropolis</t>";

("Cuerpo de Detectives") hintC [
	_paraf,
	"Este rol interno de la policia esta pensada para investigar y aprender a los peores criminales:",
	"Podrá usar y llevar todo tipo de coches y ropa de civiles.",	
	"Siempre antes de abrir fuego o utilizar armas deberá portar el chaleco que lo identifique o la placa.",
	"Podrá liberar zonas de organizaciones Criminales, seguir y atrapar personas..",
	(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

detective = true;
	
};

if (_p == "finish") exitWith {
	_nivel = call life_coplevel;

	if (_nivel < 3) exitWith {hint "No tienes el Rango de policia suficiente."};

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center""> UDEV Confidencial </t><br/><t size=""1"">- Cuerpo de Detectives de Metropolis</t>";

("Cuerpo de Detectives") hintC [
	_paraf,
	"Investigacion finalizada",
	(parseText "Para mas informacion, dirijase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _player spawn {
		_player select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
waituntil {isNull (findDisplay 72)};

detective = false;
investigado = nil; publicVariable "investigado"
	
};