

class pandemia
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['pandemia', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['pandemia', nil]; ";
	
	class controls {
		class cabecera: RscStructuredText
		{
			idc = 15000;

			text = "Centro de control de pandemias Icaruk & AxE"; //--- ToDo: Localize;
			x = 0.273125 * safezoneW + safezoneX;
			y = 0.1656 * safezoneH + safezoneY;
			w = 0.459937 * safezoneW;
			h = 0.0264 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class fondo: IGUIBack
		{
			idc = 15001;

			x = 0.273125 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.459937 * safezoneW;
			h = 0.616 * safezoneH;
		};
		class boton: RscButton
		{
			idc = 15002;

			text = "RESET"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.118594 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class slot1: RscPicture
		{
			idc = 15003;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.127875 * safezoneW;
			h = 0.2178 * safezoneH;
		};
		class slot2: RscPicture
		{
			idc = 15004;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.439156 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.127875 * safezoneW;
			h = 0.2178 * safezoneH;
		};
		class slot3: RscPicture
		{
			idc = 15005;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.588687 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.127875 * safezoneW;
			h = 0.2178 * safezoneH;
		};
		class h1: RscPicture
		{
			idc = 15006;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class h2: RscPicture
		{
			idc = 15007;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.426781 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class h3: RscPicture
		{
			idc = 15008;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.522687 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class h4: RscPicture
		{
			idc = 15009;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.621687 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class h5: RscPicture
		{
			idc = 15010;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.282406 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class h6: RscPicture
		{
			idc = 15011;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.378312 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class h7: RscPicture
		{
			idc = 15012;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.47525 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class h8: RscPicture
		{
			idc = 15013;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.572187 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class h9: RscPicture
		{
			idc = 15014;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.670156 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		

		class b1: RscButton
		{
			idc = 15015;

			colorBackground[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class b2: b1
		{
			idc = 15016;

			x = 0.426781 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class b3: b1
		{
			idc = 15017;

			x = 0.522687 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class b4: b1
		{
			idc = 15018;

			x = 0.621687 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class b5: b1
		{
			idc = 15019;

			x = 0.282406 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class b6: b1
		{
			idc = 15020;

			x = 0.378312 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class b7: b1
		{
			idc = 15021;

			x = 0.47525 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class b8: b1
		{
			idc = 15022;

			x = 0.572187 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};
		class b9: b1
		{
			idc = 15023;

			x = 0.670156 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.053625 * safezoneW;
			h = 0.0924 * safezoneH;
		};

		class p1: b1
		{
			idc = 15024;
			colorBackground[] = {0,0,0,1};
			text = "Infirmum"; //--- ToDo: Localize;
			x = 0.199181 * safezoneW + safezoneX;
			y = 0.669348 * safezoneH + safezoneY;
			w = 0.0721892 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class p2: p1
		{
			idc = 15025;

			text = "Labecula"; //--- ToDo: Localize;
			x = 0.198766 * safezoneW + safezoneX;
			y = 0.70417 * safezoneH + safezoneY;
			w = 0.0721892 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class p3: p1
		{
			idc = 15026;

			text = "Amissio"; //--- ToDo: Localize;
			x = 0.198875 * safezoneW + safezoneX;
			y = 0.7398 * safezoneH + safezoneY;
			w = 0.0721892 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class p4: p1
		{
			idc = 15027;

			text = "Tantibus"; //--- ToDo: Localize;
			x = 0.198867 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0721892 * safezoneW;
			h = 0.033 * safezoneH;
		};		
	};
};

