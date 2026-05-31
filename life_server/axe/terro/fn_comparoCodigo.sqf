private ["_codigo", "_codiDialogo", "_comparo"];
_codigo = _this select 0;
_codiDialogo = _this select 1;
_comparo = [_codigo, _codiDialogo] call BIS_fnc_areEqual;

if (_comparo) then {
	hint parseText format["<t align='center'><t size='1.7' color='#33FF00'>Uff!! La Bomba Ha Sido Desarmada !</t>"];
	DESACTIVADA = true;
	publicVariable "DESACTIVADA";
	
	
} else {
	hint parseText format["<t align='center'><t size='1.7' color='#FF3300'>Bomba Activada</t><br/>A Correr !! Pero Cagando Leches !! (era %1-%2-%3-%4 no %5-%6-%7-%8)",CODIGO select 0,CODIGO select 1,CODIGO select 2,CODIGO select 3,_codiDialogo select 4,_codiDialogo select 5,_codiDialogo select 6,_codiDialogo select 7];
	ACTIVADA = true;
	publicVariable "ACTIVADA";
	
	CABLE="X"; publicVariable "CABLE";
	CODIGO=["X"]; publicVariable "CODIGO";
};
CODIDIALOGO = [];