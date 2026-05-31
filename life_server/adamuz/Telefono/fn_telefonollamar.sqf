/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

*/

hint "Lo siento, las llamadas no están disponibles en este momento";

/*
disableserialization;
adatlf_fnc_terminarllamada = 
{
	player setvariable ["enllamada", false, true];
	player setvariable ["llamando", false, true];
	player setvariable ["marcando", false, true];
	player setvariable ["mellaman", false, true];
	player setvariable ["colgado", false, true];
	player setvariable ["finllamada", false, true];
	ocupado = nil;
	["llamar", "samsung"] spawn ica_fnc_initmovil;
	//Hint "La llamada ha finalizado";
};

adatlf_fnc_colgar =
{
	canalantiguo = nil;
};

ada_fnc_llamandoestoy = 
{
		
	while {(player getvariable ["sonarllamar", false])} do
	{
		playsound "llamando";
		sleep 2.5;
	};
};

if !(isnil "ocupado") exitwith {};

if !((["pop_note", false] call ica_fnc_tengo > 0) OR (["pop_iphone", false] call ica_fnc_tengo > 0) OR (["pop_nokia", false] call ica_fnc_tengo > 0)) exitwith {ocupado = nil; hint "No tienes telefono para llamar..."};


ocupado = true;

if ((player getvariable ["enllamada", false]) or (player getvariable ["llamando", false]) OR (player getvariable ["marcando", false]) OR (player getvariable ["mellaman", false])) exitWith { ocupado = nil; hint "Ya tienes una llamada en curso..."};

_numero = _this select 0;
_yo = player;

if (_numero isEqualTo ([player] call ica_fnc_cualesmitelefono)) exitwith {hint "No puedes llamarte a ti mismo melon..."};

if (_numero isEqualTo "000" OR _numero isEqualTo "112" OR _numero isEqualTo "091" OR _numero isEqualTo "061" OR _numero isEqualTo "080" OR _numero isEqualTo "040" OR _numero isEqualTo "035" OR _numero isEqualTo "999") exitWith { ocupado = nil; hint "No puedes llamar a los servicios de Emergencias de Metropolis. Debes mandar un mensaje..."}; 
if (_numero isEqualTo "") exitWith { ocupado = nil; hint "Escribe un numero para llamarlo..."};

_persona = [_numero] call ica_fnc_existeeltelefono;

if (_persona getvariable ["nomellames", false]) exitwith {hint "El telefono al que llamas esta apagado o fuera de cobertura..."};
if !((["pop_note", false, _persona] call ica_fnc_tiene > 0) OR (["pop_nokia", false, _persona] call ica_fnc_tiene > 0) OR (["pop_iphone", false, _persona] call ica_fnc_tiene > 0)) exitwith {ocupado = nil; hint "El telefono al que llamas esta apagado o fuera de cobertura..."};
if (isnull (_persona) OR !(alive (_persona))) exitWith { ocupado = nil; hint "El telefono al que llamas esta apagado o fuera de cobertura..."};
if (isnull (player) OR !(alive (player))) exitWith	{ocupado = nil; Hint "Imposible establecer la llamada. intentalo mas tarde..."};
if ((_persona getvariable ["enllamada", false]) OR (_persona getvariable ["marcando", false]) OR (_persona getvariable ["mellaman", false]) OR (_persona getvariable ["llamado", false])) exitwith 
{
	hint "El numero al que llamas esta ocupado. Intentalo mas tarde";
	ocupado = nil;
	format ["Tienes una nueva llamada entrante del numero: %1\n Estas ocupado...", [_yo] call ica_fnc_cualesmitelefono] remoteexec ["hint", _persona];
};



player setvariable ["marcando", true, true];

[player, _numero] remoteExec ["ica_fnc_telefonorecibirllamada", _persona];

hint "Marcando...";
_intentos = 0;
while {player getvariable ["marcando", false]} do
{
	if (_intentos > 100) exitwith {player setvariable ["colgado", true, true]; sleep 1; [] call adatlf_fnc_terminarllamada; Hint "Error al marcar el numero indicado..."};
	if (_persona getvariable ["mellaman", false]) exitWith {};
	_intentos = _intentos + 1;
	sleep 0.1;
};
player setvariable ["marcando", false, true];
alaputa = false;
_intentos = 0;
player setvariable ["llamando", true, true];
player setvariable ["sonarllamar", true, true];
hint "Llamando...";

_agregado = [_numero] call ica_fnc_tlfagregado;

_quepongo = "";
if (count _agregado isEqualTo 0) then {_quepongo = ""};
if (count _agregado > 0) then {_quepongo = _agregado select 0};

['llamando', 'samsung'] spawn ica_fnc_initmovil;

_tlf = finddisplay 8542;
_tipollamada = _tlf displayCtrl 900;
_playernombre = _tlf displayCtrl 901;
_playertelefono = _tlf displayCtrl 902;
(_playernombre) ctrlSetText _quepongo;
(_playertelefono) ctrlSetText _numero;
(_tipollamada) ctrlSetText "Llamando...";
0 spawn ada_fnc_llamandoestoy;
while {true} do
{
	if (_intentos > 100) exitwith {player setvariable ["colgado", true, true]; sleep 1; Hint "No responde..."; alaputa = true;};
	if (_persona getvariable ["colgado", false]) exitWith {Hint "Han colgado..."; alaputa = true;}; 
	if (player getvariable ["colgado", false]) exitWith {Hint "Has colgado..."; alaputa = true;}; 
	if (_persona getvariable ["enllamada", false]) exitWith {}; 
	_intentos = _intentos + 1;
	sleep 0.1;
};
sleep 0.5;
player setvariable ["sonarllamar", false, true];
if (alaputa) exitWith {['llamar', 'samsung'] spawn ica_fnc_initmovil; [] call adatlf_fnc_terminarllamada;};



player setvariable ["llamando", false, true];
player setvariable ["enllamada", true, true];
['enllamada', 'samsung'] spawn ica_fnc_initmovil;


(_playernombre) ctrlSetText _quepongo;
(_playertelefono) ctrlSetText ([_persona] call ica_fnc_cualesmitelefono);
(_tipollamada) ctrlSetText "En llamada: 00:00 ";

_tiempo = 0;
_precio = 0;
_minutos = 0;
_segundos = 0;
_cuota = (random 0.25);
sleep 1;

while {true} do
{
	if ((player getvariable ["finllamada", false]) OR (_persona getvariable ["finllamada", false]) OR isnull (_persona) OR isnull (player) OR !(alive player) OR !(alive _persona)) exitwith {};
	_tlf = finddisplay 8542;
	_tipollamada = _tlf displayCtrl 900;
	_playernombre = _tlf displayCtrl 901;
	_playertelefono = _tlf displayCtrl 902;

	(_playernombre) ctrlSetText "Desconocido";
	(_playertelefono) ctrlSetText ([_persona] call ica_fnc_cualesmitelefono);
	if (_tiempo > 60 && _tiempo < 120) then {_cuota = (random 0.2)};
	if (_tiempo > 120 && _tiempo < 300) then {_cuota = (random 0.12)};
	if (_tiempo > 300 && _tiempo < 500) then {_cuota = (random 0.1)};
	_precio = (_tiempo * _cuota);
	(_tipollamada) ctrlSetText format["En llamada: %1", [((_tiempo)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
	//hint FORMAT ["En llamada\nTiempo: %1 Segundos --> Precio: %2 €\nNumero: %3", _tiempo,_precio , [player] call ica_fnc_cualesmitelefono]; DEBUG
	if !((["pop_note", false] call ica_fnc_tengo > 0) OR (["pop_nokia", false] call ica_fnc_tengo > 0) OR (["pop_iphone", false] call ica_fnc_tengo > 0)) exitwith {hint "Has perdido el telefono..."};
	if !((["pop_note", false, _persona] call ica_fnc_tiene > 0) OR (["pop_nokia", false, _persona] call ica_fnc_tiene > 0) OR (["pop_iphone", false, _persona] call ica_fnc_tiene > 0)) exitwith {ocupado = nil; hint "El telefono con el que hablabas esta o fuera de cobertura..."};

	sleep 1;
	_tiempo = _tiempo + 1;
};
Hint "La llamada ha finalizado";
sleep 1;
[] call adatlf_fnc_terminarllamada;
[] call adatlf_fnc_colgar;
*/