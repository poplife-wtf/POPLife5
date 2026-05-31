class menuCrafteo
{
	idd = 5040;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['menuCrafteo', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['menuCrafteo', nil]; ";
	
	class controls {
		class fondo: IGUIBack
		{
			idc = 220000;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.385 * safezoneH;
		};
		
		class categorias: RscText
		{
			idc = 220001;
			text = "Categorias"; //--- ToDo: Localize;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Recetas: RscText
		{
			idc = 220002;
			text = "Recetas"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Ingredientes: RscText
		{
			idc = 220003;
			text = "Ingredientes"; //--- ToDo: Localize;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class lista1: RscListbox
		{
			idc = 5035;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.319 * safezoneH;
			onLBSelChanged = "['actualiza2'] call ica_fnc_menuCrafteo";
		};
		
		class lista2: RscListbox
		{
			idc = 5036;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.319 * safezoneH;
			onLBSelChanged = "['actualiza3'] call ica_fnc_menuCrafteo";
		};
		
		class lista3: RscListbox
		{
			idc = 5037;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.319 * safezoneH;
		};
		
		class craft: RscButton
		{
			idc = 5039;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.055 * safezoneH;
			text = "CraftDefault.paa";
			soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
		};
		
		class loading: RscPicture
		{
			idc = 220004;
			text = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.121 * safezoneH;
		};
	};
};














/* #Qokero
$[
	1.063,
	["MenuCrafteokK",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"fondo",[1,"",["0.298906 * safezoneW + safezoneX","0.302 * safezoneH + safezoneY","0.391875 * safezoneW","0.385 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"categorias",[1,"CategorÃ­as",["0.309219 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.0979687 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"Recetas",[1,"Recetas",["0.438125 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.0979687 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"Ingredientes",[1,"Ingredientes",["0.567031 * safezoneW + safezoneX","0.313 * safezoneH + safezoneY","0.0979687 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"lista1",[1,"",["0.309219 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.108281 * safezoneW","0.319 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"lista2",[1,"",["0.438125 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.108281 * safezoneW","0.319 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1502,"lista3",[1,"",["0.567031 * safezoneW + safezoneX","0.346 * safezoneH + safezoneY","0.108281 * safezoneW","0.319 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"craft",[1,"",["0.432969 * safezoneW + safezoneX","0.709 * safezoneH + safezoneY","0.108281 * safezoneW","0.055 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"loading",[1,"#(argb,8,8,3)color(0,0,0,0)",["0.432969 * safezoneW + safezoneX","0.775 * safezoneH + safezoneY","0.108281 * safezoneW","0.121 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
