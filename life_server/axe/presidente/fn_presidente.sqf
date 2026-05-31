/*
Sistema de Presidencia - Metropolis

Decretos:
0: todo igual.
1: Decreto de Alivio financiero: desc = desc - 0.05; Descuento del 5% en tiendas.
2: Decreto de Incentivo Agrario: venta de alimentos da el doble de exp y tala da exp.
3: Decreto de Subsidio Comercial: subastas y mercarosen mejoradas. Paga más la subasta y mercarosen cobra menos aunque paga igual.
4: Decreto de Ley Marcial y Conmosión Interior: presidente puede capturar (liberar) zonas.
5: Decreto de Subsidio Académico: universidad vale 1k por nivel.

EH: 
Bota un maletín con 10k de pasta que le quita al alcalde y los documentos secretos.

Scripts:
Alcalde podrá mandar sugerencias como avisos por side libres a Independent y west, desde el despacho.
Alcalde puede liberar zonas mafiosas con colaboración de la policia y su escolta y con decreto respectivo de Conmosión Interior.
Marcador de la ubicación del alcalde para la policia siempre y cuando tenga GPS.
Alcalde cobrara 50k cada restart a modo de salario

Normas:
Se podrá cobrar 100k como máximo a la policia por el rescate del alcalde.
Si el alcalde es asesinado en un secuestro dejará de ser alcalde hasta que asuma el vice (2do en las votaciones) o la próxima semana se vuelva a convocar a elecciones.
Elecciones cada Todos los domingos.
El alcalde es responsable de velar porque los ciudadanos reciban la mejor atención de las entidades del estado.
El alcalde debe valorar su vida más aún y cuidarse siempre estando cerca a las comisarias evitar ponerse en riesgo.
El alcalde solo puede liberar 1 zona por restart, y no puede revisar las casas sin orden judicial y pruebas.
Para liberar una zona de control mafioso aunque no es necesario una investigación ni saber quien la controla, es requerido denuncias ciudadanas comprobables.
El alcalde podrá contratar seguridad privada para mejorar adicionalmente su seguridad ... Deberá pagarlo él mismo.
El alcalde y su cuerpo de seguridad podrá brindar protección a los civiles en zonas de farmeo legales, solo en esa zona y solo 
	proteger al civil, no podrá hacer persecuciones ni patrullar y solo podrá retener temporalmente delincuentes en fragancia hasta que llegue la policia y lo procese.
No puede hacer nada ilegal ni él ni su cuerpo de seguridad ni ser Corrupto... (baneo por antirol).

*/


_param = _this select 0;
_decreto =  _this select 1;

if (_param isEqualTo "init") exitWith {

//[[npc_presidente, ["Emitir decreto",{[] spawn ica_fnc_presidente;}]],"addAction",true,true] call BIS_fnc_MP;
//decreto = 0;

npc_presidente setVariable ["decreto_emitido",false,true];
npc_presidente setVariable ["decreto",0,true];

[npc_presidente, ["Emitir Decreto de Alivio Financiero", {["decreto",1] spawn ica_fnc_presidente},nil,6,true,true,"","license_civ_alcalde && !(npc_presidente getVariable [""decreto_emitido"",false])"]] remoteExec ["addAction", 0,true];
[npc_presidente, ["Emitir Decreto de Incentivo Agrario", {["decreto",2] spawn ica_fnc_presidente},nil,6,true,true,"","license_civ_alcalde && !(npc_presidente getVariable [""decreto_emitido"",false])"]] remoteExec ["addAction", 0,true];
[npc_presidente, ["Emitir Decreto de Subsidio Comercial", {["decreto",3] spawn ica_fnc_presidente},nil,6,true,true,"","license_civ_alcalde && !(npc_presidente getVariable [""decreto_emitido"",false])"]] remoteExec ["addAction", 0,true];
[npc_presidente, ["Emitir Decreto de Ley Marcial y Conmosion Interior", {["decreto",4] spawn ica_fnc_presidente},nil,6,true,true,"","license_civ_alcalde && !(npc_presidente getVariable [""decreto_emitido"",false])"]] remoteExec ["addAction", 0,true];
[npc_presidente, ["Emitir Decreto de Subsidio Universitario", {["decreto",5] spawn ica_fnc_presidente},nil,6,true,true,"","license_civ_alcalde && !(npc_presidente getVariable [""decreto_emitido"",false])"]] remoteExec ["addAction", 0,true];



};


if (_param isEqualTo "decreto") exitWith {

if (npc_presidente getVariable "decreto_emitido") exitWith { hint "Ya hay un decreto en vigor."};

npc_presidente setVariable ["decreto_emitido",true,true];
npc_presidente setVariable ["decreto",_decreto,true];


switch(_decreto) do
{
	case 1: {
	{Desc = Desc - 0.05} remoteExec ["BIS_fnc_spawn",0,true];
	[[6,"Comunicado Presidencial: La Presidencia de Metropolis ha Emitido el decreto de Alivio Financiero, firmase y cumplase."],"life_fnc_broadcast",true,false] call life_fnc_MP;	
	};
	case 2: {
	[[6,"Comunicado Presidencial: La Presidencia de Metropolis ha Emitido el decreto de Incentivo Agrario, firmase y cumplase."],"life_fnc_broadcast",true,false] call life_fnc_MP;	
	};
	case 3: {
	[[6,"Comunicado Presidencial: La Presidencia de Metropolis ha Emitido el decreto de Subsidio Comercial, firmase y cumplase."],"life_fnc_broadcast",true,false] call life_fnc_MP;	
	};
	case 4: {
	[[6,"Comunicado Presidencial: La Presidencia de Metropolis ha Emitido el decreto de Ley Marcial y Conmosion Interior, firmase y cumplase."],"life_fnc_broadcast",true,false] call life_fnc_MP;	
	};	
	case 5: {
	[[6,"Comunicado Presidencial: La Presidencia de Metropolis ha Emitido el decreto de Subsidio Universitario, firmase y cumplase."],"life_fnc_broadcast",true,false] call life_fnc_MP;	
	};
	
};

};
