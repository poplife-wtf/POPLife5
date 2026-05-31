class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class Life_Client_Core
{
	tag = "life";

	class Otros
	{
		file = "otros";
		class duelRequest{};
		class duelRequested{};
		class initRace{};
		class openDuelUI{};
		class vAH_load{};
		class vAH_buy{};
		class vAH_reciever{};
		class vAH_loadInventory{};
		class vAH_sell{};
		class vAH_checkItem{};
		class vAH_takeBack{};
		class vAH_select{};
	};
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class inicio {};
	};

	class Casino
	{
		file = "core\casino";
		class blackjackInit {};
		class blackjackBet {};
		class blackjackHit {};
		class blackjackStay {};
		class rouletteInit {};
		class rouletteLoad {};
		class rouletteBet {};
		class rouletteSpin {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminTPtoPL {};
        class adminTPtoME {};
        class adminFreeze {};
        class adminRez {};
        class adminKill {};
        class adminHR {};
	    class adminATM {};
        class adminTeleport {};
        class adminKeys {};
        class adminSpectate {};
        class adminUni {};
        class adminMarkers {};
        class adminCompensate {};
        class adminDelObj {};
        class adminGDY {};
        class adminDebug {};
		class adminReparar {};
		class adminLicencias {};
		class adminRevivir {};
		class adminSaltar {};
	};

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicMarkers {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
	};

	class Actions
	{
		file = "core\actions";
		class arrestAction {};
		class buyLicense {};
		class pushVehicle {};
		class serviceChopper {};
		class serviceTruck {};
		class postBail {};
		class escortAction {};
		class impoundAction {};
		class impoundActionCiv {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupMoney {};
		class ticketAction {};
		class storeVehicle {};
		class robAction {};
		class surrender {};
		class civRestrainAction {};
		class playSound {};
	};

	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class alarmHouse {};
		class lockHouse {};
	};

	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class varToStr {};
		class impoundPrice {};
		class taxRate {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class opDefault {};

		//Clothing Store Configs
		class clothing_sp {};
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_donator {};
		class clothing_ems {};

	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveMoney {};
		class p_updateMenu {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class revokeLicense {};
	};

	class Functions
	{
		file = "core\functions";
		class fetchCfgDetails {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveMoney {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class showProgress {};
		class stripDownPlayer {};
		class enablecollisionwith {};
  		class disablecollisionwith {};
		class fadeSound {};
		class purge {};
		class SearchPosEmpty {};
		class axeGuarda {};
		class axeCarga {};
	};

	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};

	class Civilian
	{
		file = "core\civilian";
		class AAN {};
		class pubAAN {};
        class civInteractionMenu {};
		class removeWeapons {};
		class jailMe {};
		class jail {};
		class tazed {};
		class freezePlayer {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class zoneCreator {};
		class civLoadout {};
		class civRestrain {};
		class civMarkers {};
		class perrodecaza {};
	};

	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class lockVehicle {};
		class vehicleOwners {};
		class vInteractionMenu {};
		class insurance {};
		class addVehicle2Chain {};
		class civVInteractionMenu {};
        class medVInteractionMenu {};
	};

	class Cop
	{
		file = "core\cop";
		class copOpener {};
		class copMarkers {};
		class copLights {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
	//	class fedCamDisplay {};
		class copLoadout {};
		class ticketPaid {};
		class fastRope {};
		class removeWeaponAction {};
		class removeWeapons {};
		class copEnter {};
	};


	class op
	{
		file = "core\op";
		class loadGearop {};
		class saveGearop {};
	};

	class Gangs
	//Esto no es de Tonic ... ya quisiera .. AxEisOnTop
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewOwner {};
		class gangNewLeader {};		
        class gangRank {};		
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangExtorsion {};		
		class gangMarkers {};
		class updateGangInfo {};
		class gangDemote {};
		class updateGangHouse {};
		class gangAlias {};		
		class initExtorsion {};	
		class showMafiaDNI {};
		class mafiaDNI {};
	};

	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class vehicleShopEnd3DPreview {};
		class vehicleShopInit3DPreview {};
		class vehicleShop3DPreview {};
	};

	class Items
	{
		file = "core\items";
		class lockpick {};
		class storagebox {};
	};

	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class vehicleGarage {};
		class gangDeposit {};
		class calldialog {};
		class sendChannel {};
		class gangWithdraw {};
	};

	class Tonterias {
		file = "rosen\tonterias";
		class sentarse {};
		class levantarse {};
		class cohetes {};
	};	
};

class Akryllax {
	tag = "life";

	class CopBadge
	{
		file = "core\AKR\CopBadge";
		class seeBadge {};
		class showBadge {};
	};

	class DNI
	{
		file = "core\AKR\DNI";
		class seeDNI {};
		class showDNI {};
	};

	class Racing
	{
		file = "core\akr\racing";
		
		class initRacing {};
		class loadTrack {};
		class loadVehicle {};
		class raceAskSession {};
		class raceCheckStatus {};
		class raceConf {};
		class racingEnded {};
		class racingResponse {};
		class startRace {};
		class startTrackAction{};
		

	};

	class EventHandlers
	{
		file = "core\AKR\EventHandlers";
		class onIngameKilled {};
		class onIngameReborn {};
	};

	class EMP_Grenade
	{
		file = "core\AKR\EMP_Grenade";
		class asyncInit {};
		class castEMP {};
		class dropMP {};
		class EMPEH {};
		class HandleDamage {};
		class recieveEMP {};
		class say3DMP {};
		class shutdownCar {};
	};

	class EMP_EH
	{
		file = "core\AKR\EMP_Grenade\EH";
		class stallEngine {};
		class stallEngineNoSound {};
	};
};

class Quickskill
{
	tag = "QUICK";
	
	class Terroristas
	{
		file = "quickskill\terroristas";
		class comprarChalecoBomba {};
	
	};		
};

class Blakord
{
	tag = "bk";
	class FrameWork_Dialogs_Functions
	{
		file = "BK_FrameWork\BlackFeameWorkDIalogs\BlackFeameWorkDIalogsScripts";
		class ActionMenuAdd {};	
		class ActionMenuCreate {};
	};
	class FrameWork_Dialogs_Scripts
	{
		file = "BK_FrameWork\BlackFeameWorkDIalogsScripts";
		class Actions_Arrest {};
		class Actions_House {};
		class Actions_Vehicles {};	
	};
};