/*

~~ ADAMUZ SYSTEMS ~~
Sistema de Telefonia POP4

["init", "tipo movil (iphone, samsung, nokia)"] ica_fnc_initmovil;
missionconfigfile >> "ada_telefono"

*/
/*
if (movil_hc) exitWith {

	[player,telefonoabierto] remoteExec ["axe_fnc_initmovil",hc_1,false];

};
*/
disableserialization;

ada_ponerhoraentlf =
{
	[] spawn {
			while {telefonoabierto} do {
				((finddisplay 8542) displayCtrl 103) ctrlSetText (format ["%1", [] call BIS_fnc_timetostring select [0, 5]]);
				sleep 0.6;
			};
		};
};

_init = 
[
	[604,false],[900,false],[901,false],[902,false],[903,false],[904,false],[905,false],[800,false],[801,false],[802,false],[803,false],[804,false],
	[700,false],[701,false],[702,false],[600,false],[601,false],[602,false],[603,false],[514,false],[515,false],[513,false],[512,false],[511,false],
	[510,false],[509,false],[508,false],[507,false],[506,false],[505,false],[504,false],[503,false],[502,false],[501,false],[500,false],[405,false],
	[406,false],[403,false],[404,false],[402,false],[400,false],[401,false],[100,false],[101,false],[102,false],[201,false],[202,false],[203,false],
	[204,false],[205,false],[206,false],[207,false],[208,false],[209,false],[301,false],[302,false],[303,false],[304,false],[305,false],[306,false],
	[307,false],[308,false],[309,false],[605,false],[1000,false],[1001,false],[1002,false],[516,false],[407,false],[408,false]
];

_a_p_ini = [[100, true],[101, true],[102, true],[201, true],[202, true],[203, true],[204, true],[205, true],[206, true],[207, true],[208, true],[209, true],[301, true],[302, true],[303, true],[304, true],[305, true],[306, true],[307, true],[308, true],[309, true]];
_a_p_msg = [[100, true],[101, true],[102, true],[601, true],[602, true],[603, true]];
_a_p_v_msg = [[100, true],[101, true],[102, true],[601, true],[602, true],[604,true],[605,true],[402,true]];
_a_p_e_msg = [[100, true],[101, true],[102, true],[402,true],[1000,true],[1001,true],[1002,true]];
_a_p_llamar = [[514,true],[515,true],[516,true],[100, true],[101, true],[102, true],[513,true],[512,true],[511,true],[510,true],[509,true],[508,true],[507,true],[506,true],[505,true],[504,true],[503,true],[502,true],[501,true],[500,true]];
_a_p_cont = [[100, true],[101, true],[102, true],[700, true],[701, true],[702, true],[601, true], [602, true]];
_a_p_add_cont = [[100, true],[101, true],[102, true],[402,true],[800,true],[801,true],[802,true],[803,true],[804,true]];
_a_p_llama_in = [[100, true],[101, true],[102, true],[900,true],[901,true],[902,true],[903,true],[904,true],[905,true]];
_a_p_llama_on = [[100, true],[101, true],[102, true],[512, true],[900,true],[901,true],[902,true]];
_a_p_opciones = [[100, true],[101, true],[102, true],[400,true],[401,true]];
_a_p_opciones_p = [[100, true],[101, true],[102, true],[402,true],[404,true],[403,true]];
_a_p_opciones_s = [[100, true],[101, true],[102, true],[402,true],[404,true],[405,true],[406,true],[407,true],[408,true]];
_a_fondo = profilenamespace getvariable ["fondotlfandroid", "\pop_iconos2\Movil\Android_Fondos\fondo5.paa"];


_i_p_opciones = [[100, true],[101, true],[102, true]];
_fondoiphone = profilenamespace getvariable ["fondotlfiphone", "\pop_iconos2\Movil\Iphone_Fondos\fondo1.paa"];


_moviles = ["\pop_iconos2\Movil\Samsung_Galaxy_Note_4.paa", "\pop_iconos2\Movil\iphone_6.paa", "\pop_iconos2\Movil\Nokia_lumia.paa"];
_fondowindows = profilenamespace getvariable ["fondotlfwindows", ""];


_appiconos = [["android", ["\pop_iconos2\Movil\Android_Iconos\a_opciones.paa", "\pop_iconos2\Movil\Android_Iconos\a_mensajes.paa", "\pop_iconos2\Movil\Android_Iconos\a_llamar.paa", "\pop_iconos2\Movil\Android_Iconos\a_contactos.paa"]], ["iphone", ["\pop_iconos2\Movil\Iphone_Iconos\i_opciones.paa", "\pop_iconos2\Movil\Iphone_Iconos\i_llamar.paa", "\pop_iconos2\Movil\Iphone_Iconos\i_mensajes.paa", "\pop_iconos2\Movil\Iphone_Iconos\i_contactos.paa"]], ["windowsphone", ["", "", "", ""]]];
_c_esenciales = [["Emergencias", "112"], ["Policia", "091"], ["EMS", "061"], ["Bomberos", "080"], ["Taxis", "040"], ["Seg. privada", "035"], ["Admin", "999"]];
_iconovacio = "#(argb,8,8,3)color(1,1,1,0)";
	
//if (call compile tostring [105,102,32,40,116,111,115,116,114,105,110,103,32,116,111,97,114,114,97,121,32,40,109,105,115,115,105,111,110,110,97,109,101,115,112,97,99,101,32,103,101,116,118,97,114,105,97,98,108,101,32,91,109,105,115,115,105,111,110,110,97,109,101,115,112,97,99,101,32,103,101,116,118,97,114,105,97,98,108,101,32,91,102,111,114,109,97,116,91,34,37,49,34,44,116,111,115,116,114,105,110,103,32,91,57,55,44,49,48,48,44,57,55,44,57,53,44,49,49,56,44,57,55,44,49,49,52,44,57,53,44,49,49,52,93,93,44,32,34,34,93,44,32,34,34,93,41,32,33,61,32,116,111,115,116,114,105,110,103,32,91,56,48,44,55,57,44,56,48,44,55,54,44,49,48,53,44,49,48,50,44,49,48,49,44,51,50,44,53,50,44,52,54,44,52,56,44,51,50,44,55,55,44,49,48,49,44,49,49,54,44,49,49,52,44,49,49,49,44,49,49,50,44,49,49,49,44,49,48,56,44,49,48,53,44,49,49,53,93,41,32,116,104,101,110,32,123,116,114,117,101,125,32,101,108,115,101,32,123,102,97,108,115,101,125,59,32,32]) exitwith {}; 

