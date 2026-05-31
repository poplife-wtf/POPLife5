// By FuRixX Lamborghini \\

waitUntil{!isNull findDisplay 46};
waitUntil{getClientStateNumber > 8};
waitUntil {life_session_completed};
waitUntil{([] call FuRixX_fnc_TiempoConectado) > 0.1};
waitUntil{life_is_alive};

_Obtener = profileNamespace getVariable [FuRixX_VarKey_Posicion, []];

_equip = format ["%1_Equipacion", FuRixX_VarKey_Posicion];
_ObtenerEquip = profileNamespace getVariable [_equip, getUnitLoadout player];

player setVehiclePosition [_Obtener, [], 0, "CAN_COLLIDE"];
player setPosASL _Obtener;

0 spawn {
	player allowDamage false;
	sleep 3;
	player allowDamage true;
};
	
systemChat "F.L -> Se te ha teletransportado a tu última posición.";

sleep 5;

while {true} do {

	profileNamespace setVariable [FuRixX_VarKey_Posicion, getPosASL player];
	profileNamespace setVariable [_equip, getUnitLoadout player];
	sleep 1;
};

// By FuRixX Lamborghini \\
