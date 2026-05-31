
/*
por: Neoxan & Icaruk & quick update (9 contenedores a la vez).
Actualizado por: AxE (Nuevos modelos, bolsas de basura, descarga de basura, más interáctividad, etc...)
    ["solicito"] spawn ica_fnc_basura;
*/

_param = _this select 0;

if (_param isEqualTo "inicio") exitWith {
    // contenedor es el nombre del objeto que ira en el mapa con el numero del uno al 20
    _contenedores = [];
    _palabra = "contenedor";

    for "_x" from 1 to 30 do {
        _contenedores pushBack (call compile format ["%1%2", _palabra, _x]);
    };

    //hint format ["El array de contenedores es %1", _contenedores];  COMENTAME DESPUES DE TESTEAR

    while {true} do {

        {
            if !(_x getvariable "basura") then {
                _x setvariable ["basura",true,true];// es el classname del objeto que ira dentro del contenedor
                _x animate ["tapacontenedor",1]; // Animación para que la gente pueda ver si el contenedor esta lleno o vacío
                _x animate ["basura_unhide",1]; // Animación para que la gente pueda ver si el contenedor esta lleno o vacío
            };
        } forEach _contenedores;
        sleep (60 * 20);
    };
};

if (_param isEqualTo "cargo")
    exitWith
    {
		//_lvl = "tl" call ica_fnc_expToLevel;
		if !(license_civ_basurero) exitWith { hint "Solo los empleados estatales graduados con honores de wisconsin pueden ejercer esta noble profesión de basurero."};
        // Esto es para cuando el camión va a cargar el contenedor
        _camion = nearestObject[player, "mr_garbage_main_main"];
        _contenedor = nearestObject[_camion, "pop_contenedordebasura"];
        // comprobaciones para ver que el player puede cargar el container
		if (isNil {_contenedor}) exitWith {hint "No hay un contenedor de basura cerca..."};
        if ((player distance _contenedor) > 15) exitwith{ hint "Acércate al contendor de basura." };
        if !(_contenedor getvariable "basura")exitwith{ hint "El contendor de basura está vacío." };
        // Esto lo uso para ver si el camión se mueve luego
        _poscamion = getpos _camion;
        // Posiciones en coordenadas del modelo de los puntos de memoria
        _ladoIzq = _camion selectionPosition "action_1";
        _ladoDer = _camion selectionPosition "action_2"; // AxE: Pillo solo este punto para ubicar accion permitida o no de carga con modelo de contenedor viejo
        // Se cambia el sistema de referencia del modelo al mundo
        _cargoizq = _camion modelToWorld _ladoIzq;
        _cargoder = _camion modelToWorld _ladoDer;
        // posición del contenedor de basura
        _contenedorpos = getpos _contenedor;
        if (((player distance _cargoizq) > 2) and ((player distance _cargoder) > 2) and (driver _camion != player))exitwith{ hint "Colócate en posición, en cualquiera de los laterales del camión o en el asiento de conductor." }; // AxE: Si es conductor no tiene porque acercarse a laterales.
        if ((_contenedor distance _cargoder) > 4)exitwith{ hint "Acerca la parte trasera del camión al contenedor de basura" };
        if ((_contenedor distance _cargoder) > 2)exitwith{ hint "Tienes que poner la palanca trasera del camión justo debajo del contenedor." }; //Ajustar precisión de la animación. 1.50 sería mejor.

        if (_camion animationPhase "animatesingletrash1" > 0.5) exitwith{ hint "Debes bajar las palancas antes de poder cargar basura!" }; // AxE: Nuevas animaciones del modelo.
        if ((_camion getvariable "basura") >= 9)exitwith{ hint "El camión está lleno." };
        if (_camion getvariable "cargando")exitwith{ hint "El camión está cargando." };

        _chance = random(450); // AxE: Si se carga desde el conductor hay más posibilidad de que falle la carga y se tenga que hacer manual con el attach.
        if ((_camion getvariable "cabina") > 0.5)then{ _chance = random(150) }; // AxE: var de veh cabina se settea a 1 en el handler (UserActions) del modelo.

        if (_chance <= 50)exitWith{ // AxE: Si falla carga mecánica entonces el player recoge la bolsa spawneada y la mete en el camión.
			_unitbasura = "pop_basura" createVehicle[(getPos _contenedor select 0) - 1.2 * sin(random 359), (getPos _contenedor select 1) - 1.2 * cos(random 359), 0];
			_unitbasura addAction ["Recoger Basura", 'player playActionNow "PutDown";sleep 1;["bolsacargo"] call ica_fnc_basura;'];
			hint "Algo ha salido mal! Tendrás que recoger la basura manualmente, de vez en cuando hay que ensuciarse las manos eh!";
			_contenedor animate["basura_unhide", 0];
			_contenedor setvariable["basura", false, true];
			_camion setvariable["cabina", 0, true]; // AxE: Para evitar loop
        };

        _contenedor setvariable["basura", false, true]; // para que no se pongan varios camiones a descargar el mismo container
        _camion setvariable["cargando", true, true];
        // Ya por fin cargamos, hacemos todas las animaciones
		//Rosen subimos contenedor y bajamos, al ser spawn le pasamos como parametro el contenedor, quick wins
		[_contenedor,_camion] spawn {
			private "_pos";
            _contenedor = _this select 0;
			_camion = _this select 1;
			_pos = getPosATL _contenedor;
			_contenedor attachTo [_camion,[0,-5.7,-0.7]];
			sleep 0.5;
			_contenedor attachTo [_camion,[0,-5.7,-0.4]];
			sleep 0.5;
			_contenedor attachTo [_camion,[0,-5.7,-0.3]];
			sleep 0.5;
			_contenedor attachTo [_camion,[0,-5.7,-0.1]];
			sleep 9;
			_contenedor attachTo [_camion,[0,-5.7,0.1]];
			sleep 0.5;
			_contenedor attachTo [_camion,[0,-5.7,0.3]];
			sleep 0.5;
			_contenedor attachTo [_camion,[0,-5.7,0.6]];
			sleep 0.5;
			_contenedor attachTo [_camion,[0,-5.7,0.9]];
			sleep 0.5;
			_contenedor attachTo [_camion,[0,-5.7,1.1]];
			_contenedor attachTo [_camion,[0,-5.7,-10]];
			sleep 1;
			detach _contenedor;
			_contenedor setPosATL _pos;
		};
        _camion animate['animatesingletrash1', 1]; // AxE: Animación de subida de palancas
        [ _camion, "Hidraulics", 50 ] call CBA_fnc_globalSay3d;
        sleep 9;
        [ _camion, "Hidraulics", 50 ] call CBA_fnc_globalSay3d;
        _camion animate['animatesingletrash1', 0]; // AxE: Animación de bajada de palancas.
        sleep 9;
        if (((position _camion)distance _poscamion) > 2)
            exitwith{ hint "Has movido el camión de basura durante la carga.";         _camion setvariable["cargando", false, true];};
        _contenedor animate ["tapacontenedor",0];
		_contenedor animate["basura_unhide", 0]; // // AxE: en 0 cierra la tapa y oculta la basura.
        _basura = _camion getvariable "basura";
        if (isNil "_basura")then{
                _camion setvariable["basura", 0, true];
                _basura = _camion getvariable "basura";
            }; // AxE: Aqui probando hay q revisar el isNil
        _camion setvariable["basura", _basura + 1, true];
		hint format ["%1 00 Kilos de basura en el camión",(_basura + 1)];
        _camion setvariable["cabina", 0, true];
        if (_basura >= 9)then{ _camion setvariable["basura", 9, true] }; // a veces se buggeaba y no podian descargar
        _basura = _camion getvariable "basura";
        //hint format["Basura 3 :  %1", _basura]; para pruebas

        _camion setvariable["cargando", false, true];
    };

