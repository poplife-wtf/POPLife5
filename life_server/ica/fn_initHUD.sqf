
/*
CreaHUD por Icaruk
Remaster by AxE.
	0 spawn ica_fnc_initHUD;
*/

waitUntil {player == player};
waitUntil {!isNull player};
waitUntil {!isNil {pop_din}};

disableSerialization;
("hudica" call BIS_fnc_rscLayer) cutRsc ["HUDica","PLAIN", 1, false];


_ui = uiNamespace getVariable "HUDica";

_txtExp = _ui displayCtrl 6010;
	_txtExp ctrlSetTextColor [1, 0.7, 0, 1];
_txt2 = _ui displayCtrl 6014;
	_txt2 ctrlSetTextColor [0.9, 0.9, 0.9, 0.8];
_nombre = _ui displayCtrl 6008;
_color = switch (playerSide) do {
    case west: { "0a328d" };
    case civilian: {"a10ae8"};
    case independent: {"31b304"};
};	
	_nombre ctrlSetStructuredText parseText format ["<t size='1.18' font='PuristaMedium' color='#%2' align='right'>%1</t>", name player,_color];

_pipdown = _ui displayctrl 6022;
_piptop = _ui displayctrl 6023;
_fondo = _ui displayctrl 6015;
_txtExp = _ui displayctrl 6010;
_txt2 = _ui displayctrl 6014;
_separador = _ui displayctrl 6011;
_infolog = _ui displayctrl 6012;
_fondo ctrlShow false;
_piptop ctrlShow false;
_pipdown ctrlShow false;
_txt2 ctrlShow false;	
_separador ctrlShow false;
_infolog ctrlShow false;
_piptop ctrlShow false;
_pipdown ctrlsettext "\AxE\textures\pipdown.paa";
_separador ctrlShow false;

ica_fnc_actualizaHUD = life_fnc_hudUpdate;



ica_fnc_HUDvisible = {
	_param = param [0];
	_fade = if (_param) then {0} else {1};
	
	_ui = uiNamespace getVariable "HUDica";
	
	{
		if ((ctrlClassName _x) != "watermark") then {
			_x ctrlSetFade _fade;
			_x ctrlCommit 2;
		};
	} forEach allControls _ui;
	
	showHUD _param;
	
	ocultandoHUD = !ocultandoHUD;
};

[] call life_fnc_hudUpdate;



[] spawn
{
    private ["_dam"];
    for "_i" from 0 to 1 step 0 do {
        _dam = damage player;
        waitUntil {!((damage player) isEqualTo _dam)};
        [] call life_fnc_hudUpdate;
    };
};

