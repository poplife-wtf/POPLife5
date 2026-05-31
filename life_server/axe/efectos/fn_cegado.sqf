//quickskill bolsa en la cabeza, no robar el codigo cabrones
//hint "cegado sqf activado";
private ["_cegado"];
_cegado = player getVariable["cegado",false];

if(_cegado) then {
	// cegar
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1.45, 1.5, -0.75, [-0.5,-0.5,-0.5,0.45], [-0.2,-0.2,-0.2,0.9], [2,2,2,1]];
	"colorCorrections" ppEffectCommit 0;

	//effecto bolsa
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [99]; // intensity of blur
	"dynamicBlur" ppEffectCommit 1; // time till vision is fully blurred		



	} 
	else {
		
	//no esta cegado reset camera effects

	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
	"dynamicBlur" ppEffectCommit 1; // time it takes to normal

	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [1,1,1,1], [1,1,1,1]];
	"colorCorrections" ppEffectCommit 1;
}

