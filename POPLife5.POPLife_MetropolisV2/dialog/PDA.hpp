
class ADAMUZ_PDA {
	idd = 777;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['dlgPDA', _this select 0];";
	onunLoad = "ocupado = nil;";
	class controlsBackground {};
	class objects {};
	class controls 
	{ 
		class RscPicture_1200: RscPicture
		{
			moving = 1;
			idc = 3000;
			text = "\pop_iconos\pda\pdapolicia.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.66 * safezoneH;
		};
		class LISTA: RscPicture
		{
			idc = 3001;
			text = "\pop_iconos\pda\buscados.paa";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class LISTA_BTN: PDARscButton
		{
			action = "[1] spawn ica_fnc_menuspda";
			idc = 3002;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class BUSCADOR: RscPicture
		{
			idc = 3003;
			text = "\pop_iconos\pda\Buscar.paa";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class BUSCADOR_BTN: PDARscButton
		{
			action = "[2] spawn ica_fnc_menuspda";
			idc = 3004;
			x = 0.469062 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class LICENCIAS: RscPicture
		{
			idc = 3005;
			text = "\pop_iconos\pda\matriculas.paa";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class LICENCIAS_BTN: PDARscButton
		{	action = "[3] spawn ica_fnc_menuspda";
			idc = 3006;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.099 * safezoneH;
		};

		class ATRAS: RscPicture //Imagen atras
		{
			idc = 3016;
			text = "\pop_iconos\pda\atras.paa";
			x = 0.644374 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class ATRAS_BTN_BUSCAR: PDARscButton //boton atras
		{
			action = "[0] spawn ica_fnc_menuspda";
			idc = 3008;
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {1,1,1,0};
			colorBackgroundDisabled[] = {1,1,1,0};
			colorBackgroundActive[] = {1,1,1,0};
		};
		class RscButton_1601: PDARscButton2 //texto ficha policial
		{
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
			idc = 3009;
			text = "FICHA POLICIAL"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class NOMBRE_DELITOS: PDARscButton2 //BOTON PARA BUSCAR POR NOMBRE
		{
			action = "[] spawn ica_fnc_mirardelitospda";
			idc = 3010;
			text = "BUSCAR POR NOMBRE"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
		};
		class RscButton_1603: PDARscButton2
		{
			action = "[] spawn ica_fnc_buscarmatriculapda";
			idc = 3011;
			text = "BUSCAR POR MATRICULA"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
		};
		class LISTADELITOS_BUSCADELINCUENTE: RscListbox
		{
			idc = 3012;
			sizeEx = 0.025;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {1,1,1,0.25};
			colorBackgroundDisabled[] = {1,1,1,0.25};
			colorBackgroundActive[] = {0,0,0,0.25};		
		};
		class RscListbox_1500: RscListbox
		{
			idc = 3015;
			sizeEx = 0.025;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {1,1,1,0.25};
			colorBackgroundDisabled[] = {1,1,1,0.25};
			colorBackgroundActive[] = {0,0,0,0.25};		
		};
		class NOMBRE_INPUT: RscButton
		{
			idc = 3013;
			type = CT_EDIT; 
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,1,1,0.25};
			colorSelection[] = { 0.543, 0.5742, 0.4102, 1 };
			autocomplete = false;
		};
		class MATRICULA_INPUT: RscButton
		{
			idc = 3014;
			type = CT_EDIT; 
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,1,1,0.25};
			colorSelection[] = { 0.543, 0.5742, 0.4102, 1 };
			autocomplete = false;
		};
		
		class RscButton_LICENCIAS: PDARscButton2 //texto ficha policial
		{
			colorFocused[] = { 0, 0, 0, 0.5 }; // border color for focused state
			colorDisabled[] = { 0, 0, 0, 0.5 }; // text color for disabled state
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
			idc = 3017;
			text = "LICENCIAS ACTIVAS"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_NOMBRELICENCIAS: PDARscButton2 //BOTON PARA BUSCAR POR NOMBRE
		{
			action = "[] spawn ica_fnc_mirarlicenciapdamandar";
			idc = 3018;
			text = "BUSCAR POR NOMBRE"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
		};
		class RscListbox_LICENCIAS: RscListbox
		{
			idc = 3020;
			sizeEx = 0.025;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.286 * safezoneH;
			colorBackground[] = {1,1,1,0.25};
			colorBackgroundDisabled[] = {1,1,1,0.25};
			colorBackgroundActive[] = {0,0,0,0.25};		
		};
		class NOMBRE_LICENCIAS_INPUT: RscButton
		{
			idc = 3021;
			type = CT_EDIT; 
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,1,1,0.25};
			colorSelection[] = { 0.543, 0.5742, 0.4102, 1 };
			autocomplete = false;
		};
		class RscListbox_DELINCUENTES: RscListbox
		{
			idc = 3022;
			sizeEx = 0.025;
			colorBackground[] = {1,1,1,0.25};
			colorBackgroundDisabled[] = {1,1,1,0.25};
			colorBackgroundActive[] = {0,0,0,0.25};	
			onLBSelChanged = "[] spawn ica_fnc_wantedInfopda";

			x = 0.335 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.275 * safezoneH;
		};
		class RscListbox_DELITOSDELINCUENTES: RscListbox
		{
			idc = 3023;
			sizeEx = 0.025;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.231 * safezoneH;
			colorBackground[] = {1,1,1,0.25};
			colorBackgroundDisabled[] = {1,1,1,0.25};
			colorBackgroundActive[] = {0,0,0,0.25};		
		};
		class RscButton_INVESTIGAR: PDARscButton2 //texto ficha policial
		{
			colorFocused[] = { 0, 0, 0, 0.5 }; // border color for focused state
			colorDisabled[] = { 0, 0, 0, 0.5 }; // text color for disabled state
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
			onButtonClick = "[""init""] call ica_fnc_detectivePDA; closeDialog 0;";
			idc = 2050;
			text = "INVESTIGAR"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_DELINCUENTES: PDARscButton2 //texto ficha policial
		{
			colorFocused[] = { 0, 0, 0, 0.5 }; // border color for focused state
			colorDisabled[] = { 0, 0, 0, 0.5 }; // text color for disabled state
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
			idc = 3024;
			onButtonClick = "[] spawn ica_fnc_wantedmenupda;";
			text = "ACTUALIZAR DATOS"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_PERDONARDELITO: PDARscButton2 //texto ficha policial
		{
			colorFocused[] = { 0, 0, 0, 0.5 }; // border color for focused state
			colorDisabled[] = { 0, 0, 0, 0.5 }; // text color for disabled state
			colorText[] = { 1, 1, 1, 1 };
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
			onButtonClick = "[] spawn ica_fnc_pardonpda;";
			idc = 3025;
			text = "PERDONAR DELITOS"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_OBJETIVO: PDARscButton2 //BOTON PARA BUSCAR POR NOMBRE
		{
			action = "[] spawn ica_fnc_identificarpda";
			idc = 3026;
			text = "IDENTIFICAR OBJETIVO"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			colorBackgroundActive[] = {0,0,0,0.5};	
		};
		class NOMBRE_OBJETIVO: RscButton
		{
			idc = 3027;
			type = CT_EDIT; 
			x = 0.5425 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {1,1,1,0.25};
			colorSelection[] = { 0.543, 0.5742, 0.4102, 1 };
			autocomplete = false;
		};
		
    };		
};

