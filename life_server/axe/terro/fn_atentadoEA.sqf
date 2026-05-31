

_param = _this select 0;


if (_param isEqualTo "iniciar") exitWith {

if !({side _x isEqualTo WEST} count playableUnits >= 8) exitWith {hint "Tienen que estar al menos 8 policias conectados, sino, no es divertido."};

if (zona_6 getVariable "codigo" != life_gangzona) exitWith {hint "Solo los que controlan la zona del Barrio Arabe pueden Contactar conmigo ... ya sabes, por mi propia seguridad."};

        if (("ter" call ica_fnc_expToLevel) < 7) exitWith {
            titleText["No sabes como van estos contactos ni estos negocios ...", "PLAIN"];
    };

	_next = HW getVariable ["robosGrandes",1];
	if (_next > time) exitWith {
	[player,
	format ["Se esta realizando ya otro robo mayor en estos momentos, faltan %1 minutos para desbloquear el robo.",ceil ((abs(time - _next)) / 60)], 
	"Administracion",
	"pop_portatil"
	] call ica_fnc_axeMsg;	
	};
	HW setVariable ["robosGrandes",(time + (40 * 60)),true];	
	
victimasEA = 0;
publicVariable "victimasEA";

terroristasEA = []; 
_terroristas = nearestObjects [player, ["man"], 40];
{ 
  if (isPlayer _x) then {
          terroristasEA pushBack _x; 
  };
} foreach _terroristas; 
publicVariable "terroristasEA";

_liderterro = name player;
player setVariable ["lider_terro",1,true];

_pic1 = ["Cha_AKS74U"] call ica_fnc_classToPic;
hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>AxE: </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> Hola %2 ... Veo que quieres venganza ... que tu voz no es escuchada ... y que los incautos respiran tu aire ignorando tus clamores ...  <br/>Mi ejercito del terror esta completo, pero te pondre en contacto con alguien que necesita de tus servicios, solo dame unos segundos.</t>",_pic1, _liderterro];
sleep 10;
_txt = parseText format ["<t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/> AxE nos ha indicado que eres de confianza, queremos que tu y tus hermanos aqui reunidos ataquen la ciudad de Metropolis, maten a la mayor cantidad de infieles que puedan ... en especial civiles, si teneis que morir que primero caiga la espada de alá sobre ellos ... y en ese caso le daremos €12.000 por cada muerto a vuestras familias, si tu sobrevives para otra batalla mas, transferiremos este dinero a ti, tienes 15 Minutos para preparar el asalto y nuestros espias contaran bajas solo por 30 minutos, luego sera muy peligroso, Te enviaremos un SMS para que sepas Cuando Iniciar el Ataque. Que Alá este contigo hermano.</t>"];
"El Estado Arabe" hintC _txt;
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];
//[[["---> El Estado Arabe <---","<t align = 'center' size = '1.5' font='EtelkaNarrowMediumPro'>%1</t><br/>"],["","<br/>"],["AxE nos ha indicado que eres de confianza, queremos que tu y tus hermanos aqui reunidos ataquen la ciudad de Metropolis, maten a la mayor cantidad de infieles que puedan ... en especial civiles, si teneis que morir que primero caiga la espada de alá sobre ellos ... y en ese caso le daremos €120.000 por cada muerto a vuestras familias, si tu sobrevives para otra batalla mas, transferiremos este dinero a ti, tienes 15 Minutos para preparar el asalto y nuestros espias contaran bajas solo por 30 minutos, luego sera muy peligroso, Te enviaremos un SMS para que sepas Cuando Iniciar el Ataque. Que Alá este contigo hermano.","<t align = 'center' size = '0.8' color = '#ffffff'>%1</t>"]]] spawn BIS_fnc_typeText;
sleep 60;

[10, "Aviso", [1,0,0], 1.5, "Inteligencia Anti-Terrorista ha Alertado sobre posible atentado del Estado Arabe en Metropolis!!", [1,1,1], 1] remoteExec ["ica_fnc_anuncio", WEST];

