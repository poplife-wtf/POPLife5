class ada_cargando {
	idd = 69854;
	movingEnable = 0;
	duration = 9999999;  
	onLoad = "uiNamespace setVariable ['ada_cargando', _this select 0];";
	class controlsBackground {};
	class objects {};
	class controls 
	{ 
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Govoja)
		////////////////////////////////////////////////////////
		class fondo: RscPicture
		{
			idc = 1020;
			text = "";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class texto: RscText
		{
			idc = 1021;
			text = ""; //--- ToDo: Localize;
			style = ST_CENTER;
			shadow = 1;
			colorShadow[] = {0,0,0,0.75};
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.044 * safezoneH;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
		};
    };		
};

