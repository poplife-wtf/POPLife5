#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in ["hgun_P07_snds_F","arifle_SDAR_F"] && _projectile in ["B_9x21_Ball","B_556x45_dual"]) then {
            if (side _source isEqualTo west && playerSide isEqualTo civilian) then {
                _damage = 0;
                if (alive player && !life_istazed && !life_isknocked && !(_unit getVariable ["restrained",false])) then {
                    private ["_distance"];
                    _distance = 35;
                    if (_projectile == "B_556x45_dual") then {_distance = 100;};
                    if (_unit distance _source < _distance) then {
                        if !(isNull objectParent player) then {
                            if (typeOf (vehicle player) == "B_Quadbike_01_F") then {
                                player action ["Eject",vehicle player];
                                [_unit,_source] spawn life_fnc_tazed;
                            };
                        } else {
                            [_unit,_source] spawn life_fnc_tazed;
                        };
                    };
                };
            };

            //Temp fix for super tasers on cops.
            if (side _source isEqualTo west && (playerSide isEqualTo west || playerSide isEqualTo independent)) then {
                _damage = 0;
            };
        };
    };
};

_voyEnCoche = vehicle _unit  != _unit;
_vaEnCoche =  false;

if !(isNull _source ) then {
	_vaEnCoche =  vehicle _source  != _source;
};


if (_voyEnCoche AND cinturon AND _projectile isEqualTo "") exitWith {
	titleText["Has Chocado", "PLAIN"];
	_unit spawn {
	addCamShake [8,2,80];     

	"dynamicBlur" ppEffectEnable true;  
	"dynamicBlur" ppEffectAdjust [2];
	"dynamicBlur" ppEffectCommit 0; 

	"dynamicBlur" ppEffectEnable true; 
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 1; 
	};

    _dmg = damage _unit;
    _dmg
};


if ( _vaEnCoche AND !_voyEnCoche) exitWith {
titleText["Atropellado", "PLAIN"];
	_unit spawn {
	addCamShake [8,2,80];     

	[100] spawn bis_fnc_bloodeffect;   

	"dynamicBlur" ppEffectEnable true;  
	"dynamicBlur" ppEffectAdjust [5];
	"dynamicBlur" ppEffectCommit 0; 

	"dynamicBlur" ppEffectEnable true; 
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 1; 
	};

    _dmg = damage _unit;
    _dmg
};


[] spawn life_fnc_hudUpdate;
_damage;