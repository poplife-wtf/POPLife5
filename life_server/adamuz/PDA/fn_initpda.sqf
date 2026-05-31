/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

if (!isnull (findDisplay 777)) exitWith {};

createDialog "ADAMUZ_PDA";
disableSerialization;

//OCULTAR Y REINICIAR TODO. PONER EL MENU DE INICIO
ctrlEnable [3009, false];
ctrlEnable [3017, false];

ctrlShow [3007, false ];
ctrlShow [3000, true ];
ctrlShow [3001, false ];
ctrlShow [3002, false ];
ctrlShow [3003, false ];
ctrlShow [3004, false ];
ctrlShow [3005, false ];
ctrlShow [3006, false ];
ctrlShow [3008, false ];
ctrlShow [3009, false ];
ctrlShow [3010, false ];
ctrlShow [3011, false ];
ctrlShow [3012, false ];
ctrlShow [3013, false ];
ctrlShow [3014, false ];
ctrlShow [3015, false ];
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
	

//PONER MENU INICIO SOLO
ctrlShow [3000, true ];
ctrlShow [3001, true ];
ctrlShow [3002, true ];
ctrlShow [3003, true ];
ctrlShow [3004, true ];
ctrlShow [3005, true ];
ctrlShow [3006, true ];

