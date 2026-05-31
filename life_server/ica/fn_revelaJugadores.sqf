
/*
por: Icaruk
	
Params:
	0: GROUP - En este caso: CIVILIAN o WEST. 
	1: SCALAR - Duración en segundos.
	2: SCALAR - Intervalo de detección en segundos.
	
	[CIVILIAN, 60 * 15, 60] spawn ica_fnc_revelaJugadores
*/


_bando = param [0];
_duracion = param [1, 60 * 10, [0]];
_intervalo = param [2, 60, [0]];

_color = switch (_bando) do {
	case CIVILIAN: {"ColorGreen"};
	case WEST: {"ColorBlue"};
	
	default {"ColorGreen"};
};

_mrks = [];

while {_duracion > 0} do {
	
	{
		if !(_x in allUnits) then {
			deleteMarkerLocal str _x;
		};
	} forEach _mrks;
	
	_mrks = [];
	
	{
		if(alive _x && isplayer _x) then {
			deleteMarkerLocal str _x;
			
			_m = createMarkerLocal [str _x,getPos _x];
			_m setMarkerTypeLocal "mil_circle";
			_m setMarkerPosLocal getPos _x;
			_m setMarkerSizeLocal [1,1];
			_m setMarkerColorLocal _color;
			PlayerMarkers = PlayerMarkers + [_x];
		};
	} forEach allUnits;	
	
	
	_duracion = _duracion - _intervalo;
	sleep _intervalo;
};




