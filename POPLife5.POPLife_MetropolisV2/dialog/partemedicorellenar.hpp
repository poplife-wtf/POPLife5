class PARTE_MEDICO_RELLENAR {
	idd = 19097;
	movingEnable = 0;
	fadein = 1.5;
	fadeout = 1.5;
	onLoad = "uiNamespace setVariable ['ada_parte_med', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['ada_parte_med', nil]; partemedico = nil;";
	class controlsBackground {};
	class objects {};
	class controls 
	{			
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Jesovi)
		////////////////////////////////////////////////////////

		class FONDO: RscPicture
		{
			idc = 5000;
			text = "\AxE\parte.paa";
			x = -0.03625 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.748 * safezoneH;
		};
		class NOMBRE_MEDICO: RscText
		{				
			style = ST_LEFT;
			idc = 5001;
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] =  {0,0,0,1};		
			};
		class NOMBREPACIENTE: RscText
		{
			style = ST_LEFT;
			idc = 5002;
			x = 0.113281 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] =  {0,0,0,1};		
			};
		class NSS: RscText
		{	
			style = ST_LEFT;
			idc = 5003;
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] =  {0,0,0,1};		
			};
		class HOSPITAL: RscText
		{		
			style = ST_LEFT;

			tooltip = "Recinto donde se dio tratamiento al paciente."; //--- ToDo: Localize;
			idc = 5004;
			type = CT_EDIT; 
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
			colorSelection[] = { 0.543, 0.5742, 0.4102, 1 };
			autocomplete = false;
			colorText[] =  {0,0,0,1};
			colorDisabled[] = {0,0,0,0};			
		};
		class FECHA: RscText
		{
			idc = 5005;
			x = 0.0617187 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] =  {0,0,0,1};		
			};
		class HORA: RscText
		{
			idc = 5006;
			x = 0.195781 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] =  {0,0,0,1};		
			};
		class FIRMAMEDICO: RscText
		{
			idc = 5007;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			colorText[] =  {0,0,0,1};		
			};
		class DESCRIPCION: RscEdit
		{
			tooltip = "Describe brevemente lo que ha ocurrido."; //--- ToDo: Localize;
			idc = 5008;
			type = CT_EDIT; 
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.143 * safezoneH;
			colorSelection[] = { 0.543, 0.5742, 0.4102, 1 };
			autocomplete = false;
			colorText[] =  {0,0,0,1};			
			colorBackground[] = {0,0,0,0};
			colorDisabled[] = {0,0,0,0};
		};
		class RscButton_1601: RscButton
		{
			action = "closedialog 0; player setvariable ['partemedico', 0];";
			idc = 5009;
			text = "ENTREGAR PARTE MEDICO"; //--- ToDo: Localize;
			x = 0.066875 * safezoneW + safezoneX;
			y = 0.841 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
			tooltip = "Firma y entrega al paciente este informe medico."; //--- ToDo: Localize;
			colorBackground[] = {0,0,0,1};
			colorText[] =  {1,1,1,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};