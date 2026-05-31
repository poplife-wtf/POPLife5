/* Creado por Rosen */ 

_param = param[0];
_modo = param[1];
if(_modo == "poner") then {	
	if(!isNull _param) then {
		flecha = "Sign_Arrow_F" createVehicleLocal position _param;
		vehicle flecha attachTo [_param,[0,0,2.5]];
	};
};
if(_modo == "quitar") then {	
	if(!isNull flecha) then {
		deleteVehicle flecha;
	};
};