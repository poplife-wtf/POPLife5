class rscMapControlGang
{
	access = 0;
	alphaFadeEndScale = 1;
	alphaFadeStartScale = 0;
	colorBackground[] = {0.969,0.957,0.949,1};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorForestBorder[] = {0,0,0,0};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	colorInactive[] = {1,1,1,0.5};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorMainRoads[] = {0.9,0.5,0.3,1};
	colorMainRoadsFill[] = {1,0.6,0.4,1};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorOutside[] = {0,0,0,1};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0.8,0.2,0,1};
	colorRoads[] = {0.7,0.7,0.7,1};
	colorRoadsFill[] = {1,1,1,1};
	colorRocks[] = {0,0,0,0.3};
	colorRocksBorder[] = {0,0,0,0};
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorText[] = {0,0,0,1};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorTracksFill[] = {0.84,0.76,0.65,1};
	font = "TahomaB";
	fontGrid = "TahomaB";
	fontInfo = "PuristaMedium";
	fontLabel = "PuristaMedium";
	fontLevel = "TahomaB";
	fontNames = "PuristaMedium";
	fontUnits = "TahomaB";
	h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	maxSatelliteAlpha = 0.85;
	moveOnEdges = 0;
	ptsPerSquareCLn = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareObj = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	scaleDefault = 0.16;
	scaleMax = 1;
	scaleMin = 0.001;
	shadow = 0;
	showCountourInterval = 0;
	sizeEx = 0.04;
	sizeExGrid = 0.02;
	sizeExInfo =  "(            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	sizeExLevel = 0.02;
	sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	stickX[] = {0.2,["Gamma",1,1.5]};
	stickY[] = {0.2,["Gamma",1,1.5]};
	style = 48;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	type = 101;
	w = "SafeZoneWAbs";
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	class ActiveMarker
	{
		color[] = {0.3,0.1,0.9,1};
		size = 50;
	};
	class Bunker
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance = "1.5 * 14 * 0.05";
		size = 14;
	};
	class Bush
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = "0.2 * 14 * 0.05 * 0.05";
		size = "14/2";
	};
	class BusStop
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		importance = 1;
		size = 24;
	};
	class Chapel
	{
		coefMax = 4;
		coefMin = 0.85;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		importance = 1;
		size = 24;
	};
	class Church
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		importance = 1;
		size = 24;
	};
	class Command
	{
		coefMax = 1;
		coefMin = 1;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		importance =1;
		size = 18;
	};
	class Cross
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		importance = 1;
		size = 24;
	};
	class CustomMark
	{
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		importance = 1;
		size = 24;
	};
	class Fortress
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance = "2 * 16 * 0.05";
		size = 16;
	};
	class Fountain
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		importance = "1 * 12 * 0.05";
		size = 11;
	};
	class Fuelstation
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		importance = 1;
		size = 24;
	};
	class Hospital
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		importance = 1;
		size = 24;
	};
	class Legend
	{
		color[] = {0,0,0,1};
		colorBackground[] = {1,1,1,0.5};
		font = "PuristaMedium";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};
	class Lighthouse
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		importance = 1;
		size = 24;
	};
	class power
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		importance = 1;
		size = 24;
	};
	class powersolar
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		importance = 1;
		size = 24;
	};
	class powerwind
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		importance = 1;
		size = 24;
	};
	class powerwave
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		importance = 1;
		size = 24;
	};
	class Quay
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		importance = 1;
		size = 24;
	};
	class Rock
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.1,0.1,0.1,0.8};
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		importance = "0.5 * 12 * 0.05";
		size = 12;
	};
	class Ruin
	{
		coefMax = 4;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		importance = "1.2 * 16 * 0.05";
		size = 16;
	};
	class shipwreck
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		importance = 1;
		size = 24;
	};
	class SmallTree
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = "0.6 * 12 * 0.05";
		size = 12;
	};
	class Stack
	{
		coefMax = 4;
		coefMin = 0.9;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		importance = "2 * 16 * 0.05";
		size = 20;
	};
	class Task
	{
		coefMax = 1;
		coefMin = 1;
		color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorCreated[] = {1,1,1,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		importance = 1;
		size = 27;
	};
	class Tourism
	{
		coefMax = 4;
		coefMin = 0.7;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		importance = "1 * 16 * 0.05";
		size = 16;
	};
	class Transmitter
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		importance = 1;
		size = 24;
	};
	class Tree
	{
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = "0.9 * 16 * 0.05";
		size = 12;
	};
	class ViewTower
	{
		coefMax = 4;
		coefMin = 0.5;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		importance = "2.5 * 16 * 0.05";
		size = 16;
	};
	class Watertower
	{
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		importance = 1;
		size = 24;
	};
	class Waypoint
	{
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		importance = 1;
		size = 24;
	};
	class WaypointCompleted
	{
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		importance = 1;
		size = 24;
	};
	class LineMarker //<--- Neu eingefügt 
	 {
	 lineDistanceMin = 3e-005;
	 lineLengthMin = 5;
	 lineWidthThick = 0.014;
	 lineWidthThin = 0.008;
	 textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	 };//<--- bis hier 
};


