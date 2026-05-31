/*
    By AxE
	Transfiero el control de toda la IA al HeadLess Client

*/

_aquien = param [0,false,[false]];

if (_aquien) then {

    if (!axe_HC_Activo) exitWith {diag_log "ERROR: El server manda control de la ia al HC cuando axe_HC_Activo esta en false";};
    {
        if (!(isPlayer _x)) then {
            _x setOwner hc_1;
        };
    } forEach animales;

} else {

    if (axe_HC_Activo) exitWith {diag_log "ERROR: El server quiere pillar los animales cuando axe_HC_Activo is falso";};
    {
        if (!(isPlayer _x)) then {
            _x setOwner 2;
        };
    } forEach animales;

};