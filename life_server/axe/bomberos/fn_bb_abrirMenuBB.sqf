
disableSerialization;
createDialog "bbmenu";
_display        = findDisplay 6800; 
_listadomenubb    = _display displayCtrl 6801;
if (isNil "axe_BBTrabajando") then {axe_BBTrabajando = false;};
if (!axe_BBTrabajando) exitWith {hint "No estas de servicio o ya aceptaste una solicitud!";};

sleep 1;
if (isNil {LlamadasBBCliente}) exitWith {hint "Al parecer no hay solicitudes de momento"};
if (count LlamadasBBCliente > 0) then
{
	{
		_listadomenubb lbAdd format ["%1 (%2 metros)",name _x,(_x distance player)];
		_listadomenubb lbSetData [(lbSize _listadomenubb)-1,format ["%1",_x]];
	} forEach LlamadasBBCliente;
};

hint "Se han listado todas las solicitudes de bomberos, selecciona una para continuar...";