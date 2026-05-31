/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Partes medicos POP4

["abrir"] spawn ica_fnc_CrearParte;

*/
private ["_hospital", "_descripcion"];

if (!isnull (findDisplay 19097)) exitWith {};

_tipo = _this select 0;
_medico = player;
_paciente = cursorTarget; 

if (isNull _paciente OR isNull _medico OR !(_paciente isKindOf "Man") OR vehicle player != player) exitWith 
{
	titleText ["Debes apuntar a una persona para rellenarle un parte médico.", "PLAIN"];
};

if (_medico distance _paciente > 8) exitWith 
{
	hint "El paciente está muy lejos... \nDile que se acerque.";
};

_nombremedico = name _medico; 
_nombrepaciente = name _paciente;
_nss = getPlayerUID _paciente;

"Un EMS te está rellenando un parte médico..." remoteExec ["hint", _paciente];

_substring = {
	_string = [_this, 0, "", [""]] call BIS_fnc_param;
	_start = [_this, 1, -1, [-1]] call BIS_fnc_param;
	_end = [_this, 2, -1,[-1]] call BIS_fnc_param;
	
	_stringAr = toArray _string;
	_outAr = [];
	
	for "_i" from _start to _end do {
		_outAr pushBack (_stringAr select _i);
	};
	
	toString _outAr
};

_nss_final = ([_nss, (count _nss) - 7, (count _nss) - 1] call _substring); 

_hora = Format ["%1:%2", date select 3, date select 4];
_fecha = format ["%1 / %2 / %3",date select 2, date select 1, date select 0];

player setvariable ["partemedico", 1];
disableSerialization;

_parte = createDialog "PARTE_MEDICO_RELLENAR";

if (_tipo == "reabre") then 
{
	_hospital = _this select 1;
	_descripcion = _this select 2;
	((uiNamespace getVariable 'ada_parte_med') displayCtrl 5004) ctrlSetText _hospital;
	((uiNamespace getVariable 'ada_parte_med') displayCtrl 5008) ctrlSetText _descripcion;
};
	
((uiNamespace getVariable 'ada_parte_med') displayCtrl 5001) ctrlSetText _nombremedico;
((uiNamespace getVariable 'ada_parte_med') displayCtrl 5002) ctrlSetText _nombrepaciente;
((uiNamespace getVariable 'ada_parte_med') displayCtrl 5003) ctrlSetText _nss_final;
((uiNamespace getVariable 'ada_parte_med') displayCtrl 5005) ctrlSetText _fecha;
((uiNamespace getVariable 'ada_parte_med') displayCtrl 5006) ctrlSetText _hora;
((uiNamespace getVariable 'ada_parte_med') displayCtrl 5007) ctrlSetText _nombremedico;

while {!isnull (findDisplay 19097)} do 
{ 
_hospital = format ["%1", ctrlText 5004];
_descripcion = format ["%1", ctrlText 5008];
sleep 0.5;
};

if ((player getvariable "partemedico") == 0) then {

if (_hospital == "" OR _descripcion == "") exitWith 
{	
	closedialog 0;
	hintsilent "Debes rellenar la casilla de Hospital y Descipcion.";
	titleText ["Debes rellenar la casilla de Hospital y Descipcion.", "PLAIN"];
	["play", "bk_error2", player] call ica_fnc_SFX;
		
	["reabre", _hospital, _descripcion] spawn ica_fnc_CrearParte;
};
if (_medico distance _paciente > 8) exitWith 
{
	hint "El paciente está muy lejos... \nDile que se acerque.";
	closedialog 0;
	["play", "bk_error2", player] call ica_fnc_SFX;
	["reabre", _hospital, _descripcion] spawn ica_fnc_CrearParte;
};
hint "Has enviado un parte medico al paciente correctamente!";
["play", "bk_ok3", player] call ica_fnc_SFX;
systemChat "Un EMS ha entregado un parte medico a un paciente.";
closedialog 0;
sleep 1;

[_hospital, _medico, _nss_final, _descripcion] remoteExec ["ica_fnc_MandarParte", _paciente];

} else 
{
	hint "Has desechado el informe.";
	titleText ["Has desechado el informe.", "PLAIN"];
	player setvariable ["partemedico", 0];
};