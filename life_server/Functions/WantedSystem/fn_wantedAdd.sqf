/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds or appends a unit to the wanted list.
	[[getPlayerUID player,name player,"261A"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Atropello",500]};
	case "187": {_type = ["Asesinato",1500]};
	case "901": {_type = ["Fuga de la cárcel",100]};
	case "261": {_type = ["Violación",500]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Exceso de velocidad",100]};
	case "215": {_type = ["Intento de robo",100]};
	case "213": {_type = ["Uso de explosivos ilegales",300]};
	case "211": {_type = ["Robo",1500]};
	case "207": {_type = ["Secuestro",1500]};
	case "207A": {_type = ["Intento de secuestro",800]};
	case "487": {_type = ["Hurto mayor",500]};
	case "488": {_type = ["Hurto menor",100]};
	case "480": {_type = ["Golpear y correr",500]};
	case "481": {_type = ["Posesión de objetos ilegales",100]};
	case "482": {_type = ["Intención de distribuir",500]};
	case "483": {_type = ["Narcotráfico",1500]};
	case "4833": {_type = ["Tráfico de armas",250]};
	case "459": {_type = ["Robo con fractura",100]};
	case "485": {_type = ["Intento de liberar a un preso",100]};
	case "486": {_type = ["Ganzuar esposas",200]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};

[life_wanted_list] spawn life_fnc_updateWanted;