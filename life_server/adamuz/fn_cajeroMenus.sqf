/*

~~Adamuz Systems~~

Sistema de Cajeros POP4

[] spawn life_fnc_atmMenu;
["Tipo"] spawn cajeroMenus;

*/

disableSerialization;
//player setvariable ["esperandocajero", false];
_tipo = _this select 0;
_cajero = uiNamespace getVariable "cajero_dinero"; 
_cantidad = ctrlText 1623;
_dinero = parseNumber _cantidad;
iniciocajero = false;


switch (_tipo) do {
	case 0: //MENU INICIO CAJERO
	{
		iniciocajero = true;
		lbSetCurSel [1624, -1];
		
		ctrlShow [1200, true];
		
		ctrlShow [1201, true];
		ctrlShow [1202, false]; 
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, false];
		ctrlShow [1607, false];
		ctrlShow [16008, true];
		ctrlShow [1996, false];
		ctrlShow [1600, true];
		ctrlShow [1601, true];
		ctrlShow [1602, true];
		ctrlShow [1603, true];
		ctrlShow [1604, true];
		ctrlShow [1605, true];
		ctrlShow [1606, true];
		ctrlShow [1999, false];
		ctrlShow [1998, false];
		ctrlShow [1621, false];
		ctrlShow [1997, false];
		ctrlShow [1724, false]; //Mafia
ctrlShow [1725, false]; //Mafia
ctrlShow [1207, false]; //Mafia
		
		ctrlShow [1609, true];
		ctrlShow [1610, true];
		ctrlShow [1611, true];
		ctrlShow [1612, true];
		ctrlShow [1613, true];
		ctrlShow [1614, true];
		ctrlShow [1615, true];
		ctrlShow [1616, true];
		ctrlShow [1617, true];
		ctrlShow [1618, true];
		ctrlShow [1619, true];
		ctrlShow [1620, true];
				
		ctrlShow [1608, false];
		ctrlShow [8, false];
		ctrlShow [9, false];
		ctrlShow [10, false];
		ctrlShow [11, true];
				
		(_cajero displayCtrl 1623) ctrlSetText "";
	};
	
	case 1: //Menu Retirar Dinero
	{
		lbSetCurSel [1624, -1];
		ctrlShow [1200, true];
		
		ctrlShow [1201, false];
		ctrlShow [1202, false]; 
		ctrlShow [1203, true];
		ctrlShow [1204, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1996, false];
		ctrlShow [1623, true];
		ctrlShow [1607, true];
		ctrlShow [16008, false];
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1999, false];
		ctrlShow [1998, false];
		ctrlShow [1997, false];
		ctrlShow [1621, false];
		ctrlShow [1724, false]; //Mafia
ctrlShow [1725, false]; //Mafia
ctrlShow [1207, false]; //Mafia
	
		ctrlShow [1608, true];
		ctrlShow [8, false];
		ctrlShow [9, false];
		ctrlShow [10, false];
		ctrlShow [11, false];
		
		(_cajero displayCtrl 1623) ctrlSetText "";
	};
	
	case 2: //Menu Ingresar Dinero
	{
		lbSetCurSel [1624, -1];
		ctrlShow [1200, true];
		
		ctrlShow [1201, false];
		ctrlShow [1202, false]; 
		ctrlShow [1203, false];
		ctrlShow [1996, false];
		ctrlShow [1204, true];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, true];
		ctrlShow [1607, true];
		ctrlShow [16008, false];
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1997, false];
		ctrlShow [1999, false];
		ctrlShow [1998, false];
		ctrlShow [1621, false];
		ctrlShow [1724, false]; //Mafia
ctrlShow [1725, false]; //Mafia
ctrlShow [1207, false]; //Mafia
		
		ctrlShow [1608, false];
		ctrlShow [8, true];
		ctrlShow [9, false];
		ctrlShow [10, false];
		ctrlShow [11, false];
		
		(_cajero displayCtrl 1623) ctrlSetText "";
	};
	
	case 3:	//Menu Saldo
	{
		lbSetCurSel [1624, -1];
		ctrlShow [1200, true];
		
		ctrlShow [1201, false];
		ctrlShow [1202, false]; 
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1996, false];
		ctrlShow [1205, true];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, true];
		ctrlShow [1607, true];
		ctrlShow [16008, false];
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1997, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1999, false];
		ctrlShow [1998, false];
		ctrlShow [1621, false];
		ctrlShow [1724, false]; //Mafia
