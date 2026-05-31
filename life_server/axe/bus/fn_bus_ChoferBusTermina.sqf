
private ["_found"];

_found = false;
{
	if (_x == player) exitWith
	{
		BUS_Conductores deleteAt _foreachIndex;
		_found = true;
	};
} forEach BUS_Conductores;

if (_found) then
{
	publicVariable "BUS_Conductores";
	hint "Has sido retirado del servicio";
	bus_loop1 = false;
};