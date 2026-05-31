#include "\life_server\script_macros.hpp"
/*
Archivo : fn_objetos.sqf
Autor: AxE papi
Uso: [string] call ica_fnc_objetos;
Ejemplo: ["Pop_banda"] call ica_fnc_objetos --- > pone el objeto, en false lo quita.
*/


_classname = _this select 0;

if (axe_itemCreado && !axe_itemPuesto) exitWith {
hint "Ya estas colocando un objeto, ponlo primero antes de colocar otro."
};

	axe_itemCreado = false;
	axe_itemPuesto = false;
	axe_puedoPoner = true;

//_classname = "POP_npc_doctor";
cosaSimple = _classname createVehicle [0,0,0];

_attachPos = [0.16, 3, ((boundingBoxReal cosaSimple) select 1) select 2];
[cosaSimple] remoteExecCall ["life_fnc_simDisable",RANY];
cosaSimple attachTo[player, _attachPos];
clearWeaponCargoGlobal cosaSimple;
clearMagazineCargoGlobal cosaSimple;
clearItemCargoGlobal cosaSimple;
clearBackpackCargoGlobal cosaSimple;
cosaSimple setvariable ["persistent",true,true];
//_position = getPosWorld _cosa;
//_vectorDirUp = [vectorDir _cosa, vectorUp _cosa];

//_modelo = getModelInfo _cosa select 1;


//deleteVehicle _cosa;

//cosaSimple = createSimpleObject [_modelo, _position];
//cosaSimple setVectorDirAndUp _vectorDirUp;

cosaSimple_posRel = _attachPos;

//cosaSimple attachTo [player,cosaSimple_posRel]; lulwat
axe_itemCreado = true;
	_pic = ["pop_mesa_tv_box"] call ica_fnc_classToPic;
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Colocacion de Objetos</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Haz click cuando estes listo para poner el objeto... <br/>Puedes girarlo, acercarlo y alejarlo con las flechas del teclado.</t>",_pic];

if (_classname in clasesMuebles) then {
	[] spawn {
		while {!axe_itemPuesto} do {
			
			if ([cosaSimple] call life_fnc_playerInBuilding) then {
			axe_puedoPoner = true} else { axe_puedoPoner = false; titleText [" No puedes colocar este mueble fuera de tu vivienda.", "PLAIN"];};
			sleep 0.3;
		};
		[cosaSimple,false] call life_fnc_placeContainer;
	};
};	
	
if (_classname isEqualTo "POP_BandaClavos") then {
	[] spawn {
	waituntil {!isNull cosaSimple && axe_itemPuesto};
		[cosaSimple] remoteExec ["TON_fnc_spikeStrip",2];
	};
};


ponerEH = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
	
	if (_this select 1 isEqualTo 0 && axe_itemCreado && axe_puedoPoner) exitWith {

		detach cosaSimple;
		cosaSimple setPosATL [(getPosATL cosaSimple select 0),(getPosATL cosaSimple select 1),(getPosATL player select 2)];
		cosaSimple allowDamage false;
		axe_itemPuesto = true;
		axe_itemCreado = false;
		cosaSimple setvariable ["persistent",true,true];
		(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",ponerEH];
		(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",ajusteItemEH];
	_pic = ["pop_mesa_tv_box"] call ica_fnc_classToPic;
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Colocacion de Objetos</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Has puesto un objeto... <br/>Para quitarlo debes acercarte mucho, estando agachado, apuntarle y presionar windows.</t>",_pic];		
	};

}];



ajusteItemEH = (findDisplay 46) displayAddEventHandler ["KeyDown",{
	
	params ["_control","_tecla","_shift","_ctrl","_alt"];

	if (axe_itemCreado && !axe_itemPuesto && !_shift && !_ctrl && !_alt) then {

		if (_tecla isEqualTo 200) then {
			cosaSimple_posRel set [1, ( (cosaSimple_posRel select 1) + 0.2 )];
			cosaSimple attachTo [player,cosaSimple_posRel];
		};

		if (_tecla isEqualTo 208) then {
			cosaSimple_posRel set [1, ( (cosaSimple_posRel select 1) - 0.2 )];
			cosaSimple attachTo [player,cosaSimple_posRel];
		};

		if (_tecla isEqualTo 205) then {

		cosaSimple setDir ((getDir cosaSimple) - 0.2);
		
		};

		if (_tecla isEqualTo 203) then {

		cosaSimple setDir ((getDir cosaSimple) + 0.2);
		
		};			


	};


}];