ctrlShow [1725, false]; //Mafia
ctrlShow [1207, false]; //Mafia
		
		ctrlShow [1609, false];
		ctrlShow [1610, false];
		ctrlShow [1611, false];
		ctrlShow [1612, false];
		ctrlShow [1613, false];
		ctrlShow [1614, false];
		ctrlShow [1615, false];
		ctrlShow [1616, false];
		ctrlShow [1617, false];
		ctrlShow [1618, false];
		ctrlShow [1619, false];
		ctrlShow [1620, false];
		
		ctrlShow [1608, false];
		ctrlShow [8, false];
		ctrlShow [9, true];
		ctrlShow [10, false];
		ctrlShow [11, false];
		
		(_cajero displayCtrl 1623) ctrlSetText ([pop_atmdin] call life_fnc_numberText);	
	};
	
	case 4:	//Menu Transferir
	{
		lbSetCurSel [1624, -1];
		ctrlShow [1200, true];
		
		ctrlShow [1201, false];
		ctrlShow [1202, false]; 
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1205, false];
		ctrlShow [1624, true];
		ctrlShow [1997, false];
		ctrlShow [1623, true];
		ctrlShow [1206, true];
		ctrlShow [1607, true];
		ctrlShow [16008, false];		
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1996, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1998, false];
		ctrlShow [1999, false];
		ctrlShow [1621, false];
		ctrlShow [1724, false]; //Mafia
ctrlShow [1725, false]; //Mafia
ctrlShow [1207, false]; //Mafia
		
		ctrlShow [1608, false];
		ctrlShow [8, false];
		ctrlShow [9, false];
		ctrlShow [10, true];
		ctrlShow [11, false];
		
		(_cajero displayCtrl 1623) ctrlSetText "";
		_listadepersonas = (uiNamespace getVariable "cajero_dinero") displayCtrl 1624;

		lbClear _listadepersonas;
		{
			if(alive _x) then	{
				switch (side _x) do {
					case west: {};
					case civilian: {};
					case independent: {};
					case east: {};
				};
				_listadepersonas lbAdd format["%1",_x getVariable["realname",name _x]];
				_listadepersonas lbSetData [(lbSize _listadepersonas)-1,str(_x)];
			};
		} foreach playableUnits;
		
		lbSort [_listadepersonas, "ASC"];

	};
	
	case "num1":	
	{	
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "1"];		
	};
	
	case "num2":	
	{
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "2"];
	};
	
	case "num3":	
	{
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "3"];
	};
	
	case "num4":	
	{
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "4"];
	};
	
	case "num5":	
	{
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "5"];
	};
	
	case "num6":	
	{	
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "6"];
	};
	
	case "num7":	
	{
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "7"];
	};
	
	case "num8":	
	{
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "8"];
	};
	
	case "num9":	
	{
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "9"];
	};
	
	case "num0":	
	{
		(_cajero displayCtrl 1623) ctrlSetText format ["%1%2",_cantidad, "0"];
	};
	
	case "enter1":	//SACAR DINERO
	{		
		if (_cantidad == "") exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (_dinero <= 0) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (!isnil _cantidad) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (_dinero > 100000) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No puedes realizar transacciones con mas de 100.000€ de una vez.</t>"]};
		if(_dinero > pop_atmdin) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No dispones de tanto dinero en tu cuenta bancaria.</t>"]}; 
		if(_dinero < 1000 && pop_atmdin > 1000000) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Debido a que eres muy rico, debes realizar transacciones con una cantidad minima de 1.000€</t>"]};
		ctrlShow [1611, false];		
		ctrlShow [1612, false];		
		ctrlShow [1613, false];		
		ctrlShow [1614, false];		
		ctrlShow [1615, false];		
		ctrlShow [1616, false];		
		ctrlShow [1617, false];		
		ctrlShow [1618, false];		
		ctrlShow [1619, false];		
		ctrlShow [1724, false]; //Mafia
ctrlShow [1725, false]; //Mafia
ctrlShow [1207, false]; //Mafia
		ctrlShow [1620, false];		
		
		ctrlShow [1608, false];		
		ctrlShow [1610, false];		
		ctrlShow [1609, false];		
		playsound "cajero";	
		ctrlShow [1200, true];
		ctrlShow [1201, false];
		ctrlShow [1202, false]; 
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, false];
		ctrlShow [1607, false];
		ctrlShow [1997, false];
		ctrlShow [1996, false];
		ctrlShow [16008, false];
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1999, true];
		ctrlShow [1998, false];
		ctrlShow [1621, false];
		if (isnull (findDisplay 1997)) exitWith {};
		ctrlShow [1202, true];	
		ctrlShow [1999, false];
		ctrlShow [1998, true];	
		ctrlShow [1621, true];	
	
		//ESPERA A QUE COJA EL DINERO (case "RETIRARDINERO")		
	};
	
	case "enter2": //METER DINERO	
	{
		if (_cantidad == "") exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (_dinero <= 0) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (!isnil _cantidad) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (_dinero > 100000) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No puedes realizar transacciones con mas de 100.000€ de una vez.</t>"]};
		if(_dinero > pop_din) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No dispones de tanto dinero en tu cartera.</t>"]}; 
		if(_dinero < 1000 && pop_atmdin > 1000000) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Debido a que eres muy rico, debes realizar transacciones con una cantidad minima de 1.000€</t>"]}; 
		playsound "cajero";			
		ctrlShow [1202, true];	
		ctrlShow [1200, true];
		ctrlShow [1201, false];
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1996, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, false];
		ctrlShow [1607, false];
		ctrlShow [16008, false];
		ctrlShow [1997, false];
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1999, true];
		ctrlShow [1998, false];
		ctrlShow [1724, false]; //Mafia
