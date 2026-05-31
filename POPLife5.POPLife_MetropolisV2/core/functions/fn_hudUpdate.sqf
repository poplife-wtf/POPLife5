
/*
    File: fn_hudUpdate.sqf
    Author: AxE


*/

/*if (isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(2200) progressSetPosition (life_hunger / 100);
LIFEctrl(2201) progressSetPosition (1 - (damage player));
LIFEctrl(2202) progressSetPosition (life_thirst / 100);
*/

disableSerialization;
	_ui = uiNamespace getVariable ["HUDica",displayNull];

if !(isNull _ui) then {



	_txtLvl = _ui displayCtrl 6010;
	_txt2 = _ui displayCtrl 6014;
	_nombre = _ui displayCtrl 6008;
	_dinero = _ui displayCtrl 6009;
	
	_vida = ceil linearConversion[ 0, 100, (player getvariable ["ace_medical_bloodVolume",100]), 1, 45, true ];
	_fatiga = ceil linearConversion[ 0, 1, ( 1 - getFatigue player ), 1, 45, true ];
	_comida = ceil linearConversion[ 0, 100, life_hunger, 1, 45, true ];
	_bebida = ceil linearConversion[ 0, 100, life_thirst, 1, 45, true ];
	_exp = ceil linearConversion[ "%-" call ica_fnc_expToLevel, "%+" call ica_fnc_expToLevel, experiencia select 0, 1, 45, true ];
	
	
	{
		_x params[ "_idc", "_text" ];
		
		_ctrl = _ui displayCtrl _idc;
		if !( ctrlText _ctrl == _text ) then {
			_ctrl ctrlSetText _text;
		};
	}forEach [

		[ 6001, format ["\AxE\textures\sangrebar_%1.paa",_vida] ],
		[ 6003, format ["\AxE\textures\comibar_%1.paa",_comida] ],
		[ 6002, format ["\AxE\textures\aguabar_%1.paa",_bebida] ],
		[ 6006, format ["\AxE\textures\expbar_%1.paa",_exp] ],
		[ 6005, format ["\AxE\textures\comfbar_%1.paa",_fatiga] ]
	];	
	
	
	_txtLvl ctrlSetText format ["   Nivel %1", [] call ica_fnc_expToLevel];
	_txt2 ctrlSetText format ["Energía: %1/1000|SP: %2%3", experiencia select 2, experiencia select 1];
	_dinero ctrlSetStructuredText parseText format ["<t size='0.95' font='PuristaMedium' color='#d2a007' align='right'>%1 €</t>", [pop_din, 3] call ica_fnc_numToStr];
	

} else {

	[] call ica_fnc_initHUD;

};	