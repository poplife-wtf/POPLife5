/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

*/
private ["_return"];
_numero = _this select 0;
_contactos = profilenamespace getvariable ["agendatlf", []];

_return = [];
{
	if (_x select 2 isEqualTo _numero) exitwith {_return = [_x select 1]};
} foreach _contactos;

_return

