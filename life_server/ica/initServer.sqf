
/*
por: Icaruk
*/

//0 spawn ica_fnc_climaServidor;
//0 spawn ica_fnc_initVars;

//0 spawn ica_fnc_initMineria;

//["init"] spawn ica_fnc_initSubasta;


//quick inits
/*["generarmisionesINIT"] spawn ica_fnc_misionesLaEmpresa;
["generarTalleres"] spawn ica_fnc_tallerLaEmpresa;
["generarAlertasPolicias"] spawn ica_fnc_alertasPolicia;
["generTiendaPoliciaDevolverArmas"] spawn ica_fnc_venderArmasPolicia;
["init"] spawn ica_fnc_roboCoche;
["generarRobosMenores"] spawn ica_fnc_robosMenoresHandler;
["init"] spawn ica_fnc_breakingBad;
["generarmisionesINIT"] spawn ica_fnc_misionesLaEmpresaMar;
["generarCombateINIT"] spawn ica_fnc_generarCombate;*/
["init"] spawn ica_fnc_seguridadPrivada;
["init"] spawn ica_fnc_chatarrero;
["init"] spawn ica_fnc_ladronCoches;
0 spawn ica_fnc_initDroga;
["reset0"] spawn ica_fnc_initPortatil;

centralitaArray = ["Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre"];

//---------> AxE init's <--------

/* AxE PopTv !*/
["init"] spawn ica_fnc_poptv;

/* AxE Rosario !*/
["init"] spawn ica_fnc_rosario;

/* AxE Buses !*/
BUS_Conductores = [];
publicVariable "BUS_Conductores";

/* AxE Bomberos !*/
["init"] spawn ica_fnc_bomberos;

/* AxE Sistema de Control de Zonas !*/
[] spawn ica_fnc_initZonas;

/* AxE Casino !*/
["init"] spawn ica_fnc_casino;

/* AxE Fudra !*/
["init"] spawn ica_fnc_fudra;

/* AxE Presidente !*/
["init"] spawn ica_fnc_presidente;

/* AxE Presidente !*/
["init"] spawn ica_fnc_meca;

//---------> AxE init's <--------

initSerCargado = true;
publicVariable "initSerCargado";

//---------> Adamuz init's <--------

//["init"] spawn ica_fnc_rebientagasolineras;

/* Adamuz General !*/
nombreservidor = "POPLife 4.0 Metropolis";
publicvariable "nombreservidor";
robosucursalactivado = false;
publicVariable "robosucursalactivado";

//---------> Adamuz init's <--------

// *** Modo editor ***

if !(isDedicated) then {
	0 spawn ica_fnc_climaCliente;
	waitUntil {!isNil {experiencia}};

	[] call ica_fnc_initHabilidades;


	arrayInfo = ["", "", "", "", "", "", "", "", "* Pop Life", "* v.server"];
	if (isNil {profileNamespace getVariable "arraySMS"}) then {
		_arr = []; _arr resize 30;
		profileNamespace setVariable ["arraySMS", _arr];
	};

	waitUntil {!isNull (uiNamespace getVariable "HUDica")};

	player addAction ["", {
		call ica_fnc_limitadorDeArmas
	}, "", 0, false, true, "DefaultAction", "isNil 'puedoDisparar' "];

 	waitUntil {!isNil {heNacido}};
	["recibo"] call ica_fnc_bloqueoDinero;
	// call ica_fnc_silencer;
};

// **** Black

//["barcoHornGigante2", [8740.93,5785.12,74.5068], 45, 15, 3, 30, 60, 0] call ica_fnc_SFXambientes;

