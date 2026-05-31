#include <macro.h>
/*
	File: fn_vAH_sell.sqf // Editado por Rosen
	Author: Fresqo
	Description: sells items to our auction house and blah blah too much fml
*/

private["_able","_uid","_dialog","_myListbox","_myQuantity","_onGuy","_details","_tquantity","_myTotal","_price","_typeb","_type","_classname","_realName","_bad","_tax","_action","_selectedSell","_quantity","_tochangePriceText","_tochangePriceNumber","_tochangeQuantityText","_tochangeQuantityNumber","_invItem"];
disableSerialization;
_dialog = findDisplay 00015;
_myListbox = _dialog displayCtrl 00016;
_able = 1;

if (!vAH_loaded) exitWith {hint "Mercarosen no esta disponible en estos momentos."};

_bad = false;
_realName = "";
switch ((__GETC__(life_donator))) do {
	case 1: {_able = 2};
	case 2: {_able = 3};
	case 3: {_able = 4};
	case 4: {_able = 5};
	case 5: {_able = 6};
	default {_able = 1};
};

_uid = getPlayerUID player;
if (({_x select 5 == _uid} count all_ah_items) >= _able) exitWith {hint format["Solo puedes vender %1 articulos a la vez.",_able];closeDialog 0;};
if (count all_ah_items >= 80) exitWith {hint "Mercarosen no tiene mas espacio para nuevos articulos (limite 80 articulos)";closeDialog 0;};

_price = ctrlText 00021;
_quantity = ctrlText 00019;

if(! ([_price] call TON_fnc_isnumber)) exitWith {hint "Eso no es un numero.";};
if(! ([_quantity] call TON_fnc_isnumber)) exitWith {hint "Eso no es un numero.";};
_price = parseNumber _price;
_quantity = parseNumber _quantity;
if(_quantity < 1) exitWith {hint "No puedes vender la nada.";};
if (lbCurSel _myListbox < 0) exitWith {hint "Seleccione un articulo.";};
_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));

_classname = _selectedSell select 0;
if((objetos_prohibidos find _classname) == 0) exitWith {hint "Seleccione otro articulo, ya que este no es compatible en Mercarosen.";};
if (_classname == "yolo") exitWith {};
_typeb = _selectedSell select 1;
_invItem = [_selectedSell,2,3,[3]] call BIS_fnc_param;
if (_invItem != 3) exitWith {hint "No puedes vender un articulo que ya esta vendiendose."};
if(_typeb == "ymenu") then {_type = 0} else {_type = 1};

if (_price < 1) exitWith {hint "Precio no valido."};
if (_price > 250000) exitWith {hint "No puede valer mas de 250000 €."};

_tax = round (_price * 0.1);

switch (_type) do 
{
	case 0: {
				_realName = [([_classname,0] call life_fnc_varHandle)] call life_fnc_varToStr;
				if (_quantity > 100) then {_bad = true; hint "Demasiada cantidad."};
			};
	case 1: {
		if (_quantity > 1) then {
				_details = [_classname] call life_fnc_fetchCfgDetails;
				if (!(_details select 6 == "CfgMagazines")) then {
				hint "Solo puedes vender 1 articulo de este tipo.";_bad = true;};
				_onGuy = {_classname == _x} count (magazines player);
				if (_onGuy < _quantity) then {hint "No tienes tantos.";_bad = true;}
		};		
		_realName = ([_classname] call life_fnc_fetchCfgDetails) select 1;
	};
};

if (_bad) exitWith {closeDialog 0;hint "Error";};

_action = [format["Debes pagar un impuesto de %1€. Confirmar?",_tax],"Confirmacion de venta","Continuar","Cancelar"] call BIS_fnc_guiMessage;
if(_action) then {
		if(pop_atmdin < _tax) exitWith {hint "No tienes suficiente dinero en el banco.";_bad = true;};
	
	switch (_type) do 
	{
		case 0: {_bad = true;};
		case 1: {
			_cquantity = _quantity * -1;
			[_classname,_cquantity] call ica_fnc_item;
		};
	};
	if (_bad) exitWith {closeDialog 0;};
	[[4,_type,_quantity,_price,getPlayerUID player,_classname,_realName,name player],"TON_fnc_vAH_update",false,false] call life_fnc_mp;
	hint "Venta registrada.";
	pop_atmdin = pop_atmdin - _tax;
	closeDialog 0;
}
 else {
	closeDialog 0;
};