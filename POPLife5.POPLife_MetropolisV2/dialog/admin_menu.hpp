class life_admin_menu {
    idd = 2900;
    name= "life_admin_menu";
	movingEnable = true;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_adminMenu";
	class controlsBackground {};
	class objects {};
	class controls 
	{
		
	class RscPicture_1200: Life_RscPicture
	{
		idc = 1200;
		moving = 1;
		text = "\AxE\fondoadmin2.paa";
		x = 0.4625 * safezoneW + safezoneX;
		y = 0.245664 * safezoneH + safezoneY;
		w = 0.495 * safezoneW;
		h = 0.381563 * safezoneH;
	};
	class Lista_Jugadores: Life_RscListbox
	{
		idc = 2902;
		x = 0.4725 * safezoneW + safezoneX;
		y = 0.304063 * safezoneH + safezoneY;
		w = 0.22 * safezoneW;
		h = 0.309375 * safezoneH;
		sizeEx = 0.035;
		onLBSelChanged = "[_this] spawn life_fnc_adminQuery";
	};
	class Info_Jugadores: Life_RscStructuredText
	{
		idc = 2903;
		x = 0.699375 * safezoneW + safezoneX;
		y = 0.304063 * safezoneH + safezoneY;
		w = 0.2475 * safezoneW;
		h = 0.309375 * safezoneH;
		colorBackground[] = {0,0,0,0.1};
	};
	class TeleportToME: RscButton
	{
		idc = 2913;
		text = "VEN A MI"; //--- ToDo: Localize;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.365938 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0,0,1,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminTPtoME;";
		
	};
	class teleport: RscButton
	{
		idc = 2907;
		text = "TELEPORT"; //--- ToDo: Localize;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.304063 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0,0,1,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminTeleport";
	};
	class teleportoplayer: RscButton
	{
		idc = 2912;
		text = "VOY A TI"; //--- ToDo: Localize;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.335 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0,0,1,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminTPtoPL;";
	};
	class adminrevivir: RscButton
	{
		idc = 6847;
		text = "REVIVIR"; //--- ToDo: Localize;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.415437 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0,1,0,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminRevivir;";
	};
	class admincurar: RscButton
	{
		idc = 2914;
		text = "CURAR"; //--- ToDo: Localize;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.444313 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0,1,0,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "if (call life_adminlevel >= 1) then {[] spawn life_fnc_adminHR;}";
	};
	class adminreparar: RscButton
	{
		idc = 2917;
		text = "REPARAR"; //--- ToDo: Localize;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.475251 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0,1,0,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminReparar;";
	};
	class admincachear: RscButton
	{
		idc = 2915;
		text = "CACHEAR"; //--- ToDo: Localize;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.518562 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {1,0,1,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[call compile format ['%1', (lbData [2902, lbCurSel (2902)])]] spawn ica_fnc_cacheo;";
	};
	class admincongelar: RscButton
	{
		idc = 2904;
		text = "CONGELAR"; //--- ToDo: Localize;
		x = 0.396812 * safezoneW + safezoneX;
		y = 0.545303 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {1,0,1,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminFreeze;";
	};
	class adminfuego: RscButton
	{
		idc = 2919;
		text = "FUEGO"; //--- ToDo: Localize;
		x = 0.66225 * safezoneW + safezoneX;
		y = 0.634062 * safezoneH + safezoneY;
		w = 0.055 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {1,0.644531,0,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminUni;";
	};
	class admincamara: RscButton
	{
		idc = 2909;
		text = "CAMARA"; //--- ToDo: Localize;
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.634062 * safezoneH + safezoneY;
		w = 0.055 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0.5,0.5,0.5,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "if (call life_adminlevel >= 1) then {player exec ""camera.sqs"";}";
	};
	class admininvisible: RscButton
	{
		idc = 2905;
		text = "INVISIBLE"; //--- ToDo: Localize;
		x = 0.517875 * safezoneW + safezoneX;
		y = 0.634062 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] spawn ica_fnc_ocultame";	
	};
	class adminmarks: RscButton
	{
		idc = 2910;
		text = "MARCADORES"; //--- ToDo: Localize;
		x = 0.5825 * safezoneW + safezoneX;
		y = 0.634062 * safezoneH + safezoneY;
		w = 0.075625 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0.601563,0.800781,0.195313,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "if (call life_adminlevel >= 1) then {[] spawn life_fnc_adminMarkers;}";
	};
	class adminkill: RscButton
	{
		idc = 2906;
		text = "MATAR"; //--- ToDo: Localize;
		x = 0.905625 * safezoneW + safezoneX;
		y = 0.634062 * safezoneH + safezoneY;
		w = 0.048125 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {1,0,0,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "if (call life_adminlevel >= 1) then {[] call life_fnc_adminKill;}";
	};
	class adminspectator: RscButton
	{
		idc = 2413;
		text = "ESPECTADOR"; //--- ToDo: Localize;
		x = 0.45875 * safezoneW + safezoneX;
		y = 0.665 * safezoneH + safezoneY;
		w = 0.06875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0.5,0.5,0.5,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] spawn FuRixX_fnc_AdminEspectear";
	};
	class admindelete: RscButton
	{
		idc = 2916;
		text = "BORRAR OBJETO"; //--- ToDo: Localize;
		x = 0.819 * safezoneW + safezoneX;
		y = 0.634062 * safezoneH + safezoneY;
		w = 0.0825 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {1,0,0,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "if (call life_adminlevel >= 1) then {[] spawn life_fnc_adminDelObj;}";
	};
	class adminlicence: RscButton
	{
		idc = 2918;
		text = "LICENCIAS"; //--- ToDo: Localize;
		x = 0.396875 * safezoneW + safezoneX;
		y = 0.570124 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {1,0,1,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminLicencias;";
	};
	class adminpropcasa: RscButton
	{
		idc = 2416;
		text = "PROP CASA"; //--- ToDo: Localize;
		x = 0.61 * safezoneW + safezoneX;
		y = 0.665 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0,0,0.5,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[cursortarget] call life_fnc_cophouseowner;";	
	};
	class adminllavescoche: RscButton
	{
		idc = 2908;
		text = "LLAVES COCHE"; //--- ToDo: Localize;
		x = 0.53025 * safezoneW + safezoneX;
		y = 0.665 * safezoneH + safezoneY;
		w = 0.075625 * safezoneW;
		h = 0.020625 * safezoneH;
		colorBackground[] = {0,0,0.5,1};
		colorActive[] = {0,0,0,0};
		onButtonClick = "[] call life_fnc_adminKeys;";
	};

};		
};

