/*
fn_openDuelUI.sqf
Kevin Webb //Editado por Rosen
Description: As you can see, opens and sets up the duel UI.
*/
createDialog "carrera_ilegal"; //Custom Rosen
disableSerialization;
_jugadores = param[0];
_display = findDisplay 15100;
_lista = _display displayctrl 15101;
lbClear 15101;
_i = 0;
while {_i < count _jugadores} do {
	_lista lbAdd (str(_i)); //Anti metagaming
	_lista lbSetData [_i, str(_jugadores select _i)];
	_i = _i + 1;
};
_lista ctrlAddEventHandler ["LBSelChanged",{_jugador = lbData[15101,(lbCurSel 15101)];[_jugador,"Quitar"] spawn ica_fnc_flecha;[_jugador,"Poner"] spawn ica_fnc_flecha;}];