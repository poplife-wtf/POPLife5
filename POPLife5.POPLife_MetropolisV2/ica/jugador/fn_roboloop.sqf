	
	hint parsetext format ["<t size='1.5' color='#F7FE2E'>Mensaje del Banco Central: <br/><br/></t>Este mensaje es urgente, se ha detectado movimientos sospechosos en su cuenta bancaria, contáctese con nosotros a la brevedad"];
	sleep 5;
	_txt = format ["%1 se esta restando dinero de tu cuenta bancaría",name player];
	titleText [_txt, "PLAIN"];
	robodinero = 2500;
	while {pop_atmdin > 0 && robodinero > 0} do {
		pop_atmdin = pop_atmdin - 250;
		robodinero = robodinero - 250;
		["- 250€"] call ica_fnc_infolog;
		sleep 10;
	};
