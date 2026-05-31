disableSerialization;
_display        = findDisplay 6700;
_listadomenutaxi    = _display displayCtrl 6701;
if !(lbCurSel _listadomenutaxi >=0) exitWith {hint "Falla el listado";};
_player         = _listadomenutaxi lbData (lbCurSel _listadomenutaxi);
_player = call compile _player;

hint format ["Has aceptado la llamada de seguridad privada hecha por %1. que esta a %2 metros de ti. Se ha marcado en tu mapa.",name _player,player distance _player];

axe_clienteSP = _player;

[[player,_player],"ica_fnc_sp_llamadaAceptada",false,false] spawn life_fnc_mp;

_markerText = createMarkerLocal ["UbicaSP", getPos _player];
"UbicaSP" setMarkerColorLocal "ColorEAST";
"UbicaSP" setMarkerTextLocal format ["Cliente S.P.: %1",name _player];
"UbicaSP" setMarkerTypeLocal "n_support";

axe_SPtrabajando = false;
closeDialog 0;


while {player distance _player > 10} do { "UbicaSP" setMarkerPosLocal getPos _player; };
deleteMarkerLocal "UbicaSP";