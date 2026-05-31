
/*
por: Icaruk
	["menu"] spawn ica_fnc_menuY;
	["menu"] execVM "ica\dialog\fn_menuY.sqf";
*/

_param = _this select 0;
disableSerialization;

if (_param isEqualTo "menu") exitWith {
	if (!isNil {camaraInicial}) exitWith {};
	createDialog "menuY";

	_ui = uiNameSpace getVariable "menuY";
	_i1 = _ui displayCtrl 7040;
	_i2 = _ui displayCtrl 7041;
	_i3 = _ui displayCtrl 7042;
	_i4 = _ui displayCtrl 7043;
	_i6 = _ui displayCtrl 7045;
	_i7 = _ui displayCtrl 70450;	
	_b1 = _ui displayCtrl 7046;	 // dinero
	_b2 = _ui displayCtrl 7047;	 // llaves
	_b3 = _ui displayCtrl 7048;	 // crafteo
	_b4 = _ui displayCtrl 7049;	 // bailes
	_b6 = _ui displayCtrl 7051;	// buscados
	_b7 = _ui displayCtrl 70510;	

	if (playerside isEqualTo WEST) then {
	_i7 ctrlShow false;
	_b7 ctrlShow false;
	};
	
	putaFnc = {
		if (side player == WEST) then {
			[] spawn ica_fnc_initpda;
		} else {
			if (isNil "life_action_gangInUse") then {
				if !(life_in_gang) then {
					createDialog "Life_Create_Gang_Diag";
				} else {
					[] spawn life_fnc_gangMenu;
				};
			};
		}
	};
	
	fnc_Grupo = {
	if (side player == WEST) exitWith {
			hint "Esto esta reservado para civiles.";
		};
	if (!isNil {life_gangid}) then {
		if !(life_gangid == -1) exitWith { hint "Mientras estes en una organización no podrás crear agrupaciones o bandas"};
		[] call life_fnc_groupMenu;
		} else { hint "No tienes acceso a este tipo de cosas!" };
	};
	

	_b1 buttonSetAction 'closeDialog 0; ["menu"] call ica_fnc_daDinero';
	_b2 buttonSetAction ' closeDialog 0; ["menu"] call ica_fnc_daLlaves ';
	_b3 buttonSetAction ' closeDialog 0; ["menu"] spawn ica_fnc_menuCrafteo;';
	_b4 buttonSetAction ' closeDialog 0; if (vehicle player != player) then {hint "No tienes suficiente espacio para bailar con flow."} else {createDialog "bailes"}';
	_b6 buttonSetAction 'closeDialog 0; call putaFnc';
	_b7 buttonSetAction 'closeDialog 0; createdialog "menuzonas"';

	private ["_icono", "_ctrls"];
	switch (true) do {
		case ((animationState player) == "ainjPpneMstpSnonWnonDnon"): {
			llamadaDeSocorro = {
				closeDialog 0;
				if (!isNil {llamadaSocorroHecha}) exitWith {hint "Sólo puedes hacer una llamada de socorro cada minuto"};
				0 spawn {llamadaSocorroHecha = true; sleep 60; llamadaSocorroHecha = nil};
				[["recibo", player, format ["Mensaje automático: estoy herido en %1", mapGridPosition player]], "ica_fnc_mensajesica", INDEPENDENT, false, false] call life_fnc_MP;
				titleText ["Los médicos han recibido tu llamada de socorro", "PLAIN"];
			};
			_icono = ["icoAyuda.paa"];
			_ctrls = [_i1];
			{_x ctrlEnable false} forEach [_b2, _b3, _b4,  _b6, _b7];
			_b1 buttonSetAction '
				call llamadaDeSocorro;
			';
		};
		case ((animationState player) == "amovppnemstpsnonwnondnon_injured"): {
			llamadaDeSocorro = {
				closeDialog 0;
				if (!isNil {llamadaSocorroHecha}) exitWith {hint "Sólo puedes hacer una llamada de socorro cada minuto"};
				0 spawn {llamadaSocorroHecha = true; sleep 60; llamadaSocorroHecha = nil};
				[["recibo", player, format ["Mensaje automático: estoy herido en %1", mapGridPosition player]], "ica_fnc_mensajesica", INDEPENDENT, false, false] call life_fnc_MP;
				titleText ["Los médicos han recibido tu llamada de socorro", "PLAIN"];
			};
			_icono = ["icoAyuda.paa"];
			_ctrls = [_i1];
			{_x ctrlEnable false} forEach [_b2, _b3, _b4, _b6, _b7];
			_b1 buttonSetAction '
				call llamadaDeSocorro;
			';
		};
		case ((side player == CIVILIAN) OR (side player == INDEPENDENT)): {
			_icono = ["icoDinero.paa", "icoLlaves.paa", "icoCraft.paa", "icoBailes.paa", "icoGrupo.paa", "icoGrupo.paa"];
			_ctrls = [_i1, _i2, _i3, _i4, _i7, _i6];
		};
		case (side player == WEST): {
			_icono = ["icoDinero.paa", "icoLlaves.paa", "icoCraft.paa", "icoBailes.paa", "icoGrupo.paa", "icoBuscados.paa"];
			_ctrls = [_i1, _i2, _i3, _i4, _i7, _i6];
		};
	};
	_ruta = "\AxE\icons\menuY\";

	{
		_x ctrlSetPosition [((ctrlPosition _x) select 0) + 0.1, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
		_x ctrlCommit 0;
	} forEach _ctrls;

	_idx = 0;
	while {_idx < (count _ctrls)} do {
		(_ctrls select _idx) ctrlSetText (_ruta + (_icono select _idx));
		_idx = _idx + 1;
	};

	{
		_x ctrlSetPosition [((ctrlPosition _x) select 0) - 0.12, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
		_x ctrlCommit 0.5;
		sleep 0.05;
	} forEach _ctrls;

	{
		waitUntil {((ctrlPosition _x) select 0) <= 1.5925};
		_x ctrlSetPosition [((ctrlPosition _x) select 0) + 0.02, (ctrlPosition _x) select 1, (ctrlPosition _x) select 2, (ctrlPosition _x) select 3];
		_x ctrlCommit 0.2;
	} forEach _ctrls;

};
