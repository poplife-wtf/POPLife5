class pcpopbug
{
	idd = 20000;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['pcpopbug', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['pcpopbug', nil]; ";
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
	class controls
		{
			class HackRscPicture_3001: RscPicture
			{
				idc = 3001;
				text = "\Heisenberg\fotos\pcbug.paa";
				x = 0.113473 * safezoneW + safezoneX;
				y = -0.148723 * safezoneH + safezoneY;
				w = 0.778208 * safezoneW;
				h = 1.28645 * safezoneH;
			};
			class PcBugRscActivePicture_3002: RscActivePicture
			{
				idc = 3002;
				text = "\Heisenberg\fotos\pcbugenvio.paa"; //--- ToDo: Localize;
				type = 11;
				colorActive[]= {0.467,0.984,0.525,0.5};
				x = 0.551537 * safezoneW + safezoneX;
				y = 0.346066 * safezoneH + safezoneY;
				w = 0.206148 * safezoneW;
				h = 0.274883 * safezoneH;
				onButtonClick = "[] call ica_fnc_bug";
				action = "closedialog 0";
			};
			class HackRscButtonSilent_3003: RscButtonSilent
			{
				idc = 3003;
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
			class HackRscActivePicture_3004: RscActivePicture
			{
				idc = 3004;
				text = "\Heisenberg\fotos\vacio.paa"; //--- ToDo: Localize;
				type = 11;
				x = 0.608228 * safezoneW + safezoneX;
				y = 0.709791 * safezoneH + safezoneY;
				w = 0.0390345 * safezoneW;
				h = 0.0172323 * safezoneH;
				onButtonClick = "createdialog 'pcpopos'";
				action = "closedialog 0";
			};
			class HackRscEditeco_3005: RscEditeco
			{
				idc = 3005;
				x = 0.248201 * safezoneW + safezoneX;
				y = 0.242621 * safezoneH + safezoneY;
				w = 0.278331 * safezoneW;
				h = 0.302663 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorDisabled[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				tooltipColorBox[] = {0,0,0,0};
				colorSelection[] = {0,0,0,0};
				tooltipColorShade[] = {0,0,0,0.65};
				tooltipColorText[] = {0,0,0,0};
				font = "LucidaConsoleB";
				style = 0x08 + 0x40;
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			};
		};
};
