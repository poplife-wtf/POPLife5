class AXE_Life_My_Group_Diag {
	idd = 262000;
	name= "life_my_group_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[false] spawn life_fnc_gangManagement;";
	
	class controlsBackground {};
	
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Gisice)
		////////////////////////////////////////////////////////

		class fondoA: RscPicture
		{
			idc = -1;
			text = "\pop_codigo\pics\bandastemp.paa";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.627 * safezoneH;
		};
		class Cerrarmenu: RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";
			text = "Cerrar"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GangLeader : Life_RscButtonMenu
		{
			idc = 2625;
			text = "Lider";
			onButtonClick = "[] call life_fnc_setGangLeader";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangNameA : Life_RscTitle
		{
			idc = 601;
			text = "";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class GangListA : Life_RscListBox 
		{
			idc = 2621;
			text = "";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class GangKick : Life_RscButtonMenu
		{
			idc = 2624;
			onButtonClick = "[] call life_fnc_kickGang";
			text = "Expulsar"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangLeave : Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_leaveGang";
			text = "Dejar Banda"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangLock : Life_RscButtonMenu
		{
			idc = 2622;
			text = "Bloquear";
			onButtonClick = "[] call life_fnc_lockGang";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangUnlock : Life_RscButtonMenu
		{
			idc = 2623;
			text = "Desbloquear";
			onButtonClick = "[] call life_fnc_unlockGang";
			x = 0.5825 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Miembros actuales:"; //--- ToDo: Localize;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class AXE_Life_Browse_Gang_Diag {
	idd = 252000;
	name= "life_my_gang_menu_browse";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_gangBrowser";
	
	class controlsBackground {};
	
	class controls {		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Jenuba)
		////////////////////////////////////////////////////////

		class TempGangFondoBusqueda: RscPicture
		{
			idc = -1;
			text = "\pop_codigo\pics\bandastemp.paa";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.638 * safezoneH;
		};
		class CerrarDialogo: RscButton
		{
			idc = -1;
			text = "Cerrar"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0; [] call life_fnc_p_updateMenu;";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GangJoinGroup : Life_RscButtonMenu
		{
			idc = 2522;
			text = "Unirse"; //--- ToDo: Localize;			
			onButtonClick = "[] call life_fnc_joinGang";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Title : Life_RscTitle
		{
			idc = -1;
			text = "Lista de bandas actuales:"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class GangList : Life_RscListBox 
		{
			idc = 2521;
			text = "";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.187 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class AXE_Life_Create_Group_Diag {
	idd = 252000;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {};
	
	class controls {		
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Migofo)
		////////////////////////////////////////////////////////

		class TempGangFondocreate: RscPicture
		{
			idc = -1;
			text = "\pop_codigo\pics\bandastemp.paa";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.638 * safezoneH;
		};
		class botoncerrarcreate: RscButton
		{
			idc = -1;
			text = "Cerrar"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			text = "Escribe aqui el nombre para tu grupo temporal."; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class GangCreateField : Life_RscButtonMenu
		{
			idc = -1;
			text = "Crear"; //--- ToDo: Localize;			
			onButtonClick = "[] call life_fnc_createGroup";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Title : Life_RscTitle
		{
			idc = -1;
			text = "Crea un grupo temporal para jugar con tus amigos."; //--- ToDo: Localize;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
		
	};
};

class AXE_Life_Gang_Prompt
{
	idd = 255000;
	name = "Gang_Prompt";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {};
	
	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Vaxixi)
		////////////////////////////////////////////////////////

		class TempGangFondoprompt: RscPicture
		{
			idc = -1;
			text = "\pop_codigo\pics\bandastemp.paa";
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.638 * safezoneH;
		};
		class life_gang_create_button : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Crear banda"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0; createDialog ""AXE_Life_Create_Group_Diag""; ctrlShow[2522,true]";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class life_gang_browse : Life_RscButtonMenu 
		{
			idc = -1;
			text = "Buscar Banda"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0; createDialog ""AXE_Life_Browse_Gang_Diag""";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class TextoInformativoprompt: RscText
		{
			idc = -1;
			text = "Busca o crea bandas gratuitas para jugar con tus amigos."; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class botoncerrarprompt: RscButton
		{
			idc = -1;
			text = "Cerrar"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};