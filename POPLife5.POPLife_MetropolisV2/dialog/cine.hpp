/* Creado por Rosen para cine */
class cine
{
	idd = 4110;
	movingEnable = 1;
	duration = 1e+011;
	fadein = 0;
	fadeout = 1;
	onload = "uinamespace setvariable ['cine',_this select 0];";
	class controls
	{
		class pantalla: RscPicture
		{
			idc = 4111;
			text = "";
			x = "safezoneX";
			y = "safezoneY";
			w = "1280";
			h = "720";
			autoplay = 1;
			loops = 1;
		};
	};
};