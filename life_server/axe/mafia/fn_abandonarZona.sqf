
/*
	AxE Is On Top

	Totalmente hecho por AxE para Pop4.
	El que me lo robe le mando los abogados en moto.

*/

_zona = _this select 0;
_grupo = _zona getVariable ["gangOwner",grpNull];
_grupoid = _zona getVariable ["gang_id",-1];

if (isNull _grupo) exitWith {}; // Que putas ??

	_accion = [
		"Estas seguro de quere abandonar esta Zona ?",
		"Abandonando Zona..",
		"Abandonar",
		"Cancelar"
	] call BIS_fnc_guiMessage;

if!(_accion) exitWith {titleText["Captura Cancelada","PLAIN"];};

if (life_gangrank < 4) exitWith {hint "Ha ?? Y tu quien eres para decir que tu organización ya no controla esta zona ?? "};

_zona setVariable["inCapture",false,true];
_zona setVariable["gangOwner",grpNull,true];
_zona setVariable["gang_id",-1,true];

[_zona,grpNull] spawn life_fnc_initExtorsion;
if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};
[[life_gangid,"-1",-1,[],0],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;

titleText["Tu organización ya NO controla esta Zona!","PLAIN"];
