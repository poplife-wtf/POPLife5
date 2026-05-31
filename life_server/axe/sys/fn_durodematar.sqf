/*

By AxE
Duro de matar.


if (("sup" call ica_fnc_expToLevel) < 4) exitWith {
           
};

sleep 60;

{
if ((player getVariable [_x,0]) > 10) then {
if ((player getVariable [_x,0]) > 50) then {
player setVariable [_x, 50, true];
}else{
player setVariable [_x, 10, true];
	};
};
} forEach ["cabeza", "pecho", "brazos", "piernas"]; 


["Duro de Matar Activado"] call ica_fnc_infolog;



sleep 360;

spawn ica_fnc_durodematar;
        
*/
