////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rosen, v1.063, #Gojely)
////////////////////////////////////////////////////////

class apuesta_diag
{
	idd = 13371;
	name = "apuesta_diag";
	movingEnabled = false;
	enableSimulation = true;
	class controls {
		class fondo: IGUIBack
		{
			idc = -1;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class boton1: RscButton
		{
			idc = -1;
			text = "Apostar"; //--- ToDo: Localize;
			onButtonClick = "apostado = true;";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class texto: RscText
		{
			idc = -1;
			text = "Introduzca la apuesta"; //--- ToDo: Localize;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class apuesta: RscEdit
		{
			idc = 7331;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
