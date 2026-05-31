
/*
por: Icaruk edited by quick
	["sp", "hab1"] call ica_fnc_costeSP;
	["ene", "hab1"] call ica_fnc_costeSP;
*/

_param = _this select 0;
_hab = _this select 1;

_coste = switch (_hab) do {


	 	case "tl1": {[1, 100]};
        case "tl2": {[1, 200]};
        case "tl3": {[2, 300]};
        case "tl4": {[2, 300]};
        case "tl5": {[2, 400]};
        case "tl6": {[2, 400]};
        case "tl7": {[2, 400]}; 
        case "tl8": {[2, 400]}; 
        case "tl9": {[2, 500]}; 
        case "tl10": {[2, 500]};  
        case "tl11": {[2, 500]};   

      


        case "ti1": {[1, 100]};
        case "ti2": {[2, 200]};
        case "ti3": {[2, 300]};
        case "ti4": {[2, 400]};
        case "ti5": {[3, 500]};
        case "ti6": {[3, 500]};  
       
        case "cra1": {[1, 100]};
        case "cra2": {[2, 200]};
        case "cra3": {[2, 300]};
        case "cra4": {[2, 400]};
        case "cra5": {[2, 400]};
        case "cra6": {[2, 400]};
        case "cra7": {[2, 400]};
        case "cra8": {[2, 400]};
        case "cra9": {[3, 400]};
        case "cra10": {[3, 400]};
        case "cra11": {[4, 500]};
      
       
        case "med1": {[1, 300]};
        case "med2": {[2, 300]};
        case "med3": {[2, 400]};
        case "med4": {[3, 600]};
        case "med5": {[3, 700]};
       
 
 
 
 
        case "sup1": {[1, 300]};
        case "sup2": {[2, 300]};    
        case "sup3": {[3, 400]};
        case "sup4": {[4, 400]};
        case "sup5": {[5, 500]};

        case "com1": {[1, 200]};
        case "com2": {[2, 300]};    
        case "com3": {[2, 400]};
        case "com4": {[3, 500]};
        case "com5": {[3, 500]};
        case "com6": {[3, 600]};
        case "com7": {[5, 700]};


       case "tal1": {[1, 100]};
        case "tal2": {[2, 200]};    
        case "tal3": {[2, 300]};
        case "tal4": {[3, 300]};
        case "tal5": {[3, 400]};
        case "tal6": {[3, 400]};
   
 
        case "baj1": {[2, 100]};
        case "baj2": {[2, 200]};
        case "baj3": {[2, 300]};
        case "baj4": {[2, 300]};       
        case "baj5": {[3, 400]};
        case "baj6": {[3, 500]};
        case "baj7": {[4, 500]};
        case "baj8": {[4, 600]};
       
       
        case "cri1": {[1, 300]};
        case "cri2": {[2, 300]};    
        case "cri3": {[2, 300]};     
        case "cri4": {[3, 400]};
        case "cri5": {[3, 400]};
        case "cri6": {[4, 500]};
        case "cri7": {[4, 600]};
        case "cri8": {[4, 700]};
       
 
 
        case "ter1": {[1, 300]};
        case "ter2": {[2, 300]};
        case "ter3": {[2, 300]};
        case "ter4": {[2, 400]};
        case "ter5": {[3, 400]};
        case "ter6": {[3, 500]};
        case "ter7": {[3, 600]};
        case "ter8": {[3, 700]};
         case "ter9": {[3, 800]};
	
	default {[0, 0]}; // para que initExp funcione bien
};

if (_param isEqualTo "sp") exitWith {_coste select 0};
if (_param isEqualTo "ene") exitWith {_coste select 1};