class Life_My_Gang_Diag {
	idd = 2620;
	name= "life_my_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {};

	class controls {	
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Zahebe)
		////////////////////////////////////////////////////////

		class Fondo: RscPicture
		{
			idc = 1997;
			text = "\pop_codigo\pics\gang.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.693 * safezoneH;
		};
		class GangKick:  Life_RscButtonMenu
		{
			idc = 2624;
			onButtonClick = "[] call life_fnc_gangKick";
			style = ST_CENTER;
			text = "Desterrar"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangPromote:  Life_RscButtonMenu
		{
			idc = 2622;
			style = ST_CENTER;
			onButtonClick = "[] spawn life_fnc_gangNewLeader";
			text = "Ascender"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangDemote:  Life_RscButtonMenu
		{
			idc = 2633;
			onButtonClick = "[] call life_fnc_gangDemote";
			style = ST_CENTER;
			text = "Degradar"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangBanco:  Life_RScTitle
		{
			idc = 601000;
			text = ""; //--- ToDo: Localize;
			x = 0.312292 * safezoneW + safezoneX;
			y = 0.324926 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class GangAlias:  Life_RscButtonMenu
		{
			idc = 26330;
			style = ST_CENTER;
			onButtonClick = "closeDialog 0;createDialog ""Life_Gang_Alias""";
			text = "Mi Alias"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangLeave:  Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "[] call life_fnc_gangLeave";
			text = "Dejar Grupo"; //--- ToDo: Localize;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class InvitePlayer:  Life_RscButtonMenu
		{
			idc = 2630;
			style = ST_CENTER;
			onButtonClick = "[0] spawn life_fnc_gangInvitePlayer";
			text = "Invitar Jugador"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class CloseLoadMenu:  Life_RscButtonMenu
		{
			idc = -1;
			style = ST_CENTER;
			onButtonClick = "closeDialog 0";
			text = "Cerrar"; //--- ToDo: Localize;
			x = 0.31025 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Gang_Map_Map: rscMapControlGang
		{
			idc = 247415;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.315104 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.153229 * safezoneW;
			h = 0.271667 * safezoneH;
		};
		class GangMemberList: Life_RscListBox
		{
			idc = 2621;
			text = "";
			sizeEx = 0.025;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.349704 * safezoneH + safezoneY;
			w = 0.117604 * safezoneW;
			h = 0.271296 * safezoneH;
		};
		class GangOwner:  Life_RscButtonMenu
		{
			idc = 2625;
			style = ST_CENTER;
			onButtonClick = "[""menu""] spawn life_fnc_gangCasa";
			text = "Casa de Mafia"; //--- ToDo: Localize;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class DisbandGang: GangOwner
		{
			idc = 2631;
			style = ST_CENTER;
			text = "Eliminar Grupo"; //--- ToDo: Localize;
			onButtonClick = "[] spawn life_fnc_gangDisband";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class ColorList: Life_RscCombo
		{
			idc = 2632;
			x = 0.597969 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class GangBank: Life_RScTitle
		{
			idc = 2629;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class Life_Create_Gang_Diag {
	idd = 2520;
	name= "life_my_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {waitUntil {!isNull (findDisplay 2520)}; ((findDisplay 2520) displayCtrl 2523) ctrlSetText format[localize ""STR_Gang_PriceTxt"",""25000 euros"";";

	class controlsBackground {};

	class controls {
	
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Fevulu)
		////////////////////////////////////////////////////////

		class FONDOCreate: RscPicture
		{
			idc = -1;
			text = "\pop_codigo\pics\gang.paa";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class CloseLoadMenuCreate : Life_RscButtonMenu
		{
			idc = -1;
			text = "Cerrar"; //--- ToDo: Localize;
			style = ST_CENTER;
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			x = 0.376771 * safezoneW + safezoneX;
			y = 0.563333 * safezoneH + safezoneY;
			w = 0.0435417 * safezoneW;
			h = 0.0229259 * safezoneH;
		};
		class GangCreateField : Life_RscButtonMenu
		{
			idc = -1;
			text = "Crear"; //--- ToDo: Localize;
			style = ST_CENTER;
			onButtonClick = "[] call life_fnc_createGang";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class CreateGangText : Life_RscEdit
		{
			idc = 2522;
			style = ST_CENTER;
			text = $STR_Gang_YGN;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.455074 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class InfoMsgCreate : Life_RscTitle
		{
			idc = -1;
			style = ST_CENTER;
			text = "Administrar Grupo"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class TitleCreate : Life_RscTitle
		{
			idc = -1;
			text = "Nombre del Grupo:"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class Life_Gang_Alias {
	idd = 25200;
	name= "Life_Gang_Alias";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {};

	class controls {
	
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Risoqo)
		////////////////////////////////////////////////////////

		class FONDOAlias: RscPicture
		{
			idc = -1;
			text = "\pop_codigo\pics\gang.paa";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class CloseLoadMenuAlias : Life_RscButtonMenu
		{
			idc = -1;
			style = ST_CENTER;
			onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
			text = "Cerrar"; //--- ToDo: Localize;
			x = 0.376771 * safezoneW + safezoneX;
			y = 0.563333 * safezoneH + safezoneY;
			w = 0.0435417 * safezoneW;
			h = 0.0229259 * safezoneH;
		};
		class GangAliasField : Life_RscButtonMenu
		{
			idc = -1;
			style = ST_CENTER;
			onButtonClick = "closeDialog 0; [] call life_fnc_gangAlias;";
			text = "Crear Alias"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class CreateGangTextAlias : Life_RscEdit
		{
			idc = 2522;
			style = ST_CENTER;
			text = "Escribe el sobrenombre que deseas";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.455074 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class TituloAlias : Life_RscTitle
		{
			idc = -1;
			style = ST_CENTER;
			text = "Alias Anonimo"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class AliasGangText : Life_RscEdit
		{
			idc = -1;
			style = ST_CENTER;
			text = "Nuevo Alias:"; //--- ToDo: Localize;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////		
	};
};

class Life_My_Group_Diag {
	idd = 2620;
	name= "life_my_groups_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[false] spawn life_fnc_gangManagement;";
	
	class controlsBackground {
	
	    class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "textures\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		class MainBackground:life_RscText {
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class PlayerList:Life_RscListBox
		{
			idc = 2621;
			sizeEx = 0.035;
			x = 0.1125;
			y = 0.26;
			w = 0.4625;
			h = 0.54;
		};
		class LockGroupButton : Life_RscButtonMenu
		{
			idc = 2622;
			text = "Bloquear";
			onButtonClick = "[] spawn life_fnc_lockGang";
			x = 0.6;
			y = 0.44;
			w = 0.2;
			h = 0.04;
			colorBackground[] = {0, 0, 0, 0};
		};
		class UnlockGroupButton: LockGroupButton
		{
			idc = 2623;
			text = "Desbloquear";
			onButtonClick = "[] spawn life_fnc_unlockGang";
		};
		class LeaveGangButton: LockGroupButton
		{
			idc = 2403;
			text = "$STR_Gang_Leave";
			onButtonClick = "[] call life_fnc_leaveGang";
			y = 0.36;
		};
		class PromoteGangButton: LockGroupButton
		{
			idc = 2625;
			text = "$STR_Gang_SetLeader";
			onButtonClick = "[] spawn life_fnc_setGangLeader";
			y = 0.6;
		};
		class KickGangButton: LockGroupButton
		{
			idc = 2624;
			text = "$STR_Gang_Kick";
			onButtonClick = "[] call life_fnc_kickGang";
			y = 0.52;
		};
		class CloseButton: LockGroupButton
		{
			idc = -1;
			text = "Cerrar"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.82;
			w = 0.1;
			h = 0.04;
		};
		class GangNameLabel:Life_RscText
		{
			idc = 1003;
			text = "Tu Grupo:"; //--- ToDo: Localize;
			x = 0.1125;
			y = 0.2;
			w = 0.462499;
			h = 0.06;
		};
	};
};