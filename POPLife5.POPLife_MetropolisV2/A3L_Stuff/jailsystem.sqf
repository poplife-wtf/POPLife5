//A3L mod Rosen
fnc_arrestmenu = {
	disableSerialization;
	createdialog "a3l_jail_menu";
	private["_unit","_id"];
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	personyouwanjail = _unit;
	if(isNull _unit) exitWith {};
	if(isNil "_unit") exitwith {};
	if(!(_unit isKindOf "Man")) exitWith {};
	if(!isPlayer _unit) exitWith {};
	if((_unit getVariable "life_is_arrested")) exitWith {hint "Esta persona ya esta detenida.";};
	if(!(_unit getVariable "restrained")) exitWith {hint "Esta persona no esta esposada.";};
	if(!((side _unit) in [civilian,independent])) exitWith {};
	if(isNull _unit) exitWith {};
	_display = findDisplay 5546;
	_nameofperson = _display displayCtrl 2200;
	_nametext = format ["%1",name _unit];
	_nameofperson ctrlSetText _nametext;
};

fnc_arrestbutton = {
	_display = findDisplay 5546;
	_nameofperson = _display displayCtrl 2200;
	_timeinminute = _display displayCtrl 2201;
	_reasonofjail = _display displayCtrl 2202;
	_playername = ctrlText _nameofperson;
	_jailtime = ctrlText _timeinminute;
	_reason = ctrlText _reasonofjail;
	if(isNull personyouwanjail) exitWith {};

	detach personyouwanjail;
	//[[personyouwanjail,false,_jailtime,_reason],"fnc_sendtojail",personyouwanjail,false] call life_fnc_MP;
	[personyouwanjail,false,_jailtime,_reason] remoteExec ["fnc_sendtojail",personyouwanjail];
	//[[personyouwanjail,player,false],"life_fnc_wantedBounty",false,false] call life_fnc_MP;
};

fnc_sendtojail = {
	private["_bad","_unit"];
	_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	hint format["%1", _unit];
	if(isNull _unit) exitWith {};
	if(_unit != player) exitWith {};
	if(life_is_arrested) exitWith {};
	_bad = [_this,1,false,[false]] call BIS_fnc_param;
	life_arrestMinutes = _this select 2;
	life_arrestReason = _this select 3;

	A3L_Fnc_OldUniform = Uniform player;
	player addUniform "U_C_DDE";
	removeAllWeapons player;
	removevest player;
	removebackpack player;

	hint localize "STR_Jail_LicenseNOTF";
	[1] call life_fnc_removeLicenses;


	if(_bad) then
	{
		waitUntil {alive player};
		sleep 1;
	};
	remoteExec ["fnc_jailsetup",player];
	//[[player,_bad,life_arrestMinutes,life_arrestReason],"svr_sendtojail",false,false] call life_fnc_MP;
	[player,_bad,life_arrestMinutes,life_arrestReason] remoteExec ["svr_sendtojail",2];
	[5] call SOCK_fnc_updatePartial;
};

