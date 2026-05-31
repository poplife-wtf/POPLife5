#include <macro.h>
#include "..\..\script_macros.hpp"
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_achat","_money","_sp","_box","_offset"];
_mode = _this select 0;
_achat = _this select 1;

if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick";closeDialog 0;};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(pop_din < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - pop_din] call life_fnc_numberText];closeDialog 0;};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense";closeDialog 0;};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air","Motorcycle"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air","Motorcycle"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";closeDialog 0;};
pop_din = pop_din - _basePrice;
	_organizacion = cursorTarget getVariable["controlado_por",grpNull];
	if(!isNull _organizacion) then 
	{ 
	[(round (_basePrice * 0.005)),_organizacion] call life_fnc_gangExtorsion;  
	};
		_lvl = cursorTarget getVariable ["negociolvl",0];
		_lvl = _lvl + 10;
		if (_lvl > 100) then {
		_lvl = 100;
		};
		cursorTarget setVariable ["negociolvl",_lvl, true];	
// FuRixX Logs
_nombre = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
_precio = [_basePrice] call life_fnc_numberText;
hint format[localize "STR_Shop_Veh_Bought",_nombre, _precio];
FuRixX_EnviarLog = format [":red_car: El usuario **%1** (`%2`) ha comprado un/a `%3` por __%4€__", name player, getPlayerUID player, _nombre, _precio];
publicVariable "FuRixX_EnviarLog";

//Spawn the vehicle and prep it.

_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle lock 2;
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos (getMarkerPos _spawnPoint);
[_vehicle,_colorIndex] call life_fnc_colorVehicle;
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
	
[_vehicle,"trunk_in_use",false,true] remoteExecCall ["TON_fnc_setObjVar",2];
[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",2];
_vehicle allowDamage true;

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",2];


if(_mode) then {
        if (life_HC_isActive) then {
            [(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["HC_fnc_vehicleCreate",HC_Life];
        } else {
            [(getPlayerUID player),playerSide,_vehicle,_colorIndex] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
        };
};

_box = boundingBox _vehicle;
_offset = _box select 1;  //Gets an array with the maximum bounding values
_offset = _offset select 2; //Gets the Maxmimum Z height
_offset = _offset + 0.8; //Just a few inches more...

_sp = visiblePosition _vehicle;
_sp = _sp vectorAdd [0,0,_offset];

//[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;