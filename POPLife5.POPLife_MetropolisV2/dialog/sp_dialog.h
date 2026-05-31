////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Junyxe)
////////////////////////////////////////////////////////
class SEGPRIVADA_dialog
{
	idd = 656739;
	movingEnabled = true;
	enableSimulation = true;
	duration = 10;
	name="SEGPRIVADA_dialog";
	onLoad="uiNamespace setVariable ['SEGPRIVADA_dialog',_this select 0];";
		
	class ControlsBackground
	{
		class FondoPlaca: RscPicture
		{
			idc = -1;
			text = "\AxE\chapa.paa";
			x = 0.819686 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.385 * safezoneH;
		};
	};

	class Controls
	{
		class TextoNombre: AkrText
		{
			idc = 656729;
			text = "Nombre Persona";
			style = ST_CENTER;			
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {1,1,1,1};
			x = 0.87125 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0783854 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
	};
};