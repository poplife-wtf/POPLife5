#include <macro.h>

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
[] spawn {
	if (isnil "life_markers_cars") then {life_markers_cars = false;};
	life_markers_cars = !life_markers_cars;
	if(life_markers_cars) then {
		CarMarkers = [];
		FinishedLoopCar = false;
		hint "Ahora ves los coches";
		while{life_markers_cars} do {
			{
				if !(_x in vehicles) then {
					deleteMarkerLocal str _x;
				};
			} forEach CarMarkers;
			CarMarkers = [];
			{
				if(_x isKindOf "Car" OR _x isKindOf "Air" OR _x isKindOf "Ship") then {
					deleteMarkerLocal str _x;
					_pSee = createMarkerLocal [str _x,getPos _x];
					_pSee setMarkerTypeLocal "mil_triangle";
					_pSee setMarkerPosLocal getPos _x;
					_pSee setMarkerSizeLocal [1,1];
					_pSee setMarkerTextLocal format['%1',[typeof _x] call ica_fnc_classtoname];
					_pSee setMarkerColorLocal ("ColorRed");
					CarMarkers pushback _x;
				};
			} forEach vehicles;
			sleep 0.2;
		};
		FinishedLoopCar = true;
		{
			deleteMarkerLocal str _x;
		} forEach CarMarkers;
		hint "Has dejado de ver los coches";
	} else {
		if(isNil "FinishedLoop") exitWith {};
		hint "Has dejado de ver los coches";
		waitUntil{FinishedLoop};
		{
			deleteMarkerLocal str _x;
		} forEach CarMarkers;
	};
};