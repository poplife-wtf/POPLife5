
//By AxE.

// Función que aplica extorsión a la zona.
// pxóximamente con porcentajes e investigaciones policiales.
	private ["_zona","_grupocaptura"];
		
	_zona = _this select 0;
	_grupocaptura = _this select 1;
	
		_tiendas_extorsion = tiendasArr + listaCasas + ["POP_npc_mafioso3"];
		{
			_objetos = position _zona nearObjects [_x, 800];
			{
			_x setVariable["controlado_por",_grupocaptura,true];
			} forEach _objetos;
		} forEach _tiendas_extorsion;