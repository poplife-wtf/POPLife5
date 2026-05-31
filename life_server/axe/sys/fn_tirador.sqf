_noobAIM = 2;
_yoloAim = 1.8;
_mediumAIM = 1.2;
_normalAIM = 1;
_proAIM = 0.7;
 
 
if (("com" call ica_fnc_expToLevel) < 4) then {
 
          player setUnitRecoilCoefficient _noobAIM ;
};
 
 
 
if (("com" call ica_fnc_expToLevel) >=4) then {
             player setUnitRecoilCoefficient _yoloAim;
};
 
 
if (("com" call ica_fnc_expToLevel) >=5) then {
             player setUnitRecoilCoefficient _mediumAIM;
};
 
 
if (("com" call ica_fnc_expToLevel) >=6) then {
              player setUnitRecoilCoefficient _normalAIM;
};
 
 
if (("com" call ica_fnc_expToLevel) >= 7) then {
              player setUnitRecoilCoefficient _proAIM;
};