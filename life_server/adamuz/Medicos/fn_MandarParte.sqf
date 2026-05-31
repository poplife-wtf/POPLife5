/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Partes medicos POP4

*/

disableSerialization;
private["_hospital", "_medico", "_nss", "_descripcion"];

_hospital = _this select 0;
_medico = _this select 1;
_nss = _this select 2;
_descripcion = _this select 3;

_hora = Format ["%1:%2", date select 3, date select 4];
_fecha = format ["%1 / %2 / %3",date select 2, date select 1, date select 0];

5 cutRsc ["PARTE_MEDICO","plain"];

hint "Has recibido un parte medico. Guardalo bien!";

((uiNamespace getVariable 'partemed') displayCtrl 50010) ctrlSetText name _medico;
((uiNamespace getVariable 'partemed') displayCtrl 50020) ctrlSetText name player;
((uiNamespace getVariable 'partemed') displayCtrl 50030) ctrlSetText _nss;
((uiNamespace getVariable 'partemed') displayCtrl 50050) ctrlSetText _fecha;
((uiNamespace getVariable 'partemed') displayCtrl 50060) ctrlSetText _hora;
((uiNamespace getVariable 'partemed') displayCtrl 50070) ctrlSetText name _medico;
((uiNamespace getVariable 'partemed') displayCtrl 50080) ctrlSetText _descripcion;
((uiNamespace getVariable 'partemed') displayCtrl 50040) ctrlSetText _hospital;