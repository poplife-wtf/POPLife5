class granjapop
{
	idd = 101006;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['granjapop', _this select 0]; abierto = true; ";
	onUnLoad = "uiNamespace setVariable ['granjapop', nil]; abierto = nil;";
	class RscText
	{
		deletable = 0;
		fade = 0;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,1};
		access = 0;
		type = 0;
		idc = -1;
		text = "";
		fixedWidth = 0;
		colorShadow[] = {0,0,0,0.5};
		tooltipColorText[] = {1,1,1,1};
		tooltipColorBox[] = {1,1,1,1};
		tooltipColorShade[] = {0,0,0,0.65};
		x = 0;
		y = 0;
		h = 0.037;
		w = 0.3;
		style = 0;
		shadow = 1;
		font = "puristaMedium";
		SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		linespacing = 1;
	};
	class RscButton
	{
		deletable = 0;
		fade = 0;
		colorText[] = {1,1,1,1};
		colorActive[]= {1, 1, 1, 0.2};
		colorDisabled[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorBackgroundDisabled[] = {0,0,0,0};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
		soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
		soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
		soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
		soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		period = 1.2;
		periodFocus = 1.2;
		periodOver = 1.2;
		access = 0;
		borderSize = 0;
		font = "PuristaMedium";
		h = 0.039216;
		offsetPressedX = 0.002;
		offsetPressedY = 0.002;
		offsetX = 0.003;
		offsetY = 0.003;
		shadow = 2;
		sizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		style = 2;
		text = "";
		type = 1;
		w = 0.095589;
		x = 0;
		y = 0;
	};
	class RscPicture
	{
		deletable = 0;
		fade = 0;
		colorBackground[] = { 0, 0, 0, 1};
		colorText[] = { 1, 1, 1, 1};
		access = 0;
		type = 0;
		idc = -1;
		style = 48;
		font = "TahomaB";
		sizeEx = 0;
		lineSpacing = 0;
		text = "";
		fixedWidth = 0;
		tooltipColorText[] = { 1, 1, 1, 1};
		tooltipColorBox[] = { 1, 1, 1, 1};
		tooltipColorShade[] = { 0, 0, 0, 0.65};
		shadow = 0;
		x = 0;
		y = 0;
		w = 0.2;
		h = 0.15;
	};class RscActivePicture
	{
		deletable = 0;
		fade = 0;
		color[] = {1,1,1,1};
		colorText[] = {1,1,1,1};
		colorActive[]= {1,0.569,0.569,0.2};
		colorDisabled[] = {1,1,1,1};
		soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
		soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
		soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
		soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		access = 0;
		type = 11;
		idc = -1;
		style = 48;
		font = "TahomaB";
		sizeEx = 0;
		lineSpacing = 0;
		text = "";
		fixedWidth = 0;
		shadow = 2;
		x = 0;
		y = 0;
		w = 0.2;
		h = 0.15;
		default = true;
	};
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by JC, v1.063, #Wofeju)
		////////////////////////////////////////////////////////

		class GranjaRscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\AxE\granja.paa";
			x = 0.134161 * safezoneW + safezoneX;
			y = -0.115737 * safezoneH + safezoneY;
			w = 0.757441 * safezoneW;
			h = 1.11053 * safezoneH;
		};
		class GranjaRscActivePicture_1201: RscActivePicture
		{
			idc = 1201;
			text = "\AxE\botonavicola.paa";
			x = 0.402099 * safezoneW + safezoneX;
			y = 0.642939 * safezoneH + safezoneY;
			w = 0.0927478 * safezoneW;
			h = 0.175925 * safezoneH;
			tooltip = "Seleccionar trabajo avicola";
			onButtonClick = "[""menu"",([""pollo"",""pollo1""] call BIS_fnc_selectRandom)] spawn ica_fnc_granjas";
		};
		class GranjaRscActivePicture_1202: RscActivePicture
		{
			idc = 1202;
			text = "\AxE\botonhierbas.paa";
			x = 0.525763 * safezoneW + safezoneX;
			y = 0.643934 * safezoneH + safezoneY;
			w = 0.0979005 * safezoneW;
			h = 0.18692 * safezoneH;
			tooltip = "Seleccionar trabajo Hierbas";
			onButtonClick = "[""menu"",""malah""] spawn ica_fnc_granjas";
		};
		class GranjaRscActivePicture_1203: RscActivePicture
		{
			idc = 1203;
			text = "\AxE\botonmanzanas.paa";
			x = 0.396947 * safezoneW + safezoneX;
			y = 0.818864 * safezoneH + safezoneY;
			w = 0.0979005 * safezoneW;
			h = 0.175925 * safezoneH;
			tooltip = "Seleccionar trabajo Tierra";
			onButtonClick = "[""menu"",""manzanas""] spawn ica_fnc_granjas";
		};
		class GranjaRscPicture_1204: RscActivePicture
		{
			idc = 1204;
			text = "\AxE\botonanimales.paa";
			x = 0.525000 * safezoneW + safezoneX;
			y = 0.810000 * safezoneH + safezoneY;
			w = 0.0979005 * safezoneW;
			h = 0.175925 * safezoneH;			
			onButtonClick = "[""menu"",""animales""] spawn ica_fnc_granjas";
		};
		class GranjaRscButton_2404: RscButton
		{
			idc = 2404;
			text = ""; //--- ToDo: Localize;
			x = 0.783396 * safezoneW + safezoneX;
			y = 0.939813 * safezoneH + safezoneY;
			w = 0.0669846 * safezoneW;
			h = 0.0329859 * safezoneH;
			action = "closedialog 0";
			onButtonClick = "";
		};
		class GranjaRscText_2405: RscText
		{
			idc = 2405;
			text = "Dinero"; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.3416 * safezoneH + safezoneY;
			w = 0.0875952 * safezoneW;
			h = 0.0329859 * safezoneH;
			colorText[] = {0,0.859,0.043,1};
		};
		class GranjaRscText_2406: RscText
		{
			idc = 2406;
			text = "Nivel"; //--- ToDo: Localize;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.3438 * safezoneH + safezoneY;
			w = 0.0875952 * safezoneW;
			h = 0.0329859 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class GranjaRscText_2407: RscText
		{
			idc = 2407;
			text = "Proximo pago"; //--- ToDo: Localize;
			x = 0.414404 * safezoneW + safezoneX;
			y = 0.5396 * safezoneH + safezoneY;
			w = 0.087595 * safezoneW;
			h = 0.0329859 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class GranjaRscText_2408: RscText
		{
			idc = 2408;
			text = "Trabajo selecionado"; //--- ToDo: Localize;
			x = 0.573218 * safezoneW + safezoneX;
			y = 0.5396 * safezoneH + safezoneY;
			w = 0.0875952 * safezoneW;
			h = 0.0329859 * safezoneH;
			colorText[] = {0,0,0,1};
		};
		class GranjaRscButton_2410: RscButton
		{
			idc = 2410;
			text = "";
			x = 0.407252 * safezoneW + safezoneX;
			y = 0.423033 * safezoneH + safezoneY;
			w = 0.216412 * safezoneW;
			h = 0.0879625 * safezoneH;
			onButtonClick = "[""menu"",""aplicar""] spawn ica_fnc_granjas";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

