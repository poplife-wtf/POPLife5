
class ada_telefono {
	idd = 8542;
	movingEnable = 1;
	onLoad = "telefonoabierto = true; uiNamespace setVariable ['ada_telefono', _this select 0];";
	onunLoad = "telefonoabierto = false; ocupado = nil;";
	class controlsBackground {};
	class objects {};
	class controls 
	{ 
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Juan Adamuz, v1.063, #Xylobo)
		////////////////////////////////////////////////////////

		class FONDO: RscPicture
		{
			moving = 1;
			idc = 100;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class FONDO_PANTALLA: RscPicture
		{
			idc = 101;
			x = 0.420103 * safezoneW + safezoneX;
			y = 0.275482 * safezoneH + safezoneY;
			w = 0.153646 * safezoneW;
			h = 0.448222 * safezoneH;
		};
		class hora: RscText
		{
			idc = 103;
			type = CT_CENTER;

			x = 0.478447 * safezoneW + safezoneX;
			y = 0.27736 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.0128519 * safezoneH;
		};
		class inicio: TelefonoRscButton
		{
			idc = 102;
			action = "playsound 'a_pulsar'";
			x = 0.477209 * safezoneW + safezoneX;
			y = 0.72176 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.0384443 * safezoneH;
		};

		class app1action: TelefonoRscButton
		{
			idc = 201;
			action = "playsound 'a_pulsar'";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app2action: TelefonoRscButton
		{
			idc = 202;
			action = "playsound 'a_pulsar'";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app3action: TelefonoRscButton
		{
			idc = 203;
			action = "playsound 'a_pulsar'";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app4action: TelefonoRscButton
		{
			idc = 204;
			action = "playsound 'a_pulsar'";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app5action: TelefonoRscButton
		{
			idc = 205;
			action = "playsound 'a_pulsar'";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app6action: TelefonoRscButton
		{
			idc = 206;
			action = "playsound 'a_pulsar'";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app7action: TelefonoRscButton
		{
			idc = 207;
			action = "playsound 'a_pulsar'";
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app8action: TelefonoRscButton
		{
			idc = 208;
			action = "playsound 'a_pulsar'";
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app9action: TelefonoRscButton
		{
			idc = 209;
			action = "playsound 'a_pulsar'";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class app1icon: RscPicture
		{
			idc = 301;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app2icon: RscPicture
		{
			idc = 302;	
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app3icon: RscPicture
		{
			idc = 303;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app4icon: RscPicture
		{
			idc = 304;	
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app5icon: RscPicture
		{
			idc = 305;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app6icon: RscPicture
		{
			idc = 306;	
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app7icon: RscPicture
		{
			idc = 307;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app8icon: RscPicture
		{
			idc = 308;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class app9icon: RscPicture
		{
			idc = 309;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		
		class android_opciones_pantalla: TelefonoRscButton
		{
			idc = 400;
			x = 0.420104 * safezoneW + safezoneX;
			y = 0.368926 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0467778 * safezoneH;
		};
		class android_opciones_sonido: TelefonoRscButton
		{
			idc = 401;
			x = 0.420052 * safezoneW + safezoneX;
			y = 0.41663 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0503703 * safezoneH;
		};
		class android_opciones_atras: TelefonoRscButton
		{
			idc = 402;
			x = 0.420594 * safezoneW + safezoneX;
			y = 0.29276 * safezoneH + safezoneY;
			w = 0.0245834 * safezoneW;
			h = 0.0411112 * safezoneH;
		};
		class lista_fondos_opciones_android: RscCombo
		{
			idc = 403;
			x = 0.426884 * safezoneW + safezoneX;
			y = 0.38714 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class guardar_fondo_android: TelefonoRscButton
		{
			idc = 404;
			text = "Guardar"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class lista_sonidosnotificaciones: RscCombo
		{
			idc = 405;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class lista_sonidosllamadas: RscCombo
		{
			idc = 406;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class num1: TelefonoRscButton
		{
			idc = 500;
			x = 0.439114 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num2: TelefonoRscButton
		{
			idc = 501;
			x = 0.48125 * safezoneW + safezoneX;
			y = 0.492593 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num3: TelefonoRscButton
		{
			idc = 502;
			x = 0.527083 * safezoneW + safezoneX;
			y = 0.491667 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num5: TelefonoRscButton
		{
			idc = 503;
			x = 0.48125 * safezoneW + safezoneX;
			y = 0.536111 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num4: TelefonoRscButton
		{
			idc = 504;
			x = 0.439062 * safezoneW + safezoneX;
			y = 0.536111 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num6: TelefonoRscButton
		{
			idc = 505;
			x = 0.526562 * safezoneW + safezoneX;
			y = 0.536112 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num9: TelefonoRscButton
		{
			idc = 506;
			x = 0.526563 * safezoneW + safezoneX;
			y = 0.579629 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num8: TelefonoRscButton
		{
			idc = 507;
			x = 0.48125 * safezoneW + safezoneX;
			y = 0.580556 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num7: TelefonoRscButton
		{
			idc = 508;
			x = 0.439063 * safezoneW + safezoneX;
			y = 0.580555 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class num0: TelefonoRscButton
		{
			idc = 509;
			x = 0.48125 * safezoneW + safezoneX;
			y = 0.624075 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class Asterisco: TelefonoRscButton
		{
			idc = 510;
			x = 0.439063 * safezoneW + safezoneX;
			y = 0.623149 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class hashtag: TelefonoRscButton
		{
			idc = 511;
			x = 0.526563 * safezoneW + safezoneX;
			y = 0.623149 * safezoneH + safezoneY;
			w = 0.0303125 * safezoneW;
			h = 0.0420371 * safezoneH;
		};
		class btnborrarll: TelefonoRscButton
		{
			idc = 516;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class llamar: TelefonoRscButton
		{
			idc = 512;
			x = 0.482813 * safezoneW + safezoneX;
			y = 0.669444 * safezoneH + safezoneY;
			w = 0.0282812 * safezoneW;
			h = 0.0475926 * safezoneH;
		};
		class numeroentrada: RscText
		{
			idc = 513;
			sizeEx = 0.1;
			colorShadow[] = {0,0,0,0};
			colortext[] = {0,0,0,1};
			type = CT_CENTER;
			x = 0.425208 * safezoneW + safezoneX;
			y = 0.366815 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class textollamada1: RscText
		{
			idc = 514;
			sizeEx = 0.075;
			colorShadow[] = {0,0,0,0};
			colortext[] = {0.01,0.01,0.01,1};
			type = CT_LEFT;
			x = 0.425234 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class textollamada2: RscText
		{
			idc = 515;
			sizeEx = 0.05;
			colorShadow[] = {0,0,0,0};
			colortext[] = {0.05,0.05,0.05,1};
			type = CT_LEFT;
			x = 0.425234 * safezoneW + safezoneX;
			y = 0.33588 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class nuevomensaje: TelefonoRscButton
		{
			idc = 600;
			x = 0.514953 * safezoneW + safezoneX;
			y = 0.29474 * safezoneH + safezoneY;
			w = 0.0195833 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class eliminarmensaje: TelefonoRscButton
		{
			idc = 601;
			x = 0.555687 * safezoneW + safezoneX;
			y = 0.29452 * safezoneH + safezoneY;
			w = 0.018073 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class respondermensaje: TelefonoRscButton
		{
			idc = 602;
			x = 0.534856 * safezoneW + safezoneX;
			y = 0.29452 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class listamensajes: RscListbox
		{
			idc = 603;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,1};
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.385 * safezoneH;
		};
		class mensajetexto: ADAMUZ_RscStructuredText
		{
			idc = 604;
			font = "PuristaMedium";
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,1};
			x = 0.427297 * safezoneW + safezoneX;
			y = 0.33852 * safezoneH + safezoneY;
			w = 0.13974 * safezoneW;
			h = 0.370407 * safezoneH;
		};
		class mensajede: RscText
		{
			idc = 605;
			izeEx = 0.025;
			type = CT_LEFT;
			colortext[] = {1,1,1,1};
			x = 0.438641 * safezoneW + safezoneX;
			y = 0.29452 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		class llamarcontacto: TelefonoRscButton
		{
			idc = 700;
			x = 0.542694 * safezoneW + safezoneX;
			y = 0.62562 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class anadircontacto: TelefonoRscButton
		{
			idc = 701;
			x = 0.542694 * safezoneW + safezoneX;
			y = 0.6705 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class listacontactos: RscListbox
		{
			idc = 702;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,1};
			colorSelect[] = {0, 0, 0, 1};
			colorSelect2[] = { 0, 0, 0, 0.5};
			colorSelectBackground[] = {0, 0, 0.6, 0.25};
			colorSelectBackground2[] = {1, 1, 1, 0};
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.37636 * safezoneH + safezoneY;
			w = 0.117552 * safezoneW;
			h = 0.339148 * safezoneH;
		};
		class nombreaddcontacto: RscEdit
		{
			idc = 800;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,1};
			type = CT_EDIT;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.339519 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class telefonoaddcontacto: RscEdit
		{
			idc = 801;
			colorBackground[] = {0,0,0,0};
			colortext[] = {0,0,0,1};
			type = CT_EDIT;
			x = 0.447917 * safezoneW + safezoneX;
			y = 0.459704 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class guardarcontacto: TelefonoRscButton
		{
			idc = 802;
			x = 0.467499 * safezoneW + safezoneX;
			y = 0.674481 * safezoneH + safezoneY;
			w = 0.050625 * safezoneW;
			h = 0.03 * safezoneH;
		};
		class imagencontacto: RscPicture
		{
			idc = 803;
			x = 0.4505 * safezoneW + safezoneX;
			y = 0.3955 * safezoneH + safezoneY;
			w = 0.0308333 * safezoneW;
			h = 0.0503705 * safezoneH;
		};
		class listaimagen: RscCombo
		{
			idc = 804;
			x = 0.487212 * safezoneW + safezoneX;
			y = 0.3922 * safezoneH + safezoneY;
			w = 0.0638542 * safezoneW;
			h = 0.0201482 * safezoneH;
		};
		
		class tipollamada: RscText
		{
			idc = 900;
			type = CT_LEFT;
			colorBackground[] = {0,0,0,0};
			colortext[] = {1,1,1,1};
			x = 0.423177 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class quienmellama: RscText
		{
			idc = 901;
			type = CT_LEFT;
			colorBackground[] = {0,0,0,0};
			colortext[] = {1,1,1,1};
			x = 0.423177 * safezoneW + safezoneX;
			y = 0.340556 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class numerodelquemellaman: RscText
		{
			idc = 902;
			type = CT_LEFT;
			colorBackground[] = {0,0,0,0};
			colortext[] = {1,1,1,1};
			x = 0.423177 * safezoneW + safezoneX;
			y = 0.378185 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class cogerllamada: TelefonoRscButton
		{
			idc = 903;
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class colgarllamada: TelefonoRscButton
		{
			idc = 904;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class cogerllamadapaso1: TelefonoRscButton
		{
			idc = 905;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class listacontactosmsg: RscCombo
		{
			idc = 1000;
			x = 0.426249 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.143281 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class escribomensaje: RscEdit
		{
			idc = 1001;
			colorBackground[] = {0,0,0,0};
			colortext[] = {1,1,1,1};
			x = 0.425781 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.286 * safezoneH;
		};
		class mandarmsg: TelefonoRscButton
		{
			idc = 1002;
			x = 0.461302 * safezoneW + safezoneX;
			y = 0.664074 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class sonido_si: TelefonoRscButton
		{
			idc = 407;
			x = 0.421831 * safezoneW + safezoneX;
			y = 0.35744 * safezoneH + safezoneY;
			w = 0.151614 * safezoneW;
			h = 0.0456295 * safezoneH;
		};
		class silencio: TelefonoRscButton
		{
			idc = 408;
			x = 0.421934 * safezoneW + safezoneX;
			y = 0.40364 * safezoneH + safezoneY;
			w = 0.151614 * safezoneW;
			h = 0.0456295 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
    };		
};

