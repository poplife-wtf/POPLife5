

class master_funcionesica
{
	tag = "ica";

	class raiz
	{
		file = "\life_server\ica";
		class initHUD {};
	};

	class funciones
	{
		file = "\life_server\ica\funciones";
		class onmap {};
		class editando {};
		class cheto {};
		class item {};
		class classToName {};
		class classToPic {};
		class meteAccion {};
		class negToPos {};
		class numToStr {};
		class strToArr {};
		class inString {};
		class revela {};
		class masCercano {};
		class getPos {};
		class tengo {};
		class mapMarkers {};
		class setVelocity {};
		class setVelocityRas {};
		class playMoveNow {};
		class switchMove {};
		class cargaInv {};
		class addEH {};
		class ocultame {};

		class anuncio {};
		class anuncioSimple {};
		class masUno {};
		class barrita {};

		class borrame {};
		class bloqueoDinero {};
		class creaMatricula {};

		class sync {};
	};

	class clientserver
	{
		file = "\life_server\ica\funciones\clientserver";
		class varToClient {};
		class varToHC {};
		class varUpdate {};
	};

	class dialog
	{
		file = "\life_server\ica\dialog";
		class menuCompraVenta {};
		class arrayTienda {};
		class infolog {};
		class menuY {};
	};

	class precios
	{
		file = "\life_server\ica\funciones\precios";
		class precioCombustible {};
		class precio {};
	};

	class subasta
	{
		file = "\life_server\ica\subasta";
		class subasta {};
		class initSubasta {};
		class recogeBeneficios {};
		class subeBajaBeneficios {};
	};

	class experiencia
	{
		file = "\life_server\ica\exp";
		class initExp {};
		class expToLevel {};
		class exp {};
		class arrayExp {};
		class limitadorDeArmas {};
		class costeSP {};
		class ganoExp {};
	};

	class farmeo
	{
		file = "\life_server\ica\farmeo";
		class pesca {};
		class picando {};
		class llenaBotella {};
		class talando {};
		class initNaufragios {};
		class agricultura {};
		class initMineria {};
		class procesado {};
		class basura {};
		class obras {};
	};

	class robos
	{
		file = "\life_server\ica\robos";
		class hacker {};
		class ganzua {};
		class initPortatil {};
		class miroDocumentos {};
		class resetDatos {};
		class roboConcesionario {};
		class roboDeDatos {};
		class roboAlcalde {};
		class roboGasolinera {};
		class roboGasolinera2 {};
		class roboNuclear {};
		class roboJoyeria {};
		class roboBanco {};
	};

	class mafia
	{
		file = "\life_server\ica\mafia";
		class tiendaMafia {};
		class traficanteDroga {};
		class camello {};
		class initDroga {};
		class blanqueo {};
		class tiendaterrorista {};
	};

	class policia
	{
		file = "\life_server\ica\policia";
		class sacoDineroPublico {};
		class camaras {};
		class puntosCarnet {};
		class tiendaPolicia {};
		class matriculas3D {};
		class cacheo {};
	};

	class suministros
	{
		file = "\life_server\ica\suministros";
		class initVars {};
		class menuTransportes {};
		class menuMineria {};
		class carga {};
		class descarga {};
		class gasolinera {};
		class menuAlmacen {};
		class entregaPaquete {};
	};

	class jugador
	{
		file = "\life_server\ica\jugador";
		class wikipedia {};
		class impuestos {};
		class nigromante {};
		class consumo {};
		class comoBebo {};
		class crafteo {};

		class daDinero {};
		class daLlaves {};
		class mensajesica {};

		class posicion {};
		class vistaBonita {};
		class autobusMagico {};
		class reporte {};
		class silencer {};
	};

	class tonterias
	{
		file = "\life_server\ica\tonterias";
		class loteria {};
	};
	class habilidades
	{
		file = "\life_server\ica\jugador\habilidades";
		class hab_golpe {};
		class hab_molotov {};
		class hab_pocionDeInvis {};
		class hab_pocionDeParkour {};
		class hab_reparar {};
	};

	class inventario
	{
		file = "\life_server\ica\inventario";
		class EH {};
		class usoItemFis {};
		class pongoItem {};
	};

	class sistemaMedicaruk
	{
		file = "\life_server\ica\sistemaMedicaruk";
		class initMed {};
		class sistemaMedICA {};
		class sangrando {};
		class borroso {};
		class dolor {};
		class diagnostico {};
		class tratamiento {};
		class fractura {};
		class toxicidad {};
		class inconsciente {};
		class guardaCargaMed {};
		class enterrador {};
		class organos {};
	};

