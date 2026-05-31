/*

By AxE ... en progreso.

_vestItems = itemCargo (vestContainer player);
_vestMagazines = magazinesAmmoCargo (vestContainer player);
_vestWeapons = weaponsItemsCargo (vestContainer player);


(vestContainer player) addItemCargo _vestItems;
(vestContainer player) addMagazineCargo _vestMagazines;
(vestContainer player) addWeaponCargo _vestWeapons;


_uniformItems = itemCargo (uniformContainer player);
_uniformMagazines = magazinesAmmoCargo (uniformContainer player);
_uniformWeapons = weaponsItemsCargo (uniformContainer player);




(uniformContainer player) addItemCargo _vestItems;
(uniformContainer player) addMagazineCargo _vestMagazines;
(uniformContainer player) addWeaponCargo _vestWeapons;

*/

if (isNil {yaHeRefrescado}) then {

	_accion = [
		"Quieres refrescar tu Ropa y Chaleco ?...Perderas cualquier item en tu Chaleco o Ropa.",
		"Refresh de Ropa.",
		"Si",
		"No"
	] call BIS_fnc_guiMessage;
	waituntil {!isNil "_accion"};

	if(!isNil "_accion" && !_accion) exitWith {titleText["Refresh de Ropa Cancelado","PLAIN"];};

	_chaleco = vest player;
	removeVest player;
	player AddVest _chaleco;

	_ropa = uniform player;
	removeUniform player;
	player ForceAddUniform _ropa;
	titleText["Tu Ropa ha Sido Recargada","PLAIN"];
		0 spawn {
			yaHeRefrescado = true;
			sleep 40;
			yaHeRefrescado = nil;
		};
} else {
	hint "Sólo puedes Cambiar ropa cada 40 Segundos.";
};
