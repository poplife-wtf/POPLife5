////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rosen, v1.063, #Qolufa)
////////////////////////////////////////////////////////

class mercarosen
{
	idd = 00015;
	name = "mercarosen";
	movingEnabled = false;
	enableSimulation = true;
	
	class CT_LISTBOX
	{
			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = CT_LISTBOX; // Control identification (without it, the control won't be displayed)
			type = CT_LISTBOX; // Type is 5
			style = ST_LEFT + LB_TEXTURES; // Style
			default = 0; // Control selected by default (only one within a display can be used)
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

			x = 1 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; // Horizontal coordinates
			y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; // Vertical coordinates
			w = 10 * GUI_GRID_CENTER_W; // Width
			h = 3 * GUI_GRID_CENTER_H; // Height

			colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
			colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color
			colorSelectBackground2[] = {0,0,0,1}; // Selected item fill color (oscillates between this and colorSelectBackground)

			sizeEx = GUI_GRID_CENTER_H; // Text size
			font = TahomaB; // Font from CfgFontFamilies
			shadow = 0; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
			colorText[] = {1,1,1,1}; // Text and frame color
			colorDisabled[] = {1,1,1,0.5}; // Disabled text color
			colorSelect[] = {1,1,1,1}; // Text selection color
			colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
			colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)

			pictureColor[] = {1,0.5,0,1}; // Picture color
			pictureColorSelect[] = {1,1,1,1}; // Selected picture color
			pictureColorDisabled[] = {1,1,1,0.5}; // Disabled picture color

			tooltip = "CT_LISTBOX"; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected

			rowHeight = 1.5 * GUI_GRID_CENTER_H; // Row height
			itemSpacing = 0; // Height of empty space between items
			maxHistoryDelay = 1; // Time since last keyboard type search to reset it
			canDrag = 1; // 1 (true) to allow item dragging

			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

			// Scrollbar configuration (applied only when LB_TEXTURES style is used)
			class ListScrollBar //In older games this class is "ScrollBar"
			{
				width = 0; // width of ListScrollBar
				height = 0; // height of ListScrollBar
				scrollSpeed = 0.01; // scroll speed of ListScrollBar

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};
	};
	class controls {
		class fondo: IGUIBack
		{
		idc = -1;
		x = 0.29375 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.4125 * safezoneW;
		h = 0.55 * safezoneH;
		};
		class botoncomprar: RscButton
		{
			idc = -1;
			text = "Comprar"; //--- ToDo: Localize;
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "if(comprando)then{[] spawn life_fnc_vAH_buy;}else{hint 'No seas ansias';};";
		};
		class Inventario: CT_LISTBOX
		{
			idc = 00016;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.264 * safezoneH;
			sizeEx = 0.02;
		};
		class mercado: CT_LISTBOX
		{
			idc = 00017;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.264 * safezoneH;
			sizeEx = 0.03;
		};
		class texto1: RscText
		{
			idc = -1;
			text = "Inventario"; //--- ToDo: Localize;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class texto2: RscText
		{
			idc = -1;
			text = "No todos los articulos pueden venderse por compatibilidad de Arma 3."; //--- ToDo: Localize;
			x = 0.30 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class botonvender: RscButton
		{
			idc = -1;
			text = "Vender"; //--- ToDo: Localize;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.731 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_vAH_sell;";
		};
		class buscar: RscEdit
		{
			idc = 00018;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class botonfiltrar: RscButton
		{
			idc = -1;
			text = "Filtrar"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "_search = ctrlText 00018;closeDialog 0;[_search] spawn life_fnc_vAH_load;";
		};
		class botonsalir: RscButton
		{
			idc = -1;
			text = "Salir"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class cantidad: RscEdit
		{
			idc = 00019;
			text = "1"; //--- ToDo: Localize;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class imagen: RscPicture
		{
			idc = -1;
			text = "rosen\mercarosen.jpg";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class listaart: CT_LISTBOX
		{
			idc = 00020;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.253 * safezoneH;
			onLBSelChanged = "_this spawn life_fnc_vAH_select";
			sizeEx = 0.02;
		};
		class enventa: RscText
		{
			idc = -1;
			text = "Mis articulos"; //--- ToDo: Localize;
			x = 0.726875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class botondevolver: RscButton
		{
			idc = -1;
			text = "Devolver articulo"; //--- ToDo: Localize;
			x = 0.711407 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "[] spawn life_fnc_vAH_takeBack;";
		};
		class prec: RscEdit
		{
			idc = 00021;
			text = "50"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class precio: RscText
		{
			idc = -1;
			text = "Precio"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
