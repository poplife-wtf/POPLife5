/*

~~ ADAMUZ SYSTEMS ~~
Sistema PDA POPLIFE 4.0

*/

if (isnull (findDisplay 777)) exitWith {};

if !(isnil "ocupado") exitwith {Hint "Solo puedes consultar una matricula a la vez"};

disableserialization;
_PDA = finddisplay 777;
_list = _PDA displayCtrl 3012;
_matricula = CtrlText 3014;

lbClear _list;

if ((_matricula == "")) exitWith {Hint "Debes poner una matricula en la casilla para buscarla."};

ocupado = true;

_vehiculo = []; 
{ 
    if ((not isNull _x) && ((_x iskindof "Motorcycle") OR (_x iskindof "Car") OR (_x iskindof "Air")) && (typeof _x != "A3L_HospitalBed2015") && (_x getvariable ["matricula", nil] == _matricula)) exitWith 
	{ 
		_vehiculo pushback _x;	
    };
} forEach vehicles;

_tiempo = (round (random 5)) + 1;
[_tiempo, "Buscando matricula en la base de datos..."] spawn ica_fnc_barrita; 
sleep _tiempo;

if (count _vehiculo == 0) exitwith {ocupado = nil; hint "No se ha encontrado el vehiculo. Debe estar circulando o estacionado."};

_propietario = ((_vehiculo select 0) getVariable "vehicle_info_owners") select 0 select 1;
_otros = ((_vehiculo select 0) getVariable "vehicle_info_owners");

_owners = []; 
{  
 _owners pushback format["%1", _x select 1];  
} forEach _otros;

if (isnull (findDisplay 777)) exitWith {ocupado = nil; hint "Has cerrado la PDA..."};
[2, "Matricula encontrada en la base de datos."] spawn ica_fnc_barrita; 
sleep 1;
if (isnull (findDisplay 777)) exitWith {ocupado = nil; hint "Has cerrado la PDA..."};

lbClear _list;

_list lbAdd format["Matricula: %1", _matricula];

_list lbAdd format["Modelo: %1", [typeof (_vehiculo select 0)] call ica_fnc_classtoname];

_list lbAdd "";

_list lbAdd "Comprador: ";

_list lbAdd format["- %1", _propietario];


_list lbAdd "Propietarios: ";
{  
	_list lbAdd format["- %1", _x];
} forEach _owners;
_list lbAdd "";

ctrlSetText [3013, format["%1", _propietario]];

ocupado = nil;


