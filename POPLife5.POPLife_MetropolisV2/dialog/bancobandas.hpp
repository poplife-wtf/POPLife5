
class cajerobandas {
	idd = 997000;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['cajerobandas', _this select 0];";
	class controlsBackground {};
	class objects {};
	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Dilyne)
		////////////////////////////////////////////////////////

		class BACKGROUND: Life_RscPicture
		{
			idc = -1;
			text = "\AxE\bancogrupo.paa";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.517 * safezoneH;
		};
		class METER: Life_RscButton
		{
			idc = -1;
			action = "Hint 'METER DINERO'";
			text = "METER"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class SACAR: Life_RscButton
		{
			idc = -1;
			action = "Hint 'SACAR DINERO'";
			text = "SACAR"; //--- ToDo: Localize;
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class DINERO: Life_RscEdit
		{
			idc = 1351;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.109843 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class FONDOS: Life_RscText
		{
			idc = 1352;
			style = ST_CENTER;
			text = "Dinero: "; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};