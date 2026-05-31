//Adamuz Systems: Si hay 2+ EMS cerca no te deja usarlo, si te alejas mientras te cura cancela y tarda tiempo en curar ^^ A peticion de los EMS.
// this addAction["Curame EMS por favor", { [] spawn ica_fnc_curameMedicoNPC;}];

if (!isNil {ocupado}) exitwith {titleText ["Ya te estoy curando...", "PLAIN"];};

_medico = cursortarget; 
 
if ({side _x == INDEPENDENT} count playableUnits > 3)  exitWith {titleText ["Lo siento, no estoy de servicio ahora mismo. Acude a un compañero...", "PLAIN"];}; 
 
if (pop_din < 500) exitwith {titleText ["Mis servicios cuestan 500€", "PLAIN"];}; 
 
_numeroemscerca = 0; 
{ 
 if(isPlayer _x) then { 
  if( _x != player && side _x == INDEPENDENT) then { 
   _numeroemscerca = _numeroemscerca + 1; 
  }; 
 }; 
} forEach ((position _medico) nearObjects["Man", 25]); 
 
if (_numeroemscerca > 1) exitwith 
{ 
 titleText ["Estoy ocupado ahora mismo... Tengo compañeros que te pueden ayudar por aqui cerca.", "PLAIN"]; 
}; 
 
pop_din = pop_din - 500; 
["- 500€"] call ica_fnc_infolog; 

sefuedelems = false;
["play", "bkSndFxMedicoDiagnosticarBip", player] call ica_fnc_SFX;

_t = (round (random 30) + 15); 
[_t + 1, "Recibiendo tratamiento médico. No te alejes!"] spawn ica_fnc_barrita; 
 
while {_t > 0} do 
{ 
 if (player distance _medico > 5) exitwith {titleText ["Te has ido muy lejos y no puedo seguir curandote... TE LO DIJE!", "PLAIN"]; [1, "Cancelando tratamiento..."] spawn ica_fnc_barrita; sefuedelems = true;}; 
  //titleText ["Recibiendo tratamiento...", "PLAIN"]; 
 _t = _t - 1; 
 ocupado = true;
 sleep 1; 
}; 
if (sefuedelems) exitwith { ["play", "bk_error2", player] call ica_fnc_SFX; sefuedelems = nil; ocupado = nil; titleText ["Te has ido muy lejos y no puedo seguir curandote... TE LO DIJE!", "PLAIN"]; [1, "Cancelando tratamiento..."] spawn ica_fnc_barrita;}; 
 
["play", "bk_ok3", player] call ica_fnc_SFX;
[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
profileNamespace setVariable ["enfermedad",nil];
player setVariable ["drogado",false,true];
player setVariable ["tengoMono",false,true];
player setDamage 0; 

ocupado = nil;
titleText ["Ya estás curado, vuelve cuando quieras!", "PLAIN"];