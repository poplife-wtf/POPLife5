
/*
por: Icaruk
	call ica_fnc_sync;
*/

if (isNil {yaHeSincronizado}) then {
//	hint "Sincronizando... deberías esperar 10 segundos.";

	[] call SOCK_fnc_updateRequest;
	// [22] call SOCK_fnc_updatePartial; // exp
	[true] spawn ica_fnc_posicion;
	//profilenamespace setvariable ["rutome",0];
	
	0 spawn {
		yaHeSincronizado = true;
		sleep 120;
		yaHesincronizado = nil;
	};
} else {
	hint "Sólo puedes sincronizar cada 2 minutos.";
};
