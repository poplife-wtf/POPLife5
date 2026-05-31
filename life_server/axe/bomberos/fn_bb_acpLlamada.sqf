disableSerialization;
_display        = findDisplay 6800;
_listadomenubb    = _display displayCtrl 6801;
if !(lbCurSel _listadomenubb >=0) exitWith {hint "Falla la PDA";};
_player         = _listadomenubb lbData (lbCurSel _listadomenubb);
_player = call compile _player;

hint format ["Has aceptado la llamada de bomberos hecha por %1. que esta a %2 metros de ti. Se ha marcado en tu mapa.",name _player,player distance _player];

axe_clienteBB = _player;

[[player,_player],"ica_fnc_bb_llamadaAceptada",false,false] spawn life_fnc_mp;

_markerText = createMarkerLocal ["UbicaBB", getPos _player];
"UbicaBB" setMarkerColorLocal "ColorEAST";
"UbicaBB" setMarkerTextLocal format ["Alerta Bomberos: %1",name _player];
"UbicaBB" setMarkerTypeLocal "n_support";

axe_BBtrabajando = false;
closeDialog 0;


while {player distance _player > 10} do { "UbicaBB" setMarkerPosLocal getPos _player; };
deleteMarkerLocal "UbicaBB";