if (playerSide == WEST)exitWith{hint "Policia en autobus?";};
if (player in BUS_Conductores) exitWith {hint "Ya estas en servicio!";};
if !(license_civ_busetero) exitWith { hint "Solo los profesionales graduados y con licencia de Transporte de Personal."};
hint "Has empezado el servicio, Alistate!";
BUS_Conductores pushBack (player);
publicVariable "BUS_Conductores";
