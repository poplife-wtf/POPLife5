
/*
AxE

Mision para traer camion con Mercancía para aumentar el Stock de la tienda.

*/

_param = _this select 0;

if (_param isEqualTo "mafia") exitWith {

        if (("cri" call ica_fnc_expToLevel) < 1) exitWith {
            titleText["No has comprado contáctos...", "PLAIN"];
    };

	_StockMafiaMis = zona_1 getVariable "stock";	
	_transportista = name vehicle player;
	_transportando = player getvariable "transportando_mercancia_stock";
	_transporteenmarcha = zona_1 getvariable "transporte_en_marcha";
	if ( _StockMafiaMis >= 10) exitWith {hint "Tengo suficientes armas en stock ... para ti y tu familia, recuerda ... hay que pasar desapercibidos ... !"};
	if!(isNil "_transportando") then {
	if (_transportando > 0) exitwith {hint "Quieres que te haga otro encargo ?? y el anterior ? ... muy bien ... Por tu bien, sigo esperando..."};
	};

	if (_transporteenmarcha > 0) exitwith {hint "Ya hay otro fulano trayéndome mercancía, si no ha llegado en un rato te haré el encargo a ti."};
    player setvariable ["transportando_mercancia_stock",1,true];
	zona_1 setvariable ["transporte_en_marcha",1,true];
  _zonaVendura = format["mision_stock_%1",round random 4];
  _pos = getMarkerPos _zonaVendura;
  _posgrid = mapGridPosition _pos;
_markerID = format["marker_%1",floor(random 1000)];
_marker = createMarker [ _markerID, _pos];
_marker setMarkerColor "ColorEAST";
_marker setMarkerText "Van de Mercancias con Estílo";
_marker setMarkerType "c_car";
0 spawn {
sleep 120;
deleteMarker _marker; 
};
    _vendura = "pop_Vandura_civ" createvehicle getMarkerPos _zonaVendura;
	_vendura setvariable ["persistent", true, true];
    _vendura setvariable ["vendura_mercancia_mafia",1,true];	
	_pic = getText (configFile >> "CfgWeapons" >> "RH_m9" >> "picture");
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Transporte de Mercancía</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Con que necesitas equipamento de urgencia.. <br/> Bueno pues te he puesto en el mapa la ubicación de una de mis Vans con mercancía cerca a coordenadas %3, Si la traes podré venderte lo que necesitas<br/>Cuidado %2 !! Te doy las llaves ... <br/>No me la juegues ... <br/> te voy a monitorear por GPS ... <br/> es más si en 20 minutos no has llegado detonare la van remotamente <br/>!! Estás Advertido !!</t>",_pic, _transportista,_posgrid];
     [_vendura, (60 * 30) + 3] spawn ica_fnc_borrame;    
     sleep (60 * 30);
	_transporteenmarcha2 = zona_1 getvariable "transporte_en_marcha";	 
	if (_transporteenmarcha2 > 0) exitwith {	
        hint "Me canse de esperarte !! Solo espero que estes cerca muy cerca de mi van!!";
		player setvariable ["transportando_mercancia_stock",0,true];
		zona_1 setvariable ["transporte_en_marcha",0,true];
		_c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _vendura;
        _c41 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _vendura;
        _c4 setDamage 1;_c41 setDamage 1;
        _list = _vendura nearObjects 3;
        { _x setDamage 1; } forEach _list;
		deleteMarker _marker; 
		[_vendura, 1] spawn ica_fnc_borrame; 
     };
};


if (_param isEqualTo "entregaMafia") exitWith {
    if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno por favor"};
    _vendura = nearestObject [player, "pop_Vandura_civ"];
    if (isnil "_vendura") exitwith {hint "No veo mi Van ni por aqui ... ni por allá !!"};
    if ((player distance _vendura)>10) exitwith {hint "Acerca mi Van para inspeccionarla ... ojalá me falte algo ... OJALÁ !!"};
    _traemercancia = _vendura getvariable "vendura_mercancia_mafia";
    if (_traemercancia < 0.5) exitwith {hint "Esta van no trae mi mercancía !!! Que intentas loco ?? !"};
    deletevehicle _vendura;
	player setvariable ["transportando_mercancia_stock",0,true];
	zona_1 setVariable ["stock", 16, true];
	zona_1 setvariable ["transporte_en_marcha",0,true];
    pop_din = pop_din + 1500;
	_pic = getText (configFile >> "CfgWeapons" >> "RH_m9" >> "picture");
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Transporte de Mercancía</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Muy buen trabajo !! Aqui te dejo algo por el tiempo y la gasolina ...  <br/> Ya tengo suficiente Stock para ti y otros cuantos más !!</t>",_pic];
};

