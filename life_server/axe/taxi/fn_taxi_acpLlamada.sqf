disableSerialization;
_display        = findDisplay 6600;
_listadomenutaxi    = _display displayCtrl 6601;
if !(lbCurSel _listadomenutaxi >=0) exitWith {hint "Falla el listado";};
_player         = _listadomenutaxi lbData (lbCurSel _listadomenutaxi);
_player = call compile _player;

hint format ["Has aceptado la llamada de taxi de %1. que esta a %2 metros de ti. Se ha marcado en tu mapa.",name _player,player distance _player];

axe_clienteTaxi = _player;

[player,_player] remoteExec ["ica_fnc_taxi_llamadaAceptada",2];
[2,player] remoteExec ["ica_fnc_taxi_respuesta",_player];

_markerText = createMarkerLocal ["UbicaTaxi", getPos _player];
"UbicaTaxi" setMarkerColorLocal "ColorEAST";
"UbicaTaxi" setMarkerTextLocal format ["%1 Solicita Taxi",name _player];
"UbicaTaxi" setMarkerTypeLocal "c_car";
0 spawn {
waituntil {axe_TaxiTrabajando};
deleteMarkerLocal "UbicaTaxi"
};
axe_TaxiTrabajando = false;
closeDialog 0;

taxi_AcciondeSalida = player addAction ["Parar Servicio de Taxi", {
	if (alive axe_clienteTaxi) then {
		[6] remoteExec ["ica_fnc_taxi_respuesta",axe_clienteTaxi];
		player removeAction taxi_AcciondeSalida;
	} else {
		player removeAction taxi_AcciondeSalida;
		_message = parseText format ["Has parado el viaje, pero el cliente parece estar muerto o ido lejos de su mente. Obtienes el último pago guardado. ($%1).",axe_taxiCostoTotalBACKUP];
		titleText[format["%1",_message],"PLAIN"];
		pop_din = pop_din + axe_taxiCostoTotalBACKUP;
		axe_TaxiTrabajando = true;
		[player] remoteExec ["ica_fnc_taxi_vaAtrabajar",2];
	};
}];

axe_taxiCostoTotalBACKUP = 0;

while {player distance _player > 10} do { "UbicaTaxi" setMarkerPosLocal getPos _player; };

deleteMarkerLocal "UbicaTaxi";