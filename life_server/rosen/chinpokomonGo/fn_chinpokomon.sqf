/* Creado por Rosen */

if (isNil (profileNameSpace getVariable "chinpokomon")) then {
	profileNameSpace setvariable["chinpokomon", []];
};
_listaChinpokomon = profileNameSpace getVariable "chinpokomon";
_pInicial = position player;
while{chinpokomon} do {
	sleep (floor random [120,180,300]);		
	_pFinal = position player;
	_distancia = _pInicial distance _pFinal;
	if(_distancia > 300) {
		_chinpokomon = [] spawn ica_fnc_capturar;			
	};			
};
