// ["pego"] spawn ica_fnc_atacar;
_param = _this select 0;

private ["_sonidosPegar"];

if (_param isEqualTo "pego") exitWith {

if (("com" call ica_fnc_expToLevel) < 1) exitWith {
            titleText["No sabes pelear...", "PLAIN"];
};

  _inco = player getvariable ["inconsciente",false];
  if(_inco)exitWith{};

//
if ( player getVariable "restrained")exitWith{

 titleText["No puedes pegar estando esposado...", "PLAIN"];
 
};

//timer pegar

    if (!isNil {golpeDado}) exitWith {hint "Solo puedes golpear 1 vez cada 3 segundos." };
    [] spawn {
        golpeDado = true;
        sleep 3;
        golpeDado = nil;
    };

// a quien
    _victima =  cursorTarget; 

// una persona?
        if ((isNull _victima) or  !(_victima isKindOf "Man")) exitWith { 

                   _animPegar = ["stree_boxing_4","stree_boxing_5","stree_boxing_6"] call BIS_fnc_selectRandom;
          		  [player,_animPegar] remoteExec ["life_fnc_animSync",-2];

      

            

        };

//estamos a la distancia??
        if ((player distance _victima) > 2.2) exitWith {

            _animPegar = ["stree_boxing_4","stree_boxing_5","stree_boxing_6"] call BIS_fnc_selectRandom;
		  [player,_animPegar] remoteExec ["life_fnc_animSync",-2];

        
        
        };
       
//que armas lleva?
 _pWeap = currentWeapon player;



  // a puños

            if( _pWeap == "" ) then{

            //voy sin arma melee
         
            
            _animPegar = ["stree_boxing_4","stree_boxing_5","stree_boxing_6"] call BIS_fnc_selectRandom;
			[player,_animPegar] remoteExec ["life_fnc_animSync",-2];

             //_sonidosPegar = ["pop_animaciones\sounds\punch1.ogg", "pop_animaciones\sounds\punch2.ogg", "pop_animaciones\sounds\punch3.ogg", "pop_animaciones\sounds\punch4.ogg"] call BIS_fnc_selectRandom;
			 if ( _animPegar == "stree_boxing_6" ) Then { 	
				// PATADA!!!
				["play3d", "patada", player] call ica_fnc_SFX;
			} Else {
				// PU:ETAZP!!!
				["play3d", "golpe", player] call ica_fnc_SFX;
			};
   
            //playSound3D [_sonidosPegar, player, false, getPosASL player, 1, 1, 50];
              

                
  _inco = _victima getvariable ["inconsciente",false];
  
  if !(_inco)then{


            _seDefiende = round random 100;

            if  (_seDefiende > 70) then{

              _animDefender = ["stree_boxing_1","stree_boxing_3"] call BIS_fnc_selectRandom; 


            [player,_animDefender] remoteExec ["life_fnc_animSync",-2];

                     

           

                      }else{

                       titleText["hostia tremenda!", "PLAIN"];

              ["recibo",_victima] remoteExec ["ica_fnc_atacar", _victima];

       
          
            };

}else{
  
    ["recibo",_victima] remoteExec ["ica_fnc_atacar", _victima];

};



       
  
    };

};

//recibir un golpe

if (_param isEqualTo "recibo") exitWith {



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


 

//recibe daño


 sleep 0.2;

   _inco = _victima getvariable ["inconsciente",false];

  if !(_inco)then{
    
_animRecibir = ["CL3_anim_Receive3b"] call BIS_fnc_selectRandom;


[ _victima,_animRecibir] remoteExec ["life_fnc_animSync",-2];

sleep 0.8;

_victima switchMove "";

};

        
};