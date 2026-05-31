
if (hasinterface) exitWith {
	diag_log "** Hostias un player ejecutando limpiador WTF!! **";
};

/*

	Limpiador actualizado por AxE
	para Pop 4
	
	Uso:

	fnc_limpiador_normal = compileFinal preprocessFileLineNumbers "axe_hc\limpiadorNormal.sqf";

	[] spawn {

		while {true} do {        

			[] call fnc_limpiador_normal;

		sleep 500;
		};
	};

*/

private [
	"_limpiar_grupos", "_borrar_ropa", "_borrar_muertos", "_borrar_cochesgg", "_borrar_cochesvacios",
	"_borrar_cochesolvidados", "_nvl_dano", "_borrar_ruinas", "_i", "_count_borrado", "_rompo"
];


_limpiar_grupos = true;
_borrar_cochesvacios = true;
_borrar_cochesolvidados = false;
_borrar_ruinas = true;
_borrar_ropa = true; 
_borrar_muertos = true;
_borrar_cochesgg = true;
_nvl_dano = 0.9;
					

_count_borrado = [];
_i= 0;
_rompo = false;

if ((count _this) < 1) then {


	if (_borrar_muertos) then {

		{
			if !(_x getVariable ["persistent",false]) then {
				deleteVehicle _x;
				_i = _i + 1;
			};
		} forEach allDeadMen;
	};

	_count_borrado set [0, _i];
	_i= 0;

	if (_borrar_ropa) then {

		private _szrot_obj = (
			allMissionObjects "WeaponHolder" +
			allMissionObjects "GroundWeaponHolder" +
			allMissionObjects "WeaponHolderSimulated"
		);
		{
			if !(_x getVariable ["persistent",false]) then {
        		_players = nearestObjects [_x, ["CAManBase"], 40];
				if (count _players < 1) then {			
				deleteVehicle _x;
				};
				_i = _i + 1;
			};
		} forEach _szrot_obj;
	};

	_count_borrado set [1, _i];
	_i= 0;

	if (_borrar_ruinas) then {

		private _ruins = allMissionObjects "Ruins";
		{
			if !(_x getVariable ["persistent",false]) then {
				_players = nearestObjects [_x, ["CAManBase"], 40];
				if (count _players < 1) then {
				deleteVehicle _x;
				};
				_i = _i + 1;
			};
		} forEach _ruins;
	};

	_count_borrado set [2, _i];
	_i= 0;

	if (_borrar_cochesgg) then {

		{
			if !(_x getVariable ["persistent",false]) then {
				deleteVehicle _x;
				_i = _i + 1;
			};  
		} forEach allDead;
	};

	_count_borrado set [3, _i];
	_i= 0;

	if (_borrar_cochesvacios) then {

		{
			if ((damage _x > _nvl_dano || {!canMove _x}) && {{alive _x} count crew _x == 0}) then {

				if !(_x getVariable ["persistent",false]) then {
				if !(_x isKindOf "CAR") then {
				_players = nearestObjects [_x, ["CAManBase"], 650];
				if (count _players < 1) then {
					deleteVehicle _x;
					};
					};
					_i = _i + 1;
				};
			};
		} forEach vehicles;
	};

	_count_borrado set [4, _i];
	_i= 0;

	if (_borrar_cochesolvidados) then {

		{                    
			if ({alive _x} count crew _x == 0) then {

				if !(_x getVariable ["persistent",false]) then {
				_players = nearestObjects [_x, ["CAManBase"], 850];
				if (count _players < 1) then {			
					deleteVehicle _x;
					};
					_i = _i + 1;
					
				};
			};
		} forEach vehicles;
	};

	_count_borrado set [5, _i];
	_i= 0;

	if (_limpiar_grupos) then {

		{
			if ((count (units _x)) == 0) then {
				deleteGroup _x;
				_x = grpNull;
				_x = nil;
				_i = _i + 1;
			};
		} foreach allGroups;
	};

	_count_borrado set [6, _i];    

} else {

	params ["_zonaCus"];


	switch (typeName _zonaCus) do {

		case "STRING": {
			if !(_zonaCus in allMapMarkers) then {
				_rompo = true;
			};
		};
		
		case "OBJECT": {
			if !(_zonaCus isKindOf "EmptyDetector") then {
				_rompo = true;
			};
		};
		default {_rompo = true;};
	};

	if (_rompo) exitWith {
	};

	if (_borrar_muertos) then {

		{
			if !(_x getVariable ["persistent",false]) then {
				deleteVehicle _x;
				_i = _i + 1;
			};  
		} forEach (allDeadMen inAreaArray _zonaCus);
	};

	_count_borrado set [0, _i];
	_i= 0;

	if (_borrar_ropa) then {

		private _szrot_obj = (
		allMissionObjects "WeaponHolder" +
		allMissionObjects "GroundWeaponHolder" +
		allMissionObjects "WeaponHolderSimulated"
		) inAreaArray _zonaCus;

		{
			if !(_x getVariable ["persistent",false]) then {
			_players = nearestObjects [_x, ["CAManBase"], 20];
			if (count _players < 1) then {
				deleteVehicle _x;
			};
				_i = _i + 1;
			};   
		} forEach _szrot_obj;
	};

	_count_borrado set [1, _i];
	_i= 0;

	if (_borrar_ruinas) then {

		private _ruins = (allMissionObjects "Ruins") inAreaArray _zonaCus;

		{
			if !(_x getVariable ["persistent",false]) then {
				deleteVehicle _x;
				_i = _i + 1;       
			};
		} forEach _ruins;
	};

	_count_borrado set [2, _i];
	_i= 0;

	if (_borrar_cochesgg) then {

		{
			if !(_x getVariable ["persistent",false]) then {
				deleteVehicle _x;
				_i = _i + 1;
			};
		} forEach (vehicles inAreaArray _zonaCus);
	};

	_count_borrado set [3, _i];
	_i= 0;

	if (_borrar_cochesvacios) then {

		{
			if ((damage _x > _nvl_dano || {!canMove _x}) && {{alive _x} count crew _x == 0}) then {

				if !(_x getVariable ["persistent",false]) then {
				_players = nearestObjects [_x, ["CAManBase"], 40];
				if (count _players < 1) then {
					deleteVehicle _x;
					};
					_i = _i + 1;
				};

			};

		} forEach (vehicles inAreaArray _zonaCus);
	};

	_count_borrado set [4, _i];
	_i= 0;

	if (_borrar_cochesolvidados) then {

		{                    
			if ({alive _x} count crew _x == 0) then {

				if !(_x getVariable ["persistent",false]) then {
					deleteVehicle _x;
					_i = _i + 1;
				};
			};
		} forEach (vehicles inAreaArray _zonaCus);
	};

	_count_borrado set [5, _i];
	_i= 0;

	if (_limpiar_grupos) then {

		{
			if ((count (units _x)) == 0) then {
				deleteGroup _x;
				_x = grpNull;
				_x = nil;
				_i = _i + 1;
			};
		} foreach allGroups;
	};

	_count_borrado set [6, _i];
};

if !(_rompo) then {

	diag_log format [
		"** Limpiador HC: Objetos Borrados:
		%1 -Cuerpos muertos,
		%2 -Cosas botadas,
		%3 -Objetos danados,
		%4 -Vehs destruidos,
		%5 -Vehs abandonados danados,
		%6 -Vehs abandonados,
		%7 -Grupos Vacios
		**",
		_count_borrado select 0,
		_count_borrado select 1,
		_count_borrado select 2,
		_count_borrado select 3,
		_count_borrado select 4,
		_count_borrado select 5,
		_count_borrado select 6
	];
};