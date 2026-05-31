/*

Sistema de "Taquillas" Adamuz Systems ^^

this addaction ["<t color=""#37ad3b"">" + "Guardar Equipamiento en la taquilla (1000€)", "['A'] spawn ica_fnc_taquillas;"]; 
this addaction ["<t color=""#D9D638"">" + "Recoger Equipamiento de la taquilla", "['B'] spawn ica_fnc_taquillas;"]; 
this addaction ["<t color=""#37ad3b"">" + "Guardar tus armas en la taquilla", "['D'] spawn ica_fnc_taquillas;"]; 
this addaction ["<t color=""#D9D638"">" + "Recoger tus armas de la taquilla (1000€)", "['C'] spawn ica_fnc_taquillas;"];

*/
if (side player != west and side player != independent) exitwith {hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No tienes permiso para usar estas taquillas. Son solo para funcionarios publicos.</t> <br/><br/>"];};
_tipo = _this select 0;
_preciouso = 1000;
_comision = _preciouso * 0.25;

switch (_tipo) do
{
	case 'A':
	{
		if (isnil "equipamientopolicial") then 
		{ 	
			equipamientopolicial = getUnitLoadout player;  
			removeHeadgear player: 
			removeGoggles player; 
			removeVest player; 
			removeBackpack player; 
			removeUniform player; 
			removeAllWeapons player: 
			removeAllAssignedItems player; 
			playsound "taquilla";
			hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has guardado tus cosas en la taquilla.(Cuando las saques, se sobreescribirá y perderas el equipamiento que lleves encima). Si te vas del mundo, la taquilla se vacia automaticamente</t> <br/><br/>"]; 			
		} else  
		{ 
			hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Ya tienes cosas guardadas dentro. Sacalas y podras guardar otras. (Si sacas la equipacion de dentro, pierdes todo lo que tienes ahora encima!)</t> <br/><br/>"]; 
		}; 
	};
	case 'B':
	{
		if (isnil "equipamientopolicial") then 
		{ 
			hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No hay nada guardado en tu taquilla.</t> <br/><br/>"]; 
		} else 
		{ 
			player setUnitLoadout equipamientopolicial; 
			playsound "taquilla";
			equipamientopolicial = nil; 
			hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has recogido tus cosas de la taquilla.</t> <br/><br/>"]; 
		};
	};
	case 'C':
	{
		if (isnil "armaspolicia") then 
		{ 
			hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No tienes armas guardadas en la taquilla.</t> <br/><br/>"]; 
		} else 
		{ 
			player addweapon (armaspolicia select 0);
			player addweapon (armaspolicia select 1);
			player addweapon (armaspolicia select 2);
			player addPrimaryWeaponItem (accesoriosarma select 0);
			player addPrimaryWeaponItem (accesoriosarma select 1);
			player addPrimaryWeaponItem (accesoriosarma select 2);
			player addPrimaryWeaponItem (accesoriosarma select 3);
			player addSecondaryWeaponItem (accesoriostercera select 0);
			player addSecondaryWeaponItem (accesoriostercera select 1);
			player addSecondaryWeaponItem (accesoriostercera select 2);
			player addSecondaryWeaponItem (accesoriostercera select 3);
			player addHandgunItem (accesoriospistola select 0);
			player addHandgunItem (accesoriospistola select 1);
			player addHandgunItem (accesoriospistola select 2);
			player addHandgunItem (accesoriospistola select 3);
			playsound "taquilla";
			armaspolicia = nil; 
			accesoriosarma = nil; 
			accesoriospistola = nil; 
			accesoriostercera = nil; 
			hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquillas</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has recogido tus armas de la taquilla.</t> <br/><br/>"]; 
		};
	};
	case 'D':
	{
		if (isnil "armaspolicia" ) then 
		{ 
			if (handgunWeapon player == "" && primaryWeapon player == "" && secondaryWeapon player == "") exitwith {hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>No tienes armas para guardar.</t> <br/><br/>", _preciouso];};
			armaspolicia = Weapons player;  
			accesoriosarma = primaryWeaponItems player;
			accesoriospistola = handgunItems player;
			accesoriostercera = secondaryWeaponItems player;
			playsound "taquilla";
			player removeWeapon (handgunWeapon player);
			player removeWeapon (primaryWeapon player);
			player removeWeapon (secondaryWeapon player);
			hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Has guardado tus armas en la taquilla.(Si sacas armas teniendo otras equipadas en el slot de armas, las pierdes. Guarda las armas en la mochila antes de sacar las de la taquilla!) Si te vas del mundo, la taquilla se vacia automaticamente.</t> <br/><br/>"]; 			
		} else  
		{ 
			hint parseText format ["<br/><t color='#27b840' size='2' shadow='1'shadowColor='#3c6342'>Taquilla</t> <br/><t color='#e7ad3e' size='2'></t> <br/><t color='#FFFFFF' size='1.5'>Ya tienes armas guardadas. (Si sacas armas teniendo otras equipadas en el slot de armas, las pierdes. Guarda las armas en la mochila antes de sacar las de la taquilla!)</t> <br/><br/>"];  
		}; 
	};
	default
	{
	
	};
};