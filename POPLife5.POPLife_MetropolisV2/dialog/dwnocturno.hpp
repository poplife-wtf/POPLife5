class pcpopdwnocturno
{
	idd = 20000;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['dw', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['dw', nil]; ";
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
			class PcOsRscPicture_2501: RscPicture
			{
				idc = 2501;
				text = "\Heisenberg\fotos\pcos.paa";
				x = 0.113473 * safezoneW + safezoneX;
				y = -0.148723 * safezoneH + safezoneY;
				w = 0.778208 * safezoneW;
				h = 1.28645 * safezoneH;
			};
			class PcOsRscPicture_2502: RscPicture
			{
				idc = 2502;
				text = "\Heisenberg\fotos\pcosdeepweb.paa"; //--- ToDo: Localize;
				x = 0.247000 * safezoneW + safezoneX;
				y = 0.104000 * safezoneH + safezoneY;
				w = 0.108000 * safezoneW;
				h = 0.197000 * safezoneH;
			};
			class PcOsRscPicture_2503: RscPicture
			{
				idc = 2503;
				text = "\Heisenberg\fotos\pcoscamaras.paa"; //--- ToDo: Localize;
				x = 0.347000 * safezoneW + safezoneX;
				y = 0.115000 * safezoneH + safezoneY;
				w = 0.108 * safezoneW;
				h = 0.197 * safezoneH;
			};
			class PcOsRscPicture_2504: RscPicture
			{
				idc = 2504;
				text = "\Heisenberg\fotos\pcosbug.paa"; //--- ToDo: Localize;
				x = 0.447000 * safezoneW + safezoneX;
				y = 0.104000 * safezoneH + safezoneY;
				w = 0.0927665 * safezoneW;
				h = 0.175925 * safezoneH;
			};
			class DeepWebRscPicture_2505: RscPicture
			{
				idc = 2505;
				text = "\Heisenberg\fotos\pcdeepweb.paa";
				x = 0.283545 * safezoneW + safezoneX;
				y = -0.00578426 * safezoneH + safezoneY;
				w = 0.438064 * safezoneW;
				h = 0.681709 * safezoneH;
			};
			class HackRscEditeco_2506: RscEditeco
			{
				idc = 2506;
				x = 0.298284 * safezoneW + safezoneX;
				y = 0.450741 * safezoneH + safezoneY;
				w = 0.193423 * safezoneW;
				h = 0.0380567 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorDisabled[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				tooltipColorBox[] = {0,0,0,0};
				colorSelection[] = {0,0,0,0};
				tooltipColorShade[] = {0,0,0,0.65};
				tooltipColorText[] = {0,0,0,0};
				font = "PuristaLight";
				style = 0x08 + 0x40;
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			};
			class DeepWebRscActivePicture_2507: RscActivePicture
			{
				idc = 2507;
				text = "\Heisenberg\fotos\pcdeepwebdn.paa";
				type = 11;
				x = 0.685533 * safezoneW + safezoneX;
				y = 0.5 * safezoneH + safezoneY;
				w = 0.0206148 * safezoneW;
				h = 0.0329859 * safezoneH;
				onButtonClick = "createdialog 'pcpopdwdiurno';['relleno'] call ica_fnc_portatil";
				action = "closedialog 0";
			};
			class RscListbox_2508: RscListbox
			{
				idc = 2508;
				x = 0.503608 * safezoneW + safezoneX;
				y = 0.198069 * safezoneH + safezoneY;
				w = 0.197082 * safezoneW;
				h = 0.293157 * safezoneH;
			};
			class CamarasRscButtonSilent_3002: RscButtonSilent
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
			class CamarasRscActivePicture_3004: RscActivePicture
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
				onButtonClick = "_nil = ['verifica', ctrlText 2506, (lbData [2508, lbCurSel 2508])] spawn ica_fnc_portatil";
			};
		};
};