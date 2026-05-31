/*

Script por Heisenberg White - Para poner camaras en el hud. Crea un npc_camara le añade tu ropa y le pone una camara en la cara.

Para Plata o Plomo . www.plataoplomo.wtf

["crear"] call ica_fnc_camara; // Crea el npc_camara

OPCIONAL : Le puedes añadir el segundo parametro para un objecto en especifico quedaria asi : ["cuerpo",objecto] call ica_fnc_camara
["cuerpo"] call ica_fnc_camara // Le crea la camara en el cuerpo al npc_camara
["cara"] call ica_fnc_camara // Le crea la camara en la cara al npc_camara

["bcamara"] call ica_fnc_camara // Borra la camara;

["bnpc"] call ica_fnc_camara

*/ 

_param = param [0];


if (_param isEqualto "crear") exitwith {

	_cara = face player;
	_goggles = goggles player;
	_casco = headgear player;
	_uniform = uniform player;
	_vest = vest player;
	_backpack = backpack player;


	npc_camara = createAgent ["C_man_1", [0,0,999], [], 0, "NONE"];
	removeAllWeapons npc_camara;
	removeAllItems npc_camara;
	removeAllAssignedItems npc_camara;
	removeUniform npc_camara;
	removeVest npc_camara;
	removeBackpack npc_camara;
	removeHeadgear npc_camara;
	removeGoggles npc_camara;

	npc_camara switchMove "AmovPercMstpSnonWnonDnon"; 
	npc_camara setface _cara;
	npc_camara addgoggles _goggles;
	npc_camara addheadgear _casco;
	npc_camara forceadduniform _uniform;
	npc_camara adduniform _vest;
	npc_camara addbackpack _backpack;



};




if (_param isEqualto "cuerpo") exitwith {

	_objecto = param [1,npc_camara];

	cam_camara = "camera" camCreate (_objecto modelToWorld [0,0,0]);
	cam_camara camSetTarget _objecto;
	cam_camara camSetRelPos [0, 4, 1];
	cam_camara cameraEffect ["Internal", "Back", "camaracuerpo"];
	cam_camara camCommit 1;


	((uinamespace getvariable "HUDica") displayctrl 6022) ctrlsettext "#(argb,512,512,1)r2t(camaracuerpo,1)";
};


if (_param isEqualto "cara") exitwith {

	_objecto = param [1,npc_camara];


	cam_camara = "camera" camCreate (_objecto modelToWorld [0,0,0]);
	cam_camara camSetTarget _objecto;
	cam_camara camSetRelPos [0, 0.5, 1.5];
	cam_camara cameraEffect ["Internal", "Back", "camaracara"];
	cam_camara camCommit 1;

	((uinamespace getvariable "HUDica") displayctrl 6022) ctrlsettext "#(argb,512,512,1)r2t(camaracara,1)";
};


if (_param isEqualto "bcamara") exitwith {

	cam_camara cameraEffect ["terminate","back"];
	camDestroy cam_camara;
	((uinamespace getvariable "HUDica") displayctrl 6022) ctrlsettext "";
};

if (_param isEqualto "bnpc") exitwith {

	deletevehicle npc_camara;

};