/*
	File: fn_calldialog.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Calls the Dialog.
    
	
	Para enviar el anuncio de forma anónima se llama con:
		["anonimo"] call life_fnc_calldialog;
*/

_param = param [0, nil];

if (!isNil {_param}) exitWith {uiNamespace setVariable ["anuncioAnonimo", true]; createDialog "channel"};

if(!createDialog "channel") exitWith {hint "Failed Creating Dialog";}; //Couldn't create the menu?
disableSerialization;