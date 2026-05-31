private ["_tiempo"]; 
_tiempo = 1500; 
CODIDIALOGO = []; 
CODIGO=[(floor(random 9)),(floor(random 9)),(floor(random 9)),(floor(random 9))]; publicVariable "CODIGO"; 
CABLE = ["AZUL", "BLANCO", "AMARILLO", "VERDE"] call bis_fnc_selectRandom; publicVariable "CABLE"; 
DESACTIVADA = false; publicVariable "DESACTIVADA"; 
ACTIVADA = false; publicVariable "ACTIVADA";
BOMBATERMINADA=false; publicVariable "BOMBATERMINADA";
EXPLOTO=false; publicVariable "EXPLOTO";
hackeadobomba = 0; publicVariable "hackeadobomba";
hackeobomba = 0; publicVariable "hackeadobomba";
axebomba =  "pop_maleta_bomba" createVehicle position player;  
axebomba setvariable ["persistent", true, true];

[[axebomba, ["Desactivar Bomba",{
_desactivador = _this select 1;
_desactivador playmove "AinvPknlMstpSnonWrflDr_medic4"; 
    sleep 1; 
	if (uniform _desactivador == "U_bombsuit") then {
		if ((random 100) < 50) then { hint format ["Tu experiencia en la Universidad de Wisconsin te dice que el cable a cortar debe ser el %1",CABLE];
		} else {
		_cableficti = ["AZUL", "BLANCO", "AMARILLO", "VERDE"] call bis_fnc_selectRandom;
		hint format ["Tu experiencia en la Universidad de Wisconsin te dice que el cable a cortar debe ser el %1",_cableficti];
		};
	};
    createDialog "KeypadDefuse";}]],"addAction",true,true] call BIS_fnc_MP;

[[axebomba, ["Hackear Sistema de Bomba",{ 
 createDialog "portatil"; 
 abierto = 1;  
 _ui = uiNamespace getVariable "portatil";  
 _txt = (_ui displayCtrl 4090);  
 _txtC = (_ui displayCtrl 4091);  
_boton = (_ui displayCtrl 4093);
_boton ctrlEnable false;
(_ui displayCtrl 4092) ctrlEnable false;
  hackeobomba = 1;
  publicVariable "hackeadobomba";
  hackeadobomba = 0; 
  publicVariable "hackeadobomba";    
  [_txt, _txtC] spawn {  
   _txt = _this select 0;  
   _txtC = _this select 1; 
 while {!isNil {abierto}} do {    
    if (hackeadobomba == 100) exitWith {  
     _txt ctrlSetText format ["Bomba Hackeada al 100%1", "%"];  
     _txtC ctrlSetText format ["%1%2%3%4",CODIGO select 0, CODIGO select 1, CODIGO select 2, CODIGO select 3];  
    };  
    _txt ctrlSetText format ["Hackeando Bomba %1%2", hackeadobomba, "%"];  
    _txtC ctrlSetText ([((random 8999) + 1000), 20] call BIS_fnc_numberText);  
    sleep 0.1;  
  }; 
  }; }]],"addAction",true,true] call BIS_fnc_MP;
	
posbomba = mapGridPosition axebomba;  
publicVariable "posbomba"; 
_pic = getText (configFile >> "CfgWeapons" >> "RH_M16A4" >> "picture"); 
hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>.:: ELN ::. </t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has puesto la bomba ? vale ...<br/> la hemos activado remotamente con el código %2, %3, %4, %5, tienes 15 Minutos para negociar un pago .. debes protegerla mientras tanto.</t>",_pic, CODIGO select 0, CODIGO select 1, CODIGO select 2, CODIGO select 3]; 
 
while {_tiempo > 0 && !(DESACTIVADA)} do { 
 
if (hackeobomba == 1) then { 
  hackeadobomba = hackeadobomba + 1;  
  publicVariable "hackeadobomba"; 
}; 
 
_tiempo = _tiempo - 1;   
cutText [format["Detonación en: \n %1", [((_tiempo)/60)+.01,"HH:MM"] call BIS_fnc_timetostring],"PLAIN DOWN"]; 
TiempoBomba=_tiempo; 
publicVariable "TiempoBomba"; 
if (_tiempo == 160) then {
_txtf = format ["Inteligencia Anti-Terrorista ha recibido informes sobre artefacto sospechoso en coordenadas %1",posbomba];
[[10, "Aviso", [1,0,0], 1.5, _txtf, [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;	
};  
if (_tiempo < 1) then { 

 
CODIGO=[]; 
publicVariable "CODIGO"; 
deleteVehicle axebomba; 
  _explo = createVehicle ["HelicopterExploBig", position axebomba, [], 0, "NONE"]; 
  { 
   if (_x distance axebomba <= 100) then {
   	if (uniform _x == "U_bombsuit") then {
		if ((random 100) < 30) then {
		[_x, true] spawn ica_fnc_inconsciente;
		} else {
		hint format ["Eres un antiexplosivos de palo !! el Cable correcto era el %1",CABLE];
		};
	} else {_x setDamage 1};
	}; 
  } forEach allUnits; 
        _lista = axebomba nearObjects 160; 
        { 
		if (uniform _x == "U_bombsuit") then {
		if ((random 100) < 50) then {
		_x setVariable ["brazos",50,true];
		_x setVariable ["pecho",50,true];
		[_x, true] spawn ica_fnc_inconsciente;
		} else {
		_x setVariable ["brazos",50,true];
		_x setVariable ["pecho",50,true];
		_x setDamage 0.5;
		hint format ["Eres un antiexplosivos de palo !! el Cable correcto era el %1",CABLE];
		};
		} else {_x setDamage 1}; 
		} forEach _lista; 
EXPLOTO=true; 
}; 
 
if (ACTIVADA) then { 
_tiempo = 7;  
ACTIVADA = false;
paqueteaereo_enable = true;
}; 
  
 sleep 1; 
}; 
publicVariable "CODIGO"; 
deleteVehicle axebomba; 
sleep 1; 
CODIGO=[]; 
publicVariable "CODIGO";
TiempoBomba=""; 
BOMBATERMINADA=true;
hackeadobomba = "";  
publicVariable "hackeadobomba";