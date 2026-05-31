_mode = [_this, 0, -1] call BIS_fnc_param;
_info = [_this, 1, -1] call BIS_fnc_param;
precioPerM = 1; //Ajustar probando

switch (_mode) do
{
	case 1:
	{
		LlamadasTaxiCliente = _info;
		systemChat "Tus llamadas de taxi han sido actualizadas!";
		axe_TaxiTrabajando = true;
	};
	case 2:
	{
		hint format ["El Taxista %1 ha aceptado tu solicitud, esta a %2 metros de tu posición.",name _info,floor (player distance _info)];
		axe_taxista = _info;
		axe_TaxiLlamado = true;
		taxi_eventHandlerID1 = player addEventHandler ["Entrar", {
			sleep 0.1;
			if (axe_taxista == (driver vehicle player)) then {axe_enTaxi = true;};
		}];
		taxi_AcciondeSalida = player addAction ["Parar servicio de Taxi", {
			hint format ["Has dejado de usar el servicio de Taxi, has pagado $%1 por el viaje.",axe_taxiCostoTotal];
			axe_TaxiLlamado = false;
			axe_enTaxi = false;
			if (axe_taxiCostoTotal > pop_din) then {pop_atmdin = pop_atmdin - axe_taxiCostoTotal; hint "No tenías suficiente dinero contigo, has pagado con tarjeta de crédito.";} else {pop_din = pop_din - axe_taxiCostoTotal;};
			[axe_taxiCostoTotal,precioPerM] remoteExec ["ica_fnc_taxi_finalizaViaje",axe_taxista];
			player removeAction taxi_AcciondeSalida;
		}];
		_oldTaxiPos = getPos player;
		axe_taxiCostoTotal = 0;
		_updateCount = 0;
		sleep 5;
		while {axe_TaxiLlamado && !(player getVariable "restrained")} do {
			sleep 0.1;
			_updateCount = _updateCount + 1;
			hintSilent parseText format ["TAXIMETRO<br/><br/><t align='left'>Distancia Recorrida</t><t align='right'>%1</t><br/><t align='left'>Costo</t><t align='right'>%2</t>",floor (axe_taxiCostoTotal/precioPerM),axe_taxiCostoTotal];
			if ((_oldTaxiPos distance player >= 1)&&(axe_taxista == (driver vehicle player))) then { axe_taxiCostoTotal = axe_taxiCostoTotal + precioPerM; _oldTaxiPos = getPos player; };
			if (_updateCount>=200) then {
				[5,axe_taxiCostoTotal] remoteExec ["ica_fnc_taxi_respuesta",axe_taxista];
			};
		};
		if (axe_enTaxi) then {
			hint format ["Has dejado de usar el servicio de Taxi, has pagado $%1 por el viaje.",axe_taxiCostoTotal];
			axe_TaxiLlamado = false;
			axe_enTaxi = false;
			if (axe_taxiCostoTotal > pop_din) then {pop_atmdin = pop_atmdin - axe_taxiCostoTotal; hint "No tenías suficiente dinero contigo, has pagado con tarjeta de crédito.";} else {pop_din = pop_din - axe_taxiCostoTotal;};
			[axe_taxiCostoTotal,precioPerM] remoteExec ["ica_fnc_taxi_finalizaViaje",axe_taxista];
			player removeAction taxi_AcciondeSalida;
		};
	};
	case 3:
	{
		hint "Ningún taxista aceptó tu solicitud luego de 30 segundos, Serás mala paga ?, Se te quitó de la lista de espera puedes volver a pedir taxi cuando quieras.";
		axe_TaxiLlamado = false;
    };
    case 4:
    {
    	hint "Actualmente no hay taxistas trabajando, No todo es trabajo macho!.";
    	axe_TaxiLlamado = false;
	};
	case 5:
	{
		axe_taxiCostoTotalBACKUP = _info;
	};
	case 6:
	{
			axe_TaxiLlamado = false;
			sleep 0.2;
			hint format ["El taxista paró el servicio, has pagado $%1 por el viaje, asi sea a medias el gas esta caro eh.",axe_taxiCostoTotal];
			axe_enTaxi = false;
			if (axe_taxiCostoTotal > pop_din) then {pop_atmdin = pop_atmdin - axe_taxiCostoTotal; hint "No tenías suficiente dinero contigo, has pagado con tarjeta de crédito.";} else {pop_din = pop_din - axe_taxiCostoTotal;};
			[axe_taxiCostoTotal,precioPerM] remoteExec ["ica_fnc_taxi_finalizaViaje",axe_taxista];
			player removeAction taxi_AcciondeSalida;
	};
	case 7:
	{
		LlamadasSPCliente = _info;
		systemChat "Un Cliente Solicita Seguridad Privada, se ha listado en tu PDA.";
	};
	case 8:
	{
		LlamadasSPCliente = _info;
		systemChat "Un cliente ha cancelado la solicitud Seguridad Privada, se ha retirado de tu PDA.";
	};
	case 9:
	{
		LlamadasBBCliente = _info;
		systemChat "Alguien solicita asistencia de bomberos, se ha listado en tu PDA.";
	};
	case 10:
	{
		LlamadasBBCliente = _info;
		systemChat "Se ha cancelado la última solicitud de Bomberos, se ha retirado de tu PDA.";
	};		
};