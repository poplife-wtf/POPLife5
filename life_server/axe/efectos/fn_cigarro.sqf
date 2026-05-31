cutText ["Abres un paquete de cigarrillos y tomas uno..","PLAIN",2];
sleep 3;
cutText ["Mmmm... Disfrutare de este buen tabaco.","PLAIN",2];
		
_objeto = _this select 0;
 
 _pos = (ASLtoATL visiblePositionASL _objeto);  
	 _particle1 = "#particlesource" createVehicleLocal _pos;	
		_particle1 setParticleCircle [0, [0, 0, 0]];
		_particle1 setParticleRandom [1, [0.05, 0.05, 0], [0.05, 0.05, 0.05], 0, 0.1, [0, 0, 0, 0.2], 0, 0];
		_particle1 setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 2.5, [0, 0.07, 0.1], [0, 0, 0.3], 0, 10, 7.9, 0.01, [0.25, 0.75, 1.5], [[0.01, 0.01, 0.01, 0.8], [0.01, 0.01, 0.01, 0.4], [0.01, 0.01, 0.01, 0]], [0.08], 0.5, 0.05, "", "", _objeto];
		_particle1 setDropInterval 1.4;
		_particle1 attachto [_objeto,[0,0.1,0.25], "neck"];  