if (isNil "axe_SPTrabajando") then {axe_SPTrabajando = false;};
if (!axe_SPTrabajando) exitWith {hint "No estas de servicio o ya aceptaste una solicitud!";};
disableSerialization;
createDialog "spmenu";
_display        = findDisplay 6700; 
_listadomenutaxi    = _display displayCtrl 6701;
sleep 1;
if (isNil {LlamadasSPCliente}) exitWith {hint "Al parecer no hay llamadas de momento"};
if (count LlamadasSPCliente > 0) then
{
	{
		_listadomenutaxi lbAdd format ["%1 (%2 metros)",name _x,(_x distance player)];
		_listadomenutaxi lbSetData [(lbSize _listadomenutaxi)-1,format ["%1",_x]];
	} forEach LlamadasSPCliente;
};

hint "Se han listado todas las solicitudes de seguridad privada, selecciona una para continuar...";