if (_param isEqualTo "terro") exitWith {

        if (("ter" call ica_fnc_expToLevel) < 1) exitWith {
            titleText["No sabes de esto ... no tienes el llamado de Alá", "PLAIN"];
    };

	_StockMafiaMis = tienda_terro getVariable "stock";	
	_transportista = name vehicle player;
	_transportando = player getvariable "transportando_mercancia_stock";
	_transporteenmarcha = tienda_terro getvariable "transporte_en_marcha";
	if ( _StockMafiaMis >= 10) exitWith {hint "Tengo suficientes armas en stock ... para ti y tu hermanos insurgentes, recuerda ... hay que hacerle pagar a los infieles ... !"};
	if!(isNil "_transportando") then {
		if (_transportando > 0) exitwith {hint "Quieres que te haga otro encargo ?? y el anterior ? ... muy bien ... Por tu bien, sigo esperando..."};
	};

	if (_transporteenmarcha > 0) exitwith {hint "Ya hay otro hijo de Alá trayéndome mercancía, si no ha llegado en un rato te haré el encargo a ti."};
    player setvariable ["transportando_mercancia_stock",1,true];
	tienda_terro setvariable ["transporte_en_marcha",1,true];
  _zonaVendura = format["mision_stock_%1",round random 4];
  _pos = getMarkerPos _zonaVendura;
  _posgrid = mapGridPosition _pos;
_markerID = format["marker_%1",floor(random 1000)];
_marker = createMarker [ _markerID, _pos];
_marker setMarkerColor "ColorWEST";
_marker setMarkerText "Van de Mercancias Insurgentes";
_marker setMarkerType "c_car";
0 spawn {
sleep 120;
deleteMarker _marker; 
};
    _vendura = "pop_Vandura_civ" createvehicle getMarkerPos _zonaVendura;
    _vendura setvariable ["vendura_mercancia_terro",1,true];	
	_pic = getText (configFile >> "CfgWeapons" >> "RH_m9" >> "picture");
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Transporte de Mercancía</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Con que necesitas equipamento de urgencia.. <br/> Bueno pues te he puesto en el mapa la ubicación de una de mis Vans con mercancía cerca a coordenadas %3, Si la traes podré venderte lo que necesitas<br/>Cuidado %2 !! Te doy las llaves ... <br/>No me la juegues ... <br/> te voy a monitorear por GPS ... <br/> es más si en 20 minutos no has llegado detonare la van remotamente <br/>!! Estás Advertido !!</t>",_pic, _transportista,_posgrid];
     [_vendura, (60 * 30) + 3] spawn ica_fnc_borrame;    
     sleep (60 * 30);
	_transporteenmarcha2 = tienda_terro getvariable "transporte_en_marcha";	 
	if (_transporteenmarcha2 > 0) exitwith {	
        hint "Me canse de esperarte !! Solo espero que estes cerca muy cerca de mi van!!";
		player setvariable ["transportando_mercancia_stock",0,true];
		tienda_terro setvariable ["transporte_en_marcha",0,true];
		_c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _vendura;
        _c41 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _vendura;
        _c4 setDamage 1;_c41 setDamage 1;
        _list = _vendura nearObjects 3;
        { _x setDamage 1; } forEach _list;
		deleteMarker _marker; 
		[_vendura, 1] spawn ica_fnc_borrame; 
     };
};


if (_param isEqualTo "entregaTerro") exitWith {
    if ((count (nearestObjects [player, ["man"], 4]))>1) exitwith {hint "De uno en uno por favor"};
    _vendura = nearestObject [player, "pop_Vandura_civ"];
    if (isnil "_vendura") exitwith {hint "No veo mi Van ni por aqui ... ni por allá !!"};
    if ((player distance _vendura)>4) exitwith {hint "Acerca mi Van para inspeccionarla ... ojalá me falte algo ... OJALÁ !!"};
    _traemercancia = _vendura getvariable "vendura_mercancia_terro";
    if (_traemercancia < 0.5) exitwith {hint "Esta van no trae mi mercancía !!! Que intentas loco ?? !"};
    deletevehicle _vendura;
	player setvariable ["transportando_mercancia_stock",0,true];
	tienda_terro setVariable ["stock", 16, true];
	tienda_terro setvariable ["transporte_en_marcha",0,true];
    pop_din = pop_din + 1500;
	_pic = getText (configFile >> "CfgWeapons" >> "RH_m9" >> "picture");
	hintSilent parseText format["<img image='%1' size='1.50'/><t size='1' align ='center' color='#ffffff' shadow='2' font='EtelkaNarrowMediumPro'>Transporte de Mercancía</t><br/><t size='0.80' align ='center' color='#ffffff' font='EtelkaMonospacePro'><br/>Muy buen trabajo !! Aqui te dejo algo por el tiempo y la gasolina ...  <br/> Ya tengo suficiente Stock para ti y tus hermanos !!</t>",_pic];
};