	class clima
	{
		file = "\life_server\ica\clima";
		class climaCliente {};
		class climaServidor {};
	};

	class regalo
	{
		file = "\life_server\ica\spawner";
		class crearegalo {};
	};


    class tisor
    {
    	file = "life_server\tisor";
    	class centralita {};
    };
	
	class rosen
	{
		file = "\life_server\rosen";
		class apuestas {};
		class efecto {};
		class radar {};
		class pescar {};
		class bancoheist{};
		class pelicula{};
		class hintr{};
		class flecha{};
		class ragdoll{};
		class sillaelectrica{};
		class borracho{};
		class pescabarco {};
		class tasear {};
		class quitardinerocarcel {};
	};
	
	class rosenPolitica
	{
		file = "\life_server\rosen\politica";
		class inscripcion {};
		class votar {};
		class initCandidatos {};
		class listaCandidatos {};	
		class initVotantes {};
		class listaInscripcion {};
		class resultados {};
	};
	class taller
	{
		file = "\life_server\rosen\taller_pintura";
		class dialogoPintar {};
		class pintarVehiculo {};
	};


	/** AxE **/

	class StockAxE
	{
		file = "\life_server\axe\stock";
		
		class initStock{};
		class misionStock{};
		class tiendabf{};		
	};
	
	class TaxiAxE
	{
		file = "\life_server\axe\taxi";
		
		class taxi_abrirMenuTaxi{};
		class taxi_acpLlamada{};
		class taxi_dejaDEtrabajar{};
		class taxi_finalizaViaje{};
		class taxi_llamada{};
		class taxi_llamadaAceptada{};
		class taxi_llamarTaxistas{};
		class taxi_respuesta{};
		class taxi_vaAtrabajar{};
	};

	class BusAxE
	{
		file = "\life_server\axe\bus";
		
		class bus_choferBus{};
		class bus_paradeBuses{};
		class bus_ChoferBusInicia{};
		class bus_ChoferBusTermina{};		
	};
	
		class TerroAxE
	{
		file = "\life_server\axe\terro";
		
		class atentadoEA{};
		class accionDesarmar{};
		class comparoCable{};
		class comparoCodigo{};
		class plantarBomba{};		
		class misionBomba{};
		class generoPaqueteAereo{};
		class PaqueteAereo{};
	};
	
		class SeguridadAxE
	{
		file = "\life_server\axe\seguridad";
		
		class sp_abrirMenuSP{};
		class sp_acpLlamada{};
		class sp_llamada{};
		class sp_llamadaAceptada{};
		class sp_llamarSP{};
		class tiendaSeguridad{};
	};
		
		class EfectosAxE
	{
		file = "\life_server\axe\efectos";
		
		class direccionA{};
		class efectoEsVisible{};
		class llamarada{};
		class magneto{};
		class tiroAgua{};
		class melee{};
		class cigarro{};		
		class soplete{};
		class crearIncendio{};
		class cegado{};
		class atacar{};
	};	
	
		class BomberosAxE
	{
		file = "\life_server\axe\bomberos";
		
		class bomberos{};
		class bb_abrirMenuBB{};
		class bb_acpLlamada{};
		class bb_llamada{};
		class bb_llamadaAceptada{};
		class bb_llamarBB{};
	};

		class PopTvAxE
	{
		file = "\life_server\axe\poptv";
		class poptv{};
	};
	
		class SegurosAxE
	{
		file = "\life_server\axe\seguros";
		class seguro{};
	};	
	
		class PandemiasIca
	{
		file = "\life_server\axe\pandemia";
		class pandemia{};
	};
	
		class CorreosAxE
	{
		file = "\life_server\axe\correos";
		class correos{};
	};
	
		class CarcelAxE
	{
		file = "\life_server\axe\carcel";
		class trabajoCarcel{};
	};
	
		class RosarioAxE
	{
		file = "\life_server\axe\rosario";
		class rosario{};
		class rosarioEnt{};
		class drogaMar{};
	};
	
		class MafiaAxE
	{
		file = "\life_server\axe\mafia";
		class capturaZona{};
		class initZonas{};
		class abandonarZona{};
		class atacarZona{};
		class zonatoname{};	
		class menuzona{};
		class asaltarCarcel{};
		class updateMafia{};
		class robos{};
		class markersHacker {};
		class centralaxe {};
	};
	
		class CasinoAxE
	{
		file = "\life_server\axe\casino";
		class casino{};
	};
	
		class PoliciaAxE
	{
		file = "\life_server\axe\policia";
		class fudra{};
		class detective{};
		class detectivePDA{};
		class investiga{};
		class initDetective{};
		class tiendaPoli{};
		class alertasPolicia{};
	};
	
