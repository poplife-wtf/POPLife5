/*
por: Icaruk

	["menu"] call ica_fnc_diagnostico;
	["menu", player] call ica_fnc_diagnostico; // autodiag
	["diag", player] call ica_fnc_diagnostico;
*/

_inco = player getvariable ["inconsciente",false];
if(_inco)exitWith{};
_param = _this select 0;

if !(alive player)exitWith{};

//_ruta = "BK_FrameWork\BlackFeameWorkDIalogs\menuMedicImgs\";
//_ruta = "\pop_iconos\icons\medica\";

if (((animationstate Player) == "ainjPpneMstpSnonWnonDnon") or ((animationstate Player) == "amovppnemstpsnonwnondnon_injured")) exitWith {};

if (_param isEqualTo "menu") exitWith {


	if (vehicle player != player) then {
			quien = nil;
			_pasajeros = crew vehicle player;
			_tVeh = typeOf vehicle player;
			_cidx = switch (_tVeh) do {
					case "POP_Mercedes_Sprinter_cruz": {[1, 2]};
					case "POP_Mercedes_Sprinter_amb": {[1, 2]};
					case "POP_Mercedes_Sprinter_sem": {[1, 2]};
					case "POP_Mercedes_Sprinter_andaluz": {[1, 2]};
					case "POP_Mercedes_Sprinter_summa": {[1, 2]};
					case "mrshounka_vsav_smur": {[2, 1]};
					case "mrshounka_vsav_sas": {[2, 1]};
					case "mrshounka_vsav_sem": {[2, 1]};
					case "mrshounka_vsav_summa": {[2, 1]};
					default {[9, 9]};
			};

			if (vehicle player getCargoIndex player != (_cidx select 0) && side player != INDEPENDENT) exitWith {
					hint "Sólo puedes curar en una ambulancia si eres EMS y estando en un asiento próximo al enfermo si este esta en la camilla.";
					closedialog 0;
			};

			{
					if (vehicle player getCargoIndex _x == (_cidx select 1)) exitWith {
							quien = _x;
					};
			} forEach _pasajeros;
			if (isNil {quien}) then {quien = player; hint "No hay enfermo en la camilla. Te estas curando a ti mismo."} else {hint "Estas curando al enfermo de la camilla."};

	} else {

			quien = if (!isNil {_this select 1}) then {
					_this select 1;
			} else {
					_cerca = (nearestObjects [player, ["Man"], 2]);
					if ((count _cerca) > 1) then {
							hint "Estas curando a alguien.";
							_cerca select 1;		
					} else {
							hint "Te estás curando a ti mismo.";
							player;
					};
			};
		};

	if (isNil {quien}) exitWith {};
	if ((player distance quien) > 2) exitWith {hint "Estás demasiado lejos"};

	disableSerialization;
	createDialog "BK_DialogoMedico";
	_ui = uiNamespace getVariable "BK_DialogoMedico";
	_txt = _ui displayCtrl 1003;	
	_botonDiag 	=  _ui displayCtrl 1600; 	
	_selCab 	=  _ui displayCtrl 1611;	
	_selPec 	=  _ui displayCtrl 1612;	
	_selBra1 	=  _ui displayCtrl 1614;	
	_selBra2 	=  _ui displayCtrl 1615;	
	_selPie 	=  _ui displayCtrl 1613;	
	
	_selTrVendC =  _ui displayCtrl 1603;	
	_selTrVendN =  _ui displayCtrl 1604;	
	_selTrTrama =  _ui displayCtrl 1605;	
	_selTrMorfi =  _ui displayCtrl 1606;	
	_selTrEpene =  _ui displayCtrl 1607;	
	_selTrDesfi =  _ui displayCtrl 1610;	
	_selTrSangr =  _ui displayCtrl 1608;	
	_selTrForen =  _ui displayCtrl 1609;	

	_selDiSamgr =  _ui displayCtrl 1004;	
	_selDiSamgN =  _ui displayCtrl 1006;	
	_selDiLesio =  _ui displayCtrl 1007;	
	_selDiEstad =  _ui displayCtrl 1008;	

	_selMosTrat =  _ui displayCtrl 1000;	
	_selMosTrCo =  _ui displayCtrl 1001;	
	_botonTratar = _ui displayCtrl 1601;
	_adafixa = _ui displayCtrl 1012;
	_adafixb = _ui displayCtrl 1011;

	_selMosTrat ctrlEnable false ;
	_selDiSamgr ctrlEnable false ;
	_selDiSamgN ctrlEnable false ;
	_selDiLesio ctrlEnable false ;
	_selDiEstad ctrlEnable false ;
	_selMosTrCo ctrlEnable false ;
	_botonTratar ctrlEnable false ;
	_adafixa ctrlEnable false ;
	_adafixb ctrlEnable false ;
		
	_selMosTrat ctrlSetDisabledColor [1, 1, 1, 1];
	_selDiSamgr ctrlSetDisabledColor [1, 1, 1, 1];
	_selDiSamgN ctrlSetDisabledColor [1, 1, 1, 1];
	_selDiLesio ctrlSetDisabledColor [1, 1, 1, 1];
	_selDiEstad ctrlSetDisabledColor [1, 1, 1, 1];
	_selMosTrCo ctrlSetDisabledColor [1, 1, 1, 1];
	_adafixa ctrlSetDisabledColor [1, 1, 1, 1];
	_adafixb ctrlSetDisabledColor [1, 1, 1, 1];
	

	_arrLista = ["Vendas", "Vendas compresivas", "Tramadol", "Morfina", "Epinefrina", "Desfibrilador", "Bolsa de sangre", "Kit forense"];
	_data = ["pop_vendas", "pop_vendas_c", "pop_tramadol", "pop_morfina", "pop_epinefrina", "pop_desfibrilador", "pop_bolsadesangre", "pop_csi"];
	_ico = ["\POP_medic\vendaje\tex\vendasico.paa", "\POP_medic\vendaje\tex\vendascico.paa", "\POP_medic\tramadol\data\tramadolico.paa", "\POP_medic\morfina\data\morfinaico.paa",
		"\POP_medic\epinefrina\data\epenefrinaico.paa", "\POP_medic\defibrilador\data\desfibriladoico.paa", "\POP_medic\bolsadesangre\data\bolsadesangreico.paa", "\POP_objects\csikit\Data\csikitico.paa"];

	/*
	_idx = 0;
	while {_idx < (count _arrLista)} do {
		_lista lbAdd (_arrLista select _idx);
		_lista lbSetData [_idx, _data select _idx];
		_lista lbSetPicture [_idx, _ico select _idx];
		_idx = _idx + 1;
	};
	*/

	zonaSelec = nil ;
	tratarSelec = nil ;

	_selCab  buttonSetAction ' ["play", "seleccionarCuerpo", player] call ica_fnc_SFX; zonaSelec = "cabeza"; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selPec  buttonSetAction ' ["play", "seleccionarCuerpo", player] call ica_fnc_SFX; zonaSelec = "pecho"; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selBra1 buttonSetAction ' ["play", "seleccionarCuerpo", player] call ica_fnc_SFX; zonaSelec = "brazos"; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selBra2 buttonSetAction ' ["play", "seleccionarCuerpo", player] call ica_fnc_SFX; zonaSelec = "brazos"; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selPie  buttonSetAction ' ["play", "seleccionarCuerpo", player] call ica_fnc_SFX; zonaSelec = "piernas"; ["actualizo", quien] call ica_fnc_diagnostico ';

	_selTrVendC buttonSetAction ' ["play", "seleccionarVendasC", player] call ica_fnc_SFX; tratarSelec = ["pop_vendas_c","Venda compresiva"] ; ["actualizo", quien] call ica_fnc_diagnostico ' ;
	_selTrVendN buttonSetAction ' ["play", "seleccionarVendas", player] call ica_fnc_SFX; tratarSelec = ["pop_vendas","Venda escayolada"] ; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selTrTrama buttonSetAction ' ["play", "seleccionarTramadol", player] call ica_fnc_SFX; tratarSelec = ["pop_tramadol","Tramadol"] ; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selTrMorfi buttonSetAction ' ["play", "seleccionarMorfina", player] call ica_fnc_SFX; tratarSelec = ["pop_morfina","Morfina"] ; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selTrEpene buttonSetAction ' ["play", "seleccionarEpinefrina", player] call ica_fnc_SFX; tratarSelec = ["pop_epinefrina","Epinefrina"] ; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selTrDesfi buttonSetAction ' ["play", "seleccionarDesfibrilador", player] call ica_fnc_SFX; tratarSelec = ["pop_desfibrilador","Desfibrilador"] ; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selTrSangr buttonSetAction ' ["play", "seleccionarSangre", player] call ica_fnc_SFX; tratarSelec = ["pop_bolsadesangre","Bolsa de sangre"] ; ["actualizo", quien] call ica_fnc_diagnostico ';
	_selTrForen buttonSetAction ' ["play", "seleccionarKitForense", player] call ica_fnc_SFX; tratarSelec = ["pop_csi","Kit forense"] ; ["actualizo", quien] call ica_fnc_diagnostico ';

	_txt ctrlSetStructuredText parseText format [" <t size='1.13' align='center'>%1</t> ", "--"];

	_botonDiag buttonSetAction ' ["diag", quien] call ica_fnc_diagnostico ;';

	//_lista ctrlSetEventHandler ["LBSelChanged", "['actualizo', quien] call ica_fnc_diagnostico"];
	//{_x ctrlSetEventHandler ["ButtonClick", "['actualizo', quien] call ica_fnc_diagnostico"]} forEach [_selTrVendC, _selTrVendN, _selTrTrama, _selTrMorfi, _selTrEpene, _selTrDesfi, _selTrSangr, _selTrForen];
	//{_x ctrlSetEventHandler ["ButtonClick", "['actualizo', quien] call ica_fnc_diagnostico"]} forEach [_selCab, _selPec, _selBra1, _selBra2, _selPie];

};

