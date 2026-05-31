
/*

By AxE.

Madre mia que alguien me coja porq 
la estoy sacando del estadio ... he dicho.

true call ica_fnc_hudSwitch; -> extendido con camara
false call ica_fnc_hudSwitch; -> solo barras verticales

Vertical = - 0.053.

*/
disableSerialization;
_dialogo = uinamespace getvariable "HUDica";

_vida_imagen = _dialogo displayctrl 6016;
_comida_imagen = _dialogo displayctrl 6017;
_bebida_imagen = _dialogo displayctrl 6018;
_bebida_bar = _dialogo displayctrl 6002;
_comida_bar = _dialogo displayctrl 6003;
_vida_bar = _dialogo displayctrl 6001;
_exp_imagen = _dialogo displayctrl 6019; 
_exp_bar = _dialogo displayctrl 6006;
_comfort_bar = _dialogo displayctrl 6005;
_comfort_image = _dialogo displayctrl 6020;
_nombre = _dialogo displayctrl 6008;
_dinero = _dialogo displayctrl 6009;
_txtExp = _dialogo displayctrl 6010;
_txt2 = _dialogo displayctrl 6014;
_separador = _dialogo displayctrl 6011;
_sombrainfolog = _dialogo displayctrl 6013;
_infolog = _dialogo displayctrl 6012;
_fondo = _dialogo displayctrl 6015;
_pipdown = _dialogo displayctrl 6022;
_piptop = _dialogo displayctrl 6023;



if (estadoHud) then {

	_vida_imagen ctrlSetPosition [0.891875 * safezoneW + safezoneX, 0.8278 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_comida_imagen ctrlSetPosition [0.845469 * safezoneW + safezoneX, 0.9312 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_bebida_imagen ctrlSetPosition [0.859906 * safezoneW + safezoneX, 0.8674 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_bebida_bar ctrlSetPosition [0.859906 * safezoneW + safezoneX, 0.8674 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_comida_bar ctrlSetPosition [0.845469 * safezoneW + safezoneX, 0.9312 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_vida_bar ctrlSetPosition [0.891875 * safezoneW + safezoneX, 0.8278 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_exp_imagen ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.841 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_exp_bar ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.841 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_comfort_bar ctrlSetPosition [0.932094 * safezoneW + safezoneX, 0.8168 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_comfort_image ctrlSetPosition [0.932094 * safezoneW + safezoneX, 0.8168 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH];
	_nombre ctrlSetPosition [0.89 * safezoneW + safezoneX, 0.74 * safezoneH + safezoneY, 0.1059375 * safezoneW, 0.04 * safezoneH];
	_dinero ctrlSetPosition [0.89 * safezoneW + safezoneX, 0.765 * safezoneH + safezoneY, 0.1059375 * safezoneW, 0.04 * safezoneH];
	_txtExp ctrlSetPosition [0.828 * safezoneW + safezoneX, 0.785 * safezoneH + safezoneY, 0.1059375 * safezoneW, 0.04 * safezoneH];
	_txt2 ctrlSetPosition [0.874 * safezoneW + safezoneX, 0.785 * safezoneH + safezoneY, 0.1259375 * safezoneW, 0.04 * safezoneH];
	
	_fondo ctrlShow true;
	_piptop ctrlShow true;
	_pipdown ctrlShow true;
	_txt2 ctrlShow true;	
	_separador ctrlShow true;
	_infolog ctrlShow true;
	_separador ctrlShow false;
		
		
	{_x ctrlSetFade 0.5;_x ctrlCommit 2} forEach [_vida_imagen,_comida_imagen,_bebida_imagen,_bebida_bar,_comida_bar,_vida_bar,_exp_imagen,_exp_bar,_comfort_bar,_comfort_image,_nombre,_dinero];
	{_x ctrlSetFade 0;_x ctrlCommit 1} forEach [_vida_imagen,_comida_imagen,_bebida_imagen,_bebida_bar,_comida_bar,_vida_bar,_exp_imagen,_exp_bar,_comfort_bar,_comfort_image,_nombre,_dinero,_fondo,_piptop,_pipdown,_txtExp,_txt2,_separador,_sombrainfolog,_infolog];

	if (isNil "cam_hud") then {
	
	cam_hud = "camera" camcreate [0,0,0];
	cam_hud cameraEffect ["Internal", "Back", "camarahud"];
	
	} else {
	
		if (isNull cam_hud) then {
		
			cam_hud = "camera" camcreate [0,0,0];
			cam_hud cameraEffect ["Internal", "Back", "camarahud"];
		
		};
	
	};
	camaraHud = true;
	[] spawn {
		while {camaraHud} do {
			cam_hud camSetTarget player; 
			cam_hud camSetRelPos [0, 0.35, 1.72];
			cam_hud camcommit 0.5;
			sleep 0.5;
		};	
	};
	
	_pipdown ctrlsettext "#(argb,512,512,1)r2t(camarahud,1)";
	

	estadoHud = false;

} else {


	_vida_imagen ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.824 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_comida_imagen ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.93 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_bebida_imagen ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.877 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_bebida_bar ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.877 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_comida_bar ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.93 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_vida_bar ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.824 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_exp_imagen ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.718 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_exp_bar ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.718 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_comfort_bar ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.771 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_comfort_image ctrlSetPosition [0.969219 * safezoneW + safezoneX, 0.771 * safezoneH + safezoneY, 0.0309375 * safezoneW, 0.055 * safezoneH]; 
	_nombre ctrlSetPosition [0.865 * safezoneW + safezoneX, 0.95 * safezoneH + safezoneY, 0.1059375 * safezoneW, 0.04 * safezoneH];
	_dinero ctrlSetPosition [0.90 * safezoneW + safezoneX, 0.93 * safezoneH + safezoneY, 0.0709375 * safezoneW, 0.02 * safezoneH]; 
	

	{_x ctrlSetFade 1;_x ctrlCommit 2} forEach [_vida_imagen,_comida_imagen,_bebida_imagen,_bebida_bar,_comida_bar,_vida_bar,_exp_imagen,_exp_bar,_comfort_bar,_comfort_image,_nombre,_dinero,_fondo,_piptop,_pipdown,_txtExp,_txt2,_separador,_sombrainfolog,_infolog];
	{_x ctrlSetFade 0;_x ctrlCommit 1} forEach [_vida_imagen,_comida_imagen,_bebida_imagen,_bebida_bar,_comida_bar,_vida_bar,_exp_imagen,_exp_bar,_comfort_bar,_comfort_image,_nombre,_dinero];

	_fondo ctrlShow false;
	_txt2 ctrlShow false;	
	_separador ctrlShow false;	
	_infolog ctrlShow false;
	_piptop ctrlShow false;
	_pipdown ctrlsettext "\AxE\textures\pipdown.paa";
	_pipdown ctrlShow false;	
	_separador ctrlShow false;

	if (!isNil "cam_hud" && !isNull cam_hud) then {
	cam_hud cameraeffect ["terminate", "back"];
	camdestroy cam_hud;
	};
	
	
	camaraHud = false;
	estadoHud = true;
};