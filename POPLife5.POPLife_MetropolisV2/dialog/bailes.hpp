////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rosen, v1.063, #Geniwu)
////////////////////////////////////////////////////////
class bailes
{
		
	idd = -1;
	name = "bailes";
	movingenable = true;
	
	class controls {
		class text1: RscText
		{
			idc = -1;
			text = "Bailes"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class t2: RscButton
		{
			idc = -1;
			text = "Ruso"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\Bailerussian.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class t3: RscButton
		{
			idc = -1;
			text = "Duo Ivan"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\BaileDuoIvan.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class t4: RscButton
		{
			idc = -1;
			text = "Duo Stephan"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\BaileDuoStephan.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class t5: RscButton
		{
			idc = -1;
			text = "Hip Hop"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\Bailehihop.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1605: RscButton
		{
			idc = -1;
			text = "Loco"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\baileloco.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1606: RscButton
		{
			idc = -1;
			text = "Robot loco"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\bailelocoRoboto.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1607: RscButton
		{
			idc = -1;
			text = "Roboto"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\Bailerobot.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1608: RscButton
		{
			idc = -1;
			text = "Pop"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\bailelpop.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1609: RscButton
		{
			idc = -1;
			text = "Stephan"; //--- ToDo: Localize;
			action = "closeDialog 0; execVM ""animaciones\BaileStephan.sqf""";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1611: RscButton
		{
			idc = -1;
			text = "Parar"; //--- ToDo: Localize;
			action = "closeDialog 0; player switchMove ''";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class IGUIBack_2200: IGUIBack
		{
			idc = -1;
			x = 0.773281 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.495 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
