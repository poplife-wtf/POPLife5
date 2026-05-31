/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];

		//Limitador de Armas
		life_actions = life_actions + [player addAction ["", {	call ica_fnc_limitadorDeArmas}, "", 0, false, true, "DefaultAction", "isNil 'puedoDisparar' "]];
		
		life_actions = life_actions + [player addAction["Cuerda Rapida",life_fnc_fastRope,"",99,false,false,"", ' (vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 50 && (getPos player) select 2 >= 15 && speed vehicle player < 10 && !(player getVariable["transporting",false]) ']];
		
		life_actions = life_actions + [player addAction["Robale !",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 4.5 && isPlayer cursorTarget && animationState cursorTarget isEqualTo "unconsciousfacedown" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		
	};
	
	case independent:
	{
	
		//CopEnter - Driver Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_DriverSeat",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")||(cursorTarget isKindOf "Motorcycle")) && cursorTarget distance player < 3.5']];
		//CopEnter - Passenger Seat
		life_actions = life_actions + [player addAction[localize "STR_pAct_PassengerSeat",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")||(cursorTarget isKindOf "Motorcycle")) && cursorTarget distance player < 3.5']];
		//CopEnter - Exit
		life_actions = life_actions + [player addAction[localize "STR_pAct_GoOut",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player)']];
		// Heli Fast Rope
		life_actions = life_actions + [player addAction["Cuerda Rapida",life_fnc_fastRope,"",99,false,false,"", ' (vehicle player) != player && !isNull (vehicle player) && (vehicle player) isKindOf "Air" && driver (vehicle player) != player && (getPos player) select 2 <= 50 && (getPos player) select 2 >= 15 && speed vehicle player < 10 && !(player getVariable["transporting",false]) ']];
		// Enterrador
		life_actions = life_actions + [player addAction["Meter cuerpo en el ataud",ica_fnc_enterrador,"meto",99,false,false,"", ' cursortarget isKindOF "Man" && !(alive cursortarget) && (player distance cursortarget < 3.5)']];
		life_actions = life_actions + [player addAction["Cargar el ataud",ica_fnc_enterrador,"cargo",99,false,false,"", ' typeof (nearestObjects [player, ["building"], 3.5] select 0)  isEqualTo  "pop_ataud" ']];
		life_actions = life_actions + [player addAction["Enterrar",ica_fnc_enterrador,"entierro",99,false,false,"", ' typeof cursortarget  isEqualTo  "POP_corbillard_c_noir" && (player distance cursortarget < 3.5)']];
		

	};	
	
};
