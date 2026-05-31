#include <macro.h>
/*
	Sistema de rangos para Bandas.
    0 = degradar.
    1 = promover.
*/
private["_unit"];
disableSerialization;

_unit = lbData[2621,lbCurSel (2621)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {hint localize "STR_GNOTF_SelectPerson"};
if(isNull _unit) exitWith {hint localize "STR_GNOTF_SelectPerson"}; //Bad unit?
if(_unit == player) exitWith {hint "Ajá ... sigue intentandolo amigo ... en la familia nadie se sube su propio rango..."};

_grpMembers = (group player) getVariable "gang_members";
_grpLeaders = (group player) getVariable "gang_leaders";
_owner = (group player) getVariable "gang_owner";
_uid = getPlayerUID player;

// no dejo que se cambie rangos a otro grupo distinto al propio
if(((group player) getVariable "gang_id") != life_gangid) exitWith {hint "Tu no tienes poder aqui gusano."};

// no se puede kickear al dueño
if((getPlayerUID _unit) == _owner) exitWith {hint "En serio ? en verdad intentaste hacer esto ? por tu bien me hago el de la vista gorda."};

//Si no es el dueño de la banda o un lider que coño hace aqui.
if(_owner != _uid && !(_uid in _grpLeaders)) exitWith{ hint "Que te follen !! Tu no pintas nada aqui."};

switch((_this select 0)) do {
    // degradar
    case 0: {
        // si es lider de la banda solo lo degrado
        if(_owner == _uid && ((getPlayerUID _unit) in _grpLeaders )) then {
            _grpLeaders = _grpLeaders - [(getPlayerUID _unit)];
            (group player) setVariable["gang_leaders",_grpLeaders,true];
            [[5,(group player),getPlayerUID _unit],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
            
        } else {
            // boto al paciente
            // si eres el lider o dueño y el target es un don juan
            if(_owner == _uid || (((getPlayerUID player) in _grpLeaders ) && (!((getPlayerUID _unit) in _grpLeaders ) && (getPlayerUID _unit) != _owner) )) then {
                _grpMembers = _grpMembers - [(getPlayerUID _unit)];
                (group player) setVariable["gang_members",_grpMembers,true];
                [[4,(group player),getPlayerUID _unit],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
			};
        };

    };
    // promuevo
    case 1: {
        if(((group _unit) getVariable "gang_id") != life_gangid) exitWith {hint "Este caballero ya se encuentra en una organización"}; //Added
        // sino esta en banda lo agrego.
        if(!((getPlayerUID _unit) in _grpMembers)) then { 
            [[profileName,(group player),1],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
            hint "invitado a la organización";
        } else { 
        // Si esta en banda lo subo a lider.
            if(_owner == _uid) then {
                _grpLeaders set[count _grpLeaders,(getPlayerUID _unit)];
                (group player) setVariable["gang_leaders",_grpLeaders,true];
                [[5,(group player),getPlayerUID _unit],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;				
            };
        };
    };
    case default {hint "Que putas ..."};
};

[] call life_fnc_gangMenu;