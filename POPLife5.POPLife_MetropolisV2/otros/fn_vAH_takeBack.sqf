/*
	File: fn_vAH_takeBack.sqf //Editado por Rosen
	Author: Fresqo
	Description: takes back the item from auction house if its still for sale or expired.
*/
private["_dialog","_myListbox","_data","_typeb","_type","_status","_item","_diff","_iCheck","_amount","_tamount","_id","_checkid","_found","_d","_e"];
disableSerialization;
_dialog = findDisplay 00015;
_myListbox = _dialog displayCtrl 00020;
comprando = false;
if (!vAH_loaded) exitWith {hint "Mercarosen no esta disponible en estos momentos.";closeDialog 0;		
comprando = true;};

if (lbCurSel _myListbox < 0) exitWith {hint "Please select an Item";};
_data = call compile (_myListbox lbData (lbCurSel _myListbox));

_item = _data select 0;
if (_item == "yolo") exitWith {comprando = true;closeDialog 0;};
_typeb = _data select 1;
_status = [_data,2,3,[3]] call BIS_fnc_param;
_amount = [_data,3,0,[0]] call BIS_fnc_param;
_id = _data select 4;
_iCheck = true;

if (_status == 3) exitWith {hint "No puedes retirar un articulo que esta en tu inventario.";};
if(_typeb == "ymenu") then {_type = 0} else {_type = 1};
hint "Se esta realizando la transaccion, espere por favor...";
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
sleep random 0.5;
_found = [];
{_checkid = _x select 0;if (_checkid == _id) then {_found pushBack _checkid};}forEach all_ah_items;
if (count _found == 0 or isNil{_found}) exitWith {hint "El articulo se ha vendido recientemente.";};

if(_type != 1) exitWith {
	hint "Error de articulo";
	closeDialog 0;		
	comprando = true;
};
if(_item isEqualTo (currentWeapon player)) exitWith {hint "Deje espacio libre para el objeto.";closeDialog 0;comprando = true;};
_ok = [_item,_amount] call ica_fnc_item;	
if(!isNil {_ok}) then {
	if(!_ok) exitWith {hint "Deje espacio libre para el objeto.";closeDialog 0;comprando = true;};
};

[[1,_id],"TON_fnc_vAH_update",false,false] spawn life_fnc_mp;
closeDialog 0;
hint "Articulo recuperado";
comprando = true;