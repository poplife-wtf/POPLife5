waitUntil {!isNull player};
 private ["_c4", "_unit","_precio"];
_precio = 12000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if (zona_6 getVariable "codigo" != life_gangzona) exitWith {hint "Solo los que controlan la zona del Barrio Arabe pueden Contactar conmigo ... ya sabes, por mi propia seguridad."};
if(isNull _unit) exitWith {}; //if not the thief get bent

     if (("ter" call ica_fnc_expToLevel) < 4) exitWith {
            titleText["No sabes como van estos contactos ni estos negocios ...", "PLAIN"];
    };

//maximo comprar 1 coche bomba x persona
if(_unit getVariable["kamicaze", false])exitWith {hint "2 chalecos bomba a la vez?? estamos todos locos??";[] spawn { sleep 5;hint "";}};

//puede pagar?¿
 if(pop_din - _precio < 0) exitWith { hint "Sin pasta no hay explosiones 12000 euros";[] spawn { sleep 5;hint "";} };

//pago

pop_din = pop_din -_precio;


//chaleco
removevest _unit;
_unit  addVest "CUP_V_OI_TKI_Jacket2_03";



 
//funcion detonar bombas
AXE_detonate = {
        _this spawn{

                //quien a comprado el chaleco
                _unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;             
                if(isNull _unit) exitWith { hint "Error unit null"};

                if(vest _unit != "CUP_V_OI_TKI_Jacket2_03") exitWith {hint "No llevas el chaleco bomba, equipatelo,solo si lo llevas puesto estallara"};
               
               //si lleva el chaleco bomba, petarlo..
			   [[player, "bomba"], "life_fnc_say3D",true,false,false] call BIS_fnc_MP;
				sleep 2;
                _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
				_c41 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
				_c42 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
				_c43 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
                _c4 setDamage 1;_c41 setDamage 1;_c42 setDamage 1;_c43 setDamage 1; 
				_list = player nearObjects 25;
				{ _x setDamage 1; } forEach _list;

                player setDamage 1;

                removeAllActions  _unit;       
               
                //removeAllActions _unit;
                _unit setVariable["kamicaze", false];
				
        };
};
 
_unit setVariable["kamicaze", true];
_unit addAction["Detonar Chaleco!!", AXE_detonate,{}, 4, false, true, "", "player getVariable[""kamicaze"",false]"];



if(true) exitWith{hint "Feliz inmolacion!! ";[] spawn { sleep 5;hint "";} };