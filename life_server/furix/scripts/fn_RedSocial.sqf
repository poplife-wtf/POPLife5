// By FuRixX Lamborghini \\

_entrada = _this select 0;

if (isNil "_entrada") then {_entrada = "Abrir"};

if (_entrada == "Abrir") exitWith {
	createDialog "FuRixXRedSocial";
	_dialogo = findDisplay 6573;
	_boton = _dialogo displayCtrl 6564;
	_titulo = _dialogo displayCtrl 6562;
	_foto = _dialogo displayCtrl 6565;
	_fotoUsuario = profileNamespace getVariable ["FuRixX_RedSocial_FotoPerf", "https://i.imgur.com/bzil6wL.png"];
	_foto ctrlSetText _fotoUsuario;
	_titulo ctrlSetText name player;
	_boton buttonSetAction "['Enviar'] spawn FuRixX_fnc_RedSocial";
};

if (_entrada == "Enviar") exitWith {

	_dialogo = findDisplay 6573;
	_mensaje = _dialogo displayCtrl 6563;
	
	_fotoUsuario = profileNamespace getVariable ["FuRixX_RedSocial_FotoPerf", "https://i.imgur.com/bzil6wL.png"];
	_escrito = ctrlText _mensaje;
	hint "Mensaje enviado";

	FuRixX_RedSocial_EnviarMSJ = [player, _escrito, _fotoUsuario];
	publicVariableServer "FuRixX_RedSocial_EnviarMSJ";
	closeDialog 0;
	FuRixX_EnviarLog = format [":incoming_envelope: El usuario **%1** (_%2_) ha enviado un mensaje a la red social: `%3`", name player, getPlayerUID player, _escrito];
	publicVariableServer "FuRixX_EnviarLog";

};

// By FuRixX Lamborghini \\