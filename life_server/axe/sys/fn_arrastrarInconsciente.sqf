// by quickskill pop to next level//
private["_victima"];
_victima = cursorTarget;

//si voy en coche no hago nada
 if ( vehicle player != player  )exitWith {};

//soltar
if (player getVariable "estoyArrastrando") exitWith {

detach _victima;

player switchMove "";

player setVariable ["estoyArrastrando",false,true];

_victima  setVariable ["meArrastran",true,true];
_victima  setVariable ["meArrastranQuien",nil,true];

};


//cheeks
 if ((isNull _victima) or  !(_victima isKindOf "Man")) exitWith { 

   	  titleText["Apunta a una persona para moverla.", "PLAIN"];
};


if !(_victima getvariable ["inconsciente",false]) exitWith { titleText["Solo puedes mover a personas inconcsientes.", "PLAIN"];};

if (_victima  distance player > 2.5) exitWith { titleText["Estás muy lejos para arrastrar.", "PLAIN"];};

if (_victima  getVariable "meArrastran" and _victima  getVariable "meArrastranQuien" != player) exitWith {titleText["Alguien ya está moviendo a esa persona", "PLAIN"];};

if (!alive _victima ) exitWith {titleText["Ha muerto, no toques el cadaver.", "PLAIN"];};



//arrastrar
player setVariable ["estoyArrastrando",true,true];

_victima  setVariable ["meArrastran",true,true];
_victima  setVariable ["meArrastranQuien",player,true];

_victima  attachTo [player, [0, 1, 0.08]];
_victima  setDir 180;

//anim
player playAction "grabDrag";