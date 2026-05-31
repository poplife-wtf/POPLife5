#include <macro.h>
/*
	File: fn_adminDebug.sqf
    Author: tenshi	
*/

if (call life_adminlevel < 1) exitWith {
	
	0 spawn {
		_t = 1;
		while {_t > 0} do {
			closeDialog 0;
			
			_t = _t - 0.1;
			sleep 0.1;
		};
	};
	
	hint "No puedes usar esto."
};

createDialog "RscDisplayDebugPublic";