////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Junyxe)
////////////////////////////////////////////////////////
class CHAPAS_dialog
{
	idd = 656730;
	movingEnabled = true;
	enableSimulation = true;
	duration = 10;
	name="CHAPAS_dialog";
	onLoad="uiNamespace setVariable ['CHAPAS_dialog',_this select 0];";

		
	class ControlsBackground
	{
		class Picture: RscPicture
		{
			idc = 1200;
			text = "\AxE\chapa.paa";
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.341 * safezoneH;
		};
	};

	class Controls
	{
		class TextNombre: AkrText
		{
			idc = 656723;
			text = "Alias Persona"; //--- ToDo: Localize;
			x = 0.823282 * safezoneW + safezoneX;
			y = 0.388259 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};

		class TextBanda: AkrText
		{
			idc = 656724;
			text = "Nombre Banda"; //--- ToDo: Localize;
			x = 0.823229 * safezoneW + safezoneX;
			y = 0.438741 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,1};
		};

	};
};