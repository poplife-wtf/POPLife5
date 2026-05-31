#include <macro.h>
/* 
handle del menu de zonas
Comprueba ataque y lo avisa.
Panea el mapa hacia la zona seleccionada.
*/

_modo = _this select 0;
_zona = player getvariable ['zona_elegida_atacar', nil];
_codigo = _zona getVariable "codigo";
_nombre_zona = [_codigo] call ica_fnc_zonatoname;

if (isNil "_zona") exitWith {hint "No has elegido ninguna Zona Mafiosa"};
if (isNull _zona) exitWith {}; //WTF


if (_modo isEqualto "mapa") exitWith {
	
	disableSerialization;

	_parent = findDisplay 997100;
	_ctrl = _parent displayCtrl 12010;
	_posDest = getPos _zona;
	_ctrl ctrlMapAnimAdd [1, 0.05, _posDest];
	ctrlMapAnimCommit _ctrl;
	_ctrl2 = _parent displayCtrl 10001;
	_ctrl2 ctrlSetText format ["Zona Elegida: %1",_nombre_zona];

};


if (_modo isEqualTo "atacar") exitWith {

if (_zona getVariable["atacable",false]) exitWith {hint "Esta zona ya puede ser atacada, no necesitas declarar un nuevo ataque."};

_grupo = _zona getVariable ["gangOwner",grpNull];
_grupoid = _zona getVariable ["gang_id",-1];

if (_grupoid isEqualTo -1) exitWith {hint "Esta zona no tiene dueño, puedes ir a atacarle directamente sin necesidad de avisar."};

_fuera = false;
if(life_gangid  isEqualTo  -1) exitWith {_fuera = true; hint "Debes hacer parte de una organización reconocida para controlar una zona."};
if(life_gangrank < 4) exitWith {_fuera = true; hint "Tu no tienes el rango suficiente en tu organización para estos asuntos."};
if!(grpPlayer getVariable ["gang",true]) exitWith {_fuera = true; hint "Tu agrupación no es una organización reconocida"};
if ((count units grpPlayer) < 5) exitWith {_fuera = true; hint "No tienes suficientes miembros en tu organización ahora mismo como para intentar capturar esta zona"};
if(isNil {grpPlayer getVariable "gang_name"}) exitWith {_fuera = true; titleText["No estas en una agrupación !","PLAIN"]};
if(_grupo  isEqualTo  grpPlayer) exitWith {_fuera = true; titleText["Tu organización ya controla esta Zona!","PLAIN"]};
if (_fuera) exitWith {titleText["Captura Cancelada","PLAIN"];};
if ((count units _grupo) < 5) exitWith {hint "No hay suficientes integrantes del grupo que controla esta zona como para que sea reconocida tu victoria."};


	_organizacion = _grupo getVariable ["gang_name",""];
	_accion = [
		format["Esta zona esta controlada por %1<br/>Estas seguro de querer incursionar en su zona? Los propietarios de la zona serán avisados y podrás entrar en 15 minutos.",_organizacion],
		"Esta Zona pertenece a una Organización..",
		"Si",
		"No"
	] call BIS_fnc_guiMessage;
	
	waituntil {!isNil "_accion"};

	if(!isNil "_accion" && {!_accion}) exitWith {titleText["Captura Cancelada","PLAIN"];};

	_gangname = grpPlayer getVariable "gang_name";
	_text = format ["La organización %1 atacara tu zona en 15 Minutos !! Preparate ",_gangname];
	
	[10, "Amenazan tu Zona", [1,0,0], 1.5, _text, [1,1,1], 1] remoteExec ["ica_fnc_anuncio", _grupo];
	[1,_text] remoteExec ["life_fnc_broadcast",_grupo];

	hintSilent parseText "<img size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'> Guerra de Mafias: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Tendrás que esperar 15 minutos antes de poder iniciar hostilidades <br/> Una vez pasado el tiempo te avisaremos y podrás atacar la zona.</t>";	
	
	sleep (60 * 15);
	_zona setVariable ["atacable",true,true];
	{
		hintSilent parseText "<img size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'> Guerra de Mafias: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Tu organizacion ya puede iniciar el ataque a la zona amenazada. <br/>Ahora puedes iniciar hostilidades pero aún debes atacar la zona lo que te costará 10000 euros .</t>";
	} remoteExec ["BIS_fnc_spawn",grpPlayer];
	
	
	
};