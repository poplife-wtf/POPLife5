/*
	File: fn_vAH_buy.sqf //Editado por Rosen
	Description: buys the item but does some checks and another cool thing
	Author: Fresqo
	returns _id,_seller,_item,_price,_type,_amount,_sellerName
*/

disableSerialization;
private["_d","_e","_dialog","_myListbox","_selectedOffer","_id","_seller","_item","_value","_checkid","_cnt","_status","_online","_pid","_unit","_type","_amount","_diff","_uid","_caller","_handle","_tamount","_iCheck"];
comprando = false;
disableSerialization;
_dialog = findDisplay 00015;
_myListbox = _dialog displayCtrl 00017;
if (lbCurSel _myListbox < 0) exitWith {hint "Seleccione un articulo";comprando = true;};
_selectedOffer = call compile (_myListbox lbData (lbCurSel _myListbox));
if (!vAH_loaded) exitWith {hint "Mercarosen no esta disponible en estos momentos.";closeDialog 0;		
comprando = true;};
if (count _selectedOffer == 1) exitWith {closeDialog 0;		
comprando = true;};
_id = _selectedOffer select 0;
_seller = _selectedOffer select 1;
_item = _selectedOffer select 2;
_value = _selectedOffer select 3;
_type = _selectedOffer select 4;
_amount = _selectedOffer select 5;
_sellerName = _selectedOffer select 6;
_uid = getPlayerUID player;
_caller = player;
_online = false;
_iCheck = true;
if (pop_atmdin < _value) exitWith {hint "No tienes suficiente dinero en el banco.";closeDialog 0;		
comprando = true;};
if (_seller == _uid) exitWith {hint "No puedes comprar tu propio articulo.";		
comprando = true;};
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
{_checkid = _x select 0;if (_checkid == _id) then {_status = _x select 7};}forEach all_ah_items;
if (_status != 0 or isNil {_status}) exitWith {hint "El articulo no esta en venta.";closeDialog 0;		
comprando = true;}; //NOT FOR SALE ANYMORE
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
	if ((npc_presidente getVariable ["decreto",0]) == 3) then {
	_value = _value * 0.95;
	};
pop_atmdin = pop_atmdin - _value;
{if(getPlayerUID _x == _seller) then {_online = true; _unit = _x};} foreach allPlayers;
	
	if ((npc_presidente getVariable ["decreto",0]) == 3) then {
	_value = _value * 1.06;
	};
if (_online) then 
	{
		[[1,_id],"TON_fnc_vAH_update",false,false] spawn life_fnc_mp;
		[[0,[_item,_value,name _unit]],"life_fnc_vAH_reciever",_caller,false] spawn life_fnc_mp;
		[[1,[_caller,_value]],"life_fnc_vAH_reciever",_unit,false] spawn life_fnc_mp;
	} else 
		{
			[[3,_id,_value,_seller],"TON_fnc_vAH_update",false,false] spawn life_fnc_mp;
			[[0,[_item,_value,_sellerName]],"life_fnc_vAH_reciever",_caller,false] spawn life_fnc_mp;
		};
closeDialog 0;
hint "Articulo entregado";		
comprando = true;