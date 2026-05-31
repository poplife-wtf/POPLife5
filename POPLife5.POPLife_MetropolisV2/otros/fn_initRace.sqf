/*
initRace.sqf
Kevin Webb //Editado por Rosen
starts the race on the client side
*/
disableSerialization;
_point = param [0,[],[[]]];
_stake = param [1,0,[0]];
pop_din = pop_din -_stake;
hint "La carrera va a empezar!";
sleep 1;
openMap[true,false];
_finishLine = createMarkerLocal["meta",_point];
_finishLine setMarkerTypeLocal "mil_warning";
_finishLine setMarkerColorLocal "ColorRed";
_finishLine setMarkerTextLocal "META";
_task = player createSimpleTask ["Carrera"];
_task setTaskState "Assigned";
_veh = "Land_ClutterCutter_small_F" createVehicleLocal _point;
_task setSimpleTaskTarget [_veh,true];
_task setSimpleTaskDescription ["Llega a la meta el primero!","Carrera","META"];
player setCurrentTask _task;
_map = ((findDisplay 12) displayCtrl 51);
_map ctrlMapAnimAdd[3,0.1,_point];
ctrlMapAnimCommit _map;
sleep 10;
openMap[false,false];
playSound "carrera";
sleep 1.5;
for "_i" from 0 to 2 do {
	[
		[
			[
				format["%1", 3 - _i],
				"<t align = 'center' shadow = '1' size = '3' font='PuristaBold'>%1</t>"
			]
		]
	] spawn BIS_fnc_typeText;
		
	sleep 1;
};
vehicle player enableSimulation true;
[
	[
		[
			"A CORRER!",
			"<t align = 'center' shadow = '1' size = '3' font='PuristaBold'>%1</t>"
		]
	]
] spawn BIS_fnc_typeText;
while {player distance _point > 10 && !raceDone} do {
	hintSilent format["Distancia hasta la meta: %1m",round(player distance _point)];
	sleep 0.25;
};
[] spawn {
	sleep 3;
	raceDone = false;
};
hintSilent "";
deleteMarkerlocal _finishLine;
deleteVehicle _veh;
_task setTaskState "Completada";
player removeSimpleTask _task;