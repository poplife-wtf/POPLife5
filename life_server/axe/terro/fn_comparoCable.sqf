private ["_cortoCable", "_comparo"];
_cortoCable = _this select 0;

_comparo = [CABLE, _cortoCable] call BIS_fnc_areEqual;


if (_comparo) then {
	hint parseText format["<t align='center'><t size='1.7' color='#33FF00'>Bomba Desactivada</t>"];
	DESACTIVADA = true;
	publicVariable "DESACTIVADA";
	
} else {
	hint parseText format["<t align='center'><t size='1.7' color='#FF3300'>Bomba ACTIVADA</t><br/>Fuera de aqui ! Pero Cagando leches !!!"];
	ACTIVADA = true;
	publicVariable "ACTIVADA";
	CABLE="X"; publicVariable "CABLE";
	CODIGO=["X"]; publicVariable "CODIGO";
	
};