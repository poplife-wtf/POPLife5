#define X_MOD 60 // this needs to be adjusted if an aspect ratio other than 16:9 is used, as I am dialog-retarded.  
#define Y_MOD 10
#define SLIDER_START -19
#define SLIDER_INTERVAL 4
#define SLIDER_TITLE_SPACE 1.3

class dsl_gear_dialog
{
	idd = 10568; 
	movingEnable = 1; 
	enableSimulation = 1;
	enableDisplay = 1; 
	
	onLoad = "dsl_gear_dialog = _this; disableSerialization"; 
	onunLoad = "dsl_ShowingSelfCam = false"; 

	class controls 
	{


		class RscSlider_1900: dsl_Slider
		{
			idc = 1900;

			x = 0.650047 * safezoneW + safezoneX;
			y = 0.0578 * safezoneH + safezoneY;
			w = 0.333333 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscSlider_1901: dsl_Slider
		{
			idc = 1901;

			x = 0.650047 * safezoneW + safezoneX;
			y = 0.12908 * safezoneH + safezoneY;
			w = 0.333333 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscSlider_1902: dsl_Slider
		{
			idc = 1902;

			x = 0.650047 * safezoneW + safezoneX;
			y = 0.20058 * safezoneH + safezoneY;
			w = 0.333333 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscSlider_1903: dsl_Slider
		{
			idc = 1903;

			x = 0.650047 * safezoneW + safezoneX;
			y = 0.27208 * safezoneH + safezoneY;
			w = 0.333333 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscSlider_1904: dsl_Slider
		{
			idc = 1904;

			x = 0.650047 * safezoneW + safezoneX;
			y = 0.34336 * safezoneH + safezoneY;
			w = 0.333333 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscSlider_1905: dsl_Slider
		{
			idc = 1905;

			x = 0.650047 * safezoneW + safezoneX;
			y = 0.41486 * safezoneH + safezoneY;
			w = 0.333333 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscSlider_1907: dsl_Slider
		{
			idc = 1907;

			x = 0.650047 * safezoneW + safezoneX;
			y = 0.49164 * safezoneH + safezoneY;
			w = 0.333333 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscSlider_1913: dsl_Slider
		{
			idc = 1913;

			x = 0.650047 * safezoneW + safezoneX;
			y = 0.57172 * safezoneH + safezoneY;
			w = 0.333333 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;

			text = "Cascos y Misc"; //--- ToDo: Localize;
			x = 0.650047 * safezoneW + safezoneX;
			y = 0.0358 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscText_1000: RscText
		{
			idc = 1000;

			text = "Chalecos"; //--- ToDo: Localize;
			x = 0.650047 * safezoneW + safezoneX;
			y = 0.10708 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;

			text = "Uniforme"; //--- ToDo: Localize;
			x = 0.650047 * safezoneW + safezoneX;
			y = 0.17858 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1003;

			text = "Mochila"; //--- ToDo: Localize;
			x = 0.650047 * safezoneW + safezoneX;
			y = 0.25008 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscText_1004: RscText
		{
			idc = 1004;

			text = "Armas Pesadas"; //--- ToDo: Localize;
			x = 0.650047 * safezoneW + safezoneX;
			y = 0.32136 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscText_1005: RscText
		{
			idc = 1005;

			text = "Mirillas"; //--- ToDo: Localize;
			x = 0.650047 * safezoneW + safezoneX;
			y = 0.39286 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscText_1007: RscText
		{
			idc = 1007;

			text = "Pistolas"; //--- ToDo: Localize;
			x = 0.650047 * safezoneW + safezoneX;
			y = 0.47404 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscText_1013: RscText
		{
			idc = 1013;

			text = "Gafas y Misc"; //--- ToDo: Localize;
			x = 0.650047 * safezoneW + safezoneX;
			y = 0.55192 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 0.0249999 * safezoneH;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\AxE\gnpygc.paa";
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "\AxE\fondoadmin2.paa";
			x = 0.0823437 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.407 * safezoneH;
		};
	};
};