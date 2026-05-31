// Excepciones ...
if (isNil "axe_SPLlamado") then {axe_SPLlamado = false;};
if (axe_SPLlamado) exitWith { hint "Ya has llamado a la seguridad privada, cancela o espera!"; };
if (axe_SPtrabajando) exitWith { hint "A ver amigo... Seguridad privada buscando seguridad ??!"; };

// Todo okay seguimos

axe_SPLlamado = true;
[[player],"ica_fnc_sp_llamarSP",false,false] spawn life_fnc_mp;
hint "Estamos Buscandote un Agente de Seguridad Privada, espera a que acepte tu solicitud en Máximo 60 segundos.";