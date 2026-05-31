/*

By AxE
Temporada de caza.

*/

_p = _this select 0;

if (_p isEqualTo "pido") then {

if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};
if (temporadaDcaza) exitWith {
	[player,"Ya tienes la equipacion oficial para cazeria, devuelvemela y te devolvere la fianza...", 
	"Temporada de Caza","KA_crossbow_wood"] call ica_fnc_axeMsg;
};
	_accion = [
		"Estas apunto de iniciar una temporada de caza, el equipamento valdra 2000€ de fianza y ganaras experiencia cada vez que optengas carne de un animal cazado con la ballesta. Aceptas ?",
		"Temporada de Caza ::. ",
		"Si",
		"No"
	] call BIS_fnc_guiMessage;
	waituntil {!isNil "_accion"};

	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Trabajo Cancelado...","PLAIN"];};
	
	if (pop_din < 2000) exitWith {titleText["No tienes suficiente dinero para comprar la equipacion.", "PLAIN"]};
	pop_din = pop_din - 2000;
	
	player addWeapon "KA_crossbow_wood";
	player addWeapon "pop_navaja";
	//for "_i" from 1 to 8 do {player addItemToUniform "KA_arrow_mag";};
	["KA_arrow_mag", 20] call ica_fnc_item;	
	["+20 flechas"] call ica_fnc_infolog;
	
	[player,"Aqui tienes la equipacion oficial para cazeria, la mejor ballesta y la nava para desollar, devuelvemela y te devolvere la fianza...", 
	"Temporada de Caza","KA_crossbow_wood"] call ica_fnc_axeMsg;
	temporadaDcaza = true;
};


if (_p isEqualTo "devuelvo") then {

if ((count (nearestObjects [player, ["man"], 10]))>1) exitwith {hint "De uno en uno, por favor"};


	_tengoB = ["KA_crossbow_wood"] call ica_fnc_tengo;
	_tengoN = ["pop_navaja"] call ica_fnc_tengo;
	
	if (_tengoB < 1 OR _tengoN < 1) exitWith {
	
	[player,"Te hace falta la equipacion oficial ... no tienes lo que te alquile ... devuelvelo o nada de dinero", 
	"Temporada de Caza","KA_crossbow_wood"] call ica_fnc_axeMsg;	
	
	};
	
	pop_din = pop_din + 1850;
	
	["KA_crossbow_wood", -1] call ica_fnc_item;
	["pop_navaja", -1] call ica_fnc_item;
	
	[player,"Alli tienes tu dinero ... me he quedado con mi comision como a penas es logico", 
	"Temporada de Caza","KA_crossbow_wood"] call ica_fnc_axeMsg;
	temporadaDcaza = false;
};