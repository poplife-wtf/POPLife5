#include <macro.h>
/* ---------- 

A tomar por culo el Tonic este de los cojones!!
Hecho por : AxE
Para: PopLife 4

Desc: Permite a los players crear Alias para su organización usados para 
ciertas actividades en las que es mejor pasar de incógnito.

------------- */

private["_unit","_unitID","_members","_unitRank","_isLeader"];
if (playerSide == west OR playerSide == independent) exitWith {hint "Ni policias ni EMS tienen tratos con las Organizaciones"};	
disableSerialization;

_gangAlias = ctrlText ((findDisplay 25200) displayCtrl 2522);

_length = count (toArray(_gangAlias));
_chrByte = toArray (_gangAlias);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

player setVariable["gang_alias",_gangAlias,true];
life_gangAlias = _gangAlias;

_unitID = getPlayerUID player;

		//diag_log "################# AxE DEBUG Gangs #######################";
		//diag_log format["# Alias antes # life_gangmembers = %1",life_gangmembers];
_members = group player getVariable "gang_members";
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};

{
	_uid = _x select 0;
	if (_uid isEqualTo _unitID) then {
		_x set [1, _gangAlias];
	};
} forEach _members;

life_gangmembers = _members;
group player setVariable ["gang_members",_members,true];
		//diag_log "################# AxE DEBUG Gangs #######################";
		//diag_log format["# Alias despues # life_gangmembers = %1",life_gangmembers];
    if (life_HC_isActive) then {
        [4,_group] remoteExecCall ["HC_fnc_updateGang",HC_Life];
    } else {
        [4,_group] remoteExecCall ["TON_fnc_updateGang",2];
    };
_pic2 = ["POP_npc_mafioso3"] call ica_fnc_classToPic;
hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'> La organización: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Muy bien %2 ...ahora te conoceremos como %3...  <br/>has que tu nombre sea conocido, amado u odiado pero conocido.</t>",_pic2, name player,_gangAlias];
//[[life_gangid,"-1",-1,life_gangmembers,-1],"life_fnc_updateGangInfo",true,false] spawn life_fnc_MP;
[] call life_fnc_gangMenu;