
_param = param [0];
_jugador = param [1,Objnull];
_mesa = param [2,Objnull];



if (_param isEqualto "compruebo") exitwith {
if ((["pop_efedrina_b"] call ica_fnc_tengo) < 5) exitwith {[player,"No tienes lo que hay que tener. Necesitas mas Efedrina","Cocinando Meta","pop_efedrina_b"] call ica_fnc_axeMsg};


["pop_efedrina_b",-5] call ica_fnc_item;

["cocino",player,_mesa] remoteexec ["ica_fnc_cocinameta",2];


};

if (_param isEqualto "cocino") exitwith {

_mesa setvariable ["cocinando",true,true];

_t = random[200,250,300];

[_mesa] spawn {while {(_this select 0) getvariable "cocinando"} do {[meta,"ambiente"] remoteExec ["life_fnc_say3d",0,false];sleep 6}};






while {_mesa getvariable "cocinando"} do {
_t = _t - 1;


if ((random(100)) < 25) then {format ["%1",(selectrandom ["SmokeShellBlue","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellGreen","SmokeShellYellow"])] createvehicle getpos _meta;};

if (_t <= 0) exitwith {_jugador additem "pop_metanfetamina_f";_mesa setvariable ["cocinando",false,true]};

sleep 1;
};




};