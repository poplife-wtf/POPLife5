/* Creado por Rosen */

/* 

 -- Lo siento, mucho texto :v - Lo acorto mejor --

playsound "intro";
[] spawn {	
	private["_handle"];
	cutText ["","BLACK IN"];
	_handle = [] execVM "rosen\intro.sqf";
	waitUntil {scriptDone _handle};
};
["<t color='#ff0000' size = '.8'>Bienvenido a POPLIFE Metropolis</t>",-0.8,0,110,3,0,789] spawn BIS_fnc_dynamicText; 
["<t color='#10ff00' size = '.8'>Creadores:<br />PKE<br />Axe<br />Icaruk</t>",0.8,0.5,110,1,-1,790] spawn BIS_fnc_dynamicText; 
["<t color='#00ffe5' size = '.8'>Desarrolladores:<br />Heisenberg<br />Juan Adamuz<br />Jose Ramos<br />Daniel Master<br />Tito Master<br />Nicky Jam<br />Jordan Connor<br/>Sallesta<br/>Indiana Jones</t>",0.8,1,110,1,-1,791] spawn BIS_fnc_dynamicText; 
["<t color='#e9ff00' size = '.8'>Agradecimientos:<br /> Comunidad POP , GSTV <br /><br /> David Martin<br /> Nino Lodbrok<br />Manolo Perez<br />Galen Master<br /> y a todos los que han<br />promocionado el servidor</t>",0.8,2,110,0.5,-1,792] spawn BIS_fnc_dynamicText;
titleText ["", "PLAIN"];

*/

// Mejor :D

[ format ["<t color='#ff0000' size = '.8'>Bienvenido a poplife.wtf %1</t>", name player],-0.8,0,5,3,0,789] spawn BIS_fnc_dynamicText; 
["<t color='#581845' size = '.8'>Modificado por:<br />FuRixX Lamborghini",0.8,0.5,5,1,-1,790] spawn BIS_fnc_dynamicText; 
["<t color='#10ff00' size = '.8'>Base por:<br />PKE<br />Axe<br />Icaruk</t>",0.8,1,5,1,-1,791] spawn BIS_fnc_dynamicText; 
["<t color='#00ffe5' size = '.8'>Desarrollado por:<br />Heisenberg<br />Juan Adamuz<br />Jose Ramos<br />Daniel Master<br />Tito Master<br />Nicky Jam<br />Jordan Connor<br/>Sallesta<br/>Indiana Jones</t>",0.8,1.5,5,1,-1,792] spawn BIS_fnc_dynamicText; 
titleText ["", "PLAIN"];
profileNameSpace setVariable ["furixradical",0];