
/*
por: Icaruk
	call ica_fnc_reporte;
*/

FNC_QUICK_AvisarAdmin={

_quienUso= _this select 0;

{

	if (call life_adminlevel >= 2) then {
			hint format ["%1 ha usado la función reporte.", _quienUso];
	};


} foreach playableUnits;


};

if (call life_adminlevel < 2) then {
	sleep random 0.50;
	sleep random 0.50;

	_din = round (pop_atmdin * 0.10);
	pop_atmdin = pop_atmdin - _din;
	[0] call SOCK_fnc_updatePartial;
	hint format["Has perdido %1€ con el reporte.", _din];
	[format ["REPORTE ----- %1 (%2) ha usado la función reporte (- %3€)", name player, getPlayerUID player, _din], "diag_log", false, false, false] call BIS_fnc_MP;
	// [format ["%1 ha usado la función reporte.", name player], "hint", true, false, false] call BIS_fnc_MP; // antiguo

//avisar a admin de quien la uso
[(name player)]remoteExec ["FNC_QUICK_AvisarAdmin", playableUnits, false];

};

0 spawn {
	0 spawn {
		_t = diag_tickTime + 30;
		waitUntil {diag_tickTime >= _t};
		removeMissionEventHandler ["Draw3D", EHreporte]
	};
	EHreporte = addMissionEventHandler ["Draw3D",{

		_arr = nearestObjects [player, ["Man", "Car"], 40];
		if ((count _arr) > 1) then {
			{
				_dist = player distance _x;
				_dist = if (_dist < 1.5) then {1.5} else {_dist};

				drawIcon3D [
					"\a3\ui_f\data\map\Markers\System\dummy_ca.paa", 
					[1,0.2,0.2, (60 - _dist) / 50], 
					[((getPos _x) select 0), ((getPos _x) select 1), 2+(1.8/(60/_dist))],
					1,
					1,
					0,
					_x getVariable ["realname", "?"],
					1.8,
					0.036,
					"TahomaB"
				];
			} forEach _arr;
		};
	}];
};