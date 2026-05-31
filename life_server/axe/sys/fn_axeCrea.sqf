
/*
Función útil para remplazar createvehicle mejorando 
el rendimiento y los fps del server asi como de los 
clientes al cargar el objeto.

uso: ["classname",position player] spawn ica_fnc_axeCrea;

*/

_classname = _this select 0;
_pos = _this select 1;

if (axe_HC_Activo) then {

{

_cosa = _classname createVehicleLocal [0,0,0];
_cosa setPos _pos;
_position = getPosWorld _cosa;
_vectorDirUp = [vectorDir _cosa, vectorUp _cosa];

_modelo = getModelInfo _cosa select 1;

deleteVehicle _cosa;
_cosaSimple = createSimpleObject [_modelo, _position];
_cosaSimple setVectorDirAndUp _vectorDirUp;

} remoteExec ["BIS_fnc_spawn",HC_1]


} else {

{

_cosa = _classname createVehicleLocal [0,0,0];
_cosa setPos _pos;
_position = getPosWorld _cosa;
_vectorDirUp = [vectorDir _cosa, vectorUp _cosa];

_modelo = getModelInfo _cosa select 1;

deleteVehicle _cosa;
_cosaSimple = createSimpleObject [_modelo, _position];
_cosaSimple setVectorDirAndUp _vectorDirUp;

} remoteExec ["BIS_fnc_spawn",2]

};



