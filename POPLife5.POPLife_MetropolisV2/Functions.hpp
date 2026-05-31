	class Socket_Reciever {
    tag = "SOCK";
    class SQL_Socket {
        file = "core\session";
        class dataQuery {};
        class insertPlayerInfo {};
        class requestReceived {};
        class syncData {};
        class updatePartial {};
        class updateRequest {};
    };
};

class Life_Client_Core {
    tag = "life";

	class Otros	{
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
	
	
    class Master_Directory {
        file = "core";
        class initCiv {};
        class initCop {};
        class initMedic {};
        class setupActions {};
        class setupEVH {};
        class survival {};
        class welcomeNotification {};
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
	
    class Actions {
        file = "core\actions";
        class arrestAction {};
        class buyLicense {};
        class captureHideout {};
        class catchFish {};
        class dpFinish {};
        class dropFishingNet {};
        class escortAction {};
        class gather {};
        class getDPMission {};
        class gutAnimal {};
        class healHospital {};
        class impoundAction {};
        class mine {};
        class newsBroadcast {};
        class packupSpikes {};
        class pickupItem {};
        class pickupMoney {};
        class postBail {};
        class processAction {};
        class pulloutAction {};
        class putInCar {};
        class removeContainer {};
        class repairTruck {};
        class restrainAction {};
        class robAction {};
        class searchAction {};
        class searchVehAction {};
        class seizePlayerAction {};
        class serviceChopper {};
        class stopEscorting {};
        class storeVehicle {};
        class surrender {};
        class ticketAction {};
        class unrestrain {};
		class pushVehicle {};
		class impoundActionCiv {};
	};

    class Admin {
        file = "core\admin";
        class adminCompensate {};
        class adminDebugCon {};
        class adminFreeze {};
        class admingetID {};
        class adminGodMode {};
        class adminid {};
        class admininfo {};
        class adminMarkers {};
        class adminMenu {};
        class adminQuery {};
        class adminSpectate {};
        class adminTeleport {};
        class adminTpHere {};
		class adminReparar {};
		class adminLicencias {};
		class adminRevivir {};
		class adminSaltar {};
		class adminTPtoPL {};
        class adminTPtoME {};
        class adminRez {};
        class adminKill {};
        class adminHR {};
        class adminKeys {};
        class adminDelObj {};
        class adminGDY {};		
		class adminUni {};
		
    };

    class Civilian {
        file = "core\civilian";
		class pubAAN {};
        class civInteractionMenu {};
		class removeWeapons {};		
        class civLoadout {};
        class civMarkers {};
        class demoChargeTimer {};
        class freezePlayer {};
        class jail {};
        class jailMe {};
        class knockedOut {};
        class knockoutAction {};
        class removeLicenses {};
        class robPerson {};
        class robReceive {};
		class civRestrain {};		
        class tazed {};
		class perrodecaza {};		
    };

    class Config {
        file = "core\config";
        class houseConfig {};
        class itemWeight {};
        class vehicleAnimate {};
        class vehicleWeightCfg {};
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class varToStr {};
		class impoundPrice {};
		class taxRate {};
		class vehShopLicenses {};
		class weaponShopCfg {};
		class opDefault {};
		class clothing_sp {};
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_donator {};
		class clothing_ems {};		
		
    };

    class Cop {
        file = "core\cop";
        class bountyReceive {};
        class containerInvSearch {};
        class copInteractionMenu {};
        class copLights {};
        class copLoadout {};
        class copMarkers {};
        class copSearch {};
        class copSiren {};
        class doorAnimate {};
        class fedCamDisplay {};
        class licenseCheck {};
        class licensesRead {};
        class questionDealer {};
        class radar {};
        class repairDoor {};
        class restrain {};
        class searchClient {};
        class seizeClient {};
        class sirenLights {};
        class spikeStripEffect {};
        class ticketGive {};
        class ticketPaid {};
        class ticketPay {};
        class ticketPrompt {};
        class vehInvSearch {};
        class wantedGrab {};
		class fastRope {};
    };

    class Dialog_Controls {
        file = "dialog\function";
        class bankDeposit {};
        class bankTransfer {};
        class bankWithdraw {};
        class displayHandler {};
        class gangDeposit {};
        class gangWithdraw {};
        class garageLBChange {};
        class impoundMenu {};
        class progressBar {};
        class safeFix {};
        class safeInventory {};
        class safeOpen {};
        class safeTake {};
        class sellGarage {};
        class setMapPosition {};
        class spawnConfirm {};
        class spawnMenu {};
        class spawnPointCfg {};
        class spawnPointSelected {};
        class unimpound {};
        class vehicleGarage {};
        class wireTransfer {};
		class calldialog {};
		class sendChannel {};	
    };

