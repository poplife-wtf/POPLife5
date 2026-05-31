/*

 ~~ ADAMUZ SYSTEMS ~~
Sistema de explosiones por choque en gasolineras. Si chocan a más de la velocidad establecida (75km/h). Rebienta la gasolinera y el coche en el que iba.

INICIAR SCRIPT: ["init"] spawn ica_fnc_rebientagasolineras; (poner los event handlers)
PARAR SCRIPT: ["stop"] spawn ica_fnc_rebientagasolineras; (quitar los event handlers)

*/

_tipo = _this select 0;
_gasolineras = [[9313.77,9343.35,0.00143814], [8838.3,7481.63,0.00143909], [9074.95,3725.72,0.00143814], [5901.87,8259.12,0.00143433], [4606.96,9458.27,0.00143433], [3487.33,2755.87,0.00143814], [877.153,5416.13,0.00143862], [922.912,5403.61,0.00143862], [676.804,2092.11,0.00143862], [1965.7,982.845,0.00143862], [1971.24,1092.18,0.00143862], [5179.23,1319.94,0.00143814], [5150.81,2760.87,0.00143814], [6216.44,2359.49,0.00145721], [9625.99,2512.36,0.00143862], [9081.32,3724.19,0.00143814], [6901.55,4050.56,0.00142002], [6759.76,5144.09,0.00143862], [8274.32,6342.42,0.00143909], [3468.01,7576.53,0.00144196]];

if (_tipo == "init") exitwith 
{
	{
		_posiciongasx = _x;
		{
			if (_x isKindOf "land_mr_dino_gasstation") then 
			{
				_x addEventHandler 
				[
					"EpeContactStart",
					{
						_player = _this select 1;
						_speed = speed vehicle _player;
						_gas = _this select 0;

						if (((_speed >= 75) OR (_speed <= -75)) && (_player distance _gas < 17)) exitwith 
						{	
							"HelicopterExploSmall" createVehicle getPos (_gas);
							vehicle _player setdamage 1;
						};
					}
				];
			};
		} forEach nearestObjects [_posiciongasx,[],10];	
	} forEach _gasolineras;
	systemChat "Gasolineras cargadas!";
};

if (_tipo == "stop") exitwith
{
	{
		_posiciongasx = _x;
		{
			if (_x isKindOf "land_mr_dino_gasstation") then {_x removealleventhandlers "EpeContactStart";}
		} forEach nearestObjects [_posiciongasx,[],10];
	} forEach _gasolineras;
	systemChat "Gasolineras descargadas!";
};
if (true) exitwith {};



