/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

*/
disableserialization;
adatlf_fnc_terminarllamada = 
{
	player setvariable ["enllamada", false, true];
	player setvariable ["marcando", false, true];
	player setvariable ["llamando", false, true];
	player setvariable ["mellaman", false, true];
	player setvariable ["colgado", false, true];
	player setvariable ["finllamada", false, true];
	ocupado = nil;
	["llamar", "samsung"] spawn ica_fnc_initmovil;
	//Hint "La llamada ha finalizado";
	player removeaction colg2;
	player removeaction resp;
	player removeaction colg;

};

adatlf_fnc_colgar =
{
	canalantiguo = false;
};

_para = player;
_persona = _this select 0;
_numero = _this select 1;

if ((player getvariable ["enllamada", false]) OR (player getvariable ["marcando", false]) OR (player setvariable ["llamando", false]) OR (player getvariable ["mellaman", false])) exitwith {};
if (isnull (_persona) OR !(alive (_persona))) exitWith {};
if (isnull (player) OR !(alive (player))) exitWith	{};
_quienmellama = [_persona] call ica_fnc_cualesmitelefono;

player setvariable ["mellaman", true , true];
player setvariable ["colgado", false , true];
player setvariable ["aceptarllamada", false , true];
sleep 0.5;

closedialog 8542;
[] spawn ica_fnc_sonarllamadarecibir;
hint "Te están llamando al telefono...";	

_agregado = [_numero] call ica_fnc_tlfagregado;

_quepongo = "Desconocido";
if (count _agregado isEqualTo 0) then {_quepongo = "Desconocido"};
if (count _agregado > 0) then {_quepongo = _agregado select 0};

['mellaman', 'samsung', _quepongo, _quienmellama] spawn ica_fnc_initmovil;

alaputa = false;
while {true} do
{
	if (player getvariable ["colgado", false]) exitWith {alaputa = true; Hint "Has colgado la llamada..."}; 
	if (_persona getvariable ["colgado", false]) exitWith {alaputa = true; hint "Han colgado la llamada..."}; 
	if (player getvariable ["enllamada", false]) exitWith {}; 
	sleep 0.1;
};
sleep 1;
if (alaputa) exitWith {closedialog 8452; 5 cutFadeOut 0; [] call adatlf_fnc_terminarllamada};

/*----------- ACEPTO LA LLAMADA ------------*/

player setvariable ["mellaman", false , true];
/*
createdialog "ada_telefono";
['enllamada', 'samsung'] spawn ica_fnc_initmovil;
*/
//hint "En llamada";
dlgrecibiendollamada = false;
hint "Recuerda que para colgar la llamada puedes abrir el telefono, ir a llamar y colgar la llamada con el boton rojo o utilizar la accion del raton Colgar llamada!";
_tlf = uinamespace getvariable "ada_mellaman";
_fondo = _tlf displayCtrl 101;
_pantalla = _tlf displayCtrl 100;
_fondo ctrlSetText "\pop_iconos2\Movil\Android_Fondos\llamadas\p_enllamada.paa";
_moviles = ["\pop_iconos2\Movil\Samsung_Galaxy_Note_4.paa", "\pop_iconos2\Movil\iphone_6.paa", "\pop_iconos2\Movil\Nokia_lumia.paa"];	
_pantalla ctrlSetText (_moviles select 0);

/*
{
	ctrlShow _x;
}  foreach _init;
*/
(_tlf displayCtrl 513) ctrlSetText '';
(_tlf displayCtrl 514) ctrlSetText '';
(_tlf displayCtrl 515) ctrlSetText '';
		
_tiempo = 0;
_precio = 0;
_cuota = (random 0.25);
/*
_tlf = finddisplay 8542;
_tipollamada = _tlf displayCtrl 900;
_personanombre = _tlf displayCtrl 901;
_personatelefono = _tlf displayCtrl 902;
_minutos = 0;
_segundos = 0;

(_personanombre) ctrlSetText _quepongo;
(_personatelefono) ctrlSetText _quienmellama;
*/
sleep 1;
[] spawn 
{
	sleep 3;
	5 cutFadeOut 2;
};

colg2 = player addaction ["<t color=""#dd2424"">" + "Colgar llamada", {hint "Has colgado la llamada"; player removeaction colg2; playsound "a_pulsar"; player setvariable ["finllamada", true , true]; ["llamar", "samsung"] spawn ica_fnc_initmovil}];

while {true} do
{
	if ((player getvariable ["finllamada", false]) OR (_persona getvariable ["finllamada", false]) OR isnull (_persona) OR isnull (player) OR !(alive player) OR !(alive _persona)) exitwith {};
	(_tlf displayCtrl 900) ctrlSetText format["En llamada: %1", [((_tiempo)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
	(_tlf displayCtrl 901) ctrlSetText _quepongo;
	(_tlf displayCtrl 902) ctrlSetText _quienmellama;	
	_tlf2 = finddisplay 8542;
	_personanombre = _tlf2 displayCtrl 901;
	_personatelefono = _tlf2 displayCtrl 902;
	(_tlf2 displayCtrl 900) ctrlSetText format["En llamada: %1", [((_tiempo)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
	(_personanombre) ctrlSetText _quepongo;
	(_personatelefono) ctrlSetText _quienmellama;
	if !((["pop_note", false] call ica_fnc_tengo > 0) OR (["pop_nokia", false] call ica_fnc_tengo > 0) OR (["pop_iphone", false] call ica_fnc_tengo > 0)) exitwith {hint "Has perdido el telefono..."};
	if !((["pop_note", false, _persona] call ica_fnc_tiene > 0) OR (["pop_nokia", false, _persona] call ica_fnc_tiene > 0) OR (["pop_iphone", false, _persona] call ica_fnc_tiene > 0)) exitwith {ocupado = nil; hint "El telefono con el que hablabas esta apagado o fuera de cobertura..."};
	sleep 1;
	_tiempo = _tiempo + 1;
};
sleep 1;
player removeaction colg2;
[] call adatlf_fnc_terminarllamada;
[] call adatlf_fnc_colgar;
hint "La llamada ha finalizado";








