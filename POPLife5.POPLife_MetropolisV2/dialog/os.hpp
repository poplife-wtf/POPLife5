class pcpopos
{
	idd = 19800;
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
			class PcOsRscPicture_2001: RscPicture
			{
				idc = 2001;
				text = "\Heisenberg\fotos\pcos.paa";
				x = 0.113473 * safezoneW + safezoneX;
				y = -0.148723 * safezoneH + safezoneY;
				w = 0.778208 * safezoneW;
				h = 1.28645 * safezoneH;
			};
			class PcOsRscActivePicture_2002: RscActivePicture
			{
				idc = 2002;
				text = "\Heisenberg\fotos\pcosdeepweb.paa"; //--- ToDo: Localize;
				type = 11;
				x = 0.246954 * safezoneW + safezoneX;
				y = 0.103949 * safezoneH + safezoneY;
				w = 0.108 * safezoneW;
				h = 0.197 * safezoneH;
				onButtonClick = "createdialog 'pcpopdeepwebsesion'";
				action = "closedialog 0";
			};
			class PcOsRscActivePicture_2003: RscActivePicture
			{
				idc = 2003;
				text = "\Heisenberg\fotos\pcoscamaras.paa"; //--- ToDo: Localize;
				type = 11;
				x = 0.466629 * safezoneW + safezoneX;
				y = 0.146848 * safezoneH + safezoneY;
				w = 0.103074 * safezoneW;
				h = 0.208911 * safezoneH;
				onButtonClick = "createdialog 'pcpopcamaras'";
				action = "closedialog 0";
			};
			class PcOsRscActivePicture_2004: RscActivePicture
			{
				idc = 2004;
				text = "\Heisenberg\fotos\pcosbug.paa"; //--- ToDo: Localize;
				type = 11;
				x = 0.358814 * safezoneW + safezoneX;
				y = 0.102866 * safezoneH + safezoneY;
				w = 0.103074 * safezoneW;
				h = 0.197916 * safezoneH;
				onButtonClick = "createdialog 'pcpopbug'";
				action = "closedialog 0";
			};
			class PcOsRscActivePicture_2005: RscActivePicture
			{
				idc = 2005;
				text = "\Heisenberg\fotos\pcostransportes.paa"; //--- ToDo: Localize;
				type = 11;
				x = 0.577305 * safezoneW + safezoneX;
				y = 0.0931735 * safezoneH + safezoneY;
				w = 0.103074 * safezoneW;
				h = 0.208911 * safezoneH;
				onButtonClick = "createdialog 'pcpoptransportes';['menu1'] spawn ica_fnc_axeTrans";
				action = "closedialog 0";
			};
			class PcOsRscButtonSilent_2010: RscButtonSilent
			{
				idc = 2010;
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
		class PcOsRscButtonSilent_3002: RscButtonSilent
			{
				idc = 2010;
				text = ""; //--- ToDo: Localize;
				x = 0.608228 * safezoneW + safezoneX;
				y = 0.709791 * safezoneH + safezoneY;
				w = 0.0390345 * safezoneW;
				h = 0.0172323 * safezoneH;
				soundEnter[] ={"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
				soundPush[] ={"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
				soundClick[] ={"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
				soundEscape[] ={"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
				onButtonClick = "closedialog 0";
			};
		};
};

