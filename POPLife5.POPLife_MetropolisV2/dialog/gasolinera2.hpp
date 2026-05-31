class gasolineraadamuz
{
	idd = -1;
	movingenable = true;
	onLoad = "uiNamespace setVariable ['gasolinera', _this select 0]; abierto = true; ";
	onUnLoad = "uiNamespace setVariable ['gasolinera', nil]; abierto = nil; vehgasolinera = nil;";
	
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Nivamy)
		////////////////////////////////////////////////////////

		class RscPicture_1200: RscPicture
		{
			idc = -1;
			text = "\AxE\gas2.paa";
			x = -0.00578129 * safezoneW + safezoneX;
			y = 0.0012963 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 1.012 * safezoneH;
		};
		class Repostar: RscEdit
		{
			colorText[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0};
			colorBorder[] = {0,0,0,0};
			style = ST_CENTER;
			idc = 5014;
			//text = "75 L"; //--- ToDo: Localize;
			x = 0.323594 * safezoneW + safezoneX;
			y = 0.322259 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Cuantohay: RscText
		{
			style = ST_CENTER;
			idc = 5015;
			//text = "30% (24 L)"; //--- ToDo: Localize;
			x = 0.556667 * safezoneW + safezoneX;
			y = 0.332333 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class textoPrecio: RscText
		{
			style = ST_CENTER;
			idc = 5013;
			//text = "45 â‚¬"; //--- ToDo: Localize;
			x = 0.556146 * safezoneW + safezoneX;
			y = 0.390111 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1603: RscText
		{
			style = ST_CENTER;
			idc = 1603;
			//text = "1,90 â‚¬/L"; //--- ToDo: Localize;
			x = 0.577239 * safezoneW + safezoneX;
			y = 0.454259 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscButton_1604: CajeroRscButton
		{
			idc = 1604;
			action = "['rellena'] spawn ica_fnc_gasolinera; playsound 'beep';" ;
			//text = "Rellenar"; //--- ToDo: Localize;
			x = 0.40927 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class BotonRepostar: CajeroRscButton
		{
			idc = 5012;
			action = "['llena'] spawn ica_fnc_gasolinera; playsound 'beep';";
			//text = "Aceptar"; //--- ToDo: Localize;
			x = 0.40927 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1606: CajeroRscButton
		{
			idc = 1606;
			action = "playsound 'beep'; closedialog 0;";
			//text = "Cancelar"; //--- ToDo: Localize;
			x = 0.409219 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1607: CajeroRscButton
		{
			idc = 1607;
			//action = "playsound 'beep'; ['L'] spawn ica_fnc_gasolinera;";
			//text = "+"; //--- ToDo: Localize;
			x = 0.40974 * safezoneW + safezoneX;
			y = 0.482518 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1608: CajeroRscButton
		{
			idc = 1608;
			//action = "playsound 'beep'; ['K'] spawn ica_fnc_gasolinera;";
			//text = "-"; //--- ToDo: Localize;
			x = 0.433334 * safezoneW + safezoneX;
			y = 0.482408 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1609: CajeroRscButton
		{
			idc = 1609;
			//action = "playsound 'beep'; ['A'] spawn ica_fnc_gasolinera;";
			//text = "0"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.483444 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1610: CajeroRscButton
		{
			idc = 1610;
			//action = "playsound 'beep'; ['C'] spawn ica_fnc_gasolinera;";
			//text = "2"; //--- ToDo: Localize;
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.447222 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1611: CajeroRscButton
		{
			idc = 1611;
			//action = "playsound 'beep'; ['G'] spawn ica_fnc_gasolinera;";
			//text = "6"; //--- ToDo: Localize;
			x = 0.386458 * safezoneW + safezoneX;
			y = 0.413889 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1612: CajeroRscButton
		{
			idc = 1612;
			//action = "playsound 'beep'; ['D'] spawn ica_fnc_gasolinera;";
			//text = "3"; //--- ToDo: Localize;
			x = 0.386458 * safezoneW + safezoneX;
			y = 0.447222 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1613: CajeroRscButton
		{
			idc = 1613;
			//action = "playsound 'beep'; ['F'] spawn ica_fnc_gasolinera;";
			//text = "5"; //--- ToDo: Localize;
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.412963 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1614: CajeroRscButton
		{
			idc = 1614;
			//action = "playsound 'beep'; ['E'] spawn ica_fnc_gasolinera;";
			//text = "4"; //--- ToDo: Localize;
			x = 0.336979 * safezoneW + safezoneX;
			y = 0.412963 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1615: CajeroRscButton
		{
			idc = 1615;
			//action = "playsound 'beep'; ['B'] spawn ica_fnc_gasolinera;";
			//text = "1"; //--- ToDo: Localize;
			x = 0.33698 * safezoneW + safezoneX;
			y = 0.447222 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1616: CajeroRscButton
		{
			idc = 1616;
			//action = "playsound 'beep'; ['H'] spawn ica_fnc_gasolinera;";
			//text = "7"; //--- ToDo: Localize;
			x = 0.337501 * safezoneW + safezoneX;
			y = 0.378704 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1617: CajeroRscButton
		{
			idc = 1617;
			//action = "playsound 'beep'; ['I'] spawn ica_fnc_gasolinera;";
			//text = "8"; //--- ToDo: Localize;
			x = 0.361458 * safezoneW + safezoneX;
			y = 0.377778 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1618: CajeroRscButton
		{
			idc = 1618;
			//action = "playsound 'beep'; ['J'] spawn ica_fnc_gasolinera;";
			//text = "9"; //--- ToDo: Localize;
			x = 0.386458 * safezoneW + safezoneX;
			y = 0.376852 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////


	};
};