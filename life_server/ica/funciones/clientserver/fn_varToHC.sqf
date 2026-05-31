
/*
Espiritismo serveriano por Icaruk, Improvisado por AxE

Para comunicarte con el HC del más allá:
	[true, ["var1", "var2"]] call ica_fnc_varToHC; waitUntil {recibido};
*/

private ["_yo", "_var"];

_var = _this select 0; // ARRAY
recibido = false;

//[[_yo, _var], "ica_fnc_varToClient", false, false, true] call bis_fnc_mp; // hago que el server ejecute varToClient para contestarme
[2, _var] remoteExec ["axe_fnc_varToClient",hc_1];