class experiencia {
	idd = -1;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['experiencia', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['experiencia', nil]; ";
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
		font = "EtelkaNarrowMediumPro";
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
		font = "EtelkaNarrowMediumPro";
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
		colorActive[]= {1,0.569,0.569,0.5};
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
	class RscListBoxExp 
	{
		style = 16;
		idc = -1;	
		type = 5;	
		h = 0.5;
		w = 0.5;
		font = "EtelkaNarrowMediumPro";	
		colorSelect[] = {1, 1, 1, 1};
		colorSelectBackground[] = {0.95,0.95,0.95,1};
		colorSelect2[] = {0,0,0,1};
		colorSelectBackground2[] = {1,1,1,0.5};		
		wholeHeight = 0.7;
		rowHeight = 0.08;		
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		color[] = {0.7, 0.7, 0.7, 1};
		colorActive[] = {0,0,0,1};		
		colorDisabled[] = {1,1,1,0.25};
		sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 23) * 1)";	
		soundSelect[] = {"\A3\ui_f\data\sound\RscListBox\soundSelect",0.09,1};	
		soundExpand[] = {"",0.1,1};
		soundCollapse[] = {"",0.1,1};	
		maxHistoryDelay = 1;	
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		tooltipColorText[] = {1,1,1,1};
		tooltipColorBox[] = {1,1,1,1};
		tooltipColorShade[] = {0,0,0,0.65};	
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.3};
		colorScrollbar[] = {1,0,0,0};
		colorPicture[] = {1,1,1,1};
		colorPictureSelected[] = {1,1,1,1};
		colorPictureDisabled[] = {1,1,1,1};
		colorShadow[] = {0,0,0,0.5};
		access = 0;
		
		period = 1.2;
		shadow = 0;

		class ListScrollBar : ScrollBar {
			color[] = {1, 1, 1, 1};
			autoScrollEnabled = 1;
		};
	};	

	class controlsBackground {};
	class objects {};
	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Nicky Jam, v1.063, #Zyliku)
		////////////////////////////////////////////////////////

		class fondo: RscPicture
		{
			idc = 1200;
			text = "axex\fondou.paa";
			colorText[] = {1,1,1,0.9};
			x = 0.228302 * safezoneW + safezoneX;
			y = 0.0253335 * safezoneH + safezoneY;
			w = 0.548113 * safezoneW;
			h = 0.84 * safezoneH;
		};
		class listaRamas: RscListBoxExp
		{
			idc = 6043;
			x = 0.266667 * safezoneW + safezoneX;
			y = 0.145333 * safezoneH + safezoneY;
			w = 0.130818 * safezoneW;
			h = 0.605555 * safezoneH;
		};
		class listaHab: RscListBoxExp
		{
			idc = 6044;
			x = 0.43522 * safezoneW + safezoneX;
			y = 0.146667 * safezoneH + safezoneY;
			w = 0.133334 * safezoneW;
			h = 0.602222 * safezoneH;
		};
		class informacion: RscStructuredText
		{
			idc = 6045;
			x = 0.60629 * safezoneW + safezoneX;
			y = 0.142223 * safezoneH + safezoneY;
			w = 0.131447 * safezoneW;
			h = 0.61 * safezoneH;
		};
		class aprender: RscActivePicture
		{
			idc = 6048;
			text = "axex\aprender1.paa";
			x = 0.420755 * safezoneW + safezoneX;
			y = 0.794 * safezoneH + safezoneY;
			w = 0.171698 * safezoneW;
			h = 0.182 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



    };		
};

