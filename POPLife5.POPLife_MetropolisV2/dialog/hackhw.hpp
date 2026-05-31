class pcpophackhw
{
	idd = 19900;
	movingenable = true;
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
				text = "\Heisenberg\fotos\pchack.paa";
				x = 0.113473 * safezoneW + safezoneX;
				y = -0.148723 * safezoneH + safezoneY;
				w = 0.778208 * safezoneW;
				h = 1.28645 * safezoneH;
			};
			class HackRscButtonSilent_3002: RscButtonSilent
			{
				idc = 3002;
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
			class HackRscEditeco_3003: RscEditeco
			{
				idc = 3003;
				x = 0.463924 * safezoneW + safezoneX;
				y = 0.467014 * safezoneH + safezoneY;
				w = 0.128842 * safezoneW;
				h = 0.0329859 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorDisabled[] = {0,0,0,0};
				colorText[] = {0,0.714,0.082,1};
				tooltipColorBox[] = {0,0,0,0};
				colorSelection[] = {0,0,0,0};
				tooltipColorShade[] = {0,0,0,0.65};
				tooltipColorText[] = {0,0,0,0};
				font = "LucidaConsoleB";
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
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
			class HackRscButtonSilent_3005: RscButtonSilent
			{
				idc = 3005;
				text = ""; //--- ToDo: Localize;
				x = 0.747409 * safezoneW + safezoneX;
				y = 0.769676 * safezoneH + safezoneY;
				w = 0.0315586 * safezoneW;
				h = 0.0413782 * safezoneH;
				soundEnter[] ={"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
				soundPush[] ={"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
				soundClick[] ={"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
				soundEscape[] ={"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
				onButtonClick = "['portatil'] spawn ica_fnc_robo";
			};
			class HackRscButtonSilent_3006: RscButtonSilent
			{
				idc = 3006;
				text = ""; //--- ToDo: Localize;
				x = 0.605342 * safezoneW + safezoneX;
				y = 0.748934 * safezoneH + safezoneY;
				w = 0.0485466 * safezoneW;
				h = 0.0167846 * safezoneH;
				soundEnter[] ={"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
				soundPush[] ={"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
				soundClick[] ={"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
				soundEscape[] ={"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
				onButtonClick = "['portatil'] spawn ica_fnc_robo";
			};
		};
};

