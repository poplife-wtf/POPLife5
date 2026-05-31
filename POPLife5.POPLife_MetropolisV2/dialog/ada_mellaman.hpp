class ada_mellaman 
{
	idd = 12542;
	duration = 999;
	onLoad = "uiNamespace setVariable ['ada_mellaman', _this select 0];";
	onunLoad = "uiNamespace setVariable ['ada_mellaman', nil]";
	class controls {
		class FONDO: RscPicture
		{
			moving = 1;
			idc = 100;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class FONDO_PANTALLA: RscPicture
		{
			idc = 101;
			x = 0.420103 * safezoneW + safezoneX;
			y = 0.275482 * safezoneH + safezoneY;
			w = 0.153646 * safezoneW;
			h = 0.448222 * safezoneH;
		};
		class hora: RscText
		{
			idc = 103;
			type = CT_CENTER;

			x = 0.478447 * safezoneW + safezoneX;
			y = 0.27736 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.0128519 * safezoneH;
		};
		class numeroentrada: RscText
		{
			idc = 513;
			sizeEx = 0.1;
			colorShadow[] = {0,0,0,0};
			colortext[] = {0,0,0,1};
			type = CT_CENTER;
			x = 0.425208 * safezoneW + safezoneX;
			y = 0.366815 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class textollamada1: RscText
		{
			idc = 514;
			sizeEx = 0.075;
			colorShadow[] = {0,0,0,0};
			colortext[] = {0.01,0.01,0.01,1};
			type = CT_LEFT;
			x = 0.425234 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class textollamada2: RscText
		{
			idc = 515;
			sizeEx = 0.05;
			colorShadow[] = {0,0,0,0};
			colortext[] = {0.05,0.05,0.05,1};
			type = CT_LEFT;
			x = 0.425234 * safezoneW + safezoneX;
			y = 0.33588 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class quienmellama: RscText
		{
			idc = 901;
			type = CT_LEFT;
			colorBackground[] = {0,0,0,0};
			colortext[] = {1,1,1,1};
			x = 0.423177 * safezoneW + safezoneX;
			y = 0.340556 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class numerodelquemellaman: RscText
		{
			idc = 902;
			type = CT_LEFT;
			colorBackground[] = {0,0,0,0};
			colortext[] = {1,1,1,1};
			x = 0.423177 * safezoneW + safezoneX;
			y = 0.378185 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class tipollamada: RscText
		{
			idc = 900;
			type = CT_LEFT;
			colorBackground[] = {0,0,0,0};
			colortext[] = {1,1,1,1};
			x = 0.423177 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
	}; 
};