/*
File: fn_fadeSound.sqf
Auhtor: Michael Francis

Description:
Fades out sound.
*/

/*
life_fadeSound = !life_fadeSound;

if (life_fadeSound) then 
{
	0.1 fadeSound 0.1; // Faded to 10%
	hint "Te has puesto los tapones"
}
else
{
	0.1 fadeSound 1; // Returned to 100%
	hint "Te has quitado los tapones"
};
*/

// FuRixX Lamborghini \\

_variable = player getVariable ["FuRixX_Tapones", 0];
_asignado = _variable + 1;

if (_asignado > 3) then {_asignado = 0};

_valor = 1;

switch (_asignado) do {
	case 0: {_valor = 1};
	case 1: {_valor = 0.3};
	case 2: {_valor = 0.2};
	case 3: {_valor = 0.1};
};

0 fadeSound _valor;
player setVariable ["FuRixX_Tapones", _asignado];

if (_asignado == 0) then {
	hint "Tapones quitados";
} else {
	hint format ["Tapones asignados a nivel %1/3", _asignado]; 
};

// FuRixX Lamborghini \\