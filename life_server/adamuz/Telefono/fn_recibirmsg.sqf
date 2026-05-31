
_msg = _this select 0;
_player = _this select 1;
_admin = param [2, false];

if (_admin) exitwith
{
	hint "Has recibido un mensaje de ADMINISTRACION";
	
	_sonido = profilenamespace getvariable ["tononotificacion", "a_notificacion4"];	
	_ruta = "pop_iconos2\Movil\Sonidos\Android\" + _sonido + ".ogg";
	playSound3D [_ruta, player, false, getPosASL player, 5, 1, 10];
	
	"Has enviado correctamente el mensaje!" remoteexec ["hint", _player];
	['mensajes', 'samsung'] remoteexec ["ica_fnc_initmovil", _player];
	_player setvariable ["enviando", nil, true];
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_mensajes pushBack ["ADMINISTRACION", _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];
};

if (((["pop_iphone"] call ica_fnc_tengo) isEqualTo 0) AND ((["pop_nokia"] call ica_fnc_tengo) isEqualTo 0) AND ((["pop_note"] call ica_fnc_tengo) isEqualTo 0)) then 
{
	["devolver"] remoteexec ["ica_fnc_mandarmsg", _player];
} else
{
	_numquien = [_player] call ica_fnc_cualesmitelefono;

	_agregado = [_numquien] call ica_fnc_tlfagregado;
	
	_quepongo = _numquien;
	if (count _agregado isEqualTo 0) then {_quepongo = _numquien};
	if (count _agregado > 0) then {_quepongo = _agregado select 0};

	hint format ["Has recibido un mensaje de %1", _quepongo];
	
	_sonido = profilenamespace getvariable ["tononotificacion", "a_notificacion4"];	
	_ruta = "pop_iconos2\Movil\Sonidos\Android\" + _sonido + ".ogg";
	playSound3D [_ruta, player, false, getPosASL player, 5, 1, 10];
	
	"Has enviado correctamente el mensaje!" remoteexec ["hint", _player];
	['mensajes', 'samsung'] remoteexec ["ica_fnc_initmovil", _player];
	_player setvariable ["enviando", nil, true];
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_mensajes pushBack [_numquien, _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];
};

