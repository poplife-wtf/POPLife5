/*
	Creado por Rosen
	Puesto a funcionar por AxE
*/

private["_taladro"];
	if (!isNil "robos_bloqueados") exitWith {
	hint "Ya hay otro ROBO en progreso, debes esperar a que termine";
	};
if !({side _x == WEST} count playableUnits > 8) exitWith {hint "Tienen que estar al menos 8 policias conectados.";};
	if !(life_in_gang) exitWith {hint "No te encuentras en ninguna organizacion reconocida como para intentar hacer este robo."};
	if (life_gangrank < 4) exitWith {hint "Solo los lideres de la organizacion pueden iniciar un robo de estas proporciones."};
	if ((count units (group player)) < 6) exitWith {hint "No tienes suficientes miembros en tu organización ahora mismo como para intentar atracar el banco"};
	if (("cri" call ica_fnc_expToLevel) < 5) exitWith {
        titleText["No sabes robar...", "PLAIN"];
	};

	   //_tengoTaladro = ["pop_taladro"] call ica_fnc_tengo;
	   	//if (_tengoTaladro == 0) exitWith {hint "No tienes un taladro para intentar atracar el banco"};
		//["pop_taladro", -1] call ica_fnc_item;

if (banco getVariable "robando" == 1) exitWith {hint "No se puede robar mas de una vez, Se te ha confiscado el taladro por listo.";};
banco setVariable["robando",1];
[[10, "Aviso", [1,0,0], 1.5, "Están atracando el banco de Metropolis", [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;
//{robos_bloqueados = true; publicVariable "robos_bloqueados";sleep 1200;robos_bloqueados = nil; publicVariable "robos_bloqueados";} remoteExec ["BIS_fnc_spawn",2];
//aviso a todo el server

[cajaBanco, "heist",1] remoteExec ["life_fnc_say3D", -2, true]; 
["<t size='0.8' shadow='1' color='#FF6600'>Montando el taladro...Se ha activado la seguridad del banco. La puerta permanecera cerrada hasta que termine de abrirse la caja fuerte.</t>", 0, 1, 5, 2, 0, 1] spawn BIS_fnc_dynamicText;
banco animate ["door3", 1];
sleep 5;
_taladro = "pop_taladra_puerta" createVehicle position player;
_taladro attachTo [banco, [-4, -0.6, 2]]; 
_taladro setDir 90;
[_taladro, "taladro",1] remoteExec ["life_fnc_say3D", -2, true]; 
[540, "Abriendo caja fuerte..."] spawn ica_fnc_barrita;
sleep 540;
deleteVehicle _taladro;
sleep 1;
[banco, "vault",1] remoteExec ["life_fnc_say3D", -2, true]; 
sleep 1.5;
banco animate ["vaulthandle", 1];
banco animate ["latch_1", 1];
banco animate ["latch_2", 1];
banco animate ["latch_3", 1];
banco animate ["latch_4", 1];
banco animate ["vaultdoor", 1];
banco animate ["door3", 1];
[banco, "alarmb",3] remoteExec ["life_fnc_say3D", -2]; 
["<t size='0.8' shadow='1' color='#FF6600'>Ya tienes la pasta. Tito Rosen te aconseja correr!</t>", 0, 1, 5, 2, 0, 1] spawn BIS_fnc_dynamicText;
[getPlayerUID player,profileName,"487"] remoteExec ["life_fnc_wantedAdd", (group player)]; 
sleep 3;
[cajaBanco_3, ["Coger dinero",{_polisOn= {side _x == WEST} count playableUnits;_aumento = (_polisOn * 6500);if (player distance cajaBanco_3 <= 1) then {pop_din = pop_din + (155000 + _aumento);deleteVehicle cajaBanco_3;["envio", player, 50, 60*10] call ica_fnc_bloqueoDinero;}else{hint "Tienes que acercarte mucho."};}]] remoteExec ["addAction", -2];