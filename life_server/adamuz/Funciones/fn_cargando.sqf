/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Carga (Prograso) POP4

[10, "Cragando..."] call ica_fnc_cargando;

*/
private ["_barra", "_progreso", "_tx", "_largo", "_t"];

_tinicial = _this select 0;
_texto = _this select 1;

if (_tinicial <= 0) then {_tinicial = 1};

disableSerialization;

7 cutRsc ["ada_cargando", "plain"];

_dlg = uiNameSpace getVariable "ada_cargando";

_textofinal = _dlg displayCtrl 1021;
_ctrlimagen = _dlg displayCtrl 1020;

_t = _tinicial - 1;
if (_t == 0) then {_t = 1};
_porcentage = 0.00001;

_imagen  = "\pop_iconos2\Cargando\";
while {_t >= 0 && _porcentage < 100} do
{	
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "0.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "1.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "2.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "3.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "4.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "5.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "6.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "7.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "8.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "9.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "10.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "11.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "12.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "13.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "14.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "15.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "16.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "17.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "18.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
	
	_t = _t - 0.053;
	_porcentage = 100 - (_t * 100)/_tinicial;
	if (_t <= 0 ) exitwith {_porcentage = 100};
	_ctrlimagen CtrlsetText (_imagen + "19.paa");
	_textofinal CtrlsetText (format ["%1 - %2%3", _texto, round _porcentage, "%"]);
	sleep 0.053;
};
_textofinal CtrlsetText (format ["%1 - %2%3", _texto, 100, "%"]);
7 cutFadeOut 1;