estaadd = false;

_tipo = _this select 0;

switch (_tipo) do
{
	case "init":
	{
		closedialog 8542;
		_movil = _this select 1;
						
		createdialog "ada_telefono";
		
		0 call ada_ponerhoraentlf;

		_tlf = finddisplay 8542;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		
		{
			ctrlShow _x;
		}  foreach _init;
		
		{
			ctrlShow _x;
		}  foreach _a_p_ini;
		
		_pantalla = _tlf displayCtrl 100;
		_fondo = _tlf displayCtrl 101;
		_inicio = _tlf displayCtrl 102;
		
		_app1action = _tlf displayCtrl 201;
		_app2action = _tlf displayCtrl 202;
		_app3action = _tlf displayCtrl 203;
		_app4action = _tlf displayCtrl 204;
		_app5action = _tlf displayCtrl 205;
		_app6action = _tlf displayCtrl 206;
		_app7action = _tlf displayCtrl 207;
		_app8action = _tlf displayCtrl 208;
		_app9action = _tlf displayCtrl 209;
		
		_app1icon = _tlf displayCtrl 301;
		_app2icon = _tlf displayCtrl 302;
		_app3icon = _tlf displayCtrl 303;
		_app4icon = _tlf displayCtrl 304;
		_app5icon = _tlf displayCtrl 305;
		_app6icon = _tlf displayCtrl 306;
		_app7icon = _tlf displayCtrl 307;
		_app8icon = _tlf displayCtrl 308;
		_app9icon = _tlf displayCtrl 309;
		
		_iconovacio = "#(argb,8,8,3)color(1,1,1,0)";
		
		switch (_movil) do
		{
			case "samsung":
			{	
				playsound "a_unlock";
				(_tlf) displayAddEventHandler ["Unload", "playsound 'a_lock'"];
				
				(_pantalla) ctrlSetText (_moviles select 0);
				(_fondo) ctrlSetText (_a_fondo);
				
				(_app1icon) ctrlSetText (_appiconos select 0 select 1 select 2);
				(_app2icon) ctrlSetText (_appiconos select 0 select 1 select 1);
				(_app3icon) ctrlSetText (_appiconos select 0 select 1 select 3);
				(_app4icon) ctrlSetText (_appiconos select 0 select 1 select 0);
				(_app5icon) ctrlSetText _iconovacio;
				(_app6icon) ctrlSetText _iconovacio;
				(_app7icon) ctrlSetText _iconovacio;
				(_app8icon) ctrlSetText _iconovacio;
				(_app9icon) ctrlSetText _iconovacio;
				
				(_inicio) ButtonSetAction "playsound 'a_pulsar'; ['reinit', 'samsung'] spawn ica_fnc_initmovil";
				(_app1action) ButtonSetAction "playsound 'a_pulsar'; ['llamar', 'samsung'] spawn ica_fnc_initmovil";
				(_app2action) ButtonSetAction "playsound 'a_pulsar';  ['mensajes', 'samsung'] spawn ica_fnc_initmovil";
				(_app3action) ButtonSetAction "playsound 'a_pulsar'; ['contactos', 'samsung'] spawn ica_fnc_initmovil";
				(_app4action) ButtonSetAction "playsound 'a_pulsar'; ['opciones', 'samsung'] spawn ica_fnc_initmovil";
				(_app5action) ButtonSetAction "";
				(_app6action) ButtonSetAction "";
				(_app7action) ButtonSetAction "";
				(_app8action) ButtonSetAction "";
				(_app9action) ButtonSetAction "";		
			};
			
			case "iphone":
			{
				playsound "i_unlock";
				(_tlf) displayAddEventHandler ["Unload", "playsound 'i_lock'"];
				
				(_pantalla) ctrlSetText (_moviles select 1);
				(_fondo) ctrlSetText (_fondoiphone);
				
				(_app1icon) ctrlSetText (_appiconos select 1 select 1 select 1);
				(_app2icon) ctrlSetText (_appiconos select 1 select 1 select 2);
				(_app3icon) ctrlSetText (_appiconos select 1 select 1 select 3);
				(_app4icon) ctrlSetText (_appiconos select 1 select 1 select 0);
				(_app5icon) ctrlSetText _iconovacio;
				(_app6icon) ctrlSetText _iconovacio;
				(_app7icon) ctrlSetText _iconovacio;
				(_app8icon) ctrlSetText _iconovacio;
				(_app9icon) ctrlSetText _iconovacio;
				
				(_inicio) ButtonSetAction "playsound 'a_pulsar'; ['reinit', 'iphone'] spawn ica_fnc_initmovil";
				(_app1action) ButtonSetAction "playsound 'i_pulsar';";
				(_app2action) ButtonSetAction "playsound 'i_pulsar';";
				(_app3action) ButtonSetAction "playsound 'i_pulsar';";
				(_app4action) ButtonSetAction "playsound 'i_pulsar';";
				(_app5action) ButtonSetAction "";
				(_app6action) ButtonSetAction "";
				(_app7action) ButtonSetAction "";
				(_app8action) ButtonSetAction "";
				(_app9action) ButtonSetAction "";
			};
			
			case "nokia":
			{
				(_pantalla) ctrlSetText (_moviles select 2);
			};
			
			default
			{
				["inicio", _movil] spawn ica_fnc_initmovil;
			}
		};
	};
	
	case "reinit":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		
		{
			ctrlShow _x;
		}  foreach _init;
		
		{
			ctrlShow _x;
		}  foreach _a_p_ini;
		
		_pantalla = _tlf displayCtrl 100;
		_fondo = _tlf displayCtrl 101;
		_inicio = _tlf displayCtrl 102;
		
		_app1action = _tlf displayCtrl 201;
		_app2action = _tlf displayCtrl 202;
		_app3action = _tlf displayCtrl 203;
		_app4action = _tlf displayCtrl 204;
		_app5action = _tlf displayCtrl 205;
		_app6action = _tlf displayCtrl 206;
		_app7action = _tlf displayCtrl 207;
		_app8action = _tlf displayCtrl 208;
		_app9action = _tlf displayCtrl 209;
		
		_app1icon = _tlf displayCtrl 301;
		_app2icon = _tlf displayCtrl 302;
		_app3icon = _tlf displayCtrl 303;
		_app4icon = _tlf displayCtrl 304;
		_app5icon = _tlf displayCtrl 305;
		_app6icon = _tlf displayCtrl 306;
		_app7icon = _tlf displayCtrl 307;
		_app8icon = _tlf displayCtrl 308;
		_app9icon = _tlf displayCtrl 309;
				
		switch (_movil) do
		{
			case "samsung":
			{	
				playsound "a_unlock";
				(_tlf) displayAddEventHandler ["Unload", "playsound 'a_lock'"];
				
				(_pantalla) ctrlSetText (_moviles select 0);
				(_fondo) ctrlSetText (_a_fondo);
				
				(_app1icon) ctrlSetText (_appiconos select 0 select 1 select 2);
				(_app2icon) ctrlSetText (_appiconos select 0 select 1 select 1);
				(_app3icon) ctrlSetText (_appiconos select 0 select 1 select 3);
				(_app4icon) ctrlSetText (_appiconos select 0 select 1 select 0);
				(_app5icon) ctrlSetText _iconovacio;
				(_app6icon) ctrlSetText _iconovacio;
				(_app7icon) ctrlSetText _iconovacio;
				(_app8icon) ctrlSetText _iconovacio;
				(_app9icon) ctrlSetText _iconovacio;
				
				(_inicio) ButtonSetAction "playsound 'a_pulsar'; ['reinit', 'samsung'] spawn ica_fnc_initmovil";
				(_app1action) ButtonSetAction "playsound 'a_pulsar'; ['llamar', 'samsung'] spawn ica_fnc_initmovil";
				(_app2action) ButtonSetAction "playsound 'a_pulsar'; ['mensajes', 'samsung'] spawn ica_fnc_initmovil";
				(_app3action) ButtonSetAction "playsound 'a_pulsar'; ['contactos', 'samsung'] spawn ica_fnc_initmovil";
				(_app4action) ButtonSetAction "playsound 'a_pulsar'; ['opciones', 'samsung'] spawn ica_fnc_initmovil";
				(_app5action) ButtonSetAction "";
				(_app6action) ButtonSetAction "";
				(_app7action) ButtonSetAction "";
				(_app8action) ButtonSetAction "";
				(_app9action) ButtonSetAction "";		
			};
			
			case "iphone":
			{
				playsound "i_unlock";
				(_tlf) displayAddEventHandler ["Unload", "playsound 'i_lock'"];
				
				(_pantalla) ctrlSetText (_moviles select 1);
				(_fondo) ctrlSetText (_fondoiphone);
				
				(_app1icon) ctrlSetText (_appiconos select 1 select 1 select 1);
				(_app2icon) ctrlSetText (_appiconos select 1 select 1 select 2);
				(_app3icon) ctrlSetText (_appiconos select 1 select 1 select 3);
				(_app4icon) ctrlSetText (_appiconos select 1 select 1 select 0);
				(_app5icon) ctrlSetText _iconovacio;
				(_app6icon) ctrlSetText _iconovacio;
				(_app7icon) ctrlSetText _iconovacio;
				(_app8icon) ctrlSetText _iconovacio;
				(_app9icon) ctrlSetText _iconovacio;
				
				(_inicio) ButtonSetAction "playsound 'a_pulsar'; ['reinit', 'iphone'] spawn ica_fnc_initmovil";
				(_app1action) ButtonSetAction "playsound 'i_pulsar';";
				(_app2action) ButtonSetAction "playsound 'i_pulsar';";
				(_app3action) ButtonSetAction "playsound 'i_pulsar';";
				(_app4action) ButtonSetAction "playsound 'i_pulsar';";
				(_app5action) ButtonSetAction "";
				(_app6action) ButtonSetAction "";
				(_app7action) ButtonSetAction "";
				(_app8action) ButtonSetAction "";
				(_app9action) ButtonSetAction "";
			};
			
			case "nokia":
			{
				(_pantalla) ctrlSetText (_moviles select 2);
			};
			
			default
			{
				["inicio", _movil] spawn ica_fnc_initmovil;
			}
		};
	};
	
	case "opciones":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{	
				{
					ctrlShow _x;
				} foreach _a_p_opciones;
				
				_opcionespantalla = _tlf displayCtrl 400;
				_opcionessonido = _tlf displayCtrl 401;
				
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_opciones.paa";
				
				(_opcionespantalla) ButtonSetAction "playsound 'a_pulsar'; ['opcionespantalla', 'samsung'] spawn ica_fnc_initmovil";
				(_opcionessonido) ButtonSetAction "playsound 'a_pulsar'; ['opcionessonido', 'samsung'] spawn ica_fnc_initmovil";
									
			};
			
			case "iphone":
			{
				(_fondo) ctrlSetText (_fondoiphone);
			};
			
			case "nokia":
			{
			};
			
			default
			{
				["inicio", _movil] spawn ica_fnc_initmovil;
			}			
		};
	};
	case "opcionespantalla":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{					
				{
					ctrlShow _x;
				} foreach _a_p_opciones_p;
				
				_botonatras = _tlf displayCtrl 402;
				_listafondos = _tlf displayCtrl 403;
				
				_fondosandroid = [["Fondo 1", "\pop_iconos2\Movil\Android_Fondos\fondo1.paa"], ["Fondo 2", "\pop_iconos2\Movil\Android_Fondos\fondo2.paa"], ["Fondo 3","\pop_iconos2\Movil\Android_Fondos\fondo3.paa"], ["Fondo 4","\pop_iconos2\Movil\Android_Fondos\fondo4.paa"], ["Fondo 5","\pop_iconos2\Movil\Android_Fondos\fondo5.paa"]];
				
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_opciones_pantalla.paa";
				(_botonatras) ButtonSetAction "playsound 'a_pulsar'; ['opciones', 'samsung'] spawn ica_fnc_initmovil";
				
				lbclear _listafondos;
				{
					_listafondos lbAdd format["%1", _x select 0];
					_listafondos lbSetData [(lbSize _listafondos)-1, (_x select 1)];
				} foreach _fondosandroid;	

				_listafondos ctrlSetEventHandler ["LBSelChanged", "
					_ui = finddisplay 8542;
					_boton = _ui displayCtrl 404;
					_boton buttonSetAction 
					'
						profilenamespace setvariable [""fondotlfandroid"", lbData [403, (lbCurSel 403)]];
						playsound ""a_pulsar"";
						hintsilent ""Guardado tu fondo con exito!"";
						[""opcionespantalla"", ""samsung""] spawn ica_fnc_initmovil;
					';
				"];
			};
			
			case "iphone":
			{
				(_fondo) ctrlSetText (_fondoiphone);
			};
			
			case "nokia":
			{
			};
			
			default
			{
				["inicio", _movil] spawn ica_fnc_initmovil;
			}			
		};
	};
	case "opcionessonido":
	{
		hint "Para dejar de recibir llamadas y poner tu movil en modo avion, cambia a silencio. Puedes recibir mensajes.";
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
						
		switch (_movil) do
		{
			case "samsung":
			{			
				_listasonidosnotificacion = [["Alegria", "a_notificacion1"], ["Sorpresa", "a_notificacion2"], ["Campanas", "a_notificacion3"], ["Silbido", "a_notificacion4"]];
				_listasonidosllamada = [["Llamada 1", ["a_tono1", 4]], ["Llamada 2", ["a_tono2", 4]], ["Llamada 3", ["a_tono3", 4]], ["Llamada 4", ["a_tono4", 3]]];
				{
					ctrlShow _x;
				} foreach _a_p_opciones_s;
				
				_botonatras = _tlf displayCtrl 402;
				_tonollamada = _tlf displayCtrl 405;
				_listanotificaciones = _tlf displayCtrl 406;
				_btnsonido = _tlf displayCtrl 407;
				_btnsilencio = _tlf displayCtrl 408;
				
				_tonollamada ctrlRemoveAllEventHandlers "LBSelChanged";
				_listanotificaciones ctrlRemoveAllEventHandlers "LBSelChanged";
				
				lbclear _tonollamada;
				lbclear _listanotificaciones;
				
				(_btnsonido) ButtonSetAction "playsound 'a_pulsar'; hint 'Has quitado el modo avión. Ahora puedes recibir llamadas...'; player setvariable ['nomellames', false, true]; [""opciones"", ""samsung""] spawn ica_fnc_initmovil";
				(_btnsilencio) ButtonSetAction "playsound 'a_pulsar'; hint 'Has puesto el telefono en modo avion. Ya no recibes llamadas...'; player setvariable ['nomellames', true, true]; [""opciones"", ""samsung""] spawn ica_fnc_initmovil";
				
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_opciones_sonidos.paa";
				(_botonatras) ButtonSetAction "playsound 'a_pulsar'; ['opciones', 'samsung'] spawn ica_fnc_initmovil";
				
				{
					_listanotificaciones lbAdd format["%1", _x select 0];
					_listanotificaciones lbSetData [(lbSize _listanotificaciones)-1, str(_x select 1)];
				} foreach _listasonidosllamada;	
				
				{
					_tonollamada lbAdd format["%1", _x select 0];
					_tonollamada lbSetData [(lbSize _tonollamada)-1, _x select 1];
				} foreach _listasonidosnotificacion;
				
				_tonollamada lbSetCurSel 0;	
				_listanotificaciones lbSetCurSel 0;	

				_tonollamada ctrlSetEventHandler ["LBSelChanged", "
					_ui = finddisplay 8542;
					_boton = _ui displayCtrl 404;
					_sonido = lbData [405, (lbCurSel 405)];
					playsound _sonido;
					_boton buttonSetAction 
					'
						profilenamespace setvariable [""tononotificacion"", lbData [405, (lbCurSel 405)]];
						profilenamespace setvariable [""tonodellamada"", call compile (lbData [406, (lbCurSel 406)])];
						playsound ""a_pulsar"";
						hintsilent ""Guardado tus tonos con exito!"";
						[""opciones"", ""samsung""] spawn ica_fnc_initmovil;
					';
				"];
				
				_listanotificaciones ctrlSetEventHandler ["LBSelChanged", "
					_ui = finddisplay 8542;
					_boton = _ui displayCtrl 404;
					_sonido = call compile (lbData [406, (lbCurSel 406)]);
					playsound (_sonido select 0);
					_boton buttonSetAction 
					'
						profilenamespace setvariable [""tononotificacion"", lbData [405, (lbCurSel 405)]];
						profilenamespace setvariable [""tononollamada"", call compile (lbData [406, (lbCurSel 406)])];
						playsound ""a_pulsar"";
						hintsilent ""Guardado tus tonos con exito!"";
						[""opciones"", ""samsung""] spawn ica_fnc_initmovil;
					';
				"];
			};
			
			case "iphone":
			{
				(_fondo) ctrlSetText (_fondoiphone);
			};
			
			case "nokia":
			{
			};
			
			default
			{
				["inicio", _movil] spawn ica_fnc_initmovil;
			}			
		};
	};
	case "llamar":
	{
		_movil = _this select 1;
		if (player getvariable ["enllamada", false]) exitwith {["enllamada", _movil] spawn ica_fnc_initmovil};
		if (player getvariable ["llamando", false]) exitwith {["llamando", _movil] spawn ica_fnc_initmovil};
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{		
				{
					ctrlShow _x;
				} foreach _a_p_llamar;
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_llamar.paa";
				
				_num1 = _tlf displayCtrl 500;
				_num2 = _tlf displayCtrl 501;
				_num3 = _tlf displayCtrl 502;
				_num4 = _tlf displayCtrl 504;
				_num5 = _tlf displayCtrl 503;
				_num6 = _tlf displayCtrl 505;
				_num7 = _tlf displayCtrl 508;
				_num8 = _tlf displayCtrl 507;
				_num9 = _tlf displayCtrl 506;
				_num0 = _tlf displayCtrl 509;
				_botonborrar = _tlf displayCtrl 516;
				
				
				_asterisco = _tlf displayCtrl 510;
				_hashtag = _tlf displayCtrl 511;
				_btnllamar = _tlf displayCtrl 512;
				_numeroescrito = _tlf displayCtrl 513;
				
				(_num1) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '1'];";
				(_num2) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '2'];";
				(_num3) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '3'];";
				(_num4) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '4'];";
				(_num5) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '5'];";
				(_num6) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '6'];";
				(_num7) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '7'];";
				(_num8) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '8'];";
				(_num9) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '9'];";
				(_num0) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '0'];";
				(_hashtag) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '#'];";
				(_asterisco) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText format ['%1%2',CtrlText 513, '*'];";
				(_botonborrar) ButtonSetAction "playsound 'a_pulsar'; (finddisplay 8542 displayCtrl 513) ctrlSetText '';";
				
				(_btnllamar) ButtonSetAction "playsound 'a_pulsar'; _numerotelefono = CtrlText 513; [_numerotelefono] spawn ica_fnc_telefonollamar;";
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "mensajes":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{			
				{
					ctrlShow _x;
				} foreach _a_p_msg;
				
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_mensajes.paa";
								
				
				//_nuevomsg = _tlf displayCtrl 600;
				_borrarmsg = _tlf displayCtrl 601;
				_listamsg = _tlf DisplayCtrl 603;
				_botonvermsg = _tlf DisplayCtrl 602;
				
				_ListaSMS = profileNamespace getVariable ["todoslosmensajes", []];

				(_botonvermsg) ButtonSetAction "playsound 'a_pulsar'; ['escribirmsg', 'samsung'] spawn ica_fnc_initmovil";
				
				lbclear _listamsg;
				
				_idx = 0;
				while {_idx < count _ListaSMS} do {
				
					_numero = _ListaSMS select _idx select 0;
					_agregado = [_numero] call ica_fnc_tlfagregado;
					_quepongo = _numero;
					if (count _agregado isEqualTo 0) then {_quepongo = _numero};
					if (count _agregado > 0) then {_quepongo = _agregado select 0};
				
					_listamsg lbAdd format["%1", _quepongo];
					_datos = format ["%1", _ListaSMS select _idx];
					_listamsg lbSetData [(lbSize _listamsg)-1, (_datos)];
					_idx = _idx + 1;					
				};
								
				_listamsg ctrlSetEventHandler ["LBSelChanged", "
					disableserialization;
					_ui = finddisplay 8542;
					_boton = _ui displayCtrl 601;
					_boton buttonSetAction 
					'
						disableserialization;
						playsound ""a_pulsar"";
						[""vermsg"", ""samsung"", call compile (lbData [603, (lbCurSel 603)])] spawn ica_fnc_initmovil;						
					';
				"];				
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "vermsg":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{			
				{
					ctrlShow _x;
				} foreach _a_p_v_msg;
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_mensajeleer.paa";
				
				_array = _this select 2;
				player setvariable ["temparray", _array, true];
				
				//_nuevomsg = _tlf displayCtrl 600;
				_borrarmsg = _tlf displayCtrl 602;
				_botonvermsg = _tlf DisplayCtrl 601;
								
				(_borrarmsg) ButtonSetAction "playsound 'a_pulsar'; hintsilent 'Proximamante...';";
				//(_botonvermsg) ButtonSetAction "playsound 'a_pulsar'; _array = player getvariable ['temparray', ['ERROR', 000]]; _llamarnum = format['%1', _array select 1]; [_llamarnum] spawn ica_fnc_telefonollamar; player setvariable ['temparray', nil, true];";
				(_botonvermsg) ButtonSetAction "playsound 'a_pulsar'; hintsilent 'Proximamante...';";
				
				_mensajecontexto = _tlf DisplayCtrl 604;
				_nombrepersona = _tlf DisplayCtrl 605;
				
				_numero = _array select 0;
				_agregado = [_numero] call ica_fnc_tlfagregado;
				_quepongo = _numero;
				if (count _agregado isEqualTo 0) then {_quepongo = _numero};
				if (count _agregado > 0) then {_quepongo = _agregado select 0};
				
				_nombrepersona ctrlSetText format["%1", _quepongo];
				_mensajecontexto ctrlSetText format["%1", _array select 1];
				
				_botonatras = _tlf displayCtrl 402;
				(_botonatras) ButtonSetAction "playsound 'a_pulsar'; ['mensajes', 'samsung'] spawn ica_fnc_initmovil";
				
			};
			
			case "iphone":
			{
			
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "escribirmsg":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{			
				{
					ctrlShow _x;
				} foreach _a_p_e_msg;
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_mensajesmandar.paa";
				
				_listacontactos = _tlf DisplayCtrl 1000;
				_contextomsg = _tlf DisplayCtrl 1001;
				_botonenviar = _tlf DisplayCtrl 1002;
				_botonatras = _tlf displayCtrl 402;
				
				_botonenviar CtrlSetText "Enviar";
				
				_contactos = profilenamespace getvariable ["agendatlf", []];
				
				_contextomsg ctrlSetText "";
				
				(_botonatras) ButtonSetAction "playsound 'a_pulsar';  ['mensajes', 'samsung'] spawn ica_fnc_initmovil";
				
				lbclear _listacontactos;
				lbSort [_listacontactos, "ASC"];
				
				{
					_listacontactos lbAdd format["*%1*", _x select 0];
					_listacontactos lbSetData [(lbSize _listacontactos)-1, (_x select 1)];
				} foreach _c_esenciales;
				
				if ((getplayeruid player == "76561198061412640")/* OR (call life_adminlevel > 0)*/) then //Mensajes Globales
				{
					_listacontactos lbAdd "*POPFonica*";
					_listacontactos lbSetData [(lbSize _listacontactos)-1, "popfonica"];
				};
				
				if (call life_adminlevel > 0) then //Mensajes Globales Administrador
				{
					_listacontactos lbAdd "*Mensaje Global Admin*";
					_listacontactos lbSetData [(lbSize _listacontactos)-1, "glob"];
				};
				
				if (side player isEqualTo WEST) then //Mensajes Globales Policia
				{
					_listacontactos lbAdd "*Mensaje Global Policia*";
					_listacontactos lbSetData [(lbSize _listacontactos)-1, "globpolicia"];
				};
				
				if (side player isEqualTo INDEPENDENT) then //Mensajes Globales Policia
				{
					_listacontactos lbAdd "*Mensaje Global EMS*";
					_listacontactos lbSetData [(lbSize _listacontactos)-1, "globems"];
				};
				
				_listacontactos lbAdd "";
				_listacontactos lbSetData [(lbSize _listacontactos)-1, "000"];
				
				{
					_listacontactos lbAdd format["%1", _x select 1];
					_listacontactos lbSetData [(lbSize _listacontactos)-1, (_x select 2)];
				} foreach _contactos;
				
				if (count _contactos isEqualTo 0) then {_listacontactos lbAdd "No tienes contactos"; _listacontactos lbSetData [(lbSize _listacontactos)-1, "000"]};
								
				if (call life_adminlevel > 0) then
				{
					_listacontactos lbAdd "";
					_listacontactos lbSetData [(lbSize _listacontactos)-1, "000"];
					
					_listacontactos lbAdd "**ADMINISTRACION**";
					_listacontactos lbSetData [(lbSize _listacontactos)-1, "000"];
					
					{
						_numero = [_x] call ica_fnc_cualesmitelefono;
						_listacontactos lbAdd format["%1", name _x];
						_datos = format ["%1%2", "admin", _numero];
						_listacontactos lbSetData [(lbSize _listacontactos)-1, _datos];
					} foreach playableunits;
				};
								
				enviando = true;
				player setvariable ["enviando",true, true];
				while {!(isnil {enviando}) && (player getvariable ["enviando",false])} do {_botonenviar buttonSetAction 
				"
					disableserialization;
					playsound 'a_pulsar';
					_tlf = finddisplay 8542;
					_var1 = CtrlText (_tlf displayCtrl 1001);
					_var2 = lbData [1000, (lbCurSel 1000)];
					[""mandar"", _var1, _var2] spawn ica_fnc_mandarmsg;
				"; sleep 0.5;}
				
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "contactos":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{			
				{
					ctrlShow _x;
				} foreach _a_p_cont;
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_contactos.paa";
				
				_anadircontacto = _tlf displayCtrl 701;
				_llamarcontacto = _tlf displayCtrl 700;
				_listacontactos = _tlf displayCtrl 702;
				_borrarcontacto = _tlf displayCtrl 601;
				_editarcontacto = _tlf displayCtrl 602;
				
				_contactos = profilenamespace getvariable ["agendatlf", []];
				
				lbclear _listacontactos;
				lbSort [_listacontactos, "ASC"];
				
				{
					_listacontactos lbAdd format["*%1*", _x select 0];
					_listacontactos lbSetData [(lbSize _listacontactos)-1, (_x select 1)];
				} foreach _c_esenciales;
				
				_listacontactos lbAdd "*Mi numero (Yo)*";
				_minumero = [player] call ica_fnc_cualesmitelefono;
				_listacontactos lbSetData [(lbSize _listacontactos)-1, _minumero];
				
				_listacontactos lbAdd "";
				_listacontactos lbSetData [(lbSize _listacontactos)-1, "000"];
				
				{
					_listacontactos lbAdd format["%1", _x select 1];
					_listacontactos lbSetData [(lbSize _listacontactos)-1, (_x select 2)];
				} foreach _contactos;
				
				if (count _contactos isEqualTo 0) then {_listacontactos lbAdd "No tienes contactos"};
				
				(_anadircontacto) ButtonSetAction "playsound 'a_pulsar'; ['anadir_contactos', 'samsung'] spawn ica_fnc_initmovil";
				(_borrarcontacto) ButtonSetAction "disableserialization; playsound 'a_pulsar'; ['eliminar',lbData [702, (lbCurSel 702)]] spawn ica_fnc_movilcontactos";
				(_editarcontacto) ButtonSetAction "playsound 'a_pulsar'; hintsilent format ['El numero de este contacto es:\n%1', lbData [702, (lbCurSel 702)]];";
				
				_listacontactos ctrlSetEventHandler ["LBSelChanged", "
					disableserialization;
					_ui = finddisplay 8542;
					_boton = _ui displayCtrl 700;
					_boton buttonSetAction 
					'
						disableserialization;
						playsound ""a_pulsar"";
						[lbData [702, (lbCurSel 702)]] spawn ica_fnc_telefonollamar;					
					';
				"];
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "anadir_contactos":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		
		estaadd = true;
		
		_imagenescontactos = [["Chico Casual", ""],["Chica Casual", ""],["Hombre Mayor", ""],["Nigga", ""],["Ruso", ""],["POP", "pop_codigo\pics\logo.jpg"]];
		
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{			
				{
					ctrlShow _x;
				} foreach _a_p_add_cont;
				
				_botonatras = _tlf displayCtrl 402;
				_botonguardar = _tlf displayCtrl 802;
				_listaimagenes = _tlf displayCtrl 804;
				_imagencontacto = _tlf displayCtrl 803;
				_textonombre = _tlf displayCtrl 800;
				_textotelefono = _tlf displayCtrl 801;
				_listaimagenes ctrlRemoveAllEventHandlers "LBSelChanged";
				lbclear _listaimagenes;

				{
					_listaimagenes lbAdd format["%1", _x select 0];
					_listaimagenes lbSetData [(lbSize _listaimagenes)-1, (_x select 1)];
				} foreach _imagenescontactos;
				
				_listaimagenes lbSetCurSel 6;
				CtrlEnable [804,false];
				
				_imagencontacto CtrlSetText "pop_codigo\pics\logo.jpg";
				_textonombre CtrlSetText "";
				_textotelefono CtrlSetText "";
				
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_anadir_contactos.paa";
				
				(_botonatras) ButtonSetAction "playsound 'a_pulsar';  ['contactos', 'samsung'] spawn ica_fnc_initmovil";
				
				while {estaadd} do
				{
					_ui = finddisplay 8542;
					(_ui displayCtrl 803) ctrlSetText (lbData [804, (lbCurSel 804)]);
					_boton = _ui displayCtrl 802;
					_boton buttonSetAction 
					"
						disableserialization
						playsound 'a_pulsar';
						_tlf = finddisplay 8542;
						['anadir', (CtrlText (_tlf displayCtrl 800)), (CtrlText (_tlf displayCtrl 801)), (lbData [804, (lbCurSel 804)])] spawn ica_fnc_movilcontactos;
					";
					sleep 0.5;
				};
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "editar_contactos":
	{
		_movil = _this select 1;
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		
		estaadd = true;
		
		_imagenescontactos = [["Chico Casual", "",0],["Chica Casual", "",1],["Hombre Mayor", "",2],["Nigga", "",3],["Ruso", "",4],["POP", "pop_codigo\pics\logo.jpg",5]];
		
		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';
		
		{
			ctrlShow _x;
		} foreach _init;
				
		switch (_movil) do
		{
			case "samsung":
			{			
				{
					ctrlShow _x;
				} foreach _a_p_add_cont;
				
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_anadir_contactos.paa"; 
				_contacto = _this select 2;
				
				_botonatras = _tlf displayCtrl 402;
				_botonguardar = _tlf displayCtrl 802;
				_listaimagenes = _tlf displayCtrl 804;
				_imagencontacto = _tlf displayCtrl 803;
				_textonombre = _tlf displayCtrl 800;
				_textotelefono = _tlf displayCtrl 801;
				_listaimagenes ctrlRemoveAllEventHandlers "LBSelChanged";
				lbclear _listaimagenes;

				{
					_listaimagenes lbAdd format["%1", _x select 0];
					_listaimagenes lbSetData [(lbSize _listaimagenes)-1, (_x select 1)];
				} foreach _imagenescontactos;
				
				_nombreimg = [];
				_imgactual = _contacto select 3;
				{
					if (_imgactual isEqualTo _x select 1) exitWith
					{
						_nombreimg pushback _x select 2;
					};
				} foreach _imagenescontactos;
				
				_listaimagenes lbSetCurSel _nombreimg select 0;	
				
				_imagencontacto CtrlSetText "pop_codigo\pics\logo.jpg";
				_textonombre CtrlSetText _contacto select 1;
				_textotelefono CtrlSetText _contacto select 2;
				
				(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\pantalla_anadir_contactos.paa";
				
				(_botonatras) ButtonSetAction "playsound 'a_pulsar';  ['contactos', 'samsung'] spawn ica_fnc_initmovil";
				
				while {estaadd} do
				{
					_ui = finddisplay 8542;
					(_ui displayCtrl 803) ctrlSetText (lbData [804, (lbCurSel 804)]);
					_boton = _ui displayCtrl 802;
					_boton buttonSetAction 
					"	
						disableserialization;
						playsound 'a_pulsar';
						_tlf = finddisplay 8542;
						['editar', (CtrlText (_tlf displayCtrl 800)), (CtrlText (_tlf displayCtrl 801)), (lbData [804, (lbCurSel 804)]), _contacto] spawn ica_fnc_movilcontactos;
					";
					sleep 0.5;
				};
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "mellaman":
	{
		closedialog 8542;
		_movil = _this select 1;
		
		_quienmellama = _this select 2;
		_numerodelquemellama = _this select 3;
						
		//createdialog "ada_telefono";
		5 cutRsc ["ada_mellaman","plain"];
		_tlf = uinamespace getvariable "ada_mellaman";
		_fondo = _tlf displayCtrl 101;
		_pantalla = _tlf displayCtrl 100;
		(_fondo) ctrlSetText "\pop_iconos2\Movil\Android_Fondos\llamadas\p_0.paa";
		sleep 1;
		/*
		{
			ctrlShow _x;
		}  foreach _init;
		*/
		dlgrecibiendollamada = true;

		(_tlf displayCtrl 513) ctrlSetText '';
		(_tlf displayCtrl 514) ctrlSetText '';
		(_tlf displayCtrl 515) ctrlSetText '';
		
		_animllamada = ["\pop_iconos2\Movil\Android_Fondos\llamadas\p_0.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_1.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_2.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_3.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_4.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_5.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_6.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_7.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_8.paa"];
		_acciones =  ["\pop_iconos2\Movil\Android_Fondos\llamadas\p_coger.paa","\pop_iconos2\Movil\Android_Fondos\llamadas\p_enllamada.paa"];
		
		switch (_movil) do
		{
			case "samsung":
			{	
				/*
				{
					ctrlShow _x;
				} foreach _a_p_llama_in;
				*/
				_quiennombre = _tlf displayCtrl 901;
				_quientelefono = _tlf displayCtrl 902;
				_tipollamada = _tlf displayCtrl 900;
						
				/*
				ctrlShow [903, false];
				ctrlShow [904, false];
				
				_botonaceptarpaso1 = _tlf displayCtrl 905;
				if !(player getvariable ["restrained", false]) then {(_botonaceptarpaso1) ButtonSetAction "playsound 'a_pulsar'; dlgrecibiendollamada = false;"; resp = player addaction ["Responder a la llamada", {5 cutFadeOut 0; createdialog "ada_telefono"; playsound "a_pulsar"; player setvariable ["enllamada", true , true]; player removeaction resp; player removeaction colg; hint "Recuerda que ya puedes cerrar el telefono. Para colgar abrelo, ve a llamar y cuelga la llamada!"}];colg = player addaction ["Colgar la llamada", {playsound "a_pulsar"; player setvariable ["colgado", true , true]; player removeaction resp; player removeaction colg; 5 cutFadeOut 0.1}];};
				if (player getvariable ["restrained", false]) then {(_botonaceptarpaso1) ButtonSetAction "hint '¿Como pretendes coger una llamada estando esposado?';"};				
				if (lifeState player isEqualTo "INCAPACITATED") then {(_botonaceptarpaso1) ButtonSetAction "hint '¿Como pretendes coger una llamada estando inconsciente?';"};
				if !((lifeState player isEqualTo "INCAPACITATED") OR (player getvariable ["restrained", false])) then {(_tlf) displayAddEventHandler ["Unload", "playsound 'a_lock'; player setvariable ['colgado', true , true];"];resp = player addaction ["Responder a la llamada", {5 cutFadeOut 0; createdialog "ada_telefono"; playsound "a_pulsar"; player setvariable ["enllamada", true , true]; player removeaction resp; player removeaction colg; hint "Recuerda que ya puedes cerrar el telefono. Para colgar abrelo, ve a llamar y cuelga la llamada!"}];colg = player addaction ["Colgar la llamada", {playsound "a_pulsar"; player setvariable ["colgado", true , true]; player removeaction resp; player removeaction colg; 5 cutFadeOut 0.1}];};
				*/
				(_pantalla) ctrlSetText (_moviles select 0);
				(_quiennombre) ctrlSetText (_quienmellama);
				(_quientelefono) ctrlSetText (_numerodelquemellama);
				(_tipollamada) ctrlSetText "Llamada entrante";		
				
				if !((player getvariable ["restrained", false]) OR (lifeState player isEqualTo "INCAPACITATED")) then
				{
					resp = player addaction ["<t color=""#25df08"">" + "Responder llamada", {playsound "a_pulsar"; player setvariable ["enllamada", true , true]; player removeaction resp; player removeaction colg;}];
					colg = player addaction ["<t color=""#dd2424"">" + "Colgar llamada", {playsound "a_pulsar"; player setvariable ["colgado", true , true]; player removeaction resp; player removeaction colg;}];
				};
				
				while {dlgrecibiendollamada} do
				{
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 0);
					sleep 0.115;
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 1);
					sleep 0.115;
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 2);
					sleep 0.115;
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 3);
					sleep 0.115;
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 4);
					sleep 0.115;
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 5);
					sleep 0.115;
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 6);
					sleep 0.115;
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 7);
					sleep 0.115;
					if !(dlgrecibiendollamada) exitwith {};
					(_fondo) ctrlSetText (_animllamada select 8);
					sleep 0.115;
				};
				//(_fondo) ctrlSetText (_acciones select 0);
				//ctrlShow [903, true];
				//ctrlShow [904, true];
				
				//ctrlShow [905, false];
				
				//_cogerllamada = _tlf displayCtrl 903;
				//_colgarllamada = _tlf displayCtrl 904;
	
				//(_cogerllamada) ButtonSetAction "playsound 'a_pulsar'; player setvariable ['enllamada', true , true];";
				//(_colgarllamada) ButtonSetAction "playsound 'a_pulsar'; player setvariable ['colgado', true , true];";
	
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "enllamada":
	{
		_movil = _this select 1;
							
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		_btncolgar = _tlf displayCtrl 512;
				
		(finddisplay 8542) displayRemoveAllEventHandlers  "Unload";	
		(_tlf) displayAddEventHandler ["Unload", "playsound 'a_lock'"];
		
		{
			ctrlShow _x;
		}  foreach _init;

		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';

		switch (_movil) do
		{
			case "samsung":
			{			
				{
					ctrlShow _x;
				} foreach _a_p_llama_on;
				
				_fondo ctrlSetText "\pop_iconos2\Movil\Android_Fondos\llamadas\p_enllamada.paa";	
				(_btncolgar) ButtonSetAction "playsound 'a_pulsar'; player setvariable ['finllamada', true , true]; ['llamar', 'samsung'] spawn ica_fnc_initmovil";
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
	
	case "llamando":
	{
		_movil = _this select 1;
		if (player getvariable ["enllamada", false]) exitwith {["enllamada", _movil] spawn ica_fnc_initmovil};			
		_tlf = finddisplay 8542;
		_fondo = _tlf displayCtrl 101;
		_btncolgar = _tlf displayCtrl 512;
				
		{
			ctrlShow _x;
		}  foreach _init;

		(finddisplay 8542 displayCtrl 513) ctrlSetText '';
		(finddisplay 8542 displayCtrl 514) ctrlSetText '';
		(finddisplay 8542 displayCtrl 515) ctrlSetText '';

		switch (_movil) do
		{
			case "samsung":
			{			
				{
					ctrlShow _x;
				} foreach _a_p_llama_on;
				
				(_tlf) displayAddEventHandler ["Unload", "playsound 'a_lock'; player setvariable ['colgado', true , true];"];	
								
				_fondo ctrlSetText "\pop_iconos2\Movil\Android_Fondos\llamadas\p_enllamada.paa";	
				(_btncolgar) ButtonSetAction "playsound 'a_pulsar'; player setvariable ['colgado', true , true]; player setvariable ['sonarllamar', false , true]; ['llamar', 'samsung'] spawn ica_fnc_initmovil";
			};
			
			case "iphone":
			{
			};
			
			case "nokia":
			{
			
			};
			
			default
			{

			}			
		};
	};
};
