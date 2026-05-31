
/*
por: Icaruk
	0 spawn ica_fnc_initMineria;176.124
*/

_minaLejana = [
	[6429.63,9503.52,0.36824], [6460.55,9522.31,0.681137], [6473.85,9471.04,0.682251],
	[9523.54,4299.9,0.157734], [9535.23,4300.9,0.950291]
];

_pos1 = [_minaLejana] call BIS_fnc_selectRandom;
_minaLejana = _minaLejana - [_pos1];
_pos2 = [_minaLejana] call BIS_fnc_selectRandom;


_minaCercana = [
	[6420.69,9604.81,-0.0194397], [9399.69,4310.46,0.242313], [9433.11,4358.78,0.360031]
];

_pos3 = [_minaCercana] call BIS_fnc_selectRandom;
_minaCercana = _minaCercana - [_pos3];
_pos4 = [_minaCercana] call BIS_fnc_selectRandom;

_pos = _pos1 + _pos2 + _pos3 + _pos4;

_idx = round random (count _pos);
menaCobre setPos (_pos select _idx);
_pos = _pos - [_pos select _idx];

_idx = round random (count _pos);
menaHierro setPos (_pos select _idx);
_pos = _pos - [_pos select _idx];

_idx = round random (count _pos);
menaOro setPos (_pos select _idx);
_pos = _pos - [_pos select _idx];

_idx = round random (count _pos);
menaPlatino setPos (_pos select _idx);
_pos = _pos - [_pos select _idx];






