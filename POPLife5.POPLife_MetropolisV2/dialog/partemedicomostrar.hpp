class PARTE_MEDICO {
	idd = 887;
	duration = 25;		
	movingEnable = 0;
	fadein = 1.5;
	fadeout = 1.5;
	onLoad = "uiNamespace setVariable ['partemed', _this select 0];";
	class controlsBackground {};
	class objects {};
	class controls 
		{			
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Jesovi)
			////////////////////////////////////////////////////////

			class FONDO: RscPicture
			{
				idc = 50000;
				text = "\AxE\parte.paa";
				x = -0.03625 * safezoneW + safezoneX;
				y = 0.104 * safezoneH + safezoneY;
				w = 0.355781 * safezoneW;
				h = 0.748 * safezoneH;
				
			};
			class NOMBRE_MEDICO: RscText
			{
				style = ST_LEFT;
				idc = 50010;
				x = 0.12875 * safezoneW + safezoneX;
				y = 0.379 * safezoneH + safezoneY;
				w = 0.12375 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] =  {0,0,0,1};
			};
			class NOMBREPACIENTE: RscText
			{
				style = ST_LEFT;
				idc = 50020;
				x = 0.113281 * safezoneW + safezoneX;
				y = 0.335 * safezoneH + safezoneY;
				w = 0.139219 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] =  {0,0,0,1};
			};
			class NSS: RscText
			{
				style = ST_LEFT;
				idc = 50030;
				x = 0.066875 * safezoneW + safezoneX;
				y = 0.423 * safezoneH + safezoneY;
				w = 0.185625 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] =  {0,0,0,1};
			};
			class HOSPITAL: RscText
			{
				style = ST_LEFT;
				idc = 50040;
				x = 0.12875 * safezoneW + safezoneX;
				y = 0.467 * safezoneH + safezoneY;
				w = 0.12375 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] =  {0,0,0,1};
			};
			class FECHA: RscText
			{
				idc = 50050;
				x = 0.0617187 * safezoneW + safezoneX;
				y = 0.511 * safezoneH + safezoneY;
				w = 0.103125 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] =  {0,0,0,1};
			};
			class HORA: RscText
			{
				idc = 50060;
				x = 0.195781 * safezoneW + safezoneX;
				y = 0.511 * safezoneH + safezoneY;
				w = 0.0567187 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] =  {0,0,0,1};
			};
			class FIRMAMEDICO: RscText
			{
				idc = 50070;
				x = 0.185469 * safezoneW + safezoneX;
				y = 0.775 * safezoneH + safezoneY;
				w = 0.0825 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] =  {0,0,0,1};
			};
			class DESCRIPCION: ADAMUZ_RscStructuredText
			{
				idc = 50080;
				x = 0.0359375 * safezoneW + safezoneX;
				y = 0.577 * safezoneH + safezoneY;
				w = 0.216563 * safezoneW;
				h = 0.143 * safezoneH;
				colorText[] = {0,0,0,1};
			};
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT END
			////////////////////////////////////////////////////////

		};
	};