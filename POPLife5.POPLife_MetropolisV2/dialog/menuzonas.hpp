class rscMapControlGangAtt
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

class menuzonas {
	idd = 997100;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['menuzonas', _this select 0];";
	onUnLoad = "uiNamespace setVariable ['menuzonas', nil]; player setvariable ['zona_elegida_atacar', nil]";
	class controlsBackground {};
	class objects {};
	class controls 
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Kozumi)
		////////////////////////////////////////////////////////

		class RscPicture_1200: RscPicture
		{
			idc = 12000;
			text = "\pop_codigo\pics\gang.paa";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.181 * safezoneH + safezoneY;
			w = 0.417656 * safezoneW;
			h = 0.693 * safezoneH;
		};
		class mapazonas: rscMapControlGangAtt
		{
			idc = 12010;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.315104 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.153229 * safezoneW;
			h = 0.271667 * safezoneH;
			
		};
		class RscButton_1600: RscButton
		{
			idc = 16000;
			action = "['atacar'] spawn ica_fnc_menuzona";
			text = "ATACAR ZONA"; //--- ToDo: Localize;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {1,0,0,0.5};
			colorText[] =  {1,1,1,1};
		};
		class RscText_1001: RscText
		{
			idc = 10001;
			text = "Zona Elegida: "; //--- ToDo: Localize;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 16010;
			text = "Barrio Arabe"; //--- ToDo: Localize;
			action = "hint 'No puede ser atacado'";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
			
		};
		class RscButton_1602: RscButton
		{
			idc = 16020;
			action = "player setvariable ['zona_elegida_atacar', zona_5]; ['mapa'] spawn ica_fnc_menuzona";
			text = "Isla de Rosario"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1603: RscButton
		{
			idc = 16030;
			action = "player setvariable ['zona_elegida_atacar', zona_10]; ['mapa'] spawn ica_fnc_menuzona";
			text = "Isla Milo"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1604: RscButton
		{
			idc = 16040;
			action = "player setvariable ['zona_elegida_atacar', zona_4]; ['mapa'] spawn ica_fnc_menuzona";
			text = "Clowntown"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1605: RscButton
		{
			idc = 16050;
			action = "hint 'No puede ser atacado'";
			text = "Zona Paramilitar"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1606: RscButton
		{
			idc = 16060;
			action = "player setvariable ['zona_elegida_atacar', zona_2]; ['mapa'] spawn ica_fnc_menuzona";
			text = "DownTown"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1607: RscButton
		{
			idc = 16070;
			action = "player setvariable ['zona_elegida_atacar', zona_3]; ['mapa'] spawn ica_fnc_menuzona";
			text = "Isla Miconos"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1608: RscButton
		{
			idc = 16080;
			action = "player setvariable ['zona_elegida_atacar', zona_8]; ['mapa'] spawn ica_fnc_menuzona";
			text = "RiverSide"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1609: RscButton
		{
			idc = 16090;
			action = "player setvariable ['zona_elegida_atacar', zona_7]; ['mapa'] spawn ica_fnc_menuzona";
			text = "NewHorizon"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1610: RscButton
		{
			idc = 16100;
			action = "player setvariable ['zona_elegida_atacar', zona_9]; ['mapa'] spawn ica_fnc_menuzona";
			text = "Isla Marta"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1611: RscButton
		{
			idc = 16110;
			action = "player setvariable ['zona_elegida_atacar', zona_12]; ['mapa'] spawn ica_fnc_menuzona";
			text = "Lawrance Resort"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		class RscButton_1612: RscButton
		{
			idc = 16120;
			action = "player setvariable ['zona_elegida_atacar', zona_11]; ['mapa'] spawn ica_fnc_menuzona";
			text = "Isla Lanai"; //--- ToDo: Localize;
			x = 0.62375 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.75};
			colorText[] =  {1,1,1,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};