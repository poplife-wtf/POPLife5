class eventojuan 
{
	idd = 19997;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['evento_juan', _this select 0];";
	class controlsBackground {};
	class objects {};
	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Gasadu)
		////////////////////////////////////////////////////////

		class RscPicture_1200: RscPicture
		{
			moving = 1;
			idc = 1200;
			text = "\AxE\paneleventos.paa";
			x = 0.298904 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.484 * safezoneH;
		};
		class ON: CajeroRscButton
		{
			action = ["A", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1600;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	
		};
		class OFF: CajeroRscButton
		{
			action = ["B", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1601;
			x = 0.620104 * safezoneW + safezoneX;
			y = 0.386296 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0477037 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class FL1: CajeroRscButton
		{
			action = ["C", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1602;
			x = 0.619583 * safezoneW + safezoneX;
			y = 0.445815 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0495555 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class FL2: CajeroRscButton
		{
			action = ["D"] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1603;
			x = 0.620833 * safezoneW + safezoneX;
			y = 0.504629 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0495555 * safezoneH;
		};
		class Musica: CajeroRscButton
		{
			action = ["E", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1604;
			x = 0.619792 * safezoneW + safezoneX;
			y = 0.564815 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0495555 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class AUTO: CajeroRscButton
		{
			action = ["F", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1605;
			x = 0.619792 * safezoneW + safezoneX;
			y = 0.626852 * safezoneH + safezoneY;
			w = 0.0490105 * safezoneW;
			h = 0.0495555 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class SMK: CajeroRscButton
		{
			action = ["G", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1606;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class FKS1: CajeroRscButton
		{
			action = ["H", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1607;
			x = 0.33125 * safezoneW + safezoneX;
			y = 0.383334 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class FKS2: CajeroRscButton
		{
			action = ["I", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1608;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class FKS3: CajeroRscButton
		{
			action = ["J", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1609;
			x = 0.329687 * safezoneW + safezoneX;
			y = 0.50463 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class FKSCLK: CajeroRscButton
		{
			action = ["K", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1610;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class EMGSTOP: CajeroRscButton
		{
			action = ["L", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 1611;
			x = 0.329687 * safezoneW + safezoneX;
			y = 0.623148 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.055 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,0,0,1)";
			x = 0.437604 * safezoneW + safezoneX;
			y = 0.640222 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,0,0,1)";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.640222 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscPicture_1203: RscPicture
		{
			idc = 1203;
			text = "#(argb,8,8,3)color(1,0,0,1)";
			x = 0.510417 * safezoneW + safezoneX;
			y = 0.639815 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscPicture_1204: RscPicture
		{
			idc = 1204;
			text = "#(argb,8,8,3)color(1,0,0,1)";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.640222 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscPicture_1205: RscPicture
		{
			idc = 1205;
			text = "#(argb,8,8,3)color(1,0,0,1)";
			x = 0.590625 * safezoneW + safezoneX;
			y = 0.639815 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		/*
		class Intensidad: RscSlider
		{
			idc = 18412;
			x = 0.420104 * safezoneW + safezoneX;
			y = 0.313926 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		*/
		
		class masveloc: CajeroRscButton
		{
			action = ["N", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 12412;
			text = "-";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0154689 * safezoneW;
			h = 0.033 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		
		class menosveloc: CajeroRscButton
		{
			action = ["O", (name player)] remoteExec ["ica_fnc_eventojuan", -2]; 
			idc = 12413;
			text = "+";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.033 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		
		class velocidad: RscText
		{
			idc = 12414;
			text = "";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",	0.09,1};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};