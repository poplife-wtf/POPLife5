/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

*/

if (isnil {recibido}) exitwith {};
if !(recibido) exitwith {};
_tipo = _this select 0;
_msg = _this select 1;
_player = _this select 2;
_numero = [_player] call ica_fnc_cualesmitelefono;

ada_notis = {
	_sonido = profilenamespace getvariable ["tononotificacion", "a_notificacion4"];
	playsound _sonido;
};

ada_notis_glob = {
	_sonido = profilenamespace getvariable ["tononotificacion", "a_notificacion4"];	
	_ruta = "pop_iconos2\Movil\Sonidos\Android\" + _sonido + ".ogg";
	playSound3D [_ruta, player, false, getPosASL player, 5, 1, 10];
};

if (_tipo isEqualTo "admin") exitwith 
{
	if ((call life_adminlevel) < 1) exitwith{};
	hint parsetext format ["<br/><t color='#faff00' size='2' shadow='1'shadowColor='#f61010'>~ALERTA ADMIN~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'>(%1)<br/><br/></t>%2 ", name _player,  _msg];
	0 spawn ada_notis;
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_nombre = format ["ADMIN (%1)", name _player];
	_mensajes pushBack [_nombre, _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];
};
if (_tipo isEqualTo "emer") exitwith 
{
	_numero = [_player] call ica_fnc_cualesmitelefono;
	hint parsetext format ["<br/><t color='#faff00' size='2' shadow='1'shadowColor='#f61010'>~EMERGENCIAS 112~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'>(%1)<br/><br/></t>%2 ",_numero,  _msg];
	0 spawn ada_notis_glob;
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_nombre = format ["EMER (%1)", _numero];
	_mensajes pushBack [_nombre, _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];
};
if (_tipo isEqualTo "policia") exitwith 
{
	_numero = [_player] call ica_fnc_cualesmitelefono;
	hint parsetext format ["<br/><t color='#faff00' size='2' shadow='1'shadowColor='#f61010'>~POLICIA~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'>(%1)<br/><br/></t>%2 ",_numero,  _msg];
	0 spawn ada_notis_glob;
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_nombre = format ["POLICIA (%1)", _numero];
	_mensajes pushBack [_nombre, _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];	
};
if (_tipo isEqualTo "ems") exitwith 
{
		_numero = [_player] call ica_fnc_cualesmitelefono;
		hint parsetext format ["<br/><t color='#faff00' size='2' shadow='1'shadowColor='#f61010'>~EMS 061~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'>(%1)<br/><br/></t>%2 ",_numero,  _msg];
		0 spawn ada_notis_glob;
		
		_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
		reverse _mensajes;
		_nombre = format ["EMS (%1)", _numero];
		_mensajes pushBack [_nombre, _msg];
		reverse _mensajes;
		if (count _mensajes >= 30) then {_mensajes resize 30};
		profileNamespace setVariable ["todoslosmensajes", _mensajes];
};
if (_tipo isEqualTo "bomberos") exitwith 
{
	_numero = [_player] call ica_fnc_cualesmitelefono;
	hint parsetext format ["<br/><t color='#faff00' size='2' shadow='1'shadowColor='#f61010'>~BOMBEROS 080~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'>(%1)<br/><br/></t>%2 ",_numero,  _msg];
	0 spawn ada_notis_glob;
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_nombre = format ["BOMB. (%1)", _numero];
	_mensajes pushBack [_nombre, _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];

};
if (_tipo isEqualTo "taxis") exitwith 
{
	if (isNil "axe_TaxiTrabajando") then {axe_TaxiTrabajando = false;};
	if (!axe_TaxiTrabajando) exitwith{};
	_numero = [_player] call ica_fnc_cualesmitelefono;
	hint parsetext format ["<br/><t color='#faff00' size='2' shadow='1'shadowColor='#f61010'>~METRO TAXI~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'>(%1)<br/><br/></t>%2 ",_numero,  _msg];
	0 spawn ada_notis_glob;
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_nombre = format ["TAXI (%1)", _numero];
	_mensajes pushBack [_nombre, _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];
};
if (_tipo isEqualTo "seg") exitwith 
{
	if (isNil "axe_SPTrabajando") then {axe_SPTrabajando = false;};
	if (!axe_SPTrabajando) exitwith{};
	_numero = [_player] call ica_fnc_cualesmitelefono;
	hint parsetext format ["<br/><t color='#faff00' size='2' shadow='1'shadowColor='#f61010'>~SEG. PRIVADA~<br/></t><t color='#faff00' size='1.5' shadow='1'shadowColor='#f61010'>(%1)<br/><br/></t>%2 ",_numero,  _msg];
	0 spawn ada_notis_glob;
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_nombre = format ["SEG. (%1)", _numero];
	_mensajes pushBack [_nombre, _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];
};
if (_tipo isEqualTo "popfonica") exitwith 
{
	hint "Has recibido un mensaje de POPFonica";
	
	_sonido = profilenamespace getvariable ["tononotificacion", "a_notificacion4"];	
	_ruta = "pop_iconos2\Movil\Sonidos\Android\" + _sonido + ".ogg";
	playSound3D [_ruta, player, false, getPosASL player, 5, 1, 10];
	
	"Has enviado correctamente el mensaje!" remoteexec ["hint", _player];
	['mensajes', 'samsung'] remoteexec ["ica_fnc_initmovil", _player];
	_player setvariable ["enviando", nil, true];
	
	_mensajes = profileNamespace getVariable ["todoslosmensajes", []];
	reverse _mensajes;
	_mensajes pushBack ["POPFonica", _msg];
	reverse _mensajes;
	if (count _mensajes >= 30) then {_mensajes resize 30};
	profileNamespace setVariable ["todoslosmensajes", _mensajes];
};

