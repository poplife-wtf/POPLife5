/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

*/
disableserialization;
_tipo = _this select 0;

if (_tipo isEqualTo "anadir") exitwith 
{	
	_nombre = _this select 1;
	_numero = _this select 2;
	_foto = _this select 3;

	if (_numero isEqualTo "000" OR _numero isEqualTo "112" OR _numero isEqualTo "091" OR _numero isEqualTo "061" OR _numero isEqualTo "080" OR _numero isEqualTo "040" OR _numero isEqualTo "035" OR _numero isEqualTo "999") exitWith {hint "No puedes agregar este numero a tu lista de contactos."}; 

	if !(isnil "ocupado") exitwith {hint "Espera un poco antes de borrar otro contacto."};
	ocupado = true;


	if (_nombre isEqualTo "") exitwith {ocupado = nil; Hint "Debes poner un nombre al contacto."};
	if (_numero isEqualTo "") exitwith {ocupado = nil; Hint "Debes poner un numero al contacto."};
	if (count _numero < 9) exitwith {ocupado = nil; Hint "El numero debe tener al menos 9 digitos."};
	
	_contactos = profilenamespace getvariable ["agendatlf", []];
	
	puede = true;
	{
		if (_x select 1 isEqualTo _nombre) exitwith {hint "Ya existe un contacto con ese nombre."; puede = false;};
		if (_x select 2 isEqualTo _numero) exitwith {hint "Ya existe un contacto con ese numero."; puede = false;}; 
	} foreach _contactos;
	
	if !(puede) exitwith {ocupado = nil;};
	
	_idcontacto = 0;
	{
		_idcontacto = _idcontacto + 1; 
	} foreach _contactos;
	_contactos pushback [_idcontacto, _nombre, _numero, _foto];
	profilenamespace setvariable ["agendatlf", _contactos];
	Hint format ["Has agregado a %1 a tu lista de contactos", _nombre];
	["contactos", "samsung"] spawn ica_fnc_initmovil;
	estaanadiendocontacto = false;
	sleep 3;
	ocupado = nil;
};

if (_tipo isEqualTo "eliminar") exitwith 
{
	if !(isnil "ocupado") exitwith {hint "Espera un poco antes de borrar otro contacto."};
	
	_numero = _this select 1;
	if (_numero isEqualTo ([player] call ica_fnc_cualesmitelefono)) exitwith {hint "No puedes borrar este contacto"};
	if (_numero isEqualTo "000" OR _numero isEqualTo "112" OR _numero isEqualTo "091" OR _numero isEqualTo "061" OR _numero isEqualTo "080" OR _numero isEqualTo "040" OR _numero isEqualTo "035" OR _numero isEqualTo "999") exitWith {hint "No puedes borrar este contacto."}; 

	ocupado = true;	
	
	_contactos = profilenamespace getvariable ["agendatlf", []];
	
	if (_numero isEqualTo "") exitwith {ocupado = nil; Hint "Selecciona un contacto para borrarlo."};
	if (count _numero < 9) exitwith {ocupado = nil; Hint "Numero Erroneo."};
	if (count _contactos isEqualTo 0) exitwith {ocupado = nil; hint "No tienes contactos para eliminar";};
	
	puede = false;
	{
		if (_x select 2 isEqualTo _numero) exitwith {puede = true;}; 
	} foreach _contactos;
	
	if !(puede) exitwith {ocupado = nil; hint "No puedes borrar este contacto"};
	
	_idX = [99999, "Error"];
	_cual = -1;
	{
		_cual = _cual + 1;
		if (_x select 2 isEqualTo _numero) exitwith 
		{
			_idX = [_x select 0, _x select 1];
			_contactos = _contactos - [(_contactos select _cual)];
		}; 
	} foreach _contactos;
	
	{
		if ((_x select 0) > (_idX select 0)) then 
		{
			_x set [0, (_x select 0) - 1];
		};
	} foreach _contactos;
	
	profilenamespace setvariable ["agendatlf", _contactos];
	hint format ["Has eliminado a %1 de tu lista de contactos", _idX select 1];
	["contactos", "samsung"] spawn ica_fnc_initmovil;
	sleep 3;
	ocupado = nil;
};

if (_tipo isEqualTo "editar") exitwith 
{
	if !(isnil "ocupado") exitwith {hint "Espera un poco antes de editar otro contacto."};
	
	ocupado = true;
	
	_nuevonombre = _this select 1;
	_nuevonumero = _this select 2;
	_nuevafoto = _this select 3;
	_contactooriginal = _this select 4;
	
	_contactos = profilenamespace getvariable ["agendatlf", []];
	
	encontrado = false;
	{
		if ((_x select 0) isEqualTo (_contactooriginal select 0)) exitWith 
		{
			_x set [1, _nuevonombre];
			_x set [2, _nuevonumero];
			_x set [3, _nuevafoto];
			encontrado = true;
		};
	} foreach _contactos;
	
	if !(encontrado) ExitWith {ocupado = nil; hint "No se ha podido editar el contacto."};
	encontrado = nil;
	profilenamespace setvariable ["agendatlf", _contactos];
	hint "Has editado el contacto satisfactoriamente!";
	sleep 3;
	ocupado = nil;
};