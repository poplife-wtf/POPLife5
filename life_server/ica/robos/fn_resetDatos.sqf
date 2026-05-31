
/*
por: Icaruk
*/

datos = [];
//portatil4 setpos [3345.56,4146.91,0.00142288]; //fix portatil subastalia.

while {true} do {
	while {true} do {
		if ((count datos) == 0) exitWith { sleep (60 * 20); }; // si no hay datos espero, bajo y los pongo
		sleep 10;
	};
	_portatil = [portatil1, portatil2, portatil3, portatil4, portatil5] call BIS_fnc_selectRandom; // pongo los datos y al dar la vuelta espero a que no hayan
	datos = [_portatil, ([((random 899999999999999) + 100000000000000), 15] call BIS_fnc_numberText)];
};