if (_param isEqualTo "bolsacargo")exitWith{
        // Esto es para cuando el player coge bolsas de basura.
        _bolsabasura = nearestObject[player, "pop_basura"];
        // comprobaciones para ver que el player puede cargar el container
        if ((player distance _bolsabasura) > 3)exitwith{ hint "Desde aquí no llegas." };

        _bolsabasura attachto[player, [ -0.1, 0.7, -0.8 ], "Pelvis"];
        _bolsabasura setvariable["basurabolsa", 1, true];
			acciondejarbasuram = player addAction ["Dejar basura en el camión.",{
			player removeAction acciondejarbasuram;
			["bolsadescargo"] call ica_fnc_basura;
			}];
        sleep 15;

        if ((_bolsabasura getvariable "basurabolsa") >= 0.5)exitwith{
                detach _bolsabasura;
                sleep 1;
                deleteVehicle _bolsabasura;
                sleep 2;
                hint "Has tardado mucho y se ha caido la basura...";
                _bolsabasura setvariable["basurabolsa", 0, true];
            };
    };

if (_param isEqualTo "bolsadescargo")exitWith{

        _camiond = nearestObject[player, "mr_garbage_main_main"];
		player removeAction acciondejarbasuram;
        if ((player distance _camiond) > 5)exitwith{ hint "Debes acercarte más al camión de basura." };

        _bolsapuesta = nearestObject[player, "pop_basura"];
        if (isNull attachedTo _bolsapuesta)exitWith{
                hint "No cargas ningúna bolsa o hay otra cerca en el piso.";
            };
        _tienebolsa = _bolsapuesta getvariable "basurabolsa";
        if (_tienebolsa == 0)exitwith{ hint "No tienes nada para descargar." };

        _bolsapuesta setvariable["basurabolsa", 0, true];
        detach _bolsapuesta;
        deleteVehicle _bolsapuesta;
        hint "Descargado ...";

        _basuraactual = _camiond getvariable "basura";
        _camiond setvariable["basura", _basuraactual + 1, true];
		hint format ["%1 00 Kilos de basura en el camión.",(_basuraactual + 1)];
    };

