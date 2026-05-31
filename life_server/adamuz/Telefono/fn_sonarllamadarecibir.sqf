/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

*/

_tono = profilenamespace getvariable ["tonodellamada", ["a_tono2", 4]];
_sonido = _tono select 0;
_tiempo = _tono select 1;
_ruta = "pop_iconos2\Movil\Sonidos\Android\" + _sonido + ".ogg";

while {player getvariable ["mellaman", false]} do
{
	playSound3D [_ruta, player, false, getPosASL player, 5, 1, 10];
	sleep _tiempo;
};