    class Functions {
        file = "core\functions";
        class AAN {};
        class accType {};
        class actionKeyHandler {};
        class animSync {};
        class calWeightDiff {};
        class clearVehicleAmmo {};
        class dropItems {};
        class escInterupt {};
        class fetchCfgDetails {};
        class fetchDeadGear {};
        class fetchVehInfo {};
        class isDamaged {};
        class giveDiff {};
        class handleDamage {};
        class handleInv {};
        class handleItem {};
        class hideObj {};
        //class hudSetup {};
        class hudUpdate {};
        class inventoryClosed {};
        class inventoryOpened {};
        class isUIDActive {};
        class keyHandler {};
        class loadDeadGear {};
        class loadGear {};
        class nearATM {};
        class nearestDoor {};
        class nearUnits {};
        class numberText {};
        class onFired {};
        class onTakeItem {};
        class playerSkins {};
        class playerTags {};
        class postNewsBroadcast {};
        class pullOutVeh {};
        class pushObject {};
        class receiveItem {};
        class receiveMoney {};
        class revealObjects {};
        class saveGear {};
        class searchPosEmpty {};
        class simDisable {};
        class stripDownPlayer {};
        class tazeSound {};
        class teleport {};
        class whereAmI {};
		class showProgress {};		
		class enablecollisionwith {};
  		class disablecollisionwith {};
		class fadeSound {};
		class purge {};
		class axeGuarda {};
		class axeCarga {};		
    };

    class Gangs {
        file = "core\gangs";
        class createGang {};
        class gangCreated {};
        class gangDisband {};
        class gangDisbanded {};
        class gangInvite {};
        class gangInvitePlayer {};
        class gangKick {};
        class gangLeave {};
        class gangMenu {};
        class gangNewLeader {};
        class gangUpgrade {};
        class initGang {};
		class gangNewOwner {};
        class gangRank {};		
		class gangExtorsion {};		
		class gangMarkers {};
		class updateGangInfo {};
		class gangDemote {};
		class updateGangHouse {};
		class gangAlias {};		
		class initExtorsion {};	
		class showMafiaDNI {};
		class mafiaDNI {};
		class gangCasa {};
		class gangCreoCasa {};
    };

    class Housing {
        file = "core\housing";
        class buyHouse {};
		class buyApartamento {};
        class buyHouseGarage {};
        class containerMenu {};
        class copBreakDoor {};
        class copHouseOwner {};
        class garageRefund {};
        class getBuildingPositions {};
        class houseMenu {};
        class initHouses {};
        class lightHouse {};
        class lightHouseAction {};
        class lockHouse {};
        class lockupHouse {};
        class placeContainer {};
        class PlayerInBuilding {};
        class raidHouse {};
        class sellHouse {};
        class sellHouseGarage {};
		class alarmHouse {};
    };

    class Items {
        file = "core\items";
        class blastingCharge {};
        class boltcutter {};
        class defuseKit {};
        class flashbang {};
        class jerrycanRefuel {};
        class jerryRefuel {};
        class lockpick {};
        class placestorage {};
        class spikeStrip {};
        class storageBox {};
    };

    class Medical_System {
        file = "core\medical";
        class deathScreen {};
        class medicLights {};
        class medicLoadout {};
        class medicMarkers {};
        class medicRequest {};
        class medicSiren {};
        class medicSirenLights {};
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class requestMedic {};
        class respawned {};
        class revived {};
        class revivePlayer {};
    };

    class Network {
        file = "core\functions\network";
        class broadcast {};
        class corpse {};
        class jumpFnc {};
        class say3D {};
        class setFuel {};
        class soundDevice {};
		class MPexec {};
		class MP {};
    };

    class Player_Menu {
        file = "core\pmenu";
        class cellphone {};
        class giveItem {};
        class giveMoney {};
        class keyDrop {};
        class keyGive {};
        class keyMenu {};
        class p_openMenu {};
        class p_updateMenu {};
        class pardon {};
        class removeItem {};
        class s_onChar {};
        class s_onCheckedChange {};
        class s_onSliderChange {};
        class settingsMenu {};
        class updateViewDistance {};
        class useItem {};
        class wantedAddP {};
        class wantedInfo {};
        class wantedList {};
        class wantedMenu {};
		class revokeLicense {};
		
    };

    class Shops {
        file = "core\shops";
        class atmMenu {};
        class buyClothes {};
        class changeClothes {};
        class chopShopMenu {};
        class chopShopSelection {};
        class chopShopSell {};
        class clothingFilter {};
        class clothingMenu {};
        class fuelLBchange {};
        class fuelStatOpen {};
        class levelCheck {};
        class vehicleShop3DPreview {};
        class vehicleShopBuy {};
        class vehicleShopEnd3DPreview {};
        class vehicleShopInit3DPreview {};
        class vehicleShopLBChange {};
        class vehicleShopMenu {};
        class virt_buy {};
        class virt_menu {};
        class virt_sell {};
        class virt_update {};
        class weaponShopAccs {};
        class weaponShopBuySell {};
        class weaponShopFilter {};
        class weaponShopMags {};
        class weaponShopMenu {};
        class weaponShopSelection {};		
    };

    class Vehicle {
        file = "core\vehicle";
        class addVehicle2Chain {};
        class colorVehicle {};
        class deviceMine {};
        class FuelRefuelcar {};
        class fuelStore {};
        class fuelSupply {};
        class lockVehicle {};
        class openInventory {};
        class vehiclecolor3DRefresh {};
        class vehicleOwners {};
        class vehicleWeight {};
        class vehInventory {};
        class vehStoreItem {};
        class vehTakeItem {};
        class vInteractionMenu {};
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
		class Actions_Granjas {};	
	};
};
