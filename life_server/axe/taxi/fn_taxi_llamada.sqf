// Excepciones ...
if (isNil "axe_TaxiLlamado") then {axe_TaxiLlamado = false;};
if (axe_TaxiLlamado) exitWith { hint "Ya has llamado a un Taxi, cancela o espera!"; };
if (axe_TaxiTrabajando) exitWith { hint "Haber amigo ... Taxista buscando taxi ??!"; };

// Todo okay seguimos

axe_TaxiLlamado = true;
[player] remoteExec ["ica_fnc_taxi_llamarTaxistas",2];
hint "Estamos buscandote un Taxi. Porfavor espera hasta que algún taxista acepte tu solicitud en Máximo 60 segundos.";