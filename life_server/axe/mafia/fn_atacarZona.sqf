#include <macro.h>
/*
	AxE Is On Top
	
	Sistema para atacar zonas.
	Totalmente hecho por AxE para Pop4.
	El que me lo robe le mando los abogados en moto.

*/
private["_grupo","_zona","_accion","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_grupo","_lugar"];
_zona = _this select 0;
_grupo = _zona getVariable ["gangOwner",grpNull];
_grupoid = _zona getVariable ["gang_id",-1];

if (_grupoid isEqualTo -1) exitWith { hint "Los jefes de la organización que controla esta zona al parecer no estan en la isla ... tendrás que esperar para poder disputarla."};
if (isNull _grupo) then {hint "Esta zona no esta siendo controlada por ninguna organización ilegal"};
if !(_zona getVariable ["atacable",false]) exitWith {hint "No puedes atacar esta zona, debes mandar un aviso y esperar 15 Minutos primero. Usa el menu Y para abrir el dialogo de guerra de mafias."};
if(_zona getVariable ["inCapture",FALSE]) exitWith {hint"Solo una persona al tiempo puede capturar la Zona"};

_codigozona = _zona getVariable "codigo";
_nombrezona = [_codigozona] call ica_fnc_zonatoname;


if(!isNull _grupo) then {
	_organizacion = _grupo getVariable ["gang_name",""];
	_accion = [
		format["Esta zona esta controlada por %1<br/>Estas seguro de querer incursionar en su zona? Valdrá 10000 euros.",_organizacion],
		"Esta Zona pertenece a una Organización..",
		"Si",
		"No"
	] call BIS_fnc_guiMessage;
waituntil {!isNil "_accion"};
};

if(!isNil "_accion" && {!_accion}) exitWith {titleText["Captura Cancelada","PLAIN"];};

if (pop_din < 10000) exitWith {hint "Para controlar una zona necesitas dinero capo ... hay que pagar a muchas gentes..."};
[6,format ["POPTV News: Última Hora! : Se acrecienta la guerra por territorio en Metropolis, la zona de %1 esta siendo liberada ahora mismo - Seguiremos informando!",_nombrezona]] remoteExec ["life_fnc_broadcast",0];
pop_din = pop_din - 10000;

	_gangname = (group player) getVariable "gang_name";
	_text = "La zona que controlas esta siendo liberada de tu control!"; 
	
	[10, "Atacan tu Zona", [1,0,0], 1.5, _text, [1,1,1], 1] remoteExec ["ica_fnc_anuncio", units _grupo];	
	[1,_text] remoteExec ["life_fnc_broadcast",units _grupo];

_tiempoespera = 10 + (round (random 100));

[_tiempoespera, "Atacando la Zona..."] spawn ica_fnc_barrita;
[player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExec ["life_fnc_animSync",0];
sleep _tiempoespera;
player playActionNow "stop";
titleText["La zona ha sido puesta en conflicto y si habia otro dueño en estos momentos esta siendo cuestionado su control... espera 15 minutos para que puedas asaltarla.","PLAIN"];


sleep (5 * 60);

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
_zona setVariable["inCapture",false,true];
_zona setVariable["gangOwner",grpNull,true];
_zona setVariable["gang_id",-1,true];
_cod = _zona getVariable "codigo";

[_zona,grpNull] spawn life_fnc_initExtorsion;

		_gFund = _grupo getVariable ["gang_bank",0];
		_grupo setVariable ["gang_zona",0,true];
		_gId = _grupo getVariable "gang_id";
		_gfund = ceil _gfund;
		_txtfinish = format ["La zona aunque le sigue perteneciendo a sus antiguos dueños ahora puede ser robada y sus casas saqueadas, has robado de su banco %1 euros",_gfund];
		titleText[_txtfinish,"PLAIN"];			
		pop_din = pop_din + _gFund;
		[10, "Tesorero de la Organización", [1,0,0], 1.5, format ["Un ladrón nos ha robado %2 del Banco de la Organización",_gfund], [1,1,1], 1] remoteExec ["ica_fnc_anuncio",units _grupo];
		_gFund = 0;
		_grupo setVariable ["gang_bank",0,true];
		if (life_HC_isActive) then {
			[1,_grupo] remoteExecCall ["HC_fnc_updateGang",HC_Life];
		} else {
			[1,_grupo] remoteExecCall ["TON_fnc_updateGang",2];
		};
		
		if (life_HC_isActive) then {
			[1,_grupo] remoteExecCall ["HC_fnc_updateGang",HC_Life];
		} else {
			[1,_grupo] remoteExecCall ["TON_fnc_updateGang",2];
		};


//listop !!