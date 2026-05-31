class tienda_vacia {
	idd = 101002;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['tienda_vacia', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['tienda_vacia', nil];";
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

			text = "\AxE\fondo_tiendavacia.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.027 * safezoneH + safezoneY;
			w = 0.489844 * safezoneW;
			h = 0.88 * safezoneH;
			colorText[] = {1,1,1,0.65};
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;

			text = "\AxE\ganancias_futuras.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1202;

			text = "\AxE\precio_compra.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class comprar_negocio: RscActivePicture
		{
			idc = 1203;
			onButtonClick = "[""comprar""] spawn ica_fnc_negocios";

			text = "\AxE\tienda_comprarnegocio.paa"; //--- ToDo: Localize;
			x = 0.571672 * safezoneW + safezoneX;
			y = 0.3801 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class textoGanancias: RscText
		{
			idc = 1204;
			text = "1000/2000 euros "; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class textoPrecio: RscText
		{
			idc = 1205;
			text = "125000 €"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};	

    };		
};

