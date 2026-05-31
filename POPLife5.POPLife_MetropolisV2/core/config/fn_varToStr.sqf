/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{

	//License Block

	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_taxita": {"Licencia de Taxista"};
	case "license_civ_buseteroetero": {"Licencia de Transporte Civil"};
	case "license_civ_transportista": {"Licencia de Transporte"};
	case "license_civ_agricultor": {"Licencia de Agricultor"};
	case "license_civ_mecanico": {"Licencia de Mecanico"};
	case "license_civ_seguridadp": {"Licencia de Seguridad Privada"};
	case "license_civ_tesorero": {"Licencia de Tesorero"};
	case "license_civ_minero": {"Licencia de Minero"};
	case "license_civ_pescador": {"Licencia de Pescador"};
	case "license_civ_periodista": {(localize "STR_License_perdiodista")};
	case "license_civ_donator": {(localize "STR_License_donator")};
	case "license_civ_alcalde": {(localize "STR_License_alcalde")};
};