sleep 60;
hint parsetext format ["<t size='1.5' color='#F7FE2E'>Mensaje del Estado Arabe: <br/><br/></t>Hermano ... Alá te observa... toma posiciones y objetivos en la mira... yo te avisare cuando empieces la limpieza de los infieles. "];
sleep 480;
hint parsetext format ["<t size='1.5' color='#F7FE2E'>Mensaje del Estado Arabe: <br/><br/></t>Hermano ... Por el honor y la Gloria !!... Que empiece la justicia de Alá !! Si te alejas de la zona serás castigado por tu cobardía !!."];
_atentadoZona = getmarkerpos "metropolis";

    MPEH_lider_terro = player addMPEventHandler ['MPKilled',{
	_liderterroeh = _this select 0; 
	_heroe = _this select 1; 
		if (side _heroe isEqualTo west) then {
		
	[20000,"La Ciudad de Metropolis "] remoteExec ["TON_fnc_clientWireTransfer",_heroe,false];
	[[6,format ["POPTV News: Última Hora! : La Ciudad de Metropolis tiene un nuevo Héroe !! El oficial %1 ha dado de baja al Lider del Grupo Terrorista, se le ha recompensado muy bien !",name (_heroe)]],"life_fnc_broadcast",true,false] call life_fnc_MP;
		};
	}];

_tiempo = 60 * 30;


	while {_tiempo > 0} do {

		 if !(alive player) then {   
		 _tiempo = 0;
		 player setVariable ["lider_terro",0];
		 terroristasEA = [];
		 publicVariable "terroristasEA";
		 };

		if (player distance _atentadoZona > 2200) exitWith {  player setVariable ["lider_terro",0]; hint "Has abandonado la zona.... Eres un indigno de nuestros métodos.";_tiempo = 0;};
			deleteMarker "MarkerLiderTerro";
			_Pos = position player; 		                
			_markerlterro = createMarker ["MarkerLiderTerro", _Pos]; 		                
			"MarkerLiderTerro" setMarkerColor "ColorEAST";				                
			"MarkerLiderTerro" setMarkerText "Última Pos-Lider Terrorista";				                
			"MarkerLiderTerro" setMarkerType "o_inf";


			_tiempo = _tiempo - 60;
			sleep 60;
	};
	
	deleteMarker "MarkerLiderTerro";
	player removeMPEventHandler ["MPkilled", MPEH_lider_terro];
	if (victimasEA > 0) then {
	[[6,format ["POPTV News: Última Hora! : El Estado Arabe se ha adjudicado el terrible atentado sucedido hoy que ha dejado al menos %1 Muertos y gran cantidad de heridos ... Seguiremos informando...",victimasEA]],"life_fnc_broadcast",true,false] call life_fnc_MP;
		if (victimasEA > 5) then {
		paqueteaereo_enable = true;
		};
	} else {
	[[6,format ["POPTV News: Última Hora! : Las fuerzas de seguridad de Metropolis han logrado proteger a los ciudadanos de la amenaza terrorista de momento, al parecer el Estado Arabe estaba detrás de este atentado."]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	};
	
	
};

if (_param isEqualTo "terminar") exitWith {

	if !(player in terroristasEA) exitWith { hint "Shu Shu !! Tu no eres terrorista ... al menos no uno que yo conozca";};
	_liderterro = player getVariable "lider_terro";	
	if (_liderterro < 0.5) exitWith { hint format ["Hermano %1 tu lider terrorista es el único que puede cobrar, si ha muerto dejamelo saber para transferirle a su familia.",(name player)];};
	if (victimasEA < 0) then { hint "Pero con que cara vienes aqui delante mío despues del fracaso que fué eso si se puede llamar atentado... ni un solo infíel muerto !! Largate !! Largate !!";terroristasEA =[];publicVariable "terroristasEA";};
	player setVariable ["lider_terro",0];
	pop_din = 12000 * victimasEA;
	hint format ["Hermano  %1 !!! Eres grande, los infíeles ahora sabrán que no están seguros, tendrán miedo y terror. Te pagare lo acordado ... fueron %2 los caídos que informó POPTV .. te pagaré por ellos.",(name player), victimasEA];
	victimasEA = 0;
	publicVariable "victimasEA";
};
