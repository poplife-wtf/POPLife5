
// By AxE ... en memoria de mi amigo Coke !


hint "Eyy !! Mira tu has conseguido un compañero de caza ... Genial para una buena faena .. además te podrá rastrear más presas, no lo abandones he .";

player switchCamera "External";

AXE_perroMeSigue = false;

AXE_perrodecaza = createAgent ["Fin_random_F", getPos player, [], 5, "CAN_COLLIDE"];

AXE_perroSigueme = {
	AXE_perrodecaza setVariable ["BIS_fnc_animalBehaviour_disable", true];
	
	AXE_perroMeSigue = true;
	
	0 = [] spawn {
		while {AXE_perroMeSigue} do 
		{
			if (alive AXE_perrodecaza && AXE_perrodecaza distance player < 100) then 
			{
				AXE_perrodecaza moveTo getPos player;				
				
				sleep 0.5;
				AXE_perrodecaza setVariable ["persistent",true,true];
			} else {
			AXE_perroMeSigue = false;
			hint "Has abandonado a tu compañero de caza ... que mala gente... ";
			AXE_perrodecaza setVariable ["persistent",false,true];
			};
		};
	};
};

AXE_perroNoMeSigas = {
	AXE_perrodecaza setVariable ["BIS_fnc_animalBehaviour_disable", false];
	AXE_perroMeSigue = false;

	AXE_perrodecaza playMove "Dog_Idle_Stop";	
};



player addAction ["Perro: Sigueme !", {[] call AXE_perroSigueme;},nil,6,true,true,"","cursorObject isEqualTo AXE_perrodecaza"];
player addAction ["Perro: Deja de seguirme!", {[] call AXE_perroNoMeSigas;},nil,6,true,true,"","cursorObject isEqualTo AXE_perrodecaza"];
player addAction ["Perro: Busca presas", {AXE_perrodecaza playMove "Dog_Idle_Stop";},nil,6,true,true,"","cursorObject isEqualTo AXE_perrodecaza"];
player addAction ["Perro: Para !", {AXE_perrodecaza playMove "Dog_Stop";},nil,6,true,true,"","cursorObject isEqualTo AXE_perrodecaza"];
player addAction ["Perro: Sientate !", {AXE_perrodecaza playMove "Dog_Sit";},nil,6,true,true,"","cursorObject isEqualTo AXE_perrodecaza"];
player addAction ["Perro: Camina !", {AXE_perrodecaza playMove "Dog_Walk";},nil,6,true,true,"","cursorObject isEqualTo AXE_perrodecaza"];
player addAction ["Perro: Corre !", {AXE_perrodecaza playMove "Dog_Run";},nil,6,true,true,"","cursorObject isEqualTo AXE_perrodecaza"];
player addAction ["Perro: Cagando Leches !", {AXE_perrodecaza playMove "Dog_Sprint";},nil,6,true,true,"","cursorObject isEqualTo AXE_perrodecaza"];