if (_param isEqualTo "actualizo") exitWith {
	disableSerialization;
	_ui = findDisplay 30105; 
	_botonTratar =  _ui displayCtrl 1601;	// Boton de tratar
	_MostTratarP =  _ui displayCtrl 1011;	// Mostrar tratar parte
	_MostTratami =  _ui displayCtrl 1012;	// Mostrar tratamiento o equipo a usar
	
	_MostTratarP ctrlEnable false ;
	_MostTratami ctrlEnable false ;
	_botonTratar ctrlEnable false ;

	quien = _this select 1;
	//cosa = _lista lbData (lbCursel 7018);
	
	If (!(isNil {zonaSelec})) then { _MostTratarP ctrlSetText zonaSelec; };
	If (!(isNil {tratarSelec})) then { _MostTratami ctrlSetText (tratarSelec select 1) ; };

	if ( isNil {zonaSelec} Or isNil {tratarSelec} ) exitWith {};

	_botonTratar ctrlEnable true ;
	_botonTratar buttonSetAction ' closeDialog 0; [quien, zonaSelec, (tratarSelec select 0)] spawn ica_fnc_tratamiento ; ';
};

if (!isNil {ocupado}) exitWith {};
ocupado = true;

if (_param isEqualTo "diag") then {
	_quien = _this select 1;
	if (isNil {_quien}) exitWith {closeDialog 0; ocupado = nil};
	[_quien] spawn {
		_quien = _this select 0;

		if (("med" call ica_fnc_expToLevel) >= 5) then {
			["play", "bkSndFxMedicoHeartBip", player] call ica_fnc_SFX;
			[1, "Diagnosticando..."] spawn ica_fnc_barrita;
		} else {
			["play", "bkSndFxMedicoDiagnosticarBip", player] call ica_fnc_SFX;
			[8, "Diagnosticando..."] spawn ica_fnc_barrita;
			if (vehicle player == player) then {
				player playmove "AinvPknlMstpSnonWrflDr_medic4";
				sleep 8;
				player switchMove "";
			} else { sleep 8};
		};

		if (!dialog) exitWith {ocupado = nil};
		//_ruta = "\pop_iconos\icons\medica\";
		_ruta = "\pop_iconos\icons\medica\";
		//_quien = player;
		disableSerialization;
		_ui = findDisplay 30105;

		_txt 		=  _ui displayCtrl 1003;		// Paciente nombre
		_cabeza 	=  _ui displayCtrl 1271;		// Colorines de cabeza
		_pecho 		=  _ui displayCtrl 1272;		// Colorines de pecho
		_brazos 	=  _ui displayCtrl 1273;		// Colorines de brazos
		_piernas 	=  _ui displayCtrl 1274;		// Colorines de piernas
		_sangCab 	=  _ui displayCtrl 1275;		// Sangrados de cabeza
		_sangPec 	=  _ui displayCtrl 1276;		// Sangrados de pecho
		_sangBra 	=  _ui displayCtrl 1277;		// Sangrados de brazos
		_sangPie 	=  _ui displayCtrl 1278;		// Sangrados de piernas

		_sangre 	=  _ui displayCtrl 1004;		// Total de sangre en cuerpo
		_lesiones 	=  _ui displayCtrl 1006;		// Total de lesiones en el cuerpo **
		_sangradosT	=  _ui displayCtrl 1007;		// Total de sangrados en el cuerpo **
		_DialDiagno	=  _ui displayCtrl 1008;		// Diagnostico general del paciente **
		_sigVitaMsg	=  _ui displayCtrl 1201;		// Signos vitales monitor cardiaco **
		_cuerpoFond	=  _ui displayCtrl 1201;		// Imagen de fondo de cuerpo **
		
		_sangre ctrlEnable false ;
		_lesiones ctrlEnable false ;
		_sangradosT ctrlEnable false ;
		_DialDiagno ctrlEnable false ;

		_txt ctrlSetStructuredText parseText format [" <t size='1.13' align='center'>Paciente</t>"];

		_sangre ctrlSetText format ["Nivel de sangre: %1%2", (1 - (damage _quien)) * 100, "%"];
		_sangre ctrlSetTextColor [damage _quien,1 - (damage _quien),0,1];

		private ["_TotalLesCoun","_TotalLesTota","_TotalSanCoun","_imgCab","_imgPec","_imgBra","_imgPie","_sanCab","_sanPec","_sanBra","_sanPie"];
		_TotalLesCoun = 0;
		_TotalLesTota = 0;
		_TotalSanCoun = 0;

		switch (true) do {
			case ((_quien getVariable "cabeza") >= 70): { _imgCab = "medCabezaDmg4.paa" ; _TotalLesCoun = _TotalLesCoun + 7; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "cabeza") >= 50): { _imgCab = "medCabezaDmg3.paa" ; _TotalLesCoun = _TotalLesCoun + 6; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "cabeza") >= 30): { _imgCab = "medCabezaDmg2.paa" ; _TotalLesCoun = _TotalLesCoun + 3; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "cabeza") >= 10): { _imgCab = "medCabezaDmg1.paa" ; _TotalLesCoun = _TotalLesCoun + 1; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "cabeza") >= 0):  { _imgCab = ""};
		};
		switch (true) do {
			case ((_quien getVariable "pecho") >= 70): { _imgPec = "medCuerpoDmg4.paa" ; _TotalLesCoun = _TotalLesCoun + 7; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "pecho") >= 50): { _imgPec = "medCuerpoDmg3.paa" ; _TotalLesCoun = _TotalLesCoun + 5; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "pecho") >= 30): { _imgPec = "medCuerpoDmg2.paa" ; _TotalLesCoun = _TotalLesCoun + 3; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "pecho") >= 10): { _imgPec = "medCuerpoDmg1.paa" ; _TotalLesCoun = _TotalLesCoun + 1; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "pecho") >= 0):  { _imgPec = ""};
		};
		switch (true) do {
			case ((_quien getVariable "brazos") >= 70): { _imgBra = "medBrazoDmg4.paa" ; _TotalLesCoun = _TotalLesCoun + 7; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "brazos") >= 50): { _imgBra = "medBrazoDmg3.paa" ; _TotalLesCoun = _TotalLesCoun + 5; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "brazos") >= 30): { _imgBra = "medBrazoDmg2.paa" ; _TotalLesCoun = _TotalLesCoun + 3; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "brazos") >= 10): { _imgBra = "medBrazoDmg1.paa" ; _TotalLesCoun = _TotalLesCoun + 1; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "brazos") >= 0):  { _imgBra = ""};
		};
		switch (true) do {
			case ((_quien getVariable "piernas") >= 70): { _imgPie = "medPiernasDmg4.paa" ; _TotalLesCoun = _TotalLesCoun + 7; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "piernas") >= 50): { _imgPie = "medPiernasDmg3.paa" ; _TotalLesCoun = _TotalLesCoun + 5; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "piernas") >= 30): { _imgPie = "medPiernasDmg2.paa" ; _TotalLesCoun = _TotalLesCoun + 3; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "piernas") >= 10): { _imgPie = "medPiernasDmg1.paa" ; _TotalLesCoun = _TotalLesCoun + 1; _TotalLesTota = _TotalLesTota + 1 ; };
			case ((_quien getVariable "piernas") >= 0):  { _imgPie = ""};
		};
		switch ((_quien getVariable "sangrando") select 0) do {
			case 2: {_sanCab = "medCabezaSangrado2.paa" ; _TotalSanCoun = _TotalSanCoun + 2 ;};
			case 1: {_sanCab = "medCabezaSangrado1.paa" ; _TotalSanCoun = _TotalSanCoun + 1 ;};
			case 0: {_sanCab = ""};
		};
		switch ((_quien getVariable "sangrando") select 1) do {
			case 2: {_sanPec = "medPechoSangrado2.paa" ; _TotalSanCoun = _TotalSanCoun + 2 ;};
			case 1: {_sanPec = "medPechoSangrado1.paa" ; _TotalSanCoun = _TotalSanCoun + 1 ;};
			case 0: {_sanPec = ""};
		};
		switch ((_quien getVariable "sangrando") select 2) do {
			case 2: {_sanBra = "medBrazoSangrado2.paa" ; _TotalSanCoun = _TotalSanCoun + 2 ;};
			case 1: {_sanBra = "medBrazoSangrado1.paa" ; _TotalSanCoun = _TotalSanCoun + 1 ;};
			case 0: {_sanBra = ""};
		};
		switch ((_quien getVariable "sangrando") select 3) do {
			case 2: {_sanPie = "medPiernasSangrado2.paa" ; _TotalSanCoun = _TotalSanCoun + 2 ;};
			case 1: {_sanPie = "medPiernasSangrado1.paa" ; _TotalSanCoun = _TotalSanCoun + 1 ;};
			case 0: {_sanPie = ""};
		};
		
		_lesiones ctrlSetText format ["Lesiones: %1",_TotalLesTota] ;
		_sangradosT ctrlSetText format ["Heridas: %1",_TotalSanCoun] ;
		If ( _TotalLesTota > 0 Or _TotalSanCoun > 0  ) Then { _cuerpoFond ctrlSetText _ruta + "medBody2.paa" } ;
		_DiagnosMsg = "Saludable" ;
		_sigVitaMsg = 5;

		If ( _TotalSanCoun > 0 ) Then {
			If ( ((1 - (damage _quien)) * 100) < 10 ) Then {
				_DiagnosMsg = "Terminal" ;
				_sigVitaMsg = 1;
			} else {
				If ( ((1 - (damage _quien)) * 100) < 30 ) Then {
					_DiagnosMsg = "Muy grave" ;
					_sigVitaMsg = 2;
				} else {
					If ( _TotalSanCoun < 2 ) Then {
						_DiagnosMsg = "Estabilizando" ;
						_sigVitaMsg = 3;
					} else {
						If ( ((1 - (damage _quien)) * 100) > 60 ) Then {
							_DiagnosMsg = "Urgente" ;
							_sigVitaMsg = 4;
						} else {
							_DiagnosMsg = "Grave" ;
							_sigVitaMsg = 4;
						};
					};
				};
			};
		} else {
			If ( ((1 - (damage _quien)) * 100) < 15 ) Then {
				_DiagnosMsg = "Estable grave" ;
				_sigVitaMsg = 2;
			} else {
				If ( _TotalLesCoun > 25 ) Then {
					_DiagnosMsg = "Reservado" ;
					_sigVitaMsg = 9;
				} else {
					If ( _TotalLesCoun > 15 ) Then {
						_DiagnosMsg = "Traumatismos graves" ;
						_sigVitaMsg = 8;
					} else {
						If ( _TotalLesCoun > 10 ) Then {
							_DiagnosMsg = "Traumatismos leves" ;
							_sigVitaMsg = 7;
						} else {
							_DiagnosMsg = "Sano" ; 
							_sigVitaMsg = 6;
						};
					};
				};
			};
		};
		_DialDiagno ctrlSetText format ["Diagnostico: %1",_DiagnosMsg] ;


		_arr1 = [_cabeza, _pecho, _brazos, _piernas, _sangCab, _sangPec, _sangBra, _sangPie];
		_arr2 = [_imgCab, _imgPec, _imgBra, _imgPie, _sanCab, _sanPec, _sanBra, _sanPie];

		for "_x" from 0 to (count _arr1) do {
			if ((_arr2 select _x) != "") then {
				(_arr1 select _x) ctrlSetText (_ruta + (_arr2 select _x));
			};
		};
	};
	ocupado = nil;
};