		class PresidenteAxE
	{
		file = "\life_server\axe\presidente";
		class liberarZona{};
		class presidente{};
	};
	
		class MecaAxE
	{
		file = "\life_server\axe\meca";
		class meca{};
	};
	
		class SystemAxE
	{
		file = "\life_server\axe\sys";
		class axeCrea{};
		class limpiador{};
		class ZonadeCaza{};
		class IAcontrol{};
		class desuello{};
		class objetos{};
		class tiempo_server{};
		class axeLog{};
		class axeKick{};
		class axeBan{};
		class AntiCheto{};
		class axeMsg{};
		class bugRopa{};
		class arrastrarInconsciente{};
		class curameMedicoNPC{};
		class maraton{};	
		class durodematar{};
		class tirador{};
		class menuCrafteo{};
		class debug{};
		class camara{};
		class hudSwitch{};
		class cazatesoros{};
		class ftravel{};
		class tesoros{};
		class fumigador{};
		class temporada{};
		class initHabilidades {};
		class pintoDB {};
		class bug {};
		class centralica {};
	};
	
		class GranjasAxE
	{
		file ="\life_server\axe\granjas";
		class minijuegos{};
		class granjas{};
		class tractor{};
		class initGranjas{};
		class addGranja{};
	};

		class NegociosAxE
	{
		file ="\life_server\axe\negocios";
		class negocios{};
		class robarNegocio{};
		class initNegocios{};
		class addNegocio{};
		class axeTrans{};
	};
	
		class DrogasAxE
	{
		file ="\life_server\axe\drogas";
		class breakingBad{};
		class cocaine{};
		class crank{};
		class drugUsed{};
		class heroin{};
		class marijuana{};
		class meth{};
		class overdose{};
		class pegarHumo{};
		class usarDroga{};		
	};	

	/** Blakord que mola mogollon **/

	class cosasPoliciasBK
	{
		file = "\life_server\bk\policia";
		class SonidosPolicia{};
		class SonidosNewSiren{};
	};
	class cosasGeneralesBK
	{
		file = "\life_server\bk";
		class Limitador{};
		class SFX{};
		class vehiculoAsiento{};
		class vehiculoAsientoCargo{};
		class vehiculoChkClase{};
		class vehiculoIDentificar{};
		class vehiculoLimpiar{};
		class vehiculoValidar{};
		class SFXambientes{};
		class bkRemoteRequest{};
	};

	/** Juan Adamuz **/

	class adamuzGeneral
	{
		file = "\life_server\adamuz";
		class cajeroMenus{};
		class taquillas{};
		class rebientagasolineras{};
	};
	
	class adamuzRobos
	{
		file = "\life_server\adamuz\Robos";
		class robosucursal{};
	};
	
	class adamuzmedicos
	{
		file = "\life_server\adamuz\Medicos";
		class CrearParte{};
		class MandarParte{};
	};
	
	class adamuzeventos
	{
		file = "\life_server\adamuz\Eventos";
		class eventojuan{};
		class adafuegos{};
	};
	
	class adamuzPDA
	{
		file = "\life_server\adamuz\PDA";
		class menuspda{};
		class initpda{};
		class identificarpda{};
		class mirarlicenciapdadevolver{};
		class mirarlicenciapdamirar{};
		class mirarlicenciapdamandar{};
		class wantedfetchpda{};
		class wantedlistpda{};
		class wantedmenupda{};
		class wantedInfopda{};
		class pardonpda{};
		class buscarmatriculapda{};
		class mirardelitospda{};
		class wantedlistpdaindividual{};
		class wantedfetchpdaindividual{};
	};
	
	class adamuzSmartphone
	{
		file = "\life_server\adamuz\Telefono";
		class cualesmitelefono{};
		class existeeltelefono{};
		class initmovil{};
		class listatelefonica{};
		class movilcontactos{};
		class telefonollamar{};
		class telefonorecibirllamada{};
		class sonarllamadarecibir{};
		class mandarmsg{};
		class recibirmsg{};
		class mensajeespecial{};
		class tlfagregado{};
	};
	
	class adamuzFunciones
	{
		file = "\life_server\adamuz\Funciones";
		class cargando{};
		class inittaskforce{};
		class tiene{};
		class liberoesposas{};
	};
	
	class heist
	{
		file = "\life_server\heisenberg";
		class portatil {};
		class robo {};
		class tanque {};
		class creaCodigo {};
		class bug {};
		class resetRobo {};
	};	

};