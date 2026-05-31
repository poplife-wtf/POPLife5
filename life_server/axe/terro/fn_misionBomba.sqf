
_param = _this select 0;


if (_param isEqualTo "iniciar") exitWith {

        if (("ter" call ica_fnc_expToLevel) < 7) exitWith {
            titleText["No sabes como van estos contactos ni estos negocios ...", "PLAIN"];
    };
if (zona_6 getVariable "codigo" != life_gangzona) exitWith {hint "Solo los que controlan la zona del Barrio Arabe pueden Contactar conmigo ... ya sabes, por mi propia seguridad."};
_costo = 25000;
if (pop_din < _costo) exitwith {hint "No tienes los 25.000 € necesarios para pagar la bomba."};
pop_din = pop_din - _costo;

terroristasELN = [];
terroristasELN = units group player;
publicVariable "terroristasELN";
CODIGO=[]; 
publicVariable "CODIGO";
TiempoBomba=""; 
BOMBATERMINADA=true;
ciudadbomba = "fuera";
hackeadobomba = "";  
publicVariable "hackeadobomba";
posbomba = "";  
publicVariable "posbomba"; 

if !(player canAdd ["pop_c4_bomba", 1]) exitWith {hint "No tienes suficiente espacio para este tipo de bombas."};
["pop_c4_bomba", 1] call ica_fnc_item; 
 
 accionplantar = player addAction ["Plantar Bomba", ' 
 _tieneBomba = ["pop_c4_bomba"] call ica_fnc_tengo; 
    if(_tieneBomba < 1)exitWith{ hint "Para plantar una bomba necesitas al menos ... una Bomba ?";}; 
if (player distance (getMarkerPos "metropolis") < 700) then {ciudadbomba = "metropolis";publicVariable "ciudadbomba";}; 
if (player distance (getMarkerPos "morrison") < 400) then {ciudadbomba = "morrison";publicVariable "ciudadbomba";}; 
if (player distance (getMarkerPos "diablos") < 200) then {ciudadbomba = "diablos";publicVariable "ciudadbomba";}; 
if (ciudadbomba == "fuera") exitWith {hint "ELN: Camarada, no activare la Bomba si no esta en zonas urbanas ... se que le interesa el dinero ... a nosotros el Miedo!.";}; 
 player removeAction accionplantar; 
 ["pop_c4_bomba", -1] call ica_fnc_item;
_txta = format ["Inteligencia Anti-Terrorista ha Alertado sobre posible artefacto explosivo en %1 !!",ciudadbomba];  
[[10, "Aviso", [1,0,0], 1.5, _txta, [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP; 
plantadoBomba = 0;  
 if (vehicle player == player) then {  
   [120, "Plantando la Bomba..."] spawn ica_fnc_barrita; 
 }; 
 if!(alive player) exitWith {}; 
 while{plantadoBomba < 15} do{player playmove "AinvPknlMstpSnonWrflDr_medic2";sleep 2;plantadoBomba = plantadoBomba + 1;}; 
sleep 90;        
 0 spawn ica_fnc_plantarBomba; 
 '];  

	_txt = parseText format ["<t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'>Camarada %1, necesitamos un cambio, seguir nuestros ideales, derrocar a este gobierno corrupto ... es necesario sembrar el miedo con terror ... Te entrego esta bomba, podrás colocarla en cualquier ciudad y podrás usarla para el beneficio de tu grupo terrorista, tan pronto la tengas armada y plantada la activare remotamente para explotar en 15 Minutos.</t>"];
"Ejercito de Liberación Nacional" hintC _txt;
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
	0 = _this spawn {
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
	};
}];	
_chance = random(100);
if (_chance > 70) then {
[[10, "Aviso", [1,0,0], 1.5, "Inteligencia Anti-Terrorista ha interceptado mensajes del ELN sobre posible atentado con explosivos, Máxima Alerta!", [1,1,1], 1], "ica_fnc_anuncio", WEST, false, false] call life_fnc_MP;	
};
	
	};