// se crea la camara
Life_Preview_3D_Vehicle_cam = "camera" camCreate ([[5000, 5000, 0]] call life_fnc_SearchPosEmpty);
Life_Preview_3D_Vehicle_cam cameraEffect ["Internal", "BACK"];
Life_Preview_3D_Vehicle_cam camSetFocus [-1, -1];
showCinemaBorder false;
Life_Preview_3D_Vehicle_cam camCommit 0;
camUseNVG (sunOrMoon  isEqualTo  0);

Life_Preview_3D_Vehicle_object = objNull;

// Ejecuto todo realizando una rotación del coche.
0 spawn
{
	// Hasta que dejamos o cerremos la visualización
	while {!isNull Life_Preview_3D_Vehicle_cam} do
	{
		private ["_objeto", "_distancia_cam", "_final_cam"];

		// Esperamos el objeto.
		waitUntil {!isNull Life_Preview_3D_Vehicle_object};

		_objeto = Life_Preview_3D_Vehicle_object;

		_distancia_cam = 2.25 * (
				[boundingBoxReal _objeto select 0 select 0, boundingBoxReal _objeto select 0 select 2]
			distance
				[boundingBoxReal _objeto select 1 select 0, boundingBoxReal _objeto select 1 select 2]
		);
		_final_cam = 0;

		Life_Preview_3D_Vehicle_cam camSetTarget _objeto;
		Life_Preview_3D_Vehicle_cam camSetPos (_objeto modelToWorld [_distancia_cam * sin _final_cam, _distancia_cam * cos _final_cam, _distancia_cam * 0.33]);
		Life_Preview_3D_Vehicle_cam camCommit 0;

		// Rotación alrededor del coche
		while {Life_Preview_3D_Vehicle_object  isEqualTo  _objeto} do
		{
			_final_cam = _final_cam + 3.25;

			Life_Preview_3D_Vehicle_cam camSetPos (_objeto modelToWorld [_distancia_cam * sin _final_cam, _distancia_cam * cos _final_cam, _distancia_cam * 0.33]);
			Life_Preview_3D_Vehicle_cam camCommit 0.05;

			sleep 0.05;
		};
	};
};