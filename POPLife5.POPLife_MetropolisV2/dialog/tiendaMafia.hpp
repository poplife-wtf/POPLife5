class tiendaMafia {
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['tiendaMafia', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['tiendaMafia', nil]; cosa = nil; precio = nil; ";
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
	};
	class RscActivePicture
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
	class controlsBackground {};
	class objects {};
	class controls 
	{ 
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Nicky Jam, v1.063, #Wubefe)
////////////////////////////////////////////////////////

	class fondo: RscPicture
{
	idc = 5005;
	text = "\AxE\fondomafia_sinboton.paa";
	colorText[] = {1,1,1,0.85};
	x = 0.139022 * safezoneW + safezoneX;
	y = -0.292 * safezoneH + safezoneY;
	w = 0.752897 * safezoneW;
	h = 1.661 * safezoneH;
};
	class RscEdit_1400: RscEdit
{
	idc = 1400;
	colorBackground[] = { 0, 0, 0, 0.2};
	x = 0.398102 * safezoneW + safezoneX;
	y = 0.734444 * safezoneH + safezoneY;
	w = 0.0257841 * safezoneW;
	h = 0.033 * safezoneH;
};
	class RscListbox_1500: RscListbox
{
	idc = 5007;
	x = 0.269157 * safezoneW + safezoneX;
	y = 0.248889 * safezoneH + safezoneY;
	w = 0.192061 * safezoneW;
	h = 0.477333 * safezoneH;
	onLBSelChanged = "['actualiza'] call ica_fnc_tiendaMafia";	
};
	class boton_compra: RscActivePicture
{
	idc = 5006;
	text = "\AxE\botonmafia_compra.paa";
	x = 0.464406 * safezoneW + safezoneX;
	y = 0.274778 * safezoneH + safezoneY;
	w = 0.134078 * safezoneW;
	h = 0.209 * safezoneH;
	onbuttonclick = "";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


    };		
};

