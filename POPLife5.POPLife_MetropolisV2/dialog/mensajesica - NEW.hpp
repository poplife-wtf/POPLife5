
// missionConfigFile >> "mensajesica"

class mensajesica
{
	idd = 30109; 
	movingenable = true;
	onLoad = "uiNamespace setVariable ['mensajesica', _this select 0]; ";
	onUnLoad = "uiNamespace setVariable ['mensajesica', nil]; ";

	class controls {


	
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Blakord Crusader, v1.063, #Xytala)
////////////////////////////////////////////////////////

class imagen: RscPicture
{
	idc = 1200;

	text = "\pop_iconos\paa\mano.paa";
	x = 0.654688 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.345429 * safezoneW;
	h = 0.692705 * safezoneH;
};
class lista: BK_RscListBox
{
	idc = 7080;

	x = 0.711406 * safezoneW + safezoneX;
	y = 0.4406 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.264 * safezoneH;
};
class entrada: RscEdit
{
	idc = 7082;
	style = 16;

	x = 0.711406 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.143 * safezoneH;
};
/* class desplegable: RscCombo
{
	idc = 7081;

	x = 0.556719 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.0242 * safezoneH;
}; */
class boton: RscButton
{
	idc = 7083;

	text = "ENVIAR"; //--- ToDo: Localize;
	x = 0.711406 * safezoneW + safezoneX;
	y = 0.852 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.022 * safezoneH;
};
class img_back: RscPicture
{
	idc = 1201;

	text = "pop_iconos\iconos\movil\MSG_IcoAtras.paa";
	x = 0.716562 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_back: Bk_PopHideRscButton
{
	idc = 1601;

	x = 0.716563 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Regresar"; //--- ToDo: Localize;
};
class img_reply: RscPicture
{
	idc = 1209;

	text = "pop_iconos\iconos\movil\MSG_IcoResponder.paa";
	x = 0.762969 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_reply: Bk_PopHideRscButton
{
	idc = 1602;

	x = 0.762969 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Responder"; //--- ToDo: Localize;
};
class img_msgs: RscPicture
{
	idc = 1202;

	text = "pop_iconos\iconos\movil\MSG_IcoNuevo.paa";
	x = 0.716562 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_msgs: Bk_PopHideRscButton
{
	idc = 1603;

	x = 0.716563 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Ver mensajes"; //--- ToDo: Localize;
};
class img_contacts: RscPicture
{
	idc = 1203;

	text = "pop_iconos\iconos\movil\MSG_IcoContactos.paa";
	x = 0.809375 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_contacts: Bk_PopHideRscButton
{
	idc = 1604;

	x = 0.809375 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Contactos"; //--- ToDo: Localize;
};
class img_cop: RscPicture
{
	idc = 1204;

	text = "pop_iconos\iconos\movil\MSG_IcoPolicia.paa";
	x = 0.716562 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_cop: Bk_PopHideRscButton
{
	idc = 1605;

	x = 0.716563 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Mensaje a policia"; //--- ToDo: Localize;
};
class img_ems: RscPicture
{
	idc = 1205;

	text = "pop_iconos\iconos\movil\MSG_IcoEMS.paa";
	x = 0.762969 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_ems: Bk_PopHideRscButton
{
	idc = 1606;

	x = 0.762969 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Mensaje a EMS"; //--- ToDo: Localize;
};
class img_taxi: RscPicture
{
	idc = 1206;

	text = "pop_iconos\iconos\movil\MSG_IcoTaxi.paa";
	x = 0.809375 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_taxi: Bk_PopHideRscButton
{
	idc = 1607;

	x = 0.809375 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Mensaje a servicio de taxis"; //--- ToDo: Localize;
};
class img_privateSec: RscPicture
{
	idc = 1207;

	text = "pop_iconos\iconos\movil\MSG_IcoSeguridad.paa";
	x = 0.716562 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_privateSec: Bk_PopHideRscButton
{
	idc = 1608;

	x = 0.716563 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Mensaje a seguridad privada"; //--- ToDo: Localize;
};
class img_admin: RscPicture
{
	idc = 1208;

	text = "pop_iconos\iconos\movil\MSG_IcoAdmin.paa";
	x = 0.762969 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
};
class but_admin: Bk_PopHideRscButton
{
	idc = 1609;

	x = 0.762969 * safezoneW + safezoneX;
	y = 0.621 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.055 * safezoneH;
	tooltip = "Mensaje a administradores"; //--- ToDo: Localize;
};
class tapa: IGUIBack
{
	idc = 2200;

	x = 0.711406 * safezoneW + safezoneX;
	y = 0.379047 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.494807 * safezoneH;
	colorText[] = {0,0,0,1};
	colorBackground[] = {0,0,0,1};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////





	}; 
};