ctrlShow [1725, false]; //Mafia
ctrlShow [1207, false]; //Mafia
		ctrlShow [1621, false];
		if (isnull (findDisplay 1997)) exitWith {};
		ctrlShow [1999, false];
		ctrlShow [1997, true];
		ctrlShow [1202, false];
		if (isnull (findDisplay 1997)) exitWith {};
		
		pop_din = pop_din - _dinero;
		pop_atmdin = pop_atmdin + _dinero;
		[] call life_fnc_atmMenu;
		[6] call SOCK_fnc_updatePartial;
		hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has ingresado %1€ en tu cuenta bancaria.</t>", _dinero];
		
		[0] call ica_fnc_cajeroMenus;
	};
	
	case "enter4":	
	{
		//AQUI EL .HPP HACE ESTO:
		//TempDialogSelected = (lbCurSel 1624); [TempDialogSelected] call life_fnc_bankTransfer";
	};
	
	
	case "clear": //QUITA EL DINERO QUE HAS ESCRITO DEL CAMPO DEL DINERO
	{
		(_cajero displayCtrl 1623) ctrlSetText "";
	};
	
	case "cancelar": //VUELVE AL MENU INICIAL
	{
		[0] call ica_fnc_cajeroMenus ;
	};
	
	case "retirardinero": //COGER EL DINERO DEL CASE ENTER1
	{
		if (isnull (findDisplay 1997)) exitWith {}; 
		if (_dinero > 100000) exitWith {hint parseText ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Hubo un error al retirar el dinero de tu cuenta bancaria.</t>"];};		
		if ((pop_atmdin - _dinero) < 0) exitWith {hint parseText ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Hubo un error al retirar el dinero de tu cuenta bancaria.</t>"];};	
		pop_din = pop_din + _dinero;
		pop_atmdin = pop_atmdin - _dinero;
		hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has retirado %1€ de tu cuenta bancaria.</t>", _dinero];

		[6] call SOCK_fnc_updatePartial;
		[0] call ica_fnc_cajeroMenus ;
	};
	
	case "hack": //SI (DDoS != nil) SE ABRE ESTA PANTALLA
	{		
		hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Los servidores del Banco de Metropolis estan bajo un ataque DDoS...</t> <br/><t color='#FFFFFF' size='1.5'>Esto imposibilita el uso de todos nuestros cajeros automaticos hasta que finalice dicho ataque.</t> <br/><t color='#FFFFFF' size='1.5'>Perdonen las molestias.</t>"];      

 		ctrlShow [1200, true];
		ctrlShow [1201, false];
		ctrlShow [1202, false]; 
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, false];
		ctrlShow [1997, false];
		ctrlShow [1996, true];
		ctrlShow [1607, false];
		ctrlShow [16008, false];		
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1999, false];
		ctrlShow [1998, false];	
		ctrlShow [1621, false];
		ctrlShow [1724, false]; //Mafia
ctrlShow [1725, false]; //Mafia
ctrlShow [1207, false]; //Mafia
		
		ctrlShow [1609, false];
		ctrlShow [1610, false];
		ctrlShow [1611, false];
		ctrlShow [1612, false];
		ctrlShow [1613, false];
		ctrlShow [1614, false];
		ctrlShow [1615, false];
		ctrlShow [1616, false];
		ctrlShow [1617, false];
		ctrlShow [1618, false];
		ctrlShow [1619, false];
		ctrlShow [1620, false];
		
		(_cajero displayCtrl 1623) ctrlSetText "";
		
	};
	
	case "mafia": //Ingrear y retirar dinero de mafia
	{				
		if !(life_in_gang) exitWith {hint "No te encuentras registrado en ninguna organizacion"};
		if (life_gangzona isEqualto 0) exitWith {hint "Tu organizacion no cuenta con ninguna zona ... por lo que no tenemos garantias para introducirla en la banca"};
		
		ctrlShow [1724, true]; //Mafia
		ctrlShow [1725, true]; //Mafia
		
		lbSetCurSel [1624, -1];
		ctrlShow [1200, true];
		
		ctrlShow [1201, false];
		ctrlShow [1202, false]; 
		ctrlShow [1203, false];
		ctrlShow [1996, false];
		ctrlShow [1204, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1207, true];
		ctrlShow [1624, false];
		ctrlShow [1623, true];
		ctrlShow [1607, true];
		ctrlShow [16008, false];
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1997, false];
		ctrlShow [1999, false];
		ctrlShow [1998, false];
		ctrlShow [1621, false];
		
		ctrlShow [1608, false];
		ctrlShow [8, false];
		ctrlShow [9, false];
		ctrlShow [10, false];
		ctrlShow [11, false];
		
		(_cajero displayCtrl 1623) ctrlSetText "";		
	};
	
	case "mafiain": //METER DINERO	
	{
		if (_cantidad == "") exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (_dinero <= 0) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (!isnil _cantidad) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (_dinero > 100000) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No puedes realizar transacciones con mas de 100.000€ de una vez.</t>"]};
		if(_dinero > pop_din) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No dispones de tanto dinero en tu cartera.</t>"]}; 
		playsound "cajero";			
		ctrlShow [1202, true];	
		ctrlShow [1200, true];
		ctrlShow [1201, false];
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1996, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, false];
		ctrlShow [1607, false];
		ctrlShow [16008, false];
		ctrlShow [1997, false];
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1999, true];
		ctrlShow [1998, false];
		ctrlShow [1621, false];
		if (isnull (findDisplay 1997)) exitWith {};
		ctrlShow [1999, false];
		ctrlShow [1997, true];
		ctrlShow [1202, false];
		if (isnull (findDisplay 1997)) exitWith {};
		
		pop_din = pop_din - _dinero;
		_gang = group player getVariable ["gang_bank",0];
		group player setVariable ["gang_bank",_gang + _dinero,true];
		[] call life_fnc_atmMenu;
		[6] call SOCK_fnc_updatePartial;
		
		if (life_HC_isActive) then {
			[1,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life];
		} else {
			[1,group player] remoteExecCall ["TON_fnc_updateGang",2];
		};
		hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has ingresado %1€ en tu cuenta de Mafia.</t>", _dinero];
		remoteExecCall ["ica_fnc_updateMafia",group player];
		[0] call ica_fnc_cajeroMenus;
	};
	
	case "mafiaout": //METER DINERO	
	{
		if (_cantidad == "") exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (_dinero <= 0) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (!isnil _cantidad) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Introduce un valor correcto.</t>"]};
		if (_dinero > 100000) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No puedes realizar transacciones con mas de 100.000€ de una vez.</t>"]};
		if((group player getVariable ["gang_bank",0]) < _dinero) exitWith {hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No dispones de tanto dinero en tu cuenta de Mafia.</t>"]}; 
		playsound "cajero";			
		ctrlShow [1202, true];	
		ctrlShow [1200, true];
		ctrlShow [1201, false];
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1996, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, false];
		ctrlShow [1607, false];
		ctrlShow [16008, false];
		ctrlShow [1997, false];
		ctrlShow [1600, false];
		ctrlShow [1601, false];
		ctrlShow [1602, false];
		ctrlShow [1603, false];
		ctrlShow [1604, false];
		ctrlShow [1605, false];
		ctrlShow [1606, false];
		ctrlShow [1999, true];
		ctrlShow [1998, false];
		ctrlShow [1621, false];
		if (isnull (findDisplay 1997)) exitWith {};
		ctrlShow [1999, false];
		ctrlShow [1997, true];
		ctrlShow [1202, false];
		if (isnull (findDisplay 1997)) exitWith {};
		if ((player getVariable ["mafia_rango",1]) < 4) exitWith {hint "Contador discreto: No tienes el rango en tu organizacion para retirar dinero."};
		[10, "Tesorero de la Organización", [1,0,0], 1.5, format ["%1 ha retirado €%2 del Banco de la Organización",profileName,_dinero], [1,1,1], 1] remoteExec ["ica_fnc_anuncio",group player];
		pop_din = pop_din + _dinero;
		_gang = group player getVariable ["gang_bank",0];
		group player setVariable ["gang_bank",_gang - _dinero,true];
		[] call life_fnc_atmMenu;
		[6] call SOCK_fnc_updatePartial;
		 if (life_HC_isActive) then {
			[1,group player] remoteExecCall ["HC_fnc_updateGang",HC_Life];
		} else {
			[1,group player] remoteExecCall ["TON_fnc_updateGang",2];
		};
		remoteExecCall ["ica_fnc_updateMafia",group player];
		hint parseText format ["<br/><t color='#e7ad3e' size='2' shadow='1'shadowColor='#7e521c'>BANCO DE METROPOLIS</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has retirado %1€ en tu cuenta de Mafia.</t>", _dinero];
		
		[0] call ica_fnc_cajeroMenus;
	};
	
	default //SI FALLA EL SWITCH PONE LA PANTALLA DE INICIO
	{
		ctrlShow [1200, true];
		ctrlShow [1201, true];
		ctrlShow [1202, false]; 
		ctrlShow [1203, false];
		ctrlShow [1204, false];
		ctrlShow [1205, false];
		ctrlShow [1206, false];
		ctrlShow [1624, false];
		ctrlShow [1623, false];
		ctrlShow [1997, false];
		ctrlShow [1996, false];
		ctrlShow [1607, false];
		ctrlShow [16008, true];		
		ctrlShow [1600, true];
		ctrlShow [1601, true];
		ctrlShow [1602, true];
		ctrlShow [1603, true];
		ctrlShow [1604, true];
		ctrlShow [1605, true];
		ctrlShow [1606, true];
		ctrlShow [1999, false];
		ctrlShow [1998, false];	
		ctrlShow [1621, false];
		ctrlShow [1724, false]; //Mafia
		ctrlShow [1725, false]; //Mafia
		ctrlShow [1207, false]; //Mafia
		(_cajero displayCtrl 1623) ctrlSetText "";

	};
};