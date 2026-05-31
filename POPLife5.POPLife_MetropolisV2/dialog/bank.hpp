class Life_atm_management {
	idd = 1997;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['cajero_dinero', _this select 0];";
	class controlsBackground {};
	class objects {};
	class controls { 
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Jutovo)
		////////////////////////////////////////////////////////
		
		// "CajeroRscButton" Se declara en RAIZ/dialogs/defines.hpp
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "pop_iconos\icons\banco\pantallacajero.paa";
			x = -0.000156274 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 1.012 * safezoneH;
		};
		/*
		class RscPicture_1996: RscPicture
		{
			idc = 1996;
			text = "pop_iconos\icons\banco\cajerohack.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		*/
		class RscPicture_1999: RscPicture
		{
			idc = 1999;
			text = "pop_iconos\icons\banco\espere.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		
		class RscPicture_1996: RscPicture
		{
			idc = 1996;
			text = "pop_iconos\icons\banco\cajerohack.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		
		class RscPicture_1997: RscPicture
		{
			idc = 1997;
			text = "pop_iconos\icons\banco\finalingreso.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
				
		class RscPicture_1998: RscPicture
		{
			idc = 1998;
			text = "pop_iconos\icons\banco\final.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class RscPicture_1202: RscPicture
		{
			idc = 1202;
			text = "pop_iconos\icons\banco\dinerobiulletess.paa";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.106296 * safezoneH;
		};
		class PANTALLA0: RscPicture
		{
			idc = 1201;
			text = "axex\pantallacajero.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class PANTALLA1: RscPicture
		{
			idc = 1203;
			text = "pop_iconos\icons\banco\retirar.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class PANTALLA2: RscPicture
		{
			idc = 1204;
			text = "pop_iconos\icons\banco\depositar.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class PANTALLA3: RscPicture
		{
			idc = 1205;
			text = "pop_iconos\icons\banco\saldo.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		
		class PANTALLA4: RscPicture
		{
			idc = 1206;
			text = "pop_iconos\icons\banco\transferir.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class PANTALLAMAFIA: RscPicture
		{
			idc = 1207;
			text = "axex\mafia.paa";
			x = 0.283438 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.341 * safezoneH;
		};
		class 1i: CajeroRscButton
		{
		action = "playsound 'beep'; [1] call ica_fnc_cajeroMenus ;";
			idc = 1600;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 2i: CajeroRscButton
		{
		action = "playsound 'beep'; [2] call ica_fnc_cajeroMenus ;";
			idc = 1601;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 3i: CajeroRscButton
		{
		action = "playsound 'beep'; [3] call ica_fnc_cajeroMenus ;";
			idc = 1602;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 4i: CajeroRscButton
		{
		action = "playsound 'beep'; [4] call ica_fnc_cajeroMenus ;";
			idc = 1603;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 1d: CajeroRscButton
		{
		action = "playsound 'beep';";
			idc = 1604;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 2D: CajeroRscButton
		{
		action = "playsound 'beep';";
			idc = 1605;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 3d: CajeroRscButton
		{
		action = "playsound 'beep';";
			idc = 1606;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 4d: CajeroRscButton
		{
			action = "playsound 'beep'; [0] call ica_fnc_cajeroMenus ;";
			idc = 1607;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		
		class 4d2: CajeroRscButton
		{
		action = "playsound 'beep'; ['mafia'] call ica_fnc_cajeroMenus ;";
			idc = 16008;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Enter: CajeroRscButton
		{
		action = "playsound 'beep';";
			idc = 11;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Enter1: CajeroRscButton
		{
		action = "playsound 'beep'; ['enter1'] call ica_fnc_cajeroMenus ;";
			idc = 1608;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Enter2: CajeroRscButton
		{
		action = "playsound 'beep'; ['enter2'] call ica_fnc_cajeroMenus ;";
			idc = 8;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Enter3: CajeroRscButton
		{
		action = "playsound 'beep';";
			idc = 9;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class Enter4: CajeroRscButton
		{
			action = "playsound 'beep'; TempDialogSelected = (lbCurSel 1624); ['enter4'] call ica_fnc_cajeroMenus; [TempDialogSelected] call life_fnc_bankTransfer";
			idc = 10;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class CLEAR: CajeroRscButton
		{
		action = "playsound 'beep'; ['clear'] call ica_fnc_cajeroMenus ;";
			idc = 1609;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class CANCEL: CajeroRscButton
		{
		action = "playsound 'beep'; ['clear'] call ica_fnc_cajeroMenus ;";
			idc = 1610;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 1: CajeroRscButton
		{
		action = "playsound 'beep'; ['num1'] call ica_fnc_cajeroMenus ;";
			idc = 1611;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 2: CajeroRscButton
		{
		action = "playsound 'beep'; ['num2'] call ica_fnc_cajeroMenus ;";
			idc = 1612;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 3: CajeroRscButton
		{
		action = "playsound 'beep'; ['num3'] call ica_fnc_cajeroMenus ;";
			idc = 1613;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 4: CajeroRscButton
		{
		action = "playsound 'beep'; ['num4'] call ica_fnc_cajeroMenus ;";
			idc = 1614;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 5: CajeroRscButton
		{
		action = "playsound 'beep'; ['num5'] call ica_fnc_cajeroMenus ;";
			idc = 1615;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 6: CajeroRscButton
		{
		action = "playsound 'beep'; ['num6'] call ica_fnc_cajeroMenus ;";
			idc = 1616;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.83 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class 9: CajeroRscButton
		{
		action = "playsound 'beep'; ['num9'] call ica_fnc_cajeroMenus ;";
			idc = 1617;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class 8: CajeroRscButton
		{
		action = "playsound 'beep'; ['num8'] call ica_fnc_cajeroMenus ;";
			idc = 1618;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class 7: CajeroRscButton
		{
		action = "playsound 'beep'; ['num7'] call ica_fnc_cajeroMenus ;";
			idc = 1619;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.874 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class 0: CajeroRscButton
		{
		action = "playsound 'beep'; ['num0'] call ica_fnc_cajeroMenus ;";
			idc = 1620;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.929 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class TARJETA: CajeroRscButton
		{
		//action = "hint 'Coger Tarjeta';";
			idc = 1622;
			x = 0.840313 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class PILLARDINERO: CajeroRscButton
		{
			
			action = "['retirardinero'] call ica_fnc_cajeroMenus ;";
			idc = 1621;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.11 * safezoneH;
		};
		
		class PERSONAS: Life_RscListBox
		{		
			idc = 1624;
			sizeEx = 0.035;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.33214 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.099 * safezoneH;
		};
		/*
		class PERSONAS: RscCombo
		{
			idc = 1624;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.33214 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.022 * safezoneH;
		};
		*/
		class INPUTDINERO: RscText
		{
			colorText[] = {0,0,0,1};
			style = ST_CENTER;
			idc = 1623;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.28638 * safezoneH + safezoneY;
			w = 0.201146 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
				
		//MAFIAS
		
		class Ingresomafia: CajeroRscButton
		{
			action = "playsound 'beep'; ['mafiain'] call ica_fnc_cajeroMenus ;";
			idc = 1724;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.11 * safezoneH;
		};
		
		class sacomafia: CajeroRscButton
		{
			action = "playsound 'beep'; ['mafiaout'] call ica_fnc_cajeroMenus ;";
			idc = 1725;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.11 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};