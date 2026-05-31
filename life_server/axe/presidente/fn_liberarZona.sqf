/*
	AxE Is On Top
	
	Sistema de liberación de zonas para el presidente de Metropolis.
	Totalmente hecho por AxE para Pop4.
	El que me lo robe le mando los abogados en moto.

*/
private["_grupo","_zona","_accion","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_organizacion","_lugar"];
_zona = _this select 0;
_grupo = _zona getVariable ["gangOwner",grpNull];
_grupoid = _zona getVariable ["gang_id",-1];


if (_grupoid != -1 && isNull _grupo) exitWith { hint "Los jefes de la organización que controla esta zona al parecer no estan en la isla ... tendrás que esperar para poder disputarla."};
if (isNull _grupo) then {hint "Esta zona no esta siendo controlada por ninguna organización ilegal"};
//Excepciones de organización

if!(license_civ_alcalde) exitWith { hint "Esto es solo para el presidente."};
if ((npc_presidente getVariable ["decreto",0]) != 4) exitWith {hint "El decreto actual no te permite hacer esto"};


if !(isNull _grupo) then {
if ((count units _grupo) < 5) exitWith {hint "No hay suficientes integrantes del grupo que controla esta zona como para que sea reconocida tu victoria."};
};

if((_zona getVariable ["inCapture",FALSE])) exitWith {hint"Solo una persona al tiempo puede capturar la Zona"};


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
_nombreorg = _grupo getVariable ["gang_name",""];
[[6,format ["POPTV News: Última Hora! : El Gobierno de Metropolis, esta liberando una zona del control de la temida organización criminal %1 ahora mismo - Seguiremos informando!",_nombreorg]],"life_fnc_broadcast",true,false] call life_fnc_MP;	
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
	_text = format["La zona que controlas esta siendo Liberada por el Gobierno"]; 	
	[[10, "Caputran tu Zona", [1,0,0], 2.5, _text, [1,1,1], 1.5], "ica_fnc_anuncio", _grupo, false, false] call life_fnc_MP;	
	[[1,_text],"life_fnc_broadcast",_grupo,false] spawn life_fnc_MP;
};
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
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

[_zona] spawn {
private ["_zona","_grupo","_gangalias"];
sleep 1800;

_zona = _this select 0;
_grupo = _zona getVariable ["gangOwner",grpNull];

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
_zona setFlagTexture _flagTexture;
//_organizacion = _grupo getVariable ["gang_name",""];
[[6,"POPTV News: Última Hora! : Las fuerzas del estado han cumplido la orden presidencial y han logrado liberar una zona que estaba bajo control de organizaciones ilegales"],"life_fnc_broadcast",true,false] call life_fnc_MP;	
_zona setVariable["inCapture",false,true];
_zona setVariable["gangOwner",grpNull,true];
_zona setVariable["gang_id",-1,true];
_cod = _zona getVariable "codigo";

[_zona,grpNull] spawn life_fnc_initExtorsion;

	if !(isNull _grupo) then {
	_gID = _grupo getVariable "gang_id";
	if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};
	[[_gID,"-1",-1,[],0],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
	};
};

//listop !!