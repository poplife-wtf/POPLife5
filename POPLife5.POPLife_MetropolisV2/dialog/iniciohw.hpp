class pcpopi
{
	idd = 19700;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['pcpopi', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['pcpopi', nil]; ";
	class RscActivePicture
	{
		deletable = 0;
		fade = 0;
		color[] = {1,1,1,1};
		colorText[] = {1,1,1,1};
		colorActive[]= {0,0.714,0.082.6};
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
	class controls
		{
			class PortatilRscPicture_1001: RscPicture
			{
				idc = 1001;
				text = "\Heisenberg\fotos\pcinicio.paa";
				x = 0.113473 * safezoneW + safezoneX;
				y = -0.148723 * safezoneH + safezoneY;
				w = 0.778208 * safezoneW;
				h = 1.28645 * safezoneH;
			};
			class PortatilRscText_1002: RscText
			{
				idc = 1002;
				font = "TahomaB";
				text = "Nombre Jugador";
				x = 0.237000 * safezoneW + safezoneX;
				y = 0.31000 * safezoneH + safezoneY;
				w = 0.510000 * safezoneW;
				h = 0.0760000 * safezoneH;
				style = 2;
				shadow = 0;
				size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				sizeEx = "(                     (                       (                       ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 3)";
			};
			class PortatilRscActivePicture_1003: RscActivePicture
			{
				idc = 1003;
				text = "\Heisenberg\fotos\pcinicioboton.paa";
				x = 0.654611 * safezoneW + safezoneX;
				y = 0.434028 * safezoneH + safezoneY;
				w = 0.0927665 * safezoneW;
				h = 0.175925 * safezoneH;
				onButtonClick = "createdialog 'pcpopos'";
				action = "closedialog 0";
			};
			class PortatilRscButtonSilent_1004: RscButtonSilent
			{
				idc = 1004;
				text = ""; //--- ToDo: Localize;
				x = 0.227576 * safezoneW + safezoneX;
				y = 0.665589 * safezoneH + safezoneY;
				w = 0.0360759 * safezoneW;
				h = 0.0109953 * safezoneH;
				soundEnter[] ={"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
				soundPush[] ={"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
				soundClick[] ={"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
				soundEscape[] ={"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
				onButtonClick = "closedialog 0";
			};
		};
};