fnc_jailsetup = {
	_minutes = parseNumber life_arrestMinutes;
	_hours = floor (_minutes/60);
	_minutes = _minutes % 60;
	player setVariable["restrained",false,true];
	player setVariable["Escorting",false,true];
	player setVariable["transporting",false,true];
	life_is_arrested = true;
	player setVariable["life_is_arrested",true,true];
	removeAllWeapons player;
	{player removeMagazine _x} foreach (magazines player);
			
	acciontrabajocarcel = player addAction ["Trabajar en la Carcel",{
	player removeAction acciontrabajocarcel;
	["trabajo"] call ica_fnc_trabajoCarcel;
	},nil,1.5,false,true,"","player distance [9366.01,5846.99,1.90735] < 200"];	

	_jaillocations = [
 [9351.38,5808.06,0.438865],
[9350.08,5805.55,0.436355],
[9348.39,5802.88,0.432074]
	];
	_randomer = floor random (count _jaillocations);
	_jailpos = _jaillocations select _randomer;

	player setPos _jailpos;
	if((player distance (getMarkerPos "jail_marker")) > 40) then
	{
		player setPos (getMarkerPos "jail_marker");
	};

	("A3LJAILTIME" call BIS_fnc_rscLayer) cutRsc ["a3l_jail_timer","PLAIN"];
	[] spawn
	{
		while {(player distance (getMarkerPos "jail_marker")) < 60} do
		{
			player allowdamage false;  
			sleep 120;
			if ((player distance (getMarkerPos "jail_marker")) < 60) then {
			("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; 
			("A3LJAILTIME" call BIS_fnc_rscLayer) cutRsc ["a3l_jail_timer","PLAIN"];
			_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#B20000' align='center' size='1.8'>%1</t>",life_arrestReason];
			((uiNamespace getVariable "a3ljailtimer") displayCtrl 1101) ctrlSetStructuredText _sexytext;
			};
			player allowdamage true; 
		};
	};

	_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#B20000' align='center' size='1.8'>%1</t>",life_arrestReason];
	((uiNamespace getVariable "a3ljailtimer") displayCtrl 1101) ctrlSetStructuredText _sexytext;

	[0,_minutes,_hours,0] spawn fnc_jailtimer;
};




fnc_jailtimer = {
	sleep 1;
	_release = 0;
	_second = _this select 0;
	_minute = _this select 1;
	_hour = _this select 2;
	_dtbsave = _this select 3;
	if (_second > 0) then {
		_second = _second - 1;
	} else { if (_minute > 0) then {
		_minute = _minute - 1;
		_second = 60;
	} else { if (_hour > 0) then {
		_hour = _hour - 1;
		_minute = 59;
		_second = 60;
	} else {};};};
	seconds = _second;
	minute = _minute;
	hour = _hour;

	_hrtext = "";
	_hourtext = "";
	_mntext = "";
	_minutetext = "";
	_sectext = "";
	_secondtext = "segundos";

	if (_hour == 0) then {_hrtext = "";} else {
	if (_hour == 1) then {_hourtext = "hora"} else {_hourtext = "horas"};
		_hrtext = parseText format["%1 %2, ",_hour,_hourtext];
	};
	if ((_hour == 0) && (_minute == 0)) then { _mntext = ""; } else {
	if (_minute == 1) then {_minutetext = "minuto"} else {_minutetext = "minutos"};
		_mntext = parseText format["%1 %2 and ",_minute,_minutetext];
	};

	_dtbsave = _dtbsave + 1;
	if (_dtbsave == 300) then {[[_hour,_minute,player],"svr_jailtodb",false,false] call life_fnc_MP; _dtbsave = 0;};
	_sectext = parseText format["%1 %2",_second,_secondtext];

	_sexytext = parseText format["<t font='EtelkaNarrowMediumPro' color='#B20000' align='center' size='1.8'>%1%2%3</t>",_hrtext,_mntext,_sectext];
	((uiNamespace getVariable "a3ljailtimer") displayCtrl 1100) ctrlSetStructuredText _sexytext;

	if (((_hour < 1) && (_minute < 1)&& (_second < 1)) OR ((player distance (getMarkerPos "jail_marker")) > 100)) then {
		if ((_hour < 1) && (_minute < 1)&& (_second < 1)) then {
			_release = 1;
			[_release] call fnc_releaseprison;
		} else {
			_release = 2;
			[_release] call fnc_releaseprison;
		};
	} else { [_second,_minute,_hour,_dtbsave] spawn fnc_jailtimer;  };
};

fnc_releaseprison = {
	_release = _this select 0;
	life_is_arrested = false;
	player setVariable["life_is_arrested",false,true];
	[[player],"svr_releaseprison",false,false] call life_fnc_MP;
	if (_release == 1) then {

		if (isNil "A3L_Fnc_OldUniform") then
		{
			player addUniform "U_C_Poloshirt_blue";
		} else
		{
			player addUniform A3L_Fnc_OldUniform;
		};

		[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
		player setPos (getMarkerPos "jail_release");
		player allowdamage true;
		("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; 
		hint "Has salido de la carcel!";
		player addUniform A3L_Fnc_OldUniform;
		player removeAction acciontrabajocarcel;
	} else {
		player removeAction acciontrabajocarcel;
		_trabajocarcel = player getVariable ["trabajo_carcel",false];
			if (_trabajocarcel) then {
			if (isNil "A3L_Fnc_OldUniform") then
		{
			player addUniform "U_C_Poloshirt_blue";
		} else
		{
			player addUniform A3L_Fnc_OldUniform;
		};

		[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
		player setPos (getMarkerPos "jail_release");
		player allowdamage true;
		("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; 
		hint "Has salido de la carcel!";
			} else {
		
		hint "Has escapado de la carcel!";
		
		player allowdamage true;
		("A3LJAILTIME" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; 
		};
	};
};