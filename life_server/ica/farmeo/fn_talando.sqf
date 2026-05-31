/*
por: Icaruk
	0 spawn ica_fnc_talando;
	Editado por AxE para agregar calculos de madera por tamaño y etc ... animaciones y cosas.
*/
private ["_arbol","_pos2D","_pos3D","_cantidad","_arbolesX"];

if (player distance (getMarkerPos "metropolis") < 1000 || player distance (getMarkerPos "morrison") < 500 || player distance (getMarkerPos "diablos") < 500 ||  player distance (getMarkerPos "notalar") < 500) exitWith { hint "Por orden del alcalde no puedes talar cerca de centros urbanos ni cerca a la zona de procesamiento." };
If ( count (player nearRoads 50) > 0 ) exitWith { hint "Por orden del alcalde no puedes talar junto a las vias publicas." };
    if (!isNil {talandoarboles}) exitWith {hint "Tan rápido cansa..." };
    [] spawn {
        talandoarboles = true;
        sleep 2;
		closedialog 0;		
        talandoarboles = nil;
    };
_arbol = cursorObject;
//if !((["MeleeHatchet"] call ica_fnc_tengo) >= 1) exitWith {hint "Necesitas un hacha"};
_tengohacha = secondaryWeapon player;
 if( (secondaryWeapon player)!="pop_hacha_f" ) exitWith{
  hint "Adivina qué te falta!! eso... un hacha en las manos."; 
 };
player selectWeapon "pop_hacha_F";
if (isNull _arbol) exitWith {hint "Qué quieres practicar? mejor apunta a un árbol."};

_pos3D = getPos _arbol;
_pos2D = [_pos3D select 0, _pos3D select 1, 0];
if ((getPosATL player) distance _pos2D > 10) exitWith {hint "No la tienes tan larga... el hacha."};

_altoarb = _pos2D distance _pos3D;

_cantidad = round (_altoarb / 3);
if (_cantidad > 4) then { _cantidad = 4 };

playSound3D ["pop_animaciones\sounds\Swing.wav", player, false, getPosASL player, 1, 1, 50];
[player,"Sledge_swing"] remoteExec ["life_fnc_animSync",-2];
//playSound "talar";
["play", "madera", player] call ica_fnc_SFX;
sleep 1.5;

if ((damage _arbol) < 0.8) exitWith {
    _arbol setDamage (damage _arbol) + 0.2;
//hint format ["Daño actual %1",damage _arbol];	
};
_arbol setDamage 1;
 talandoarboles = nil;

if ((npc_presidente getVariable ["decreto",0])  isEqualTo  2) then {
_exp = 1;
["exp",_exp] call ica_fnc_arrayexp;  
};

if ((random 100) < 30) then { 
_exp = 1;
["exp",_exp] call ica_fnc_arrayexp;  
};
	
_cantMadera = _cantidad * 3;

titleText [format["Has talado un árbol que medía %1m.", round(_altoarb * 100) / 100],"PLAIN"];

_lena = "Land_WoodenLog_F" createVehicleLocal (getPos _arbol);
//_lena setPos [getPos _arbol select 0, getPos _arbol select 1, (getPos _arbol select 2) + 3];
_lena setDir (getDir player);
sleep 0.1;
[_lena, [random 1, 2 + (random 3), 2 + (random 2)]] call ica_fnc_setVelocity;

_lena addAction ["Recoger", '
    player playActionNow "PutDown";
    sleep 1;
    deleteVehicle (_this select 0);	
    ["pop_tronco",2] call ica_fnc_item;']; 

_lena = "Land_WoodenLog_F" createVehicleLocal (getPos _arbol);
//_lena setPos [getPos _arbol select 0, getPos _arbol select 1, (getPos _arbol select 2) + 3];
_lena setDir (getDir player);
sleep 0.1;
[_lena, [random 1, 2 + (random 3), 2 + (random 2)]] call ica_fnc_setVelocity;

_lena addAction ["Recoger", '
    player playActionNow "PutDown";
    sleep 1;
    deleteVehicle (_this select 0);	
    ["pop_tronco",1] call ica_fnc_item;']; 
	
_lena = "Land_WoodenLog_F" createVehicleLocal (getPos _arbol);
//_lena setPos [getPos _arbol select 0, getPos _arbol select 1, (getPos _arbol select 2) + 3];
_lena setDir (getDir player);
sleep 0.1;
[_lena, [random 1, 2 + (random 3), 2 + (random 2)]] call ica_fnc_setVelocity;

_lena addAction ["Recoger", '
    player playActionNow "PutDown";
    sleep 1;
    deleteVehicle (_this select 0);	
    ["pop_tronco",3] call ica_fnc_item;']; 