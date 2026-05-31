
/*
por: Quickskill :P
	[_victima, true] spawn ica_fnc_inconsciente;

*/

_victima = _this select 0;
_estado = _this select 1;

if (_estado) then {

// si ya esta incociente salimos
_estoyInco = _victima getvariable ["inconsciente",false];
if (_estoyInco) exitWith {};
if (call life_adminlevel < 1) then {
disableUserInput true;
};

closeDialog 0;
//quick cegado
//variable cegado
_victima  setVariable["cegado", true ,true];
 
//efecto camara al jugador
[[], "ica_fnc_cegado", _victima  , false] call BIS_fnc_MP;

//sordera
1 fadeSound 0.05;

//si voy en coche salimos
_voyEnCoche = vehicle _victima  != _victima ;
if(_voyEnCoche && !cinturon) then {
	_veh = velocity (vehicle _victima);
	sleep 0.5;	
	moveOut _victima;
	_victima setVelocity [(_veh select 0) * 2,(_veh select 1) * 2,((_veh select 2) * 2) + 5];	
};


//paso a estar inconciente
_victima setvariable ["inconsciente",true,true];

//animacion inco
/*[[_victima, "DeadState"], "ica_fnc_playMoveNow", true, true, true] call life_fnc_MP;
sleep 0.0001;

//esperar a que termine la animacion
waituntil {animationState _victima =="DeadState"};*/
_victima setUnconscious true;

//quitamos que pueda hacer animaciones¿?
//_victima disableAI "ANIM";

//vars
_dolor = ((_victima getVariable "cabeza") + (_victima getVariable "pecho") + (_victima getVariable "brazos") + (_victima getVariable "piernas")) / 4;
player disableConversation true;
_time = (_dolor * 3) + 10;
_time fadeRadio 0;
_reanimado = _victima getVariable ["reanimado",false];
/*atameAlSuelo = nil;

//player no puede moverse lo atamos al suelo 
atameAlSuelo = "land_cluttercutter_small_f" createVehicle (getPosATL _victima);
atameAlSuelo setPosATL (getPosATL _victima);
atameAlSuelo setVectorUp (surfaceNormal (getPos _victima));
_victima attachTo [atameAlSuelo, [0,0,0]];*/
			
//info para trolls
 titleText["Dar tu posición o información sobre la posición de otros jugadores es motivo de ban", "PLAIN"];

//cd 60s no dejamos que se mueva
while {_time > 0 && !_reanimado && alive _victima} do {

//hint tiempo inco
hintSilent format["HAS CAIDO INCONSCIENTE", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
sleep 1;
_time = _time -1;

};//end while

//Rosen inconsciente
_victima setUnconscious false;
_victima switchMove "FXStandDip";
_victima setVariable ["reanimado",false,true];
detach _victima;
//eliminar no puede moverse lo desatamos del suelo
//detach atameAlSuelo;
//deleteVehicle atameAlSuelo;

//poonemos que pueda hacer animaciones¿?
//_victima enableAI "ANIM";


//animacion de volver en si
//[[_victima, "AmovPpneMstpSnonWnonDnon_healed"], "ica_fnc_switchMove", true, true, true] call life_fnc_MP;

//ya no esta inconciente
_victima setvariable ["inconsciente",false,true];
if (call life_adminlevel < 1) then {
disableUserInput false;
};
enableRadio true;
player disableConversation false;
//hint al jugador
hint "Ya no estás inconsciente, visita un médico";


//quick cegado
//variable cegado
_victima  setVariable["cegado", false ,true];
 
//efecto camara al jugador
[[], "ica_fnc_cegado", _victima, false] call BIS_fnc_MP;

//sordera quitar
3 fadeSound 1;

};