disableSerialization;
createDialog "taximenu";
_display        = findDisplay 6600; 
_listadomenutaxi    = _display displayCtrl 6601;
if (isNil "axe_TaxiTrabajando") then {axe_TaxiTrabajando = false;};
if (!axe_TaxiTrabajando) exitWith {hint "No estas de servicio o ya aceptaste una solicitud!";closedialog 0};
//_lvl = "tl" call ica_fnc_expToLevel;
if !(license_civ_taxista) exitWith {hint "Hombre ... para ser taxista no basta con saber manejar ... esto es un arte, deja de ser vagancia y pasa por la u primero."; closedialog 0};

[player] remoteExec ["ica_fnc_taxi_vaAtrabajar",2];
sleep 1;
if (count LlamadasTaxiCliente > 0) then
{
	{
		_listadomenutaxi lbAdd format ["%1 (%2 metros)",name _x,(_x distance player)];
		_listadomenutaxi lbSetData [(lbSize _listadomenutaxi)-1,format ["%1",_x]];
	} forEach LlamadasTaxiCliente;
};

hint "Se han listado todas las solicitudes de taxi, selecciona una para continuar...";