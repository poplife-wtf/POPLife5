
#define altoB 0.143 // * safezoneH

#define col1 0.00618749
#define col2 0.153658
#define col3 0.301125

#define incY 0.154 			// Incremento de Y de 1 al 4 para TODO
#define difY 0.022 	// Diferencia entre el texto y la lista

#define fil2 (0.00660001 + (0.154 * 1))
#define fil3 (0.00660001 + (0.154 * 2))
#define fil4 (0.00660001 + (0.154 * 3))
#define fil5 (0.00660001 + (0.154 * 4))
#define fil6 (0.00660001 + (0.154 * 5))
#define fil7 (0.00660001 + (0.154 * 6))
#define fil8 (0.00660001 + (0.154 * 7))
#define fil9 (0.00660001 + (0.154 * 8))
#define fil10 (0.00660001 + (0.154 * 9))





class centralica
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['centralica', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['centralica', nil]; ";
	
	class controls {

		class ica: RscStructuredText
		{
			idc = -1;

			text = "Centralica"; //--- ToDo: Localize;
			x = 0.462873 * safezoneW + safezoneX;
			y = 0.1634 * safezoneH + safezoneY;
			w = 0.0536249 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] = {1,1,1,0.2};
			colorBackground[] = {0,0,0,0};
		};
		class fondo: IGUIBack
		{
			idc = -1;

			x = 0.2525 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.5742 * safezoneH;
		};
		class fondoArr: IGUIBack
		{
			idc = -1;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.1854 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.0594 * safezoneH;
		};
		class txtMensajeDelDia: RscStructuredText
		{
			idc = 12000;

			text = "Mensaje de bienvenida."; //--- ToDo: Localize;
			x = 0.256625 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.450656 * safezoneW;
			h = 0.0462 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class fondoDer: IGUIBack
		{
			idc = 12006;

			x = 0.713473 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.143334 * safezoneW;
			h = 0.616 * safezoneH;
		};
		
		
		
		class cabeceraEditar: RscStructuredText
		{
			idc = 11996;

			text = "Editar:"; //--- ToDo: Localize;
			x = 0.71347 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.143341 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {1,1,1,1};
		};
		class boton: RscButton
		{
			idc = 12007;
			periodFocus = 0;
			periodOver = 0;
			period = 0;
			
			text = "UNIRSE"; //--- ToDo: Localize;
			x = 0.252499 * safezoneW + safezoneX;
			y = 0.824674 * safezoneH + safezoneY;
			w = 0.458906 * safezoneW;
			h = 0.0374 * safezoneH;
		};
		class entradaNombre: RscEdit
		{
			idc = 12004;

			colorBackground[] = {0,0,0,0.4};
			text = "Selecciona un grupo"; //--- ToDo: Localize;
			x = 0.716563 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.138186 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class selectorColor: RscCombo
		{
			idc = 12005;

			x = 0.715532 * safezoneW + safezoneX;
			y = 0.3262 * safezoneH + safezoneY;
			w = 0.0711659 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class botonAplicar: boton
		{
			idc = 11999;

			text = "APLICAR"; //--- ToDo: Localize;
			x = 0.789764 * safezoneW + safezoneX;
			y = 0.3262 * safezoneH + safezoneY;
			w = 0.0639371 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		
		
		
		class cabeceraEditarMensaje: RscStructuredText
		{
			idc = 12002;

			text = "Editar mensaje de bienvenida:"; //--- ToDo: Localize;
			x = 0.71347 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.143341 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {1,1,1,1};
		};
		class editMensaje: RscEdit
		{
			idc = 11997;
			style = 16;

			x = 0.71553 * safezoneW + safezoneX;
			y = 0.3944 * safezoneH + safezoneY;
			w = 0.138184 * safezoneW;
			h = 0.1232 * safezoneH;
		};
		class botonAplicar2: boton
		{
			idc = 11998;

			text = "APLICAR"; //--- ToDo: Localize;
			x = 0.753687 * safezoneW + safezoneX;
			y = 0.5198 * safezoneH + safezoneY;
			w = 0.0639371 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		
		class botonReset: boton
		{
			idc = 13999;

			text = "RESET GLOBAL"; //--- ToDo: Localize;
			x = 0.753672 * safezoneW + safezoneX;
			y = 0.551722 * safezoneH + safezoneY;
			w = 0.0639371 * safezoneW;
			h = 0.0286 * safezoneH;
		};		

		
		
		
		
		class cabeceraSinGrupo: RscStructuredText
		{
			idc = 11995;

			text = "Sin grupo:"; //--- ToDo: Localize;
			x = 0.71348 * safezoneW + safezoneX;
			y = 0.58125 * safezoneH + safezoneY;
			w = 0.143341 * safezoneW;
			h = 0.0219999 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {1,1,1,1};
		};
		class listaSinGrupo: RscListbox
		{
			idc = 12003;
			x = 0.717073 * safezoneW + safezoneX;
			y = 0.599494 * safezoneH + safezoneY;
			w = 0.13662 * safezoneW;
			h = 0.253906 * safezoneH;
		};


		
		
		
		class grp: life_RscControlsGroup
		{
			idc = 12008;

			x = 0.254563 * safezoneW + safezoneX;
			y = 0.2514 * safezoneH + safezoneY;
			w = 0.45478 * safezoneW;
			h = 0.5654 * safezoneH;
			class controls
			{
				
				// Fila 1
				
				class l1txt: RscStructuredText
				{
					idc = 12009;
					
					text = "1"; //--- ToDo: Localize;
					x = 0.00618749 * safezoneW;
					y = 0.00660001 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l1: RscListbox
				{
					idc = 12010;
					sizeEx = 0.043;
					rowHeight = 0.053;
					
					text = ""; //--- ToDo: Localize;
					x = 0.00618749 * safezoneW;
					y = 0.0286 * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;					
				};
				class l1b: RscButton
				{
					idc = 12011;
					
					x = 0.00618749 * safezoneW;
					y = 0.0374 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;

				};
				
				class l2txt: RscStructuredText
				{
					idc = 12012;

					text = "2"; //--- ToDo: Localize;
					x = 0.153658 * safezoneW;
					y = 0.00660001 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l2: RscListbox
				{
					idc = 12013;

					text = ""; //--- ToDo: Localize;
					x = 0.153658 * safezoneW;
					y = 0.0286 * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l2b: l1b
				{
					idc = 12014;

					x = 0.153658 * safezoneW;
					y = 0.0374 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};
				
				class l3txt: RscStructuredText
				{
					idc = 12015;

					text = "3"; //--- ToDo: Localize;
					x = 0.301125 * safezoneW;
					y = 0.00660001 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l3: RscListbox
				{
					idc = 12016;

					text = ""; //--- ToDo: Localize;
					x = 0.301125 * safezoneW;
					y = 0.0286 * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l3b: l1b
				{
					idc = 12017;

					x = 0.301125 * safezoneW;
					y = 0.0374 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};
				
				
				// Fila 2
				
				class l4txt: RscStructuredText
				{
					idc = 12018;

					text = "4"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil2 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l4: RscListbox
				{
					idc = 12019;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil2 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l4b: l1b
				{
					idc = 12020;

					x = col1 * safezoneW;
					y = fil2 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};
				
				
				// ------------------
				// Generadas a mano
				// ------------------
				
				
				class l5txt: RscStructuredText
				{
					idc = 12021;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil2 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l5: RscListbox
				{
					idc = 12022;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil2 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l5b: l1b
				{
					idc = 12023;

					x = col2 * safezoneW;
					y = fil2 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};
				
				class l6txt: RscStructuredText
				{
					idc = 12024;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil2 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l6: RscListbox
				{
					idc = 12025;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil2 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l6b: l1b
				{
					idc = 12026;

					x = col3 * safezoneW;
					y = fil2 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				// Fila 3
				
				class l7txt: RscStructuredText
				{
					idc = 12027;

					text = "5"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil3 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l7: RscListbox
				{
					idc = 12028;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil3 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l7b: l1b
				{
					idc = 12029;

					x = col1 * safezoneW;
					y = fil3 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l8txt: RscStructuredText
				{
					idc = 12030;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil3 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l8: RscListbox
				{
					idc = 12031;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil3 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l8b: l1b
				{
					idc = 12032;

					x = col2 * safezoneW;
					y = fil3 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l9txt: RscStructuredText
				{
					idc = 12033;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil3 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l9: RscListbox
				{
					idc = 12034;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil3 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l9b: l1b
				{
					idc = 12035;

					x = col3 * safezoneW;
					y = fil3 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};		


				// Fila 4
				
				class l10txt: RscStructuredText
				{
					idc = 12036;

					text = "5"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil4 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l10: RscListbox
				{
					idc = 12037;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil4 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l10b: l1b
				{
					idc = 12038;

					x = col1 * safezoneW;
					y = fil4 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l11txt: RscStructuredText
				{
					idc = 12039;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil4 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l11: RscListbox
				{
					idc = 12040;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil4 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l11b: l1b
				{
					idc = 12041;

					x = col2 * safezoneW;
					y = fil4 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l12txt: RscStructuredText
				{
					idc = 12042;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil4 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l12: RscListbox
				{
					idc = 12043;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil4 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l12b: l1b
				{
					idc = 12044;

					x = col3 * safezoneW;
					y = fil4 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	


				// Fila 5
				
				class l13txt: RscStructuredText
				{
					idc = 12045;

					text = "5"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil5 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l13: RscListbox
				{
					idc = 12046;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil5 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l13b: l1b
				{
					idc = 12047;

					x = col1 * safezoneW;
					y = fil5 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l14txt: RscStructuredText
				{
					idc = 12048;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil5 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l14: RscListbox
				{
					idc = 12049;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil5 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l14b: l1b
				{
					idc = 12050;

					x = col2 * safezoneW;
					y = fil5 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l15txt: RscStructuredText
				{
					idc = 12051;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil5 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l15: RscListbox
				{
					idc = 12052;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil5 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l15b: l1b
				{
					idc = 12053;

					x = col3 * safezoneW;
					y = fil5 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};					
				
				
				// Fila 6
				
				class l16txt: RscStructuredText
				{
					idc = 12054;

					text = "5"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil6 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l16: RscListbox
				{
					idc = 12055;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil6 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l16b: l1b
				{
					idc = 12056;

					x = col1 * safezoneW;
					y = fil6 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l17txt: RscStructuredText
				{
					idc = 12057;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil6 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l17: RscListbox
				{
					idc = 12058;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil6 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l17b: l1b
				{
					idc = 12059;

					x = col2 * safezoneW;
					y = fil6 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l18txt: RscStructuredText
				{
					idc = 12060;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil6 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l18: RscListbox
				{
					idc = 12061;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil6 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l18b: l1b
				{
					idc = 12062;

					x = col3 * safezoneW;
					y = fil6 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	
				
				
				
				// Fila 7
				
				class l19txt: RscStructuredText
				{
					idc = 12063;

					text = "5"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil7 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l19: RscListbox
				{
					idc = 12064;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil7 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l19b: l1b
				{
					idc = 12065;

					x = col1 * safezoneW;
					y = fil7 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l20txt: RscStructuredText
				{
					idc = 12066;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil7 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l20: RscListbox
				{
					idc = 12067;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil7 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l20b: l1b
				{
					idc = 12068;

					x = col2 * safezoneW;
					y = fil7 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l21txt: RscStructuredText
				{
					idc = 12069;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil7 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l21: RscListbox
				{
					idc = 12070;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil7 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l21b: l1b
				{
					idc = 12071;

					x = col3 * safezoneW;
					y = fil7 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	
				
				
				
				
				
				
				
				
				// Fila 8
				
				class l22txt: RscStructuredText
				{
					idc = 12072;

					text = "5"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil8 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l22: RscListbox
				{
					idc = 12073;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil8 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l22b: l1b
				{
					idc = 12074;

					x = col1 * safezoneW;
					y = fil8 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l23txt: RscStructuredText
				{
					idc = 12075;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil8 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l23: RscListbox
				{
					idc = 12076;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil8 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l23b: l1b
				{
					idc = 12077;

					x = col2 * safezoneW;
					y = fil8 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l24txt: RscStructuredText
				{
					idc = 12078;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil8 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l24: RscListbox
				{
					idc = 12079;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil8 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l24b: l1b
				{
					idc = 12080;

					x = col3 * safezoneW;
					y = fil8 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	







				// Fila 9
				
				class l25txt: RscStructuredText
				{
					idc = 12081;

					text = "5"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil9 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l25: RscListbox
				{
					idc = 12082;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil9 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l25b: l1b
				{
					idc = 12083;

					x = col1 * safezoneW;
					y = fil9 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l26txt: RscStructuredText
				{
					idc = 12084;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil9 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l26: RscListbox
				{
					idc = 12085;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil9 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l26b: l1b
				{
					idc = 12086;

					x = col2 * safezoneW;
					y = fil9 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l27txt: RscStructuredText
				{
					idc = 12087;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil9 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l27: RscListbox
				{
					idc = 12088;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil9 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l27b: l1b
				{
					idc = 12089;

					x = col3 * safezoneW;
					y = fil9 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};







				// Fila 10
				
				class l28txt: RscStructuredText
				{
					idc = 12090;

					text = "5"; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = fil10 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l28: RscListbox
				{
					idc = 12091;

					text = ""; //--- ToDo: Localize;
					x = col1 * safezoneW;
					y = (fil10 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l28b: l1b
				{
					idc = 12092;

					x = col1 * safezoneW;
					y = fil10 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l29txt: RscStructuredText
				{
					idc = 12093;

					text = "5"; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = fil10 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l29: RscListbox
				{
					idc = 12094;

					text = ""; //--- ToDo: Localize;
					x = col2 * safezoneW;
					y = (fil10 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l29b: l1b
				{
					idc = 12095;

					x = col2 * safezoneW;
					y = fil10 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};	

				class l30txt: RscStructuredText
				{
					idc = 12096;

					text = "5"; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = fil10 * safezoneH;
					w = 0.14437 * safezoneW;
					h = 0.022 * safezoneH;
					colorBackground[] = {0,0,0,1};
				};
				class l30: RscListbox
				{
					idc = 12097;

					text = ""; //--- ToDo: Localize;
					x = col3 * safezoneW;
					y = (fil10 + difY) * safezoneH;
					w = 0.144375 * safezoneW;
					h = 0.121 * safezoneH;
				};
				class l30b: l1b
				{
					idc = 12098;

					x = col3 * safezoneW;
					y = fil10 * safezoneH;
					w = 0.134057 * safezoneW;
					h = altoB * safezoneH;
					colorBackground[] = {0,0,0,0};
				};					
				
			};
		};

	};
};


