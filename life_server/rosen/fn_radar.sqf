private["_distancia1","_distancia2","_distancia3","_distancia4","_velocidad","_multa"];

if (playerSide != civilian) exitWith {};
_velocidad = round speed player;
if (_velocidad < 130) exitWith {};
if (multa_cobrada) exitWith {};
multa_cobrada = true;

		_multa = 0;

		
			playSound "fotoradar";
			cutText ["","WHITE OUT",0.5];
			cutText ["","WHITE IN",0.5];		
			if(_velocidad < 190) then {
				_multa = round(75 + 1.5 * _velocidad);
 				["mequitan", 1] call ica_fnc_puntosCarnet;
			}
			else {
				_multa = round(200 + 1.5 * _velocidad);
 				["mequitan", 2] call ica_fnc_puntosCarnet;
			};
			sleep 3;
			if(pop_atmdin > _multa) then {


				disableSerialization;
				1 cutRsc ["Dialogo_Multa","plain"];

				((uiNamespace getVariable 'dialogmulta') displayCtrl 1600) ctrlSetText (name player);
				((uiNamespace getVariable 'dialogmulta') displayCtrl 1601) ctrlSetText ([typeof (vehicle player)] call ica_fnc_classtoname);
				((uiNamespace getVariable 'dialogmulta') displayCtrl 1602) ctrlSetText (format ["%1 Km/h (Max:%2 Km/h)", _velocidad, "128"]);
				((uiNamespace getVariable 'dialogmulta') displayCtrl 1603) ctrlSetText (vehicle player getVariable ["matricula", "Sin Matricula"]);
				((uiNamespace getVariable 'dialogmulta') displayCtrl 1604) ctrlSetText (format ["%1 Euros", _multa]);
				((uiNamespace getVariable 'dialogmulta') displayCtrl 1605) ctrlSetText (format ["%1/%2/%3",date select 2, date select 1, date select 0]);
				((uiNamespace getVariable 'dialogmulta') displayCtrl 1606) ctrlSetText (format ["%1:%2", date select 3, date select 4]);
				((uiNamespace getVariable 'dialogmulta') displayCtrl 1607) ctrlSetText (format ["%1%2%3", round (random 999999), round (random 999999), round (random 999999)]);

				pop_atmdin = pop_atmdin - _multa;
			} 
			else {
				if(pop_din > _multa) then {

					disableSerialization;
					1 cutRsc ["Dialogo_Multa","plain"];
					
					((uiNamespace getVariable 'dialogmulta') displayCtrl 1600) ctrlSetText (name player);
					((uiNamespace getVariable 'dialogmulta') displayCtrl 1601) ctrlSetText ([typeof (vehicle player)] call ica_fnc_classtoname);
					((uiNamespace getVariable 'dialogmulta') displayCtrl 1602) ctrlSetText (format ["%1 Km/h (Max:%2 Km/h)", speed vehicle player, "128"]);
					((uiNamespace getVariable 'dialogmulta') displayCtrl 1603) ctrlSetText (vehicle player getVariable ["matricula", ""]);
					((uiNamespace getVariable 'dialogmulta') displayCtrl 1604) ctrlSetText (format ["%1 Euros", _multa]);
					((uiNamespace getVariable 'dialogmulta') displayCtrl 1605) ctrlSetText (format ["%1/%2/%3",date select 2, date select 1, date select 0]);
					((uiNamespace getVariable 'dialogmulta') displayCtrl 1606) ctrlSetText (format ["%1:%2", date select 3, date select 4]);
					((uiNamespace getVariable 'dialogmulta') displayCtrl 1607) ctrlSetText (format ["%1%2%3", round (random 999999), round (random 999999), round (random 999999)]);

					pop_din = pop_din - _multa;					
				}
				else {
					//[[getPlayerUID player,name player,"261A"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
				if (life_HC_isActive) then {
					[getPlayerUID player,profileName,"261A"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
				} else {
					[getPlayerUID player,profileName,"261A"] remoteExecCall ["life_fnc_wantedAdd",2];
				};					
					
 					hint "Debido a que no tienes dinero para pagar la multa, el radar ha enviado tus datos a ola policía y ha emitido una orden de detencion contra este vehículo.";
				};
			};
			sleep 1;

	if (((vehicle player != player) && ((assignedVehicleRole player) select 0) == "driver")) then {
		sleep 1;
	}
	else {
		sleep 10;
	};
	
uisleep 2;
multa_cobrada = false;