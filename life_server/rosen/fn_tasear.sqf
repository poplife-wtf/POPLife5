// Creado por Rosen

_unit = param[0]; 
_weapon = param[1]; 
_muzzle = param[2]; 
_mode = param[3]; 
_ammo = param[4]; 
_magazine = param[5]; 
_projectile = param[6]; 
_gunner = param[7]; 
_objetivo = cursorObject; 
if(!isNull _objetivo) then { 
	if(_weapon in ["Taser_26"] && _objetivo isKindOf "Man") then {   
		_null = [_ammo] spawn { deleteVehicle ( nearestobject [player,_this select 0] ) };
		if (player distance _objetivo < 15) then { 
			if (!life_istazed && !(_unit getVariable ["restrained", false]) && vehicle _objetivo == _objetivo  && vehicle _unit == _unit) then { 
				[] remoteExec["ica_fnc_ragdoll",_objetivo];
				player setAmmo ["Taser_26", 0];
			}; 
		}; 
	};
};

//Granadas tambien
if(_ammo == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		[[_position],"life_fnc_flashbang",true,false] call life_fnc_MP;
	};
};
