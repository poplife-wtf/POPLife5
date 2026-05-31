/*

Animales muy animalezcos 
By Boru
Mejorado por AxE

*/

private["_listaAnimales","_dist","_radio","_marcadorZona","_unitsCerca","_animalesActivos"];
params [
        ["_marcadorZona","",[""]],
        ["_maxanimales",50,[0]]
];

if (_marcadorZona isEqualTo "") exitWith {};
_listaAnimales = ["Sheep_random_F","Goat_random_F","Cock_random_F"];
_radio = (getMarkerSize _marcadorZona) select 0;
_dist = _radio + 100;
_zone = getMarkerPos _marcadorZona;

if (!isNil "animales" && {count animales != 0}) then {
    _maxanimales = _maxanimales - count(animales);
} else {
    animales = [];
};

_unitsCerca = false;
_animalesActivos = false;
for "_i" from 0 to 1 step 0 do {
    {if ((_x distance _zone) < _dist) exitWith {_unitsCerca = true;}; _unitsCerca = false;} forEach playableUnits;
    if (_unitsCerca && !_animalesActivos) then {
        _animalesActivos = true;
        for "_i" from 1 to _maxanimales do {
            _animalClass = selectRandom _listaAnimales;
            _position = [((_zone select 0) - _radio + random (_radio * 2)), ((_zone select 1) - _radio + random (_radio * 2)),0];
            _animal = createAgent [_animalClass,_position,[],0,"FORM"];
            _animal setDir (random 360);
            animales pushBack _animal;
        };
    } else {
        if (!_unitsCerca && _animalesActivos) then {
            {deleteVehicle _x;} forEach animales;
            animales = [];
            _animalesActivos = false;
        };
    };
    uiSleep (3 + random 2);
    _maxanimales = param [1,10,[0]];
};