class mafia_casa {
	idd = 101001;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['mafia_casa', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['mafia_casa', nil];";
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
	class controlsBackground {};
	class objects {};	
	
	class controls 
	{ 
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\AxE\fondo1.paa";
			colorText[] = {1,1,1,0.65};
			x = 0.128708 * safezoneW + safezoneX;
			y = -0.171 * safezoneH + safezoneY;
			w = 0.76321 * safezoneW;
			h = 1.331 * safezoneH;
		};
		class desterrar: RscActivePicture
		{
			idc = 1201;
			text = "\AxE\desterrar.paa"; //--- ToDo: Localize;
			x = 0.649548 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.11345 * safezoneW;
			h = 0.187 * safezoneH;
			onbuttonclick = "[""quitar""] call life_fnc_gangCasa";
		};
		class dar_llaves: RscActivePicture
		{
			idc = 1202;
			text = "\AxE\dar_llaves.paa"; //--- ToDo: Localize;
			x = 0.530941 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.11345 * safezoneW;
			h = 0.187 * safezoneH;
			onbuttonclick = "[""agregar""] call life_fnc_gangCasa";
		};
		class Miembros_Mafia: RscListbox
		{
			idc = 1500;
			x = 0.279605 * safezoneW + safezoneX;
			y = 0.507111 * safezoneH + safezoneY;
			w = 0.21143 * safezoneW;
			h = 0.231 * safezoneH;
			onLBSelChanged = "";
		};
		class textoMafia: RscText
		{
			idc = 1003;
			text = "ELN"; //--- ToDo: Localize;
			x = 0.320562 * safezoneW + safezoneX;
			y = 0.2778 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class textoBanco: RscText
		{
			idc = 1004;
			text = "3500 euros"; //--- ToDo: Localize;
			x = 0.321593 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};

    };		
};

