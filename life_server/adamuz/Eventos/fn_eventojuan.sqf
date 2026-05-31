/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Eventos POP4

["M", name player] spawn ica_fnc_eventojuan;

*/

ada_fnc_lanzarcohetes = 
{
	_pos = _this select 0;
	_veloc = _this select 1;
	_nul = 'CMflare_Chaff_Ammo' createvehiclelocal  _pos;  
	_nul setVelocity _veloc; 
	_launchSound = ['fluier1','fluier2','fluier3','fluier4','fluier5','fluier6','fluier7'] call BIS_fnc_selectRandom;
	_nul say3D _launchsound;
	_a = random 1; 
	_b = random 1; 
	_c = random 1; 
	_luz = '#lightpoint' createVehiclelocal  _pos; 
	_luz lightAttachObject  [_nul, [0,0,0]];
	_luz setLightBrightness 5; 
	_luz setLightUseFlare true; 
	_luz setLightAmbient [_a, _b, _c]; 
	_luz setLightColor [_a, _b, _c]; 
	
	sleep 4.9;
	if (!isnull _nul) then {deletevehicle _nul};
	deletevehicle _luz;
};

ada_fnc_LanzarFuegos = 
{
	_lanzador = _this select 0;

	_h = _this select 1; 	
	_ro = _this select 2;
	_ve = _this select 3;
	_bl = _this select 4;

	_firsound = ['firework1','firework2','firework3'] call BIS_fnc_selectRandom;
	_firflut = ['fluier1','fluier2','fluier3','fluier4','fluier5','fluier6','fluier7'] call BIS_fnc_selectRandom;

	_explotador = 'xcam_wood_invisiramp2m15' createvehiclelocal [(getpos _lanzador) select 0, (getpos _lanzador) select 1, _h];

	if (!(_ro==0) and !(_ve==0) and !(_bl==0)) exitWith 
	{
		_lanzador say3D _firflut;
		_nul1 = 'CMflare_Chaff_Ammo' createvehiclelocal [(getpos _lanzador) select 0,(getpos _lanzador) select 1, (getpos _lanzador) select 2];  
		_nul1 setVelocity [(random 10) -5,(random 10)-5, 300]; 
		
		sleep 3;
		_sparks_handler = [_explotador,_ro,_ve,_bl, _h] execvm 'ALfireworks\alias_sparks.sqf';
		
		sleep 0.5;
		
		_nul = [_explotador,_ro,_ve,_bl, _h] execvm 'ALfireworks\alias_lumina.sqf';
			
		waitUntil {scriptDone _sparks_handler};

		_explotador say3D _firsound;	
	};
	["K"] remoteExec ["ica_fnc_eventojuan", -2];
};

ada_fnc_Luces = 
{
	_color = _this select 1;
	_posluz = _this  select 0;			
	_lolx = '#lightpoint' createVehiclelocal _posluz;
	_lolx setLightBrightness 8.5;
	_lolx setLightDayLight true;
	_lolx setLightAmbient _color;
	_lolx setLightColor _color;	

	_bri = 8.5;	
	while {_bri>0} do {
	_lolx setLightBrightness _bri;
	_bri = _bri - 1;
	sleep 0.05;
	};
	deleteVehicle _lolx;
};


_tipo = _this select 0;
_organizador = _this select 1; 

_velocidad = missionnamespace getvariable ["velocidadluzeventojuan", 0.5];
((uiNamespace getVariable "evento_juan") displayCtrl 12414) ctrlSetText str(_velocidad);
disableserialization;

