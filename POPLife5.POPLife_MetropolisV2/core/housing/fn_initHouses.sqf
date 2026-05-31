/*
    File: fn_initHouses.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the players houses, mainly throwing down markers.
*/
if (life_houses isEqualTo []) exitWith {}; //Nothing to do.

		
_clasesCasas = listaCasas + listaGarajes + listaGranjas + apartamentos;
{
	_position = call compile format ["%1",_x select 0];
	_houses = nearestObjects [_position, _clasesCasas, 20];
	if (_houses isEqualto []) then {}else{
	_house = _houses select 0; 
    _house setVariable ["uid",round(random 99999),true];
    _houseName = "Casa";
	if (typeof _house in listaCasas) then {
	_houseName = "Casa";
	};
    if (typeof _house in apartamentos) then {
	_houseName = "Apartamento";
	};
    if (typeof _house in listaGarajes) then {
	_houseName = "Garaje";
	};	
    _marker = createMarkerLocal [format ["house_%1",(_house getVariable "uid")],_position];
    _marker setMarkerTextLocal _houseName;
    _marker setMarkerColorLocal "ColorBlue";
    _marker setMarkerTypeLocal "loc_Lighthouse";
	};
} forEach life_houses;
