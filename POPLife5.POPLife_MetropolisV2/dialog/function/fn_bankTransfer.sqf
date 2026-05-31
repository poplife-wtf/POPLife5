/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Figure it out again.
*/
disableSerialization;
_cajero = uiNamespace getVariable "cajero_dinero"; 
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 1623);
_selccion = _this select 0;
_unit = call compile format["%1",(lbData[1624,(_selccion)])];
if(isNull _unit) exitWith {};
if((lbCurSel 1624)  isEqualTo  -1) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Selecciona a la persona que quieres mandar el dinero.</t>"]};
if(isNil "_unit") exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>La persona que has seleccionado no existe.</t>"]};

if(_val > 100000) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No puedes transferir mas de 100.000€ de una vez.</t>"]};      

if(_val < 0) exitwith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto a transferir.</t>"]};
//if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > pop_atmdin) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No dispones de tanto dinero en tu cuenta bancaria para transferir.</t>"]};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > pop_atmdin) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No dispones de esa cantidad en tu cuenta, para transferir $%1 necesitas $%2 por comision.</t>", _val, _tax]};

	playsound "cajero";	
	ctrlShow [1200, true];
	ctrlShow [1201, false];
	ctrlShow [1202, false]; //Billetes
	ctrlShow [1203, false];
	ctrlShow [1204, false];
	ctrlShow [1205, false];
	ctrlShow [1996, false];
	ctrlShow [1206, false];
	ctrlShow [1624, false];
	ctrlShow [1623, false];
	ctrlShow [1607, false];
	ctrlShow [16008, false];
	ctrlShow [1600, false];
	ctrlShow [1601, false];
	ctrlShow [1602, false];
	ctrlShow [1603, false];
	ctrlShow [1604, false];
	ctrlShow [1605, false];
	ctrlShow [1606, false];
	ctrlShow [1998, false];
	ctrlShow [1621, false];
	ctrlShow [1999, false];
	ctrlShow [1997, true];
	if (isnull (findDisplay 1997)) exitWith {};
		
pop_atmdin = pop_atmdin - (_val + _tax);

[_val,profileName] remoteExec ["life_fnc_WireTransfer",_unit];

/*

TON_fnc_clientWireTransfer = 
{
	private["_unit","_val","_from"];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from  isEqualTo  "") exitWith {};
	pop_atmdin = pop_atmdin + _val;
	//hint format["%1 has wire transferred $%2 to you.",_from,[_val] call life_fnc_numberText];
	hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>%1 te ha transferido %2€ a tu cuenta bancaria.</t>", _from,[_val] call life_fnc_numberText];      
}

*/
//[] call life_fnc_atmMenu;
//hint format[localize "STR_ATM_SentMoneySuccess",];
hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has transferido %1€ a la cuenta de %2. Se te han cobrado %3€ de comision.</t>", [_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];      

[6] call SOCK_fnc_updatePartial;
[0] call ica_fnc_cajeroMenus; 
