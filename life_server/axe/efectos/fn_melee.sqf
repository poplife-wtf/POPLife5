/*
Melees handle
*/

_param = _this select 0;

if (_param  isEqualTo  "pegar") exitWith {
    if (("com" call ica_fnc_expToLevel) < 1) exitWith {
            titleText["No sabes pelear con armas...", "PLAIN"];
	};
	_victima = (nearestObjects [player getpos [1, getDir player], ["CAManBase"], 1]) select 0; 
	if (isNil "_victima") exitWith {};
	if (_victima  isEqualTo  player) exitWith {};	
	_arma = _this select 1;	
	if!((secondaryWeapon player)== _arma) exitWith{
	hint "Necesitas un arma melee .. en las manos..."; 
	};
	player selectWeapon _arma;
	_inco = player getvariable ["inconsciente",false];
	if(_inco)exitWith{};

	if ( player getVariable "restrained")exitWith{
		titleText["No puedes pegar estando esposado....", "PLAIN"];
	};

    if (!isNil {pegandomelee}) exitWith {hint "Tan rápido y con esto too tocho cansa ..." };
    [] spawn {
        pegandomelee = true;
        sleep 3;
        pegandomelee = nil;
    };	
	
	playSound3D ["pop_animaciones\sounds\Swing.wav", player, false, getPosASL player, 1, 1, 50];
	sleep 0.2;
	[player,"Sledge_swing"] remoteExec ["life_fnc_animSync",-2];

	sleep 0.5;
    ["recibo",_victima] remoteExec ["ica_fnc_melee", _victima];

			
};


if (_param  isEqualTo  "recibo") exitWith {



_victima = _this select 1;

//si esta muerto salimos
if !(alive _victima)exitWith{};

//si va en coche
 _voyEnCoche = vehicle _victima  != _victima ;

if( _voyEnCoche)exitWith{

        //hint "El coche te protege de los impactos";

};

// efecto golpe



_victima spawn {
     addCamShake [8,2,80];     

    [100] spawn bis_fnc_bloodeffect;   

    "dynamicBlur" ppEffectEnable true;  
    "dynamicBlur" ppEffectAdjust [5];
    "dynamicBlur" ppEffectCommit 0; 

    "dynamicBlur" ppEffectEnable true; 
    "dynamicBlur" ppEffectAdjust [0];
    "dynamicBlur" ppEffectCommit 1; 
};


 


_animRecibir = ["CL3_anim_Receive3b"] call BIS_fnc_selectRandom;


[ _victima,_animRecibir] remoteExec ["life_fnc_animSync",-2];

sleep 0.8;

_victima switchMove "";

        
};