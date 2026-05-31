/* Creado por Rosen */ 
// ["titulo","mensaje",tiempo] spawn ica_fnc_hintr;

waitUntil{mensaje};
disableSerialization;
createDialog "hintr";
mensaje = false;
_titulo = param[0];
_hint = param[1];
_tiempo = param[2];
disableSerialization;
_display = findDisplay 15393;
_ctrl = _display displayCtrl 15394;
_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 0;
_ctrl ctrlSetFade 0;
_ctrl ctrlCommit 0.5;
_ctrl ctrlSetStructuredText parseText format["<t color='#FCBB66'><t size='1.25'>%2</t><br/><br/><t color='#FFFF'><t size='0.85'>%1</t>",_hint, _titulo];
sleep _tiempo;
_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 0;
closeDialog 15393;
mensaje = true;