_taxiConductor = _this select 0;
_target = _this select 1;

LlamadasTaxi = LlamadasTaxi - [_target];
{ [1,LlamadasTaxi] remoteExec ["ica_fnc_taxi_respuesta",_x]; } forEach TaxistasEnServicio; // Llamo taxis
TaxistasEnServicio = TaxistasEnServicio - [_taxiConductor];