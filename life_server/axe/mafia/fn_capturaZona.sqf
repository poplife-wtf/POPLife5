#include <macro.h>
/*
	AxE Is On Top

	Totalmente hecho por AxE para Pop4.
	El que me lo robe le mando los abogados en moto.

*/
private["_grupo","_zona","_accion","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_organizacion","_lugar"];
_zona = _this select 0;
_grupo = _zona getVariable ["gangOwner",grpNull];
_grupoid = _zona getVariable ["gang_id",-1];

if (_grupoid != -1 && isNull _grupo) exitWith { hint "Los jefes de la organización que controla esta zona al parecer no estan en la isla ... tendrás que esperar para poder disputarla."};
if (_grupoid != -1 && !(_zona getVariable ["atacable",false])) exitWith {hint "No puedes capturar esta zona, debes mandar un aviso y esperar 15 Minutos primero. Usa el menu Y para abrir el dialogo de guerra de mafias."};

//Excepciones de organización
if(life_gangzona > 0) exitWith { hint "Ya controlas una zona y no tienes suficientes hombres como para controlar dos."};
if(life_gangid == -1) exitWith { hint "Debes hacer parte de una organización reconocida para controlar una zona."};
if(life_gangrank < 4) exitWith { hint "Tu no tienes el rango suficiente en tu organización para estos asuntos."};
if!(grpPlayer getVariable ["gang",true]) exitWith { hint "Tu agrupación no es una organización reconocida"};
if !(isNull _grupo) then {
if(_grupo == grpPlayer) exitWith {titleText["Tu organización ya controla esta Zona!","PLAIN"]};
if ((count units _grupo) < 5) exitWith {hint "No hay suficientes integrantes del grupo que controla esta zona como para que sea reconocida tu victoria."};
};
if ((count units grpPlayer) < 8) exitWith {hint "No tienes suficientes miembros en tu organización ahora mismo como para intentar capturar esta zona"};

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText["No estas en una agrupación !","PLAIN"]};

if((_zona getVariable ["inCapture",FALSE])) exitWith {hint"Solo una persona al tiempo puede capturar la Zona"};

_gangalias = life_gangAlias;
if (_gangalias == "") then {
_gangalias = name player;
};

if(!isNull _grupo) then {
	_organizacion = _grupo getVariable ["gang_name",""];
	_accion = [
		format["Esta zona esta controlada por %1<br/>Estas seguro de querer incursionar en su zona?",_organizacion],
		"Esta Zona pertenece a una Organización..",
		"Si",
		"No"
	] call BIS_fnc_guiMessage;

	_cpRate = 0.008;
	
} else {
	_cpRate = 0.01;
};

if(!isNil "_accion" && {!_accion}) exitWith {titleText["Captura Cancelada","PLAIN"];};
if (pop_din < 20000) exitWith {hint "Para controlar una zona necesitas dinero capo ... hay que pagar a muchas gentes..."};
[6,format ["POPTV News: Última Hora! : Se acrecienta la guerra por territorio en Metropolis, la organización %2 estan disputando el control de una zona ahora mismo - Seguiremos informando!",_gangalias,(group player) getVariable "gang_name"]] remoteExec ["life_fnc_broadcast",-2];
pop_din = pop_din - 20000;
life_action_inUse = true;

disableSerialization;
_title = "Capturando la zona...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
/*
Mando alerta a los miembros de la banda que esta siendo atacada... la idea esque solo puedan atacar una vez cada 24 horas a la misma mafia y que tengan que 
avisar 15 mins antes ... sino esta bajo ataque la zona es zona segura para la mafia.
*/
if(!isNull _grupo) then 
{
	_gangname = (group player) getVariable "gang_name";
	_text = format["La zona que controlas esta siendo capturada por la organización %1!",_gangname]; 
	
	[10, "Caputran tu Zona", [1,0,0], 1.5, _text, [1,1,1], 1] remoteExec ["ica_fnc_anuncio", _grupo];	
	[1,_text] remoteExec ["life_fnc_broadcast",_grupo];
};
		[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["life_fnc_animSync",-2];
while {true} do
{
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_zona setVariable["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_zona setVariable["inCapture",false,true];};
	if(life_istazed) exitWith {_zona setVariable["inCapture",false,true];}; //Tazed
	if(life_interrupted) exitWith {_zona setVariable["inCapture",false,true];};
};

//Cierro la barrita y checo si todo fue bn.
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_zona setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_zona setVariable["inCapture",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Captura Cancelada","PLAIN"]; life_action_inUse = false;_zona setVariable["inCapture",false,true];};
life_action_inUse = false;

titleText["La zona ha sido puesta en conflicto y si habia otro dueño en estos momentos esta siendo cuestionado su control... espera 30 minutos para que sea completamente tuya.","PLAIN"];

[_zona,grpPlayer,_gangalias] spawn {
private ["_zona","_grupo","_gangalias"];
sleep 900;

_zona = _this select 0;
_grupocaptura = _this select 1;
_gangalias = _this select 2;
_grupo = _zona getVariable ["gangOwner",grpNull];

if !(isNull _grupo) then {
if(_grupo == _grupocaptura) exitWith {titleText["Tu organización sigue controlando esta Zona!","PLAIN"]};
};

_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
//_organizacion = _grupo getVariable ["gang_name",""];
[6,format ["POPTV News: Última Hora! : Alias %1 y su Organización %2 al parecer ahora han ganado control sobre una zona!",_gangalias,_grupocaptura getVariable "gang_name"]] remoteExec ["life_fnc_broadcast",-2];	
_zona setVariable["inCapture",false,true];
_zona setVariable["gangOwner",_grupocaptura,true];
_zona setVariable["gang_id",_grupocaptura getVariable "gang_id",true];
_cod = _zona getVariable "codigo";
_grupocaptura setVariable ["gang_zona",_cod,true];
_grupo setVariable ["gang_zona",0,true];

[_zona,_grupocaptura] spawn life_fnc_initExtorsion;

if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};
		if (life_HC_isActive) then {
			[6,_grupocaptura] remoteExec ["HC_fnc_updateGang",HC_Life]; 
		} else {
			[6,_grupocaptura] remoteExec ["TON_fnc_updateGang",2]; 
		};
sleep 2;

	if !(isNull _grupo) then {
	if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};
		if (life_HC_isActive) then {
			[6,_grupo] remoteExec ["HC_fnc_updateGang",HC_Life]; 
		} else {
			[6,_grupo] remoteExec ["TON_fnc_updateGang",2]; 
		};
	};
};

//listop !!