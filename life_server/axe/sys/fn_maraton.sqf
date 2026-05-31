/* 
By AxE
Un simple SpeedAimCoef llamada desde el keyhandler.

*/


_p = _this select 0;



if (_p isEqualTo "buzo") exitWith {


if (("tal" call ica_fnc_expToLevel) < 5) exitWith {
	[
	player,
	format ["Debes aprender esta habilidad primero en la universidad  %1",name player], 
	"Como pez en el agua"
	] call ica_fnc_axeMsg;
};

if !(underwater player)exitWith{
  titleText["No estas en el agua ...", "PLAIN"];

};


    if (!isNil {buzo}) exitWith {hint "Solo puedes activar buzo 1 vez cada dos minutos." };
    [] spawn {
        buzo = true;
        player setAnimSpeedCoef 1.5;
		["Como pez en el agua Activado"] call ica_fnc_infolog;
		sleep 30;
		player setAnimSpeedCoef 1;
		["Como pez en el agua desactivado"] call ica_fnc_infolog;
        sleep 90;
        buzo = nil;
       
    }


};


if (_p isEqualTo "maraton") exitWith {


if (("tal" call ica_fnc_expToLevel) < 6) exitWith {
	[
	player,
	format ["Debes aprender esta habilidad primero en la universidad  %1",name player], 
	"Maraton"
	] call ica_fnc_axeMsg;
};


    if (!isNil {Maraton}) exitWith {hint "Solo puedes activar Maraton cada 2 Minutos." };
    [] spawn {
        Maraton = true;
        player setAnimSpeedCoef 1.3;
		["Maraton Activado"] call ica_fnc_infolog;
		sleep 20;
		player setAnimSpeedCoef 1;
		["Maraton Desactivado"] call ica_fnc_infolog;
		sleep 120;
        Maraton = nil;
        
    }


};