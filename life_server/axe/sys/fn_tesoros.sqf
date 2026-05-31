/*
By AxE
*/


    if (cavando) exitWith {hint "Solo puedes cavar 1 vez cada 20 segundos." };
	cavando = true;		
    [] spawn {
        sleep 30;
        cavando = false;
    };


      if !(license_civ_tesorero) exitWith {
            titleText["No sabes de esto ... ve a la universidad primero", "PLAIN"];
    };


_zonasTesoros = ["tesoros_1","tesoros_2"];
_zona = "";
//Buscar si estamos en la zona
{
	if(player distance (getMarkerPos _x) < 50) exitWith {_zona = _x;};

} foreach _zonasTesoros;

if(_zona isEqualTo "") exitWith {
	
	   hint "En esta zona no hay tesoros."; 
};

//tiene pala
 _launcherWeaponEquipada = currentWeapon player;
 if( _launcherWeaponEquipada!="pop_pala_h" ) exitWith{
 	hint "Necesitas una pala para cavar."; 
 	  cavando = false;
 };


 //tiene pala y esta en la zona//

//barrita de espera y animacion
disableUserInput true;
[20, "Cavando en busca de algo de valor..."] spawn ica_fnc_barrita;
_tries = 10;
while {_tries > 0} do {
[player,"AinvPknlMstpSnonWrflDr_medic4"] remoteExec ["life_fnc_animSync",-2];
_tries = _tries - 1;
sleep 2;
};

_recompensa = selectRandom ["Fapret_Oro","Fapret_Plata","Fapret_Cobre"];

_encontradoAlgo = round (random 100);

if(_encontradoAlgo < 20)then{

//info 
titleText["He encontrado una caja enterrada justo Aqui.", "PLAIN"];

//exp
_exp = 2;
["exp",_exp] call ica_fnc_arrayexp;

// add caja 
_cajaGTA =  "Fapret_Mediano" createVehicle position player;
clearMagazineCargoGlobal _cajaGTA;
clearItemCargoGlobal _cajaGTA;
clearWeaponCargoGlobal _cajaGTA; 

//agregar item a la caja
 _cajaGTA addItemCargoGlobal [_recompensa, round (random [3,5,8])];  
_cajaGTA spawn {
sleep 60;
deletevehicle _this;
};
cavando = false;
disableUserInput false;
}else{

//info 
  titleText["Sigue buscando, para encontrar una buena huaca hace falta mucha suerte.", "PLAIN"];
  cavando = false;
  disableUserInput false;

};

