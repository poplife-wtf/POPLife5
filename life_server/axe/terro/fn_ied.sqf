/*______________________________________________________________

Ied Terro 
By AxE
_______________________________________________________________*/

_param = _this select 0;

if (_param isEqualTo "plantar") exitWith {

plantadoBombaIed = 0;  
 if (vehicle player == player) then {  
   [30, "Plantando IED..."] spawn ica_fnc_barrita; 
 }; 
	if!(alive player) exitWith {}; 
	while{plantadoBombaIed < 4} do{player playmove "AinvPknlMstpSnonWrflDr_medic2";sleep 2;plantadoBombaIed = plantadoBombaIed + 1;}; 
	sleep 30;
	_radio = 5;
	_obj = "IEDUrbanSmall_Remote_Mag" createVehicle position player;
	_gat = createTrigger ["EmptyDetector", getPos _obj];
	_gat setTriggerArea [_radio, _radio, 0, false];
	_gat setTriggerActivation ["ANY", "PRESENT", false];
	_gat setTriggerStatements ["this", "'r_80mm_HE' createVehicle (getPos thisTrigger)", ""];
	waitUntil {triggerActivated _gat};
	deleteVehicle _obj;
	
	};