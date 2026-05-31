/*
	File: fn_roulleteSpin.sqf
	Author: Paronity
	Description: makes the roulette wheel spin like whoa!
*/
disableSerialization;
_display = findDisplay 2505;
_wheelState = _display displayCtrl 1248;
_boton_rula = _display displayCtrl 1600;
_boton_rula ctrlEnable false;
_boton_rula ctrlSetText "Abre de nuevo";

if (isNil "axe_apuesta_actual") then {axe_apuesta_actual = 1;};
if(axe_apuesta_actual == 0) exitWith {hint "Tienes que seleccionar un tipo de apuesta!"};//no wager
if(count axe_ruleta_apuestas == 0) exitWith {hint "Tienes que seleccionar una apuesta!"};//no bets selected

_currentBet = axe_apuesta_actual;
_currentBets = axe_ruleta_apuestas;
_totalCost = (count axe_ruleta_apuestas * axe_apuesta_actual);

if(pop_din < _totalCost) exitWith {hint format["No tienes suficiente dinero, pusiste %2 apuestas a %1 por apuesta para un total de €%3.",_currentBet,count axe_ruleta_apuestas,[_totalCost] call life_fnc_numberText];};//not enough greenery

pop_din = pop_din - _totalCost;
caja_casino setVariable ["dinero",(caja_casino getVariable ["dinero",180000]) + _totalCost,true];

_totalWinnings = 0;
//order needed for the wheel to appear to be spinning since they aren't numerically sorted
_circleOrder = [32,15,19,4,21,2,25,17,34,6,27,13,36,11,30,8,23,10,5,24,16,33,1,20,14,31,9,22,18,29,7,28,12,35,3,26,0];

//arrays of winners
_oddNumbers = [1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35];
_evenNumbers = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36];
_blackNumbers = [2,4,6,8,10,11,13,15,17,20,22,24,26,28,29,31,33,35];
_redNumbers = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36];
_column1Numbers = [3,6,9,12,15,18,21,24,27,30,33,36];
_column2Numbers = [2,5,8,11,14,17,20,23,26,29,32,35];
_column3Numbers = [1,4,7,10,13,16,19,22,25,28,31,34];

winnings = [];
_winningNumber = ceil(random(36));

_rotateWheel =
{
	_stop = _this select 0;
	_number = _this select 1;
	_sleep = _this select 2;
	{
		_wheelState ctrlSetText format["\pop_iconos\roulette\wheels\wheel_%1.jpg",_x];
		if(_stop && _x == _number) exitWith {};
		sleep _sleep;
	} foreach _circleOrder;
};

[false,0,.05] call _rotateWheel;
[false,0,.05] call _rotateWheel;
[true,_winningNumber,.09] call _rotateWheel;

{
	if(_x >= 0 && _x < 37) then
	{
		if(_x == _winningNumber) then
		{
			winnings pushBack ["Acierto en Numero","35:1",(_currentBet * 36)];
		};
	};
	switch(_x) do
	{
		case 37 :
		{
			if(_winningNumber in _column1Numbers) then
			{
				winnings pushBack ["Acierto en Columna","2:1",(_currentBet * 3)];
			};
		};
		case 38 :
		{
			if(_winningNumber in _column2Numbers) then
			{
				winnings pushBack ["Acierto en Columna","2:1",(_currentBet * 3)];
			};
		};
		case 39:
		{
			if(_winningNumber in _column3Numbers) then
			{
				winnings pushBack ["Acierto en Columna","2:1",(_currentBet * 3)];
			};
		};
		case 40:
		{
			if(_winningNumber in [1,2,3,4,5,6,7,8,9,10,11,12]) then
			{
				winnings pushBack ["Acierto del 1-12","2:1",(_currentBet * 3)];
			};
		};
		case 41:
		{
			if(_winningNumber in [13,14,15,16,17,18,19,20,21,22,23,24]) then
			{
				winnings pushBack ["Acierto del 13-24","2:1",(_currentBet * 3)];
			};
		};
		case 42:
		{
			if(_winningNumber in [25,26,27,28,29,30,31,32,33,34,35,36]) then
			{
				winnings pushBack ["Acierto del 25-36","2:1",(_currentBet * 3)];
			};
		};
		case 43:
		{
			if(_winningNumber in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]) then
			{
				winnings pushBack ["Primeros 18","1:1",(_currentBet * 2)];
			};
		};
		case 44:
		{
			if(_winningNumber in [19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]) then
			{
				winnings pushBack ["Ultimos 18","1:1",(_currentBet * 2)];
			};
		};
		case 45:
		{
			if(_winningNumber in _evenNumbers) then
			{
				winnings pushBack ["Acierto en Pares","1:1",(_currentBet * 2)];
			};
		};
		case 46:
		{
			if(_winningNumber in _oddNumbers) then
			{
				winnings pushBack ["Acierto en Inpares","1:1",(_currentBet * 2)];
			};
		};
		case 47:
		{
			if(_winningNumber in _redNumbers) then
			{
				winnings pushBack ["Acerto Rojo","1:1",(_currentBet * 2)];
			};
		};
		case 48:
		{
			if(_winningNumber in _blackNumbers) then
			{
				winnings pushBack ["Acerto Negro","1:1",(_currentBet * 2)];
			};
		};
	};
} foreach _currentBets;

winningsMessage = format["<t color='#BB1111'><t size='2.0'><t align='center'>%1<br/>","Sin Aciertos"];
if(count winnings > 0) then
{
	player setVariable ["casino",(player getVariable ["casino",0]) + 1,true];
	winningsMessage = format["<t color='#BB1111'><t size='2.0'><t align='center'>%1<br/>","Ganancias"];
	{
		_totalWinnings = _totalWinnings + (_x select 2);
		winningsMessage = winningsMessage +  format ["<br/><t color='#5A80EB'><t size='1.5'><t align='center'>%1<br/><t color='#11FF00'><t align='center'><t size='1'>Paga %2: €%3",(_x select 0),(_x select 1),(_x select 2)];
	} foreach winnings;
	winningsMessage = winningsMessage +  format ["<br/><t color='#5A80EB'><t size='1.5'><t align='center'>Total:<br/><t color='#FF0000'><t align='center'><t size='1'>€%1",_totalWinnings];
}
else
{
	_totalWinnings = 0;
	winningsMessage = format["<t color='#BB1111'><t size='2.0'><t align='center'>%1<br/>","Sin aciertos"];
};

hint parseText winningsMessage;
pop_din = pop_din + _totalWinnings;