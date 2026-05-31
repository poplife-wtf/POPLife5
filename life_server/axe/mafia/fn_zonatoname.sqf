/*

AxE is On Top 

Funcion que te da el nombre de la zona basandose en el código.

uso: [1] call ica_fnc_zonatoname


*/


_numeroname = _this select 0;
_zonaname = "";
switch (_numeroname) do {
	case 0: {_zonaname = "Desconocida"};
    case 1: {_zonaname = "Militar"};
	case 2: {_zonaname = "Downtown"};
	case 3: {_zonaname = "Isla Miconos"};
	case 4: {_zonaname = "Clown Town"};
	case 5: {_zonaname = "Isla de Rosario"};
	case 6: {_zonaname = "Barrio Arabe"};
	case 7: {_zonaname = "New Horizon"};
	case 8: {_zonaname = "Riverside"};
	case 9: {_zonaname = "Isla Marta"};
	case 10: {_zonaname = "Isla Milo"};
	case 11: {_zonaname = "Isla Lanai"};
	case 12: {_zonaname = "Lawrance Resort"};
    default {_zonaname = "Desconocida"};
};

_zonaname 