// Excepciones ...
if (isNil "axe_BBLlamado") then {axe_BBLlamado = false;};
if (axe_BBLlamado) exitWith { hint "Ya has llamado a la seguridad privada, cancela o espera!"; };
if (axe_BBtrabajando) exitWith { hint "Haber amigo ... Seguridad privada buscando seguridad ??!"; };

// Todo okay seguimos

axe_BBLlamado = true;
[[player],"ica_fnc_sp_llamarSP",false,false] spawn life_fnc_mp;
hint "Estamos Buscandote un Agente de Seguridad Privada, espera a que acepte tu solicitud en Máximo 60 segundos.";