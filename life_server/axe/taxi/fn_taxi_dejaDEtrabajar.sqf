_driver = _this select 0;
if (isNil "TaxistasEnServicio") then { TaxistasEnServicio = []; };
if (isNil "LlamadasTaxi") then { LlamadasTaxi = []; };
if (_driver in TaxistasEnServicio) then {TaxistasEnServicio = TaxistasEnServicio - [_driver];};