switch (_tipo) do {

    case "A": //ON
	{ 
		if ((missionnamespace getvariable ["adashowluces", false])) exitWith {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>¡Las luces ya están activadas!<br/><t color='#FFFFFF' size='1.5'>"]}};
		missionnamespace setvariable ["adashowluces", true];

		while {(missionnamespace getvariable "adashowluces")} do
		{
			missionnamespace setvariable ["posicionslidereventojuan", (sliderPosition 18412)]
			sliderSetRange [18412, 0.15, 1];
			sliderSetPosition [18412, (missionnamespace getvariable "posicionslidereventojuan")];
			_ro = random 1;
			_ve = random 1;
			_bl = random 1;
			_nul = [[8667.99,7170.89,1.91254], [_ro, _ve, _bl]] spawn ada_fnc_Luces; 
			_velocidad = missionnamespace getvariable ["velocidadluzeventojuan", 0.5];
			if (_velocidad < 0.15) then {sleep 0.5} else {sleep _velocidad};
			((uiNamespace getVariable "evento_juan") displayCtrl 1201) ctrlSetText ("#(argb,8,8,3)color(0,0.5,0,1)");
			((uiNamespace getVariable "evento_juan") displayCtrl 12414) ctrlSetText str(_velocidad);
		};
		sleep 0.5;
		sliderSetPosition [18412, 0.5];	
		((uiNamespace getVariable "evento_juan") displayCtrl 1201) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");

	};
	
    case "B": 
	{
		if (!(missionnamespace getvariable ["adashowluces", false])) exitWith {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>Las luces ya estan desactivadas. Activalas primero...<br/><t color='#FFFFFF' size='1.5'>"]}};
		missionnamespace setvariable ["adashowluces", false];
		((uiNamespace getVariable "evento_juan") displayCtrl 1201) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");
	};
	
    case "C": //FL1
	{
		if ((missionnamespace Getvariable ["adashowflash", false])) exitWith {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>¡El Flash ya esta activo! Espera unos segundos para volver a utilizarlo.<br/><t color='#FFFFFF' size='1.5'>"]}}; 
					
		missionnamespace setvariable ["adashowflash", true];
		
		_flash = 5;
		while {_flash > 0} do
		{
			_nul = [[8667.99,7170.89,1.91254], [1,1,1]] spawn ada_fnc_Luces;  
			_flash = _flash - 1;
			((uiNamespace getVariable "evento_juan") displayCtrl 1202) ctrlSetText ("#(argb,8,8,3)color(0,0.5,0,1)");
			sleep 0.15;
		};
		sleep 1;
		missionnamespace setvariable ["adashowflash", false];
		((uiNamespace getVariable "evento_juan") displayCtrl 1202) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");	
	};
	
	case "D": //MUSICA ON
	{		
		if (!(missionnamespace Getvariable ["adamusica", false])) then
		{
			missionnamespace setvariable ["adamusica", true];
			Altavoces = "xcam_wood_invisiramp2m15" createvehiclelocal [8664,7163,0.987];
			Altavoces say3D "setJuan";
			while {(missionnamespace Getvariable "adamusica")} do {((uiNamespace getVariable "evento_juan") displayCtrl 1203) ctrlSetText ("#(argb,8,8,3)color(0,0.5,0,1)")};
			((uiNamespace getVariable "evento_juan") displayCtrl 1203) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");

		} else {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>La musica ya esta activada.<br/><t color='#FFFFFF' size='1.5'>"]}};
	};
	
	case "E": //Musica OFF
	{		
		if ((missionnamespace Getvariable ["adamusica", false])) then
		{
			missionnamespace setvariable ["adamusica", false];
			if (!isnull Altavoces) then {deletevehicle Altavoces};
			((uiNamespace getVariable "evento_juan") displayCtrl 1203) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");
		} else {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>La musica ya esta desactivada.<br/><t color='#FFFFFF' size='1.5'>"]}};
	};
	
	case "F": //Auto
	{		
		if ((missionnamespace getvariable ["isFoco", false])) then 
		{
			missionnamespace setvariable ["isFoco", false];
			if (!isnull FocoLuz) then {deletevehicle FocoLuz};
			while {!(missionnamespace getvariable "isFoco")} do {((uiNamespace getVariable "evento_juan") displayCtrl 1204) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)")};
		} 
		else
		{
			missionnamespace setvariable ["isFoco", true];
			FocoLuz = "#lightpoint" createvehiclelocal [8716,7219,1.44];
			FocoLuz setlightbrightness 25;
			FocoLuz setlightcolor [1,1,1];
			FocoLuz setlightambient [1,1,1];
			while {(missionnamespace getvariable "isFoco")} do {((uiNamespace getVariable "evento_juan") displayCtrl 1204) ctrlSetText ("#(argb,8,8,3)color(0,0.5,0,1)")};	
		};		
	};
	
	case "G": //SMK
	{		
		if ((missionnamespace Getvariable ["SMK", false])) exitWith {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>¡El humo ha sido activado recientemente! Espera un tiempo para volver a activarlo.<br/><t color='#FFFFFF' size='1.5'>"]}};
			
		missionnamespace setvariable ["SMK", true];			
		_smk1 = "SmokeShellRed";
		_smk2 = "SmokeShellGreen";
		_smk3 = "SmokeShellYellow";
		_smk4 = "SmokeShellPurple";
		_smk5 = "SmokeShellBlue";
		_smk6 = "SmokeShellOrange";

		_humillo = [_smk1,_smk2,_smk3,_smk4,_smk5,_smk6] call BIS_fnc_selectRandom;

		Dust = _humillo createvehiclelocal [8667.57,7170.44,1.91279]; 

		while {!isnull Dust} do
		{
			((uiNamespace getVariable "evento_juan") displayCtrl 1205) ctrlSetText ("#(argb,8,8,3)color(0,0.5,0,1)");
			sleep 1;
		};
		sleep 10;
		((uiNamespace getVariable "evento_juan") displayCtrl 1205) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");
		if (!isnull Dust) then {deletevehicle Dust};
		missionnamespace setvariable ["SMK", false];	
	};
	
	case "H": //FSK1
	{
		if ((missionnamespace Getvariable ["FSK", false])) exitWith {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>Has lanzado cohetes recientemente. Espera un poco para volver a lanzarlos.<br/><t color='#FFFFFF' size='1.5'>"]}};

		missionnamespace setvariable ["FSK", true];	
		_vel = [(random 10) -5,(random 10)-5, 300];		
		[[8669.433, 7199.87, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8694.656, 7185.888, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8714.602, 7164.465, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8721.754, 7136.275, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8717.244, 7106.923, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8701.980, 7082.167, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8678.792, 7064.592, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8650.213, 7057.573, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8622.076, 7063.824, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8596.802, 7077.054, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8579.319, 7100.146, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8571.972, 7127.97, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8576.763, 7156.851, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8591.691, 7182.1, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8614.569, 7199.455, 21], _vel] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8643.123, 7205.651, 21], _vel] spawn ada_fnc_lanzarcohetes;  
		sleep 5;
		missionnamespace setvariable ["FSK", false];			
	};
	
	case "I": //FSK2
	{			
		if ((missionnamespace Getvariable ["FSK", false])) exitWith {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>Has lanzado cohetes recientemente. Espera un poco para volver a lanzarlos.<br/><t color='#FFFFFF' size='1.5'>"];}};

		missionnamespace setvariable ["FSK", true];	
		_vel2 = [(random 10) -5,(random 10)-5, 300];		
		[[8669.433, 7199.87, 21], _vel2] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8643.123, 7205.651, 21], _vel2] spawn ada_fnc_lanzarcohetes;  
		sleep 0.15;
		[[8694.656, 7185.888, 21], _vel2] spawn ada_fnc_lanzarcohetes;  
		sleep 0.15;
		[[8614.569, 7199.455, 21], _vel2] spawn ada_fnc_lanzarcohetes; 
		sleep 0.15;
		[[8714.602, 7164.465, 21], _vel2] spawn ada_fnc_lanzarcohetes; 
		sleep 0.15;
		[[8591.691, 7182.1, 21], _vel2] spawn ada_fnc_lanzarcohetes;  
		sleep 0.15;
		[[8721.754, 7136.275, 21], _vel2] spawn ada_fnc_lanzarcohetes;  
		sleep 0.15;
		[[8576.763, 7156.851, 21], _vel2] spawn ada_fnc_lanzarcohetes;  
		sleep 0.15;
		[[8717.244, 7106.923, 21], _vel2] spawn ada_fnc_lanzarcohetes;  
		sleep 0.15;
		[[8571.972, 7127.97, 21], _vel2] spawn ada_fnc_lanzarcohetes; 
		sleep 0.15;
		[[8701.980, 7082.167, 21], _vel2] spawn ada_fnc_lanzarcohetes; 
		sleep 0.15;
		[[8579.319, 7100.146, 21], _vel2] spawn ada_fnc_lanzarcohetes; 
		sleep 0.15;
		[[8678.792, 7064.592, 21], _vel2] spawn ada_fnc_lanzarcohetes; 
		sleep 0.15;
		[[8596.802, 7077.054, 21], _vel2] spawn ada_fnc_lanzarcohetes; 
		sleep 0.15;
		[[8650.213, 7057.573, 21], _vel2] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		[[8622.076, 7063.824, 21], _vel2] spawn ada_fnc_lanzarcohetes;
		sleep 0.15;
		sleep 5;
		missionnamespace setvariable ["FSK", false];
	};
	
	case "J": //FSK3
	{		  
		if ((missionnamespace Getvariable ["FSK3", false])) exitWith {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>Has lanzado bengalas recientemente. Espera un poco para volver a lanzarlas.<br/><t color='#FFFFFF' size='1.5'>"]}};
		_a = random 1; 
		_b = random 1; 
		_c = random 1;
		missionnamespace setvariable ["FSK3", true];	

	    _f1 = 'CMflare_Chaff_Ammo' createVehiclelocal [8657.55,7165.3,0.0160842];  
		_f1 setVelocity [0,0,15]; 	
		_f1 say3d "fluier5";
		 
		_f2 = 'CMflare_Chaff_Ammo' createVehiclelocal [8663.79,7162.85,0.0160842];  
		_f2 setVelocity [0,0,15];
		_luz2 = "#lightpoint" createVehiclelocal  (position _f2); 
		_luz2 lightAttachObject  [_f2, [0,0,0]];
		_luz2 setLightBrightness 3; 
		_luz2 setLightUseFlare true; 
		_luz2 setLightAmbient [_a, _b, _c]; 
		_luz2 setLightColor [_a, _b, _c]; 		
		_f2 say3d "fluier5";
		 
		_f3 = 'CMflare_Chaff_Ammo' createVehiclelocal [8669.31,7159.84,0.0160842];  
		_f3 setVelocity [0,0,15];		
		_f3 say3d "fluier5";
		sleep 1;  
		if (!isnull _f1) then {deletevehicle _f1};
		if (!isnull _f2) then {deletevehicle _f2};
		if (!isnull _f3) then {deletevehicle _f3}; 
		deletevehicle _luz2;
		sleep 4;
		missionnamespace setvariable ["FSK3", false];
	};
	
	case "K": //FKSCLK
	{
		if ((missionnamespace Getvariable ["FSKCLK", false])) exitWith {if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>Has lanzado fuegos artificiales recientemente. Espera un poco para volver a lanzarlos.<br/><t color='#FFFFFF' size='1.5'>"];}};

		missionnamespace setvariable ["FSKCLK", true];
		Launcher1 = "xcam_wood_invisiramp2m15" createvehiclelocal [8637.317, 7180.84, 1.607];
		Launcher2 = "xcam_wood_invisiramp2m15" createvehiclelocal [8668.504, 7175.029, 1.607];
		Launcher3 = "xcam_wood_invisiramp2m15" createvehiclelocal [8691.869, 7152.669, 1.607]; 
		
		_h = 200 + (random 100); 	
		_ro = random 1;
		_ve = random 1;
		_bl = random 1;
		_artif = [Launcher1, _h, _ro, _ve, _bl] spawn ada_fnc_LanzarFuegos;
		
		sleep 0.5;
		
		_h2 = 200 + (random 100); 	
		_ro2 = random 1;
		_ve2 = random 1;
		_bl2 = random 1;
		_artif2 = [Launcher2, _h2, _ro2, _ve2, _bl2] spawn ada_fnc_LanzarFuegos;
		
		sleep 0.5;
		
		_h3 = 200 + (random 100); 	
		_ro3 = random 1;
		_ve3 = random 1;
		_bl3 = random 1;
		_artif3 = [Launcher3, _h2, _ro2, _ve2, _bl2] spawn ada_fnc_LanzarFuegos;
		sleep 3.6;
		
		if (!isnull Launcher1) then {deletevehicle Launcher1};
		if (!isnull Launcher2) then {deletevehicle Launcher2};
		if (!isnull Launcher3) then {deletevehicle Launcher3};
		sleep 5;
		missionnamespace setvariable ["FSKCLK", false];		
	};
	
	case "L": //EMGSTOP
	{
		if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>¡Has presionado el boton de EMERGENCIA!<br/><t color='#FFFFFF' size='1.5'>"]};      

		missionnamespace setvariable ["adashowluces", false];
		missionnamespace setvariable ["adashowflash", false];
		missionnamespace setvariable ["isFoco", false];
		missionnamespace setvariable ["adamusica", false];
		missionnamespace setvariable ["SMK", false];
		missionnamespace setvariable ["FSK", false];
		missionnamespace setvariable ["FSKCLK", false];
		missionnamespace setvariable ["FSK3", false];
		
		((uiNamespace getVariable "evento_juan") displayCtrl 1201) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");	
		((uiNamespace getVariable "evento_juan") displayCtrl 1202) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");
		((uiNamespace getVariable "evento_juan") displayCtrl 1203) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");
		((uiNamespace getVariable "evento_juan") displayCtrl 1204) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");
		((uiNamespace getVariable "evento_juan") displayCtrl 1205) ctrlSetText ("#(argb,8,8,3)color(1,0,0,1)");

		if (!isnull Altavoces) then {deletevehicle Altavoces};
		if (!isnull FocoLuz) then {deletevehicle FocoLuz};
		if (!isnull Dust) then {deletevehicle Dust};
		if (!isnull Launcher1) then {deletevehicle Launcher1};
		if (!isnull Launcher2) then {deletevehicle Launcher2};
		if (!isnull Launcher3) then {deletevehicle Launcher3};
	};
	
	case "M": //INICIO 
	{
		if (_organizador != (name player)) exitWith {};
		createDialog "eventojuan";
		sliderSetPosition [18412, 0.5];		
		if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>PANEL DE CONTROL DE EVENTOS ~ADAMUZ SYSTEMS~ ACTIVADO!</t><br/>"]}; 
	};
	
	case "N":
	{
		_velocidad = missionnamespace getvariable ["velocidadluzeventojuan", 0.5];
		_velocidad = _velocidad + 0.15;
		if (_velocidad < 0.15) then {_velocidad = 0.15; if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>¡La luz ya está a la minima velocidad!<br/><t color='#FFFFFF' size='1.5'>"]}};
		if (_velocidad > 1) then {_velocidad = 1; if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>¡La luz ya está a la minima velocidad!<br/><t color='#FFFFFF' size='1.5'>"]}};
		missionnamespace setvariable ["velocidadluzeventojuan", _velocidad];
		((uiNamespace getVariable "evento_juan") displayCtrl 12414) ctrlSetText str(_velocidad);
	};

	case "O":
	{
		_velocidad = missionnamespace getvariable ["velocidadluzeventojuan", 0.5];
		_velocidad = _velocidad - 0.15;
		if (_velocidad < 0.15) then {_velocidad = 0.15; if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>¡La luz ya está a la minima velocidad!<br/><t color='#FFFFFF' size='1.5'>"]}};
		if (_velocidad > 1) then {_velocidad = 1; if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS</t> <br/><t color='#e7ad3e' size='2'></t>¡La luz ya está a la maxima velocidad!<br/><t color='#FFFFFF' size='1.5'>"]}};
		missionnamespace setvariable ["velocidadluzeventojuan", _velocidad];
		((uiNamespace getVariable "evento_juan") displayCtrl 12414) ctrlSetText str(_velocidad);
	};
	
    default 
	{
		if (_organizador == (name player)) then {hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#7F0000'>ADAMUZ SYSTEMS ERROR</t><br/>"]};      
	};
};