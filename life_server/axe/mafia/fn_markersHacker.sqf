/*
	By AxE
*/

life_markers = !life_markers;
if(life_markers) then {
	PlayerMarkers = [];
	FinishedLoop = false;
	[player,"Coordenadas satelitales recibidas.", 
	"Hacker","pop_portatil"] call ica_fnc_axeMsg;
	while{life_markers} do {
		{
			if !(_x in allUnits) then {
				deleteMarkerLocal str _x;
			};
		} forEach PlayerMarkers;
		PlayerMarkers = [];
		{
			if(alive _x && isplayer _x) then {
				deleteMarkerLocal str _x;
				_pSee = createMarkerLocal [str _x,getPos _x];
				_pSee setMarkerTypeLocal "mil_triangle";
				_pSee setMarkerPosLocal getPos _x;
				_pSee setMarkerSizeLocal [1,1];
				
				if (side _x == west) then {
				_pSee setMarkerColorLocal ("ColorWEST");
				}else{
				_pSee setMarkerColorLocal ("colorCivilian");
				};
				
				PlayerMarkers = PlayerMarkers + [_x];
		};
	} forEach allUnits;
	sleep 60;
};
FinishedLoop = true;
} else {
	if(isNil "FinishedLoop") exitWith {};
	[player,"El satelite se ha reposicionado ya no puedo enviarte mas coordenadas..", 
	"Hacker","pop_portatil"] call ica_fnc_axeMsg;
	waitUntil{FinishedLoop};
	{
		deleteMarkerLocal str _x;
	} forEach PlayerMarkers;
};