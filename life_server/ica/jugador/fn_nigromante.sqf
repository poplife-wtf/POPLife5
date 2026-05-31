
/*
por: Icaruk
	para la gente que se ha desconectado sin esperar el tiempo de muerte
	0 spawn ica_fnc_nigromante;
*/

private ["_tiempoMuerto", "_handle"];

if ((profileNamespace getVariable "rutome") > 0) then {
	[false] spawn ica_fnc_vistaBonita;
	waitUntil {(!isNull player) AND (player == player)};
	sleep 2;

	player setPos (getMarkerPos "respawn_civilian");

	[] spawn {
		if (!isNil {loopNigromante}) exitWith {}; // ya estoy en el loop

		while {true} do {
			_tiempoMuerto = profileNamespace getVariable "rutome";
			loopNigromante = true;

			sleep 1;
			if (_tiempoMuerto <= 0) exitWith {
				sleep 1;
				//[false, false] spawn ica_fnc_vistaBonita;
				heNacido = true;
				loopNigromante = nil;
				
				profileNamespace setVariable ["rutome", 0];
				/*_mrk = if (isNil {life_deadPosition}) then {
					"salidahospitalc";
				} else {
					[life_deadPosition, ["salidahospitalc", "salidahospitalp", "salidahospitalb"]] call ica_fnc_masCercano;
				};

				player setPos (getMarkerPos _mrk);*/
				profileNamespace setVariable [FuRixX_VarKey_Posicion, getMarkerPos "respawn_civilian"];
				
				call life_fnc_respawned;
				0 spawn life_fnc_inicio;
				[] call life_fnc_spawnMenu;
				player setDamage 0;
				[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
				life_hunger = 100;
				life_thirst = 100;
				profileNamespace setVariable ["fois", 100];
				profileNamespace setVariable ["hearb", 100];				
			};

			titleText [format ["Estas muerto. %1s restantes para revivir.", _tiempoMuerto], "PLAIN"];
			profileNamespace setVariable ["rutome", (profileNamespace getVariable "rutome") - 1];
		};
	};
} else {
	if (isNil {profileNamespace getVariable FuRixX_VarKey_Posicion}) then {
		profileNamespace setVariable [FuRixX_VarKey_Posicion, (getMarkerPos "salidahospitalc")];
	};
	player setPosATL (profileNamespace getVariable FuRixX_VarKey_Posicion);
		player setDamage 0;
	[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
	life_hunger = 100;
	life_thirst = 100;
	profileNamespace setVariable ["fois", 100];
	profileNamespace setVariable ["hearb", 100];
};