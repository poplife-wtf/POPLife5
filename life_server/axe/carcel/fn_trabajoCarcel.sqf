
/*
Trabajo de Carcel
by: AxE
	

*/

_param = _this select 0;

if (_param  isEqualTo  "init") exitWith {

	_pos = [[9427.21,5800.24,0.00143909],[9427.83,5843.59,0.00143909],[9365.73,5847.95,0.00144482]];
    while {true} do {
{        
	_haybasura = nearestObject[_x, "pop_basura"];
	if (isNull _haybasura) then {
    _unitbasura = "pop_basura" createVehicle[(_x select 0) - 1.2 * sin(random 359), (_x select 1) - 1.2 * cos(random 359), 0];
	[_unitbasura, ["Recoger Basura", {
    player playActionNow "PutDown";
    sleep 1;	
	["bolsacargo"] spawn ica_fnc_trabajoCarcel;	
	}]] remoteExec ["addAction", -2, _unitbasura];
	sleep 20;
	};
} foreach _pos;
        sleep (60 * 10);
		
		};
};    


if (_param  isEqualTo  "trabajo") exitWith { 

player setPosATL [9423.39,5805.56,0.0707436];
player addWeapon "pop_pico_h";
hint format ["Hola %1, como en Metropolis creemos que la gente puede cambiar y ser productiva te daremos una oportunidad pica carbón o recoge basura, si trabajas duro y es lo suficiente comparado con el tiempo de tu condena saldrás libre por buena conducta",name player];

};



if (_param  isEqualTo  "pico") exitWith {
_num = parseNumber life_arrestMinutes;
if (player getVariable "pico_carcel" > (_num * 3) ) exitWith {
player setVariable ["trabajo_carcel",true,true];
[1] call fnc_releaseprison;
player removeWeapon "pop_pico_h";
hint "Has salido de la carcel de manera anticipada por tu buena condúcta";
};

			_msg_random = selectRandom [
				"Eso es !! Sigue asi y pronto saldrás",
				"Venga tio ... para hacer lo malo si ... pero para trabajar como se debe no ... que flojo",	
				"Vamo a ve ... Con ganas chaval que sino en vez de bajarte la condena de sube he ... ya lo he dicho",	
				"Metele huevos !!",
				"Madre mía delincuente de poca monta ...",
				"Y tú ?? que eras político o que ? no puedes ni con el pico ?",
				"Bien..",
				"",
				"",
				"",
				"",
				"",				
				"Sigue...",
				"Asi es ..."
			];

hint _msg_random;
_pico_carcel = player getVariable "pico_carcel";
if (isNil "_pico_carcel") then {_pico_carcel = 0};
player setVariable ["pico_carcel",_pico_carcel + 1,true];



};

if (_param  isEqualTo  "bolsacargo")exitWith{
        // Esto es para cuando el player coge bolsas de basura.
        _bolsabasura = nearestObject[player, "pop_basura"];
        // comprobaciones para ver que el player puede cargar el container
        if ((player distance _bolsabasura) > 3)exitwith{ hint "Desde aqui no llegas" };

        _bolsabasura attachto[player, [ -0.1, 0.7, -0.8 ], "Pelvis"];
        _bolsabasura setvariable["basurabolsa", 1, true];
			acciondejarbasuramc = player addAction ["Dejar basura en la cesta de basura",{
			player removeAction acciondejarbasuramc;
			["bolsadescargo"] spawn ica_fnc_trabajoCarcel;
			},nil,6,true,true,"","!isNull nearestObject[player, ""Land_GarbageContainer_open_F""]"];
        sleep 15;

        if ((_bolsabasura getvariable "basurabolsa") >= 0.5)exitwith{
                detach _bolsabasura;
                sleep 1;
                _bolsabasura setvariable["basurabolsa", 0, true];
                deleteVehicle _bolsabasura;
                sleep 2;
                hint "Has tardado mucho y se ha regado la basura...";
            };
    };
	
if (_param  isEqualTo  "bolsadescargo")exitWith{

        _contenedorc = nearestObject[player, "Land_GarbageContainer_open_F"];
		player removeAction acciondejarbasuramc;
        if ((player distance _contenedorc) > 3)exitwith{ hint "Debes acercarte más a la cesta de basura" };

        _bolsapuesta = nearestObject[player, "pop_basura"];
        if (isNull attachedTo _bolsapuesta)exitWith{
                hint "No cargas ningúna bolsa o hay otra cerca en el piso.";
            };
        _tienebolsa = _bolsapuesta getvariable "basurabolsa";
        if (_tienebolsa  isEqualTo  0)exitwith{ hint "No tienes nada que descargar." };

        _bolsapuesta setvariable["basurabolsa", 0, true];
        detach _bolsapuesta;
        deleteVehicle _bolsapuesta;
        hint "Descargado ...";

_num = parseNumber life_arrestMinutes;
if (player getVariable "pico_carcel" > _num ) exitWith {
[1] call fnc_releaseprison;
hint "Has salido de la carcel de manera anticipada por tu buena condúcta";
};		
	_pico_carcel = player getVariable "pico_carcel";
	if (isNil "_pico_carcel") then {_pico_carcel = 0};
	player setVariable ["pico_carcel",_pico_carcel + 3,true];
};	