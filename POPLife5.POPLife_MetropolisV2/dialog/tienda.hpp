class tienda {
	idd = 101003;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['tienda', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['tienda', nil];";
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
	};
	class RscActivePicture
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
	////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Nicky Jam, v1.063, #Ropeci)
////////////////////////////////////////////////////////
class tienda_fondo: RscPicture
{
	idc = 1200;

	text = "\AxE\fondo_tienda.paa";
	x = 0.231875 * safezoneW + safezoneX;
	y = -0.028 * safezoneH + safezoneY;
	w = 0.531094 * safezoneW;
	h = 1.056 * safezoneH;
	colorText[] = {1,1,1,0.65};
};
class RscButton_1600: RscActivePicture
{
	idc = 1201;

	text = "\AxE\tienda_vendernegocia.paa"; //--- ToDo: Localize;
	x = 0.5825 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.209 * safezoneH;
	onButtonClick = "hint ""solo un abogado o juez puede inicar este proceso""";
};
class mercancia: RscActivePicture
{
	idc = 1202;

	text = "\AxE\mercancia.paa"; //--- ToDo: Localize;
	x = 0.422656 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.209 * safezoneH;
	onButtonClick = "[""mercancia""] spawn ica_fnc_negocios";
};
class retirarg: RscActivePicture
{
	idc = 1203;

	text = "\AxE\retirarg.paa"; //--- ToDo: Localize;
	x = 0.262812 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.209 * safezoneH;
	onButtonClick = "[""cobrar""] spawn ica_fnc_negocios";
};
class RscPicture_1201: RscPicture
{
	idc = 1204;

	text = "\AxE\ganancias_futuras.paa";
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.214 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.154 * safezoneH;
};
class RscPicture_1202: RscPicture
{
	idc = 1205;

	text = "\AxE\ganancias_actuales.paa";
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.214 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.154 * safezoneH;
};
class textoGanancias: RscText
{
	idc = 1206;
	text = "1150 euros"; //--- ToDo: Localize;
	x = 0.350469 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.044 * safezoneH;
};
class textoFuturas: RscText
{
	idc = 1207;
	text = "1000/2000 Aprox"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};		
};

