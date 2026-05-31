/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

_tipo = _this select 0;
disableSerialization;

_PDA = uiNamespace getVariable 'dlgPDA'; 

_list = _PDA displayctrl 3020;
_list2 = _PDA displayctrl 3022;
_list3 = _PDA displayctrl 3023;
_list4 = _PDA displayctrl 3012;

lbClear _list;
lbClear _list2;
lbClear _list3;
lbClear _list4;

(_PDA displayCtrl 3013) ctrlSetText "";
(_PDA displayCtrl 3014) ctrlSetText "";
(_PDA displayCtrl 3021) ctrlSetText "";
(_PDA displayCtrl 3027) ctrlSetText "";


switch (_tipo) do {
	case 0: 
	{	
		//hint "0";
		//OCULTAR TODO
		ctrlShow [3000, true ];
		ctrlShow [3001, false ];
		ctrlShow [3002, false ];
		ctrlShow [3003, false ];
		ctrlShow [3004, false ];
		ctrlShow [3005, false ];
		ctrlShow [3006, false ];
		ctrlShow [3007, false ];
		ctrlShow [3008, false ];
		ctrlShow [3009, false ];
		ctrlShow [3010, false ];
		ctrlShow [3011, false ];
		ctrlShow [3012, false ];
		ctrlShow [3013, false ];
		ctrlShow [3014, false ];
		ctrlShow [3016, false ];
		ctrlShow [3017, false ];
		ctrlShow [3018, false ];
		ctrlShow [3019, false ];
		ctrlShow [3020, false ];
		ctrlShow [3021, false ];
		ctrlShow [3022, false ];
		ctrlShow [3023, false ];
		ctrlShow [3024, false ];
		ctrlShow [3025, false ];
		ctrlShow [3026, false ];		
		ctrlShow [3027, false ];		
		ctrlShow [2050, false ];		
		
		//MOSTRAR MENU INICIAL SOLO
		ctrlShow [3000, true ];
		ctrlShow [3001, true ];
		ctrlShow [3002, true ];
		ctrlShow [3003, true ];
		ctrlShow [3004, true ];
		ctrlShow [3005, true ];
		ctrlShow [3006, true ];
	};
	
	case 1: 
	{
		//hint "1";
		ctrlShow [3000, true ];
		ctrlShow [3001, false ];
		ctrlShow [3002, false ];
		ctrlShow [3003, false ];
		ctrlShow [3004, false ];
		ctrlShow [3005, false ];
		ctrlShow [3006, false ];
		ctrlShow [3007, false ];
		ctrlShow [3008, false ];
		ctrlShow [3009, false ];
		ctrlShow [3010, false ];
		ctrlShow [3011, false ];
		ctrlShow [3012, false ];
		ctrlShow [3013, false ];
		ctrlShow [3014, false ];
		ctrlShow [3016, false ];
		ctrlShow [3017, false ];
		ctrlShow [3018, false ];
		ctrlShow [3019, false ];
		ctrlShow [3020, false ];
		ctrlShow [3021, false ];
		ctrlShow [3022, false ];
		ctrlShow [3023, false ];
		ctrlShow [3024, false ];
		ctrlShow [3025, false ];		
		ctrlShow [3026, false ];		
		ctrlShow [3027, false ];
		ctrlShow [2050, false ];		
		
		//PONER MENU 1
		ctrlShow [3022, true ];
		ctrlShow [3023, true ];
		ctrlShow [3024, true ];
		ctrlShow [3025, true ];
		ctrlShow [3016, true ];
		ctrlShow [3008, true ];
		ctrlShow [2050, true ];		
		[] call ica_fnc_wantedmenupda;
	};
	case 2:
	{	
		//hint "2";
		//OCULTAR TODO 
		ctrlShow [3000, true ];
		ctrlShow [3001, false ];
		ctrlShow [3002, false ];
		ctrlShow [3003, false ];
		ctrlShow [3004, false ];
		ctrlShow [3005, false ];
		ctrlShow [3006, false ];
		ctrlShow [3007, false ];
		ctrlShow [3008, false ];
		ctrlShow [3009, false ];
		ctrlShow [3010, false ];
		ctrlShow [3011, false ];
		ctrlShow [3012, false ];
		ctrlShow [3013, false ];
		ctrlShow [3014, false ];
		ctrlShow [3016, false ];
		ctrlShow [3017, false ];
		ctrlShow [3018, false ];
		ctrlShow [3019, false ];
		ctrlShow [3020, false ];
		ctrlShow [3021, false ];
		ctrlShow [3022, false ];
		ctrlShow [3023, false ];
		ctrlShow [3024, false ];
		ctrlShow [3025, false ];
		ctrlShow [3026, false ];		
		ctrlShow [3027, false ];	
		ctrlShow [2050, false ];		
				
		//PONER MENU 2
		ctrlShow [3000, true ];
		ctrlShow [3007, true ];
		ctrlShow [3008, true ];
		ctrlShow [3009, true ];
		ctrlShow [3010, true ];
		ctrlShow [3011, true ];
		ctrlShow [3012, true ];
		ctrlShow [3013, true ];
		ctrlShow [3014, true ];
		ctrlShow [3016, true ];
		ctrlShow [3026, true ];		
		ctrlShow [3027, true ];		
	};
	case 3:
	{
		//hint "3";
		ctrlShow [3000, true ];
		ctrlShow [3001, false ];
		ctrlShow [3002, false ];
		ctrlShow [3003, false ];
		ctrlShow [3004, false ];
		ctrlShow [3005, false ];
		ctrlShow [3006, false ];
		ctrlShow [3007, false ];
		ctrlShow [3008, false ];
		ctrlShow [3009, false ];
		ctrlShow [3010, false ];
		ctrlShow [3011, false ];
		ctrlShow [3012, false ];
		ctrlShow [3013, false ];
		ctrlShow [3014, false ];
		ctrlShow [3016, false ];
		ctrlShow [3017, false ];
		ctrlShow [3018, false ];
		ctrlShow [3019, false ];
		ctrlShow [3020, false ];
		ctrlShow [3021, false ];
		ctrlShow [3022, false ];
		ctrlShow [3023, false ];
		ctrlShow [3024, false ];
		ctrlShow [3025, false ];
		ctrlShow [3026, false ];		
		ctrlShow [3027, false ];	
		ctrlShow [2050, false ];		
				
		//poner menu 3
		ctrlShow [3000, true ];
		ctrlShow [3007, true ];
		ctrlShow [3008, true ];
		ctrlShow [3016, true ];
		ctrlShow [3017, true ];
		ctrlShow [3018, true ];
		ctrlShow [3019, true ];
		ctrlShow [3020, true ];
		ctrlShow [3021, true ];
		ctrlShow [3026, true ];
		ctrlShow [3027, true ];
	};
	default 
	{
		//hint "DEFAULT";
		//OCULTAR TODO
		ctrlShow [3000, true ];
		ctrlShow [3001, false ];
		ctrlShow [3002, false ];
		ctrlShow [3003, false ];
		ctrlShow [3004, false ];
		ctrlShow [3005, false ];
		ctrlShow [3006, false ];
		ctrlShow [3007, false ];
		ctrlShow [3008, false ];
		ctrlShow [3009, false ];
		ctrlShow [3010, false ];
		ctrlShow [3011, false ];
		ctrlShow [3012, false ];
		ctrlShow [3013, false ];
		ctrlShow [3014, false ];
		ctrlShow [3016, false ];
		ctrlShow [3017, false ];
		ctrlShow [3018, false ];
		ctrlShow [3019, false ];
		ctrlShow [3020, false ];
		ctrlShow [3021, false ];
		ctrlShow [3022, false ];
		ctrlShow [3023, false ];
		ctrlShow [3024, false ];
		ctrlShow [3025, false ];	
		ctrlShow [3026, false ];		
		ctrlShow [3027, false ];
		ctrlShow [2050, false ];				
		
		//MOSTRAR MENU INICIAL SOLO
		ctrlShow [3000, true ];
		ctrlShow [3001, true ];
		ctrlShow [3002, true ];
		ctrlShow [3003, true ];
		ctrlShow [3004, true ];
		ctrlShow [3005, true ];
		ctrlShow [3006, true ];
	};
};