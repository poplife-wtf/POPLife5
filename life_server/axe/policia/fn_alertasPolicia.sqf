
/*
por: quickskill

pop to next level, 
alertas police!!!!! tos cabronee to el dia con mp5



*/

_param = _this select 0;

if !(playerside isEqualTo WEST) then {
hint "Fuera de aqui trol";
};

if (_param isEqualTo "generarAlertasPolicias") exitWith {


  [[NPC_POLICIA_DEVOLVER_ARMAS, ["Establecer nivel de alerta en 1",{["alerta1"] spawn ica_fnc_alertasPolicia;}]],"addAction",true,true] call BIS_fnc_MP;
 
  [[NPC_POLICIA_DEVOLVER_ARMAS, ["Establecer nivel de alerta en 2",{["alerta2"] spawn ica_fnc_alertasPolicia;}]],"addAction",true,true] call BIS_fnc_MP;

  [[NPC_POLICIA_DEVOLVER_ARMAS, ["Establecer nivel de alerta en 3",{["alerta3"] spawn ica_fnc_alertasPolicia;}]],"addAction",true,true] call BIS_fnc_MP;
 
   [[NPC_POLICIA_DEVOLVER_ARMAS, ["Establecer nivel de alerta en 4",{["alerta4"] spawn ica_fnc_alertasPolicia;}]],"addAction",true,true] call BIS_fnc_MP;
 
  [[NPC_POLICIA_DEVOLVER_ARMAS, ["Establecer nivel de alerta en 5",{["alerta5"] spawn ica_fnc_alertasPolicia;}]],"addAction",true,true] call BIS_fnc_MP;
  
  [[NPC_POLICIA_DEVOLVER_ARMAS, ["Activar FUDRA - nivel de alerta en 6",{["fudra"] spawn ica_fnc_alertasPolicia;}]],"addAction",true,true] call BIS_fnc_MP;
  
  [[NPC_POLICIA_DEVOLVER_ARMAS, ["Alertar Amenaza Terrorista",{["terro"] spawn ica_fnc_alertasPolicia;}]],"addAction",true,true] call BIS_fnc_MP;



};

if (_param isEqualTo "alerta1") exitWith {


     _message = "Atención a todos los ciudadanos: La policía está en nivel de alerta 1 (TEASER)";

     [10, "Policia", [1,0,0], 1.5, _message, [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
     
    

 
};

if (_param isEqualTo "alerta2") exitWith {


     _message = "Atención a todos los ciudadanos: La policía está en nivel de alerta 2 (PISTOLA Y CHALECO)";

     [10, "Policia", [1,0,0], 1.5, _message, [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
     
    

 
};

if (_param isEqualTo "alerta3") exitWith {


     _message = "Atención a todos los ciudadanos: La policía está en nivel de alerta 3 ( PISTOLA Y 1 SUBFUSIL POR PATRULLA)";

     [10, "Policia", [1,0,0], 1.5, _message, [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
     
    

 
};


if (_param isEqualTo "alerta4") exitWith {


     _message = "Atención a todos los ciudadanos: La policía está en nivel de alerta 4 (SUBFUSIL PARA CADA AGENTE)";

     [10, "Policia", [1,0,0], 1.5, _message, [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
     
    

 
};


if (_param isEqualTo "alerta5") exitWith {


     _message = "Atención a todos los ciudadanos: La policía está en nivel de alerta 5 (GEOS ACTIVADOS)";

     [10, "Policia", [1,0,0], 1.5, _message, [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
     
 
};


if (_param isEqualTo "fudra") exitWith {

     _message = "Atención a todos los ciudadanos: La policia está en nivel de alerta 6 (Comando FUDRA ACTIVADO)";
	fudra_permitido = true;
	publicVariable "fudra_permitido";
    [10, "Policia", [1,0,0], 1.5, _message, [1,1,1], 1] remoteExec ["ica_fnc_anuncio",0];
 
};


if (_param isEqualTo "terro") exitWith {

[6,format ["POLICIA: Atención! Nos encontramos bajo amenaza terrorista, pedimos evitar aglomeraciones e informar de cualquier persona o paquete sospechoso. Se podrá insepccionar a cualquier persona en centros urbanos."]] remoteExec ["life_fnc_broadcast",0];
 
};