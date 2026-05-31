////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rosen, v1.063, #Woxaka)
////////////////////////////////////////////////////////
class carrera_ilegal
{
	idd = 15100;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {dialog}; ctrlShow[15103, false]};";
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
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class listbox: CT_LISTBOX
		{
			idc = 15101;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.198 * safezoneH;
			sizeEx = 0.03;
		};
		class imagen: RscPicture
		{
			idc = -1;
			text = "rosen\carrera.jpg";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class esc: RscButton
		{
			idc = -1;
			text = "Salir"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class boton1: RscButton
		{
			idc = 15102;
			text = "Agregar corredores"; //--- ToDo: Localize;
			onButtonClick = "if(lbCurSel 15101 == -1) exitWith {hint 'Seleccione corredores';}; _unit = lbData[15101,(lbCurSel 15101)]; _unit = call compile format['%1',_unit]; if(_unit in life_racers || vehicle _unit == _unit) exitWith {}; life_racers pushBack _unit; ctrlShow[15103,true]; _out = ''; {_toAdd = name _x + ' '; _out = _out + _toAdd} forEach life_racers;";//hint format['Corredores: %1',_out];";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class texto: RscText
		{
			idc = -1;
			text = "Jugadores cercanos"; //--- ToDo: Localize;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class boton2: RscButton
		{
			idc = 15103;
			text = "Retar"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_duelRequest;";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};	
					 
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
