#include <macro.h>
/*

Accion de desuello llamada con el click.
tenes que tener "pop_navaja" activada.
Mod by axe para que sirva con pop 4.

*/
private["_animalCorpse","_upp","_ui","_progress","_pgText","_cP","_displayName","_item"];
_animalCorpse = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _animalCorpse) exitWith {}; //Object passed is null?

life_interrupted = false;
if(!((typeOf _animalCorpse) in ["Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F"])) exitWith {};
if(player distance _animalCorpse > 3.5) exitWith {};
life_action_inUse = true;
 switch(typeOf _animalCorpse) do {
	case "Hen_random_F": {_displayName = "Pollo"; };
	case "Cock_random_F": {_displayName = "Gallo"; };
	case "Goat_random_F": {_displayName = "Cabra"; };
	case "Sheep_random_F": {_displayName = "Obeja"; };
	case "Rabbit_F": {_displayName = "Conejo"; };
	default {_displayName = ""; _item = "";};
};

if(EQUAL(_displayName,"")) exitWith {life_action_inUse = false;};

_upp = format["Desollando %1",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

		[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";

while{true} do {
	
	player playmove "AinvPknlMstpSnonWrflDr_medic2";
	uiSleep 0.15;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(isNull _animalCorpse) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};
		
life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(isNull _animalCorpse) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player != vehicle player) exitWith {titleText["No puedes Cazar desde Autos ... poco ortodoxo no ?","PLAIN"];};
_cantidad = round (random 3);
if (player canAdd ["pop_filete",_cantidad]) then {
	deleteVehicle _animalCorpse;
	["pop_filete", _cantidad] call ica_fnc_item;
	titleText [format["Has obtenido carne fresca procedente del cuerpo de %1 ",_displayName],"PLAIN"];
	player setVariable ["perro",(player getVariable ["perro",0]) + 1,true];
	if (temporadaDcaza) then {
		["exp",1] call ica_fnc_arrayexp;
		[format ["+ %1exp", 1]] call ica_fnc_infolog;
	};
	if ((player getVariable ["perro",0]) > 8) then {
		0 call life_fnc_perrodecaza;
		};
} else {
	hint "No te cabe nada más, y no creo que quieras transportarlo en ninguna cavidad...";
};