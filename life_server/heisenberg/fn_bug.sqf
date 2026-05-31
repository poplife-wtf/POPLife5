
/*
por: Heisenberg White

Función: SCRIPT QUE ENVIA UNA VARIABLE A NPC PARA SETEAR LOS BUGS QUE LA GENTE ENCUENTRE . PROVISIONAL
*/

if (isnil "HW getvariable 'bug'") then {HW setvariable ["bug",[],true]};





_variable = ctrltext ((uinamespace getvariable "pcpopbug") displayctrl 3005);

(HW getvariable "bug") pushback ([_variable,name player,mapgridposition player]);

HW setvariable ["bug",(HW getvariable "bug"),true];

