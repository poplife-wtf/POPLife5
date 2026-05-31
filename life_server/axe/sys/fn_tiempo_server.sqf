/*
Sencillamente inicializa el servidor con tiempo soleado ... gran cosa no ?
*/

_pido = param [0];

if (_pido == 0) then {
	sleep 60;
	setWind [0,0,true];
	5 setRain 0;
	5 setFog [0,0,0];
};