if (_param isEqualTo "descargo")exitWith{
        _camiondes = nearestObject[player, "mr_garbage_main_main"];
        _basurerodes = nearestObject[player, "Land_GarbageBags_F"];
        if ((player distance _camiondes) > 10)exitwith{ hint "Acercate al camión de basura" };
        if ((player distance _basurerodes) > 10)exitwith{ hint "Acercate al depósito de basuras, solo puedes descargar ahí." };
        if ((count(nearestObjects[player, ["man"], 4])) > 1)exitwith{ hint "De uno en uno por favor" };
        if ((_camiondes getvariable "basura") == 0)exitwith{ hint "El camión está vacío" };

        _ladoDer = _camiondes selectionPosition "action_2";
        _cargoder = _camiondes modelToWorld _ladoDer;

        if ((_basurerodes distance _cargoder) > 3)exitwith{ hint "Acerca la parte trasera del camión al contenedor de basura al depósito." };

        _camiondes setvariable["descargado", 1, true];
        _camiondes animate['animatebackend', 1];
        [ _camiondes, "Hidraulics", 50 ] call CBA_fnc_globalSay3d;
        sleep 9;
        [ _camiondes, "Hidraulics", 50 ] call CBA_fnc_globalSay3d;
        _camiondes animate['animatebackend', 0];
        sleep 9;
        hint "La basura ya fue pesada y descargada, ve al encargado por tu pago."
    };

if (_param isEqualTo "pago")exitWith{
        _camionpag = nearestObject[player, "mr_garbage_main_main"];
        if ((player distance _camionpag) > 10)exitwith{ hint "Acércate al camión de basura." };
        if ((_camionpag getvariable "basura") == 0)exitwith{ hint "No traías suficiente basura." };
        if ((_camionpag getvariable "descargado") != 1)exitwith{ hint "No has descargado la basura del camión en el basurero." };
        //quick skill update para 9 contenedores
        _basurades = _camionpag getvariable "basura";
        _exp = 1 * _basurades;
        _pago = 120 * _basurades;

        //pagamos y damos exp

        pop_din = pop_din + _pago;
        [ "exp", _exp ] call ica_fnc_arrayexp;
        //hint format ["Pago : %1, Exp : %2", _pago, _exp];

        //poner basura del camion a 0

        _camionpag setvariable["basura", 0, true];

        //segun la cantidad damos un mensaje

        if ((_camionpag getvariable "basura") == 1)exitwith{
                hint "Había algo de basura, recuerda que puedes cargar hasta 9 contenedores.";
                _camionpag setvariable["basura", 0, true];
            };
        if ((_camionpag getvariable "basura") == 3 or (_camionpag getvariable "basura") == 4)exitwith{
                hint "No está mal, aquí tienes tu recompensa.";
                _camionpag setvariable["basura", 0, true];
            };

        if ((_camionpag getvariable "basura") == 5 or (_camionpag getvariable "basura") == 6)exitwith{
                hint "Muy bien, es bastante basura, aquí tienes tu recompensa.";
                _camionpag setvariable["basura", 0, true];
            };
        if ((_camionpag getvariable "basura") >= 7)exitwith{
                hint "Fantástico, había un montón de basura, aquí tienes tu recompensa.";
                _camionpag setvariable["basura", 0, true];
            };
    };

if (_param isEqualTo "solicito") exitWith {
	//_lvl = "tl" call ica_fnc_expToLevel;
	if !(license_civ_basurero) exitWith { hint "Solo los empleados estatales graduados con honores de wisconsin pueden ejercer ésta noble profesión de basurero."};
    if (!license_civ_driver) exitwith {hint "No tienes carnet de conducir B, no puedes conducir este camión!"};
    if (pop_din < 1500) exitwith {hint "La fianza del camión son 1.500€"};
    pop_din = pop_din - 1500;
    _camion = "mr_garbage_main_main" createvehicle position player;
    _camion setvariable ["basura",0,true];
    _camion setvariable ["propietario",name player,true];
    player setvariable ["uniforme",uniform player,true];
    player adduniform "U_C_FireFighter";
    hint "Todo listo, ve a buscar los contenedores verdes que hay por Metrópolis y Nueva Morrison, carga el camión y vuelve cuando tengas algo de basura, puedes devolver el camión cuando quieras, se te devolverá la fianza, y el uniforme que llevabas lo tenemos guardado en la taquilla.";
};


if (_param isEqualTo "fianza") exitWith {

    if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno, por favor."};
    _camion = nearestObject [player, "mr_garbage_main_main"];
    if (isnil "_camion") exitwith {hint "No veo cerca ningún camión de basura."};
    if ((player distance _camion)>5) exitwith {hint "Acerca el camión de basura."};
    _propietario = _camion getvariable "propietario";
    if (name player != _propietario) exitwith {hint "Éste camión no está registrado a tu nombre."};
    deletevehicle _camion;
    _uniforme = player getvariable "uniforme";
    player adduniform _uniforme;
    pop_din = pop_din + 1500;
    hint "Todo listo, el camión está guardado en el garage, vuelve a por más trabajo cuando quieras.";
};