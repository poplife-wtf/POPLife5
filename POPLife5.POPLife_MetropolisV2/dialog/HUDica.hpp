
class HUDica {
	idd = 6000;
	movingEnable = 0;
	duration = 9e+012;
	onLoad = "uiNamespace setVariable ['HUDica', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['HUDica', nil];";

	class controls {
		class fondo: life_RscPicture
		{
			idc = 6015;

			text = "\AxE\textures\fondohud.paa";
			x = 0.845469 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.253 * safezoneH;
		};
        class vida_imagen: life_RscPicture
        {
            idc = 6016;
 
            text = "\AxE\textures\san.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.824 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class comida_imagen: life_RscPicture
        {
            idc = 6017;
 
            text = "\AxE\textures\com.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class bebida_imagen: life_RscPicture
        {
            idc = 6018;
 
            text = "\AxE\textures\agu.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.877 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class bebida_bar: life_RscPicture
        {
            idc = 6002;
 
            text = "\AxE\textures\aguabar_45.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.877 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class comida_bar: life_RscPicture
        {
            idc = 6003;
 
            text = "\AxE\textures\comibar_45.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class vida_bar: life_RscPicture
        {
            idc = 6001;
 
            text = "\AxE\textures\sangrebar_45.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.824 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class exp_imagen: life_RscPicture
        {
            idc = 6019;
 
            text = "\AxE\textures\exp.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.718 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class exp_bar: life_RscPicture
        {
            idc = 6006;
 
            text = "\AxE\textures\expbar_45.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.718 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class comf_bar: life_RscPicture
        {
            idc = 6005;
 
            text = "\AxE\textures\comfbar_45.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.771 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class comfort_image: life_RscPicture
        {
            idc = 6020;
 
            text = "\AxE\textures\comf.paa";
            x = 0.969219 * safezoneW + safezoneX;
            y = 0.771 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
        };
   
        // textos e img
        class nombre: RscStructuredText
        {
            idc = 6008;
            x = 0.865 * safezoneW + safezoneX;
            y = 0.95 * safezoneH + safezoneY;
            w = 0.1059375 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class dinero: RscStructuredText
        {
            idc = 6009;
            x = 0.90 * safezoneW + safezoneX;
            y = 0.93 * safezoneH + safezoneY;
            w = 0.0709375 * safezoneW;
            h = 0.02 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
        class txtExp: RscStructuredText
        {
            idc = 6010;
            text = "Lvl 999 | SP: 50"; //--- ToDo: Localize;
            x = 0.834124 * safezoneW + safezoneX;
            y = 0.9796 * safezoneH + safezoneY;
            w = 0.0546561 * safezoneW;
            h = 0.0176 * safezoneH;
            colorText[] = {0,0,0,1};
            colorBackground[] = {0,0,0,0};
        };
        class txt2: RscStructuredText
        {
            idc = 6014;
            text = "Energía: 1000/1000"; //--- ToDo: Localize;
            x = 0.873311 * safezoneW + safezoneX;
            y = 0.9796 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.022 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0};
        };
        class separador: RscStructuredText
        {
            idc = 6011;
            text = "|"; //--- ToDo: Localize;
            x = 0.494845 * safezoneW + safezoneX;
            y = 0.9864 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.055 * safezoneH;
            colorText[] = {0,0,0,1};
            colorBackground[] = {0,0,0,0};
        };
 
        class infolog: RscListBox
        {
            idc = 6012;
            text = ""; //--- ToDo: Localize;
            x = 0.768126 * safezoneW + safezoneX;
            y = 0.819 * safezoneH + safezoneY;
            w = 0.061875 * safezoneW;
            h = 0.165 * safezoneH;
            colorBackground[] = {0,0,0,0};
            sizeEx = 0.034;
            rowHeight = 0.02;
        };
		class icaruk: RscText
		{
			idc = -1;
			text = "FuRixX"; //--- ToDo: Localize;
			x = 0.917656 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,0.2};
		};
		class watermark : RscText
       {
            idc = -1;
			text = "poplife.wtf";
			x = 0.01 * safezoneW + safezoneX;
			y = 0.92 * safezoneH + safezoneY;
		    w = 0.064 * safezoneW;
            h = 0.090 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,0.2};			
		};
		class pipdown: life_RscPicture
		{
			idc = 6022;
			text = "\AxE\textures\pipdown.paa";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.8872 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class piptop: life_RscPicture
		{
			idc = 6023;
			text = "\AxE\textures\piptop.paa";
			x = 0.907344 * safezoneW + safezoneX;
			y = 0.8872 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.11 * safezoneH;
		};
	};
};



