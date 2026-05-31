/*
por: Quickskill to pro https://feedback.bistudio.com/T65008 esta bug thanks arma 3!!
	esto se llama desde un EH "HandleDamage" con call
*/
private["_parte","_victima","_damage","_source","_danoReducido","_danoReal","_voyEnCoche","_vaEnCoche","_dano","_dolor","_proj","_curWeapon"];

//pro level
 BIS_hitArray = _this; BIS_wasHit = true; // For BIS stuff to work

//get parametros
_victima 		= _this select 0;
_parte	= _this select 1;
_damage		= _this select 2;
_source 	= _this select 3;
_proj = _this select 4;	
_voyEnCoche = vehicle _victima  != _victima;
_vaEnCoche =  false;



//reduccion de daño
_danoReducido = _damage * 0.08;
_danoExtra = 0;
//daño a 2 decimales
_danoReducido = round ( _danoReducido  ) / (100);


//daño maximo
if(_danoReducido >= 0.10)then{
	_danoReducido = 0.10;
};


//daño minimo
if(_danoReducido <= 0)then{
	_danoReducido = 0.05;
};





//si estoy muerto salimos
if !(alive _victima) exitWith {
	_damage = damage _victima ;
    _damage
};

//si no es null miramos si es un vehiculo //Rosen taser
if !(isNull _source ) then {
	_vaEnCoche =  vehicle _source  != _source;
};



//si es null me hago el daño yo solo
if (isNull _source)then{
    _source =  _victima;  
};



//debug
//if( _proj != "" )then{

//hint format ["Victima: %1 \n Parte: %2 \n Daño: %3 \n Quien: %4  \n Daño reducido: %5 \n Voy en Coche:%6 \n Va en Coche: %7 \n Proyectil:%8",_victima,_parte,_damage,_source,_danoReducido,_voyEnCoche,_vaEnCoche,_proj];

//};

//si es daño de caida
if(velocity _victima select 2 < -2.5 and !_voyEnCoche and _parte=="legs" OR _parte=="leg_l" OR _parte=="leg_r" OR _parte=="pelvis" and _proj=="" and !_vaEnCoche) exitWith{

titleText ["Te has caido...", "PLAIN"];



_fortaleza = "sup" call ica_fnc_expToLevel;
if(_fortaleza > 4) then {

	//titleText ["Buff otra persona sin las  piernas tan fuertes no podria correr ...", "PLAIN"];

} else {

_animRecibir = "CL3_anim_beartrap1";
_victima playActionNow _animRecibir;
[[ _victima,_animRecibir],"life_fnc_animSync",nil,false] call life_fnc_MP;

WaitUntil {!((animationState _victima) == "CL3_anim_beartrap1")};

_animRecibir = "CL3_anim_beartrap2";
_victima playActionNow _animRecibir;
[[ _victima,_animRecibir],"life_fnc_animSync",nil,false] call life_fnc_MP;

};


};


//si te daña un coche por atropello
if ( _vaEnCoche AND !_voyEnCoche OR _proj=="coche" ) exitWith {
titleText["Atropellado", "PLAIN"];
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

    _dmg = damage _victima;
    _dmg
};


//si te tasean
if (_proj =="26_taser" AND !_voyEnCoche) exitWith {

	[_victima] spawn life_fnc_knockoutAction;

	_dmg = damage _victima;
    _dmg	
};

//si me la he pegado
if ( _voyEnCoche AND _proj=="" ) exitWith {


	//titleText ["Me la he pegado..", "PLAIN"];
	_damage =  _danoReducido;
	_velocidad = speed _victima;
				 
	//a mas de 80 sangrados y daño

		if(_velocidad > 100)then{

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

};


		_damage = damage _victima ;
		_damage		
	
		
};


//si te disparan aumentamos el daño
if(_proj!="")then{
//titleText ["Me han disparado ...", "PLAIN"];



//headshoot bro!
_ammoMatanCabeza = ["RH_357mag_ball","RH_45acp", "RH_454_Casull","HLC_762x51_ball","RH_50_AE_Ball","B_408_Ball"];
_parteMorirInsta = ["head","head_hit"];

	if (_proj isEqualTo "CUP_B_12Gauge_74Slug" OR _proj isEqualTo "R3F_CARTOUCHES") then {
	_dmgesp = damage _victima;
	_danoExtra = _dmgesp + 0.04;
	if (_source distance _victima < 2 ) then {
		_danoExtra = _dmgesp + 0.8;
		};
	};

if ( _parte in _parteMorirInsta and _proj isEqualTo "B_408_Ball" )then{
	
	_dmgex = damage _victima;
	_danoExtra = _dmgex + 0.8;
}else{
	
	_danoExtra = 0;
};




[] spawn {
     addCamShake [8,2,80];     

    [100] spawn bis_fnc_bloodeffect;   

    "dynamicBlur" ppEffectEnable true;  
    "dynamicBlur" ppEffectAdjust [5];
    "dynamicBlur" ppEffectCommit 0; 

    "dynamicBlur" ppEffectEnable true; 
    "dynamicBlur" ppEffectAdjust [0];
    "dynamicBlur" ppEffectCommit 1; 
};



if (("cri" call ica_fnc_expToLevel) > 8) then {
    

 
		_pos = position _source;
		_markerID = format["marker_%1",floor(random 1000)];
		_marker = createMarkerLocal [ _markerID, _pos];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText "Disparan";
		_marker setMarkerType "mil_warning";
		 
		[_markerID]spawn{
		_markerID = _this select 0;
		sleep 3;
		   
		deleteMarker _markerID;
		 
		};

	
};

};


//salir con el daño total de la victima
_damage = damage _victima;
_damage = _damage + _danoReducido;
_damage