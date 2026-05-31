// By FuRixX Lamborghini \\

_Dialogo = findDisplay 2900;
_Lista = _Dialogo displayCtrl 2902;
_Seleccion = lbCurSel _Lista;

if (isNil "FuRixX_Admin_Jugadores") exitWith {hint "ERROR: Variable de jugadores no definida"};
if (_Seleccion == -1) exitWith {hint "Debes seleccionar a un jugador primero"};

_Seleccionado = FuRixX_Admin_Jugadores select _Seleccion;
if (isNil "_Seleccionado") exitWith {hint "ERROR: No se ha podido obtener al jugador"};

_Seleccionado call fnc_beginspectate;

// By FuRixX Lamborghini \\