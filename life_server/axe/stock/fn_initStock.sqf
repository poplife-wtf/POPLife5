
/*
AxE

Inicio aumento automático de inventario disponible en tiendas

0 spawn ica_fnc_initStock;

*/

    [[tienda_terro, ["Dejame Traerte Mercancía",{["terro"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;
    [[tienda_terro, ["Entregar Mercancía",{["entregaTerro"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;	
	
	[[zona_1, ["Dejame Traerte Mercancía",{["mafia"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;
	[[zona_1, ["Entregar Mercancía",{["entregaMafia"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;
	
	[[zona_2, ["Dejame Traerte Mercancía",{["mafia"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;
	[[zona_2, ["Entregar Mercancía",{["entregaMafia"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;	
	
	[[zona_3, ["Dejame Traerte Mercancía",{["mafia"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;
	[[zona_3, ["Entregar Mercancía",{["entregaMafia"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;	
	
	[[zona_4, ["Dejame Traerte Mercancía",{["mafia"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;
	[[zona_4, ["Entregar Mercancía",{["entregaMafia"] spawn ica_fnc_misionStock;}]],"addAction",true,true] call BIS_fnc_MP;	
	
	[[npc_transportes, ["Empezar Trabajo de Taxista",{axe_TaxiTrabajando = true;[player] spawn ica_fnc_taxi_vaAtrabajar;}]],"addAction",true,true] call BIS_fnc_MP;	
	[[npc_transportes, ["Terminar Trabajo de Taxista",{axe_TaxiTrabajando = false;[player] spawn ica_fnc_taxi_dejaDEtrabajar;}]],"addAction",true,true] call BIS_fnc_MP;
	
	[[npc_transportes_1, ["Empezar Trabajo de Bus",{[] spawn ica_fnc_bus_ChoferBusInicia;}]],"addAction",true,true] call BIS_fnc_MP;	
	[[npc_transportes_1, ["Terminar Trabajo de Bus",{[] spawn ica_fnc_bus_ChoferBusTermina;}]],"addAction",true,true] call BIS_fnc_MP;	

    [[tienda_terro, ["Contáctar Emisario Terrorista",{["iniciar"] spawn ica_fnc_atentadoEA;}]],"addAction",true,true] call BIS_fnc_MP;
    [[tienda_terro, ["Reclamar Pago Terrorista",{["finalizar"] spawn ica_fnc_atentadoEA;}]],"addAction",true,true] call BIS_fnc_MP;	
    [[tienda_terro, ["Solicitar Explosivos al ELN - Coste 25.000",{["iniciar"] spawn ica_fnc_misionBomba;}]],"addAction",true,true] call BIS_fnc_MP;	
	
	[[NPC_SEGURIDAD_PRIVADA, ["Alerta de Inicio Seguridad Privada",{
	[10, "Seguridad Privada", [1,0,0], 1.5, "Atención a todos los ciudadanos: El departamento de Seguridad Privada de Metropolis se encuentra operativo, podeis llamarles via móvil o directamente en sus oficinas en metropolis", [1,1,1], 1] remoteExec ["ica_fnc_anuncio",-2];
	},nil,1.5,true,true,""," call segurata > 0"]],"addAction",true,true] call BIS_fnc_MP;
	
	
tienda_terro setVariable ["stock", 0, true];
zona_1 setVariable ["stock", 0, true];
tienda_bf setVariable ["stock", 0, true];
tienda_terro setVariable ["transporte_en_marcha", 0, true];
zona_1 setVariable ["transporte_en_marcha", 0, true];
tienda_bf setVariable ["transporte_en_marcha", 0, true];
//PORTATll
_vari = round (random 50);
_usuarioPor = format ["hacker_%1",_vari];
HW setvariable ["nombre",_usuarioPor,true];

0 spawn {
	while {true} do {
StockTerro = tienda_terro getVariable "stock";
StockMafia = zona_1 getVariable "stock";
StockBf = tienda_bf getVariable "stock";

		//if (StockCivil < 8) then {StockCivil = StockCivil + 1;} else { StockCivil = 8;}; //civiles tienen máximo 4 armas siempre y si hay menos agrego 1 cada 10 mins.
		if (StockTerro < 20) then {StockTerro = StockTerro + 5;tienda_terro setVariable ["stock", StockTerro, true];} else { tienda_terro setVariable ["stock", 20, true];};	//Solo limitamos las tiendas de terro y mafia.
		if (StockMafia < 30) then {StockMafia = StockMafia + 10;zona_1 setVariable ["stock", StockMafia, true];} else { zona_1 setVariable ["stock",30, true];};
		if (StockBf < 20) then {StockBf = StockBf + 16;tienda_bf setVariable ["stock", StockBf, true];} else { tienda_bf setVariable ["stock", 20, true];};
//		if (StockMafia_1 < 16) then {StockMafia_1 = StockMafia_1 + 2;zona_1_1 setVariable ["stock", StockMafia_1, true];} else {zona_1_1 setVariable ["stock", 16, true];};
//		if (StockMafia_2 < 16) then {StockMafia_2 = StockMafia_2 + 2;zona_1_2 setVariable ["stock", StockMafia_2, true];} else {zona_1_2 setVariable ["stock", 16, true];};
//		if (StockMafia_3 < 16) then {StockMafia_3 = StockMafia_3 + 2;zona_1_3 setVariable ["stock", StockMafia_3, true];} else {zona_1_3 setVariable ["stock", 16, true];};
		//if (StockPoli < 40) then {StockPoli = StockPoli + 4;} else { StockPoli = 40;};
		sleep (60 * 15);
	};
};

