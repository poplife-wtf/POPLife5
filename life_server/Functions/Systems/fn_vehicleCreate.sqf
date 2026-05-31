/*
    File: fn_vehicleCreate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Answers the query request to create the vehicle in the database.
*/
private ["_uid","_side","_type","_classname","_color","_plate"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[west]] call BIS_fnc_param;
_vehicle = [_this,2,objNull,[objNull]] call BIS_fnc_param;
_color = [_this,3,-1,[0]] call BIS_fnc_param;

//Error checks
if (_uid isEqualTo "" || _side isEqualTo sideUnknown || isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {};
_className = typeOf _vehicle;
_type = switch (true) do {
    case (_vehicle isKindOf "Car"): {"Car"};
    case (_vehicle isKindOf "Air"): {"Air"};
    case (_vehicle isKindOf "Ship"): {"Ship"};
	case (_vehicle isKindOf "Motorcycle"): {"Motorcycle"};	
};

_side = switch (_side) do {
    case west:{"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    default {"Error"};
};

_plate = round(random(1000000));
[_uid,_side,_type,_classname,_color,_plate] call DB_fnc_insertVehicle;

_vehicle setVariable ["dbInfo",[_uid,_plate],true];
_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"];

// ica
_vehicle setVariable ["matricula", [] call ica_fnc_creaMatricula, true];

if (_vehicle isKindOf "Air") then {
 	_str = '
		_veh = _this select 0;
		_pos = _this select 1;
		_tio = _this select 2;
		
		//hint format ["veh %1\n pos %2\n unit %3", _veh, _pos, _tio];
		
		if (player == _tio) then {
			if !(license_civ_piloto) then {
				if (_pos == "driver") then {
					moveOut _tio;
					titleText ["No sabes pilotar esto, será mejor que no toques nada", "PLAIN"];
				};
				if (_pos == "gunner") then {
					if (isCopilotEnabled _veh) then {
						_veh enableCopilot false;
					};
				};
			} else {
			
			};
		};
	';
	[_vehicle, "getIn", _str, true] call ica_fnc_addEH;
};