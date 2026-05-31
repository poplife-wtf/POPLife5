/*
Gasolinera por Icaruk MOD by Adamuz Systems
	["menu"] spawn ica_fnc_gasolinera;
*/

disableserialization;
_param = _this select 0;
_camiones = ["pop_dafxf_euro6_rojo", "pop_dafxf_euro6_negro", "pop_iveco_noir","pop_volvo","pop_volvo1","pop_volvo2","pop_volvo3","mr_american_classic_truck_v2", "mr_american_classic_truck_v3", "pop_dafxf_euro6_rojo_oscuro","pop_dafxf_euro6_verde","pop_dafxf_euro6_verde_oscuro","pop_dafxf_euro6_blanco","pop_dafxf_euro6_azul","pop_dafxf_euro6_azul_oscuro","pop_dafxf_euro6_gris","pop_dafxf_euro6_amarillo","pop_dafxf_euro6_rosa","pop_dafxf_euro6_violeta","pop_iveco_f","mr_american_classic_truck_v2","pop_iveco_bleufonce","pop_iveco_rouge","pop_iveco_jaune","pop_iveco_rose","pop_iveco_grise","pop_iveco_orange","pop_Man_TGX_negro","pop_volvo_camion","pop_mercedes_vito","pop_mercedes_vito1","pop_Vandura_civ","pop_Vandura_civ_negro","pop_Vandura_civ_azul","pop_Vandura_civ_rojo","pop_Vandura_civ_Amarillo","pop_Vandura_civ_rosa","pop_Vandura_civ_gris","pop_Vandura_civ_violeta","pop_Vandura_civ_naranja","shounka_a3_spr_civ_noir","shounka_a3_spr_civ_bleufonce","shounka_a3_spr_civ_rouge","shounka_a3_spr_civ_jaune","shounka_a3_spr_civ_rose","shounka_a3_spr_civ_grise","shounka_a3_spr_civ_violet","shounka_a3_spr_civ_orange","Jonzie_Transit","pop_nemo","pop_nemo_noir","pop_nemo_bleufonce","pop_nemo_rouge","pop_nemo_jaune","pop_nemo_rose","pop_nemo_grise","pop_nemo_violet","pop_nemo_orange","ADM_Ford_F100"];

if (vehicle player != player) exitwith {hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Tienes que bajarte del coche, no tenemos empleados para que reposten por ti.</t> <br/><br/>"];};

fn_quitargasolina =
{ 
	_coche = _this select 0;
	_vargas = 40;
	while {_vargas > 0 && fuel _coche > 0} do
	{
		_rand = random 0.005;
		(_coche) setfuel (fuel (_coche)) - _rand; 
		_vargas = _vargas - 1;
		sleep 0.025; 
	};
};

if (_param == "rellena") exitWith 
{
	_gasolinera = uiNamespace getVariable "gasolinera";
	_entada = (_gasolinera displayCtrl 5014);
	
	_fuelNow = round ((fuel vehgasolinera) * 100);
	_fuelneed = 100 - _fuelNow;
	_precio = round (call ica_fnc_precioCombustible) * 0.05;
	if ( (_fuelneed * _precio) > pop_din ) Then {
		if ( pop_din > 0 ) Then {
			_fuelneed = round ( pop_din / _precio );
		} else {
			_fuelneed = 0;
		};
	};
	_entada ctrlSetText format ["%1%2", _fuelneed,"%"];
};
if (_param == "menu") exitWith {
	if (!isNil {ocupado}) exitWith {["play", "bk_error2", player] call ica_fnc_SFX; hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Nome pidas tantas cosas a la vez que me saturo D:</t> <br/><br/>"];};
	[] spawn {
		ocupado = true;
		sleep 2;
		ocupado = nil;
	};
	
	surtidor = cursorObject;
	
	vehgasolinera = ((nearestObjects [surtidor, ["Motorcycle"], 7]) select 0);
	if (isNil {vehgasolinera}) then 
	{
		vehgasolinera = ((nearestObjects [surtidor, ["Air"], 15]) select 0);
		if !(isNil {vehgasolinera}) then {tienecamion = true;};
	};
	if (isNil {vehgasolinera}) then 
	{
		vehgasolinera = ((nearestObjects [surtidor, ["Car"], 15]) select 0);
		if !(isNil {vehgasolinera}) then 
		{
			if (typeof vehgasolinera in _camiones) then 
			{
				tienecamion = true;
			} else 
			{
				tienecamion = false;
				vehgasolinera = ((nearestObjects [surtidor, ["Car"], 7]) select 0);
			};
		};
	};
	if (isNil {vehgasolinera}) exitWith {["play", "bk_error2", player] call ica_fnc_SFX; hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No hay ningún vehiculo cerca.</t> <br/><br/>"]; closeDialog 0};
	
	_vehname = [(typeof vehgasolinera)] call ica_fnc_classtoname;
	hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Estas echando gasolina al vehiculo: <br/><t color='#27b840' size='1.5'>%1</t></t> <br/><br/>", _vehname];
	
	[player, ["alm1Com", "alm2Com"]] call ica_fnc_varToServer; waitUntil {recibido};
	
	createDialog "gasolineraadamuz";
	_gasolinera = uiNamespace getVariable "gasolinera";
	
	_preciolitro = _gasolinera displayCtrl 1603; 
	_preciolitro ctrlSetText format ["%1 €/L", (call ica_fnc_precioCombustible * 0.05)];
	_migas = round ((fuel vehgasolinera) * 100);
	_tengogas = _gasolinera displayCtrl 5015; 
	_tengogas ctrlSetText format ["%1%2", _migas, "%"];

	0 spawn {
		while {!isNil {uiNamespace getVariable "gasolinera"}} do {
			["actualiza"] call ica_fnc_gasolinera;
			sleep 0.5;
		};
	};
};


if (_param == "actualiza") exitWith {
	_gasolinera = uiNamespace getVariable "gasolinera";
	disableserialization;
	_boton = (_gasolinera displayCtrl 5012);
	_txtprecio = (_gasolinera displayCtrl 5013);

	entrada = parseNumber ctrlText 5014;
	
	_precio = round ((call ica_fnc_precioCombustible) * entrada) * 0.05;
	_txtprecio ctrlSetText format ["%1€", _precio];
	
	_boton buttonSetAction '
		["llena", entrada] spawn ica_fnc_gasolinera;
	';
};

if (_param == "llena") exitWith {
	if (isEngineOn vehgasolinera) exitwith {["play", "bk_error2", player] call ica_fnc_SFX; hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Apaga el motor para echar gasolina.</t> <br/><br/>"];};

	if (tienecamion) then {distanciapararepostar = 15} else {distanciapararepostar = 7};
	if ((vehgasolinera distance surtidor) > distanciapararepostar) exitwith {["play", "bk_error2", player] call ica_fnc_SFX; hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Donde esta el coche? Se lo han llevado??.</t> <br/><br/>"];};
	
	_com = _this select 1;
	if (_com < 0) exitWith {["play", "bk_error2", player] call ica_fnc_SFX; hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Escribe un numero valido entre 0 y 100.</t> <br/><br/>"];};
	if (_com > 100) exitWith {["play", "bk_error2", player] call ica_fnc_SFX; hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Escribe un numero valido entre 0 y 100.</t> <br/><br/>"]; };
	if (_com == 0) exitWith {["play", "bk_error2", player] call ica_fnc_SFX; hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Quieres 0 de gasolina? Bueno... aqui tienes XD.</t> <br/><br/>"]; };

	_precio = round ((call ica_fnc_precioCombustible) * entrada) * 0.05 ;
	if !(pop_din >= _precio) exitWith {["play", "bk_error2", player] call ica_fnc_SFX; hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No tienes dinero para pagar.</t> <br/><br/>"];  closeDialog 0; };
	["comercios", _precio] spawn ica_fnc_subeBajaBeneficios;
	pop_din = pop_din - _precio;
		
	_organizacion = cursorTarget getVariable["controlado_por",grpNull];
	if(!isNull _organizacion) then 
	{ 
		[(round (_precio * 0.10)),_organizacion] call life_fnc_gangExtorsion;  
	};
	
	[format ["-%1 €", _precio]] call ica_fnc_infolog;
	_vehiculoseleccionado = vehgasolinera;
	closeDialog 0;
	
	_can = round (entrada / 2);
	_cerca = ["mrkalmacen1", "mrkalmacen2"] call ica_fnc_masCercano;
	_var = if (_cerca == "mrkAlmacen1") then {"alm1Com"} else {"alm2Com"};
	
	missionNamespace setVariable [_var, (missionNamespace getVariable _var) - _can];
	if ((missionNamespace getVariable _var) > 1000) then {missionNamespace setVariable [_var, 1000]};
	if ((missionNamespace getVariable _var) < 0) then {missionNamespace setVariable [_var, 0]};
	publicVariableServer _var;
	_manguera = ropeCreate [_vehiculoseleccionado, [0,0,0], surtidor, [-0.5,0,(random 0.05)], (distanciapararepostar - 2)];
	_t = round (_com / 8);
	[_t, "Repostando..."] spawn ica_fnc_barrita;
	_a = 0; 
	 while {_a < _t} do 
	{ 
		if ((_vehiculoseleccionado distance surtidor) > (distanciapararepostar * 4.2)) exitWith {[_manguera, _vehiculoseleccionado] spawn {_factura = (5000 + round(random 5000)); ["play", "bk_error2", player] call ica_fnc_SFX; "HelicopterExploSmall" createVehicle getPos (surtidor);  hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#330000'>HAS ARRANCADO LA _manguera DEL SURTIDOR!! LA HAS CAGADO PERO BIEN...</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Se te ha pasado la factura a tu banco por los daños causados por valor de (%1)€ y encima se te ha caido un montón de gasolina de tu deposito por la _manguera...</t> <br/><br/>", _factura]; if (pop_atmdin > 5000) then{pop_atmdin = pop_atmdin - _factura; [format ["-%1 €",_factura]] call ica_fnc_infolog;} else {pop_atmdin = pop_atmdin - pop_atmdin; [format ["-%1 €", pop_atmdin]] call ica_fnc_infolog;};[_this select 1] spawn fn_quitargasolina; closeDialog 0; sleep 15; deletevehicle (_this select 0); surtidor= nil;}};  
		if ((isEngineOn _vehiculoseleccionado)) then {["play", "bk_error2", player] call ica_fnc_SFX; if ((_vehiculoseleccionado getHit "engine") < 0.89) then {_vehiculoseleccionado setHit ["engine", ((_vehiculoseleccionado getHit "engine") + 0.095)]}; titleText ["ESTAS REPOSTANDO, APAGA EL MOTOR, SE ESTA ROMPIENDO!!!", "PLAIN", 1];};  
		_a = _a + 1; 
		hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Repostando</t> <br/><br/>"]; 
		sleep 0.25;
		hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Repostando.</t> <br/><br/>"]; 
		sleep 0.25;
		hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Repostando..</t> <br/><br/>"]; 
		sleep 0.25;
		hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Repostando...</t> <br/><br/>"]; 
		sleep 0.25; 
	}; 
	if ((_vehiculoseleccionado distance surtidor) > (distanciapararepostar * 4.2)) exitWith {[_manguera, _vehiculoseleccionado] spawn {_factura = (5000 + round(random 5000)); ["play", "bk_error2", player] call ica_fnc_SFX; "HelicopterExploSmall" createVehicle getPos (surtidor);  hint parseText format ["<br/><t color='#FF0000' size='2' shadow='1'shadowColor='#330000'>HAS ARRANCADO LA _manguera DEL SURTIDOR!! LA HAS CAGADO PERO BIEN...</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Se te ha pasado la factura a tu banco por los daños causados por valor de (%1)€ y encima se te ha caido un montón de gasolina de tu deposito por la _manguera...</t> <br/><br/>", _factura]; if (pop_atmdin > 5000) then{pop_atmdin = pop_atmdin - _factura; [format ["-%1 €",_factura]] call ica_fnc_infolog;} else {pop_atmdin = pop_atmdin - pop_atmdin; [format ["-%1 €", pop_atmdin]] call ica_fnc_infolog;};[_this select 1] spawn fn_quitargasolina; closeDialog 0; sleep 15; deletevehicle (_this select 0); surtidor= nil;}};  
	deletevehicle _manguera;
	sleep 1;
	_vehiculoseleccionado setFuel ((fuel _vehiculoseleccionado) + (_com / 100));
	surtidor = nil;
	distanciapararepostar = nil;
	tienecamion = nil;
	["play", "bk_ok3", player] call ica_fnc_SFX;
	hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>GASOLINERAS ADAMUZ</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Gracias por su compra en nuestra gasolinera. Le deseamos un buen viaje!</t> <br/><br/>"]; 
	closeDialog 0;
};