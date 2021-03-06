*===================
*= ARCHIVO PRINCIPAL
*===================
*
*	VER AL PIE alguna consideracion con respecto a campos tablas
*
clear all
SET SYSMENU off
set classlib to
l='C:'
set talk off
lldesarrollo=(_vfp.startmode()#4)

_vfp.AutoYield = .f.

lctituloGestion = "Gestión de Punto de Venta"

If !lldesarrollo
*!*	   If f_activawin(lctituloGestion)
*!*	  
*!*	      =messagebox('Ya Estaba activo !!!!',48,'Información al Usuario')
*!*	    *' _Screen.windowstate=2
*!*	      _screen.lockscreen=.f.
*!*	      _screen.visible=.t.
*!*	      _screen.refresh      
*!*				 * El programa ya estaba activo:
*!*	      Return && Termina el programa
*!*	   Endif
ENDIF

Set cursor off

lccaption=_screen.caption

Set cursor on

lcdd=alltrim(curdir()) && directorio de arranque

If lldesarrollo
   lcdd=L+'\xsoftmolino\proyectos\gestion_ptovta\'
*-- RUTA
   _rutaclases =lcdd+'Clases'
   _rutaclased =L+'\xsoftmolino\desarrollo\clases'
   _rutabmpd   =L+'\xsoftmolino\desarrollo\graficos'
   _rutaprogs  =lcdd+'Progs'
   _rutamenu   =lcdd+'Menus'
   _rutadatos  =lcdd+'Datos'
   _rutabmps   =lcdd+'graphics'
   _rutaforms  =lcdd+'forms'
   _rutareports=lcdd+'reports' 
    _rutaformsDesarrollo =L+'\xsoftmolino\desarrollo\forms'
   _rutaffc  =L+'\xsoftmolino\desarrollo\clases\ffc'
   _rutalib  =L+'\xsoftmolino\desarrollo\lib'   
   Set default to (lcdd) &&;(lcddc)

   Set path to &_rutaclases,&_rutaprogs,&_rutamenu,&_rutadatos,&_rutabmps,&_rutaforms;
               ,&_rutareports,&_rutaclased,&_rutabmpd,&_rutaformsDesarrollo,&_rutaffc,&_rutalib
Endif

*-- CREACION DE OBJETO APLICACION

Set classlib to localaplicacion.vcx additive && Objeto Aplicacion

*-- APERTURA DE CLASES Y ARCHIVOS DE PROCEDIMIENTOS

   SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
   SET PROCEDURE  TO  procdesarrollo.prg ADDITIVE
   SET PROCEDURE  TO  syserror.prg ADDITIVE  
   SET PROCEDURE TO procfiscal.prg ADDITIVE 
   SET PROCEDURE  TO registry.prg ADDITIVE       
     
   SET CLASSLIB  TO  reindexer ADDITIVE 
   SET CLASSLIB  TO  clasesgenerales ADDITIVE 
   SET CLASSLIB  TO  controles ADDITIVE 
   SET CLASSLIB  TO  controleslocal ADDITIVE 
   SET CLASSLIB  TO  iabm.vcx ADDITIVE 
   SET CLASSLIB  TO  calc.vcx ADDITIVE  && Calculadora   
   SET CLASSLIB  TO  icontrolespersonalizados ADDITIVE 
   SET CLASSLIB TO onegocioslocal ADDITIVE 
   SET CLASSLIB TO rcscalendar ADDITIVE 
   SET CLASSLIB TO _reportlistener.vcx ADDITIVE 
   SET  CLASSLIB  TO  xfrxlib ADDITIVE 
   SET LIBRARY TO xfrxlib.fll ADDITIVE 
*clear all

_screen.lockscreen=.t.
_Screen.windowstate=2
_Screen.caption=lctituloGestion
_Screen.icon='help.ico'
_screen.picture= 'fondoscreen.jpg'
_Screen.closable=.f.
_Screen.visible=.t.

PUBLIC LcConectionString,LcDataSourceType,lcOrigenPublico,PcmsgIU,PcmsgIP,LcWebService,LcLlaveCf,Pnterminal,pnsucursal
PUBLIC lcConectionODBC,lnconectorODBC
   
 STORE '' TO LcConectionString,LcDataSourceType,lcOrigenPublico,LcWebService,lcConectionODBC
 STORE 0 TO Pnterminal,Pnsucursal,lnconectorODBC

PUBLIC OAvisar
Oavisar=CREATEOBJECT('avisar')

Public goapp,ObjReporter

goapp=createobject('app',!lldesarrollo,lldesarrollo)

ObjReporter= CREATEOBJECT("Custom")
ObjReporter.AddProperty('titulo1',"")
ObjReporter.AddProperty('titulo2',"")
ObjReporter.AddProperty('titulo3',"")
ObjReporter.AddProperty('titulo4',"")

IF TYPE('goApp')='O'
*-- CARGAR PROPIEDADES DE RUTA EN OBJETO APLICACION
	IF lldesarrollo && Aplicacion en modo desarrollo
		goapp.cdefault=set('default')
		goapp.cpath=set('path')
	ELSE  && Aplicacion en modo ejecución
		IF LcDataSourceType = "NATIVE"
			Set defa to (goapp.cdefault)
			Set path to (goapp.cpath)
		ENDIF          
	ENDIF 
	
	goapp.version = "01.00.00"
	
	PUBLIC  gcicono
	     
	PcmsgIU  = 'Información al Usuario'
	PcmsgIP  = 'Información al Programador'
	   
	gcicono=lcdd+'help.ico'
	LcLlaveCf = SPACE(8)
	      
	on error do errorsys
	           		                          
	do setup	

	_Screen.LockScreen=.F.
	
	oavisar.proceso('S','Inicializando el sistema, aguarde unos instantes por favor ...')
	*Set Procedure To foxypreviewer.App Additive
	*Do foxypreviewer.App
	
    WAIT WINDOW "Verificando ActiveX instalados ..." nowait
    DO Verifica_OCX WITH "Check"
	
	llSucess = InstallSystemFont(lcdd+"fonts\DS-DIGIB.TTF") 

*!*		**** aca comienza la parte de posicionamiento del escritorio
*!*		PUBLIC oscreen    
*!*		LeerXML("screen.xml",@oscreen)  && rescato la posicion de la _screen	
*!*		try
*!*			_screen.Top=ABS(oscreen.top)
*!*			_screen.Left=ABS(oscreen.left)
*!*		CATCH
*!*			_screen.Top=38
*!*			_screen.Left=1
*!*		ENDTRY	
*!*		_screen.height=oscreen.height
*!*		_screen.width=oscreen.width

*!*		_screen.LockScreen=.f.

*!*		PUBLIC oHandler
*!*	    oHandler=NEWOBJECT("myhandler")
*!*	    BINDEVENT(_SCREEN,"Resize",oHandler,"myresize")    
*!*	    BINDEVENT(_SCREEN,"Moved",oHandler,"mymoved")
*!*		***** fin posicionamiento escritorio
	
	_screen.LockScreen=.t.	
	DO directivasfiscal    && en procfiscal.prg
	DO directivasHasar
	
   * =MESSAGEBOX(amodelofiscal[1])	  
   
	= Fwin32()    && funciones api win32

	 =ObtenerServidor()
	  
	IF LEN(TRIM(LcConectionString))=0
		DO FORM configbd
		=ObtenerServidor()
	ENDIF    

	PUBLIC loConnDataSource,lcIdObjCon,lcIdObjneg,lcServidor,ObjNeg
    
	LeerXMLClassID("objetodll.xml")
    
    If lldesarrollo 
		oavisar.usuario('Conectado a  '+ALLTRIM(goapp.servidor)+'\'+LTRIM(goapp.initcatalo))
	ENDIF 
	
	   * en proc.prg   
	IF ExisteDSN() 
		IF !ConeccionADO()
			CANCEL 
			CLEAR ALL
			RETURN 
		ENDIF 
	ELSE
		CANCEL 
		CLEAR ALL
		RETURN 
	ENDIF 
	
	WAIT CLEAR 

* en proc.prg

	IF !lldesarrollo 
*!*			IF !LeerVersionExe(1)
*!*				CANCEL
*!*				CLEAR ALL
*!*				RETURN 	
*!*		      ENDIF 
	ENDIF 
	
	LeerEmpresa()
		 
	Goapp.idusuario           = 0
	Goapp.perfilusuario     = 0
	Goapp.nombreusuario= ""
	Goapp.sucursal10   = Goapp.sucursal   && si sucursal10#0 en proc almacenado de insert suma 10 y concatena el numero de id obtenido, ver odata
	
	*--------------Codigo para que abra el form
	_screen.visible=.t.	   
	_screen.lockscreen=.f.
	_screen.Show() 
	
	DO FORM frmlogin
	
	_screen.lockscreen=.t.	
	*--------------------------   
		 

	Local oMenu
	PUBLIC Pidsistema
	Pidsistema=2
	oDesktop = ''
	_Screen.LockScreen=.T.
	oMenu = Newobject("createmenu","menu.vcx",.Null.,.T.,oDesktop,goapp.perfilusuario,"'verdana',9","")
	oMenu.createMenu('datapvta','seguridad','favoritos',Pidsistema)
	oMenu = Null
	_Screen.LockScreen=.F.
	LeerEjercicioPerfil()

	Do Form frmmenu With 'datapvta','seguridad','favoritos',Pidsistema

	
	_screen.visible=.t.	   
	_screen.lockscreen=.f.
	
	
	Read events   
ENDIF

loConnDataSource = null 

cancel all
clear all

Return

*-----------------------------
FUNCTION F_ActivaWin(cCaption)
*-----------------------------

LOCAL nHWD
DECLARE INTEGER FindWindow IN WIN32API ;
STRING cNULL,;
STRING cWinName

DECLARE SetForegroundWindow IN WIN32API ;
INTEGER nHandle

DECLARE SetActiveWindow IN WIN32API ;
INTEGER nHandle

DECLARE ShowWindow IN WIN32API ;
INTEGER nHandle, ;
INTEGER nState

nHWD = FindWindow(0, cCaption)
IF nHWD > 0
    * VENTANA YA ACTIVA
    * LA "LLAMAMOS":
    ShowWindow(nHWD,9)

    * LA PONEMOS ENCIMA
    SetForegroundWindow(nHWD)

    * LA ACTIVAMOS
    SetActiveWindow(nHWD)
    RETURN .T.
ELSE
    * VENTANA NO ACTIVA
    RETURN .F.
ENDIF

FUNCTION Fwin32
	DECLARE Beep IN WIN32API INTEGER nFrequency, INTEGER nDuration
RETURN .t.

*DEFINE CLASS MiImagen AS IMAGE
*	PROCEDURE ResizeFondo
*		WITH THIS
*		.LEFT = INT(_SCREEN.WIDTH  - .WIDTH)/ 2
*		.TOP = INT(_SCREEN.HEIGHT - .HEIGHT)/ 2
*		ENDWITH
*	ENDPROC
*	
*	PROCEDURE DESTROY
*		UNBINDEVENT(THIS)
*	ENDPROC
*ENDDEFINE

DEFINE CLASS myhandler AS Session
   PROCEDURE myresize
      IF ISNULL(oscreen) THEN
         UNBINDEVENTS(THIS)
      ELSE
		oscreen.Top=_screen.top
		oscreen.Left=_screen.left
		oscreen.height=_screen.height
		oscreen.width=_screen.width		 
 	  *=Oavisar.usuario('resize '+STR(oscreen.width,5),0)      
      *   _obrowser.left = _SCREEN.Width - _obrowser.width
      ENDIF
   RETURN
   PROCEDURE mymoved
      IF ISNULL(oscreen) THEN
         UNBINDEVENTS(THIS)
      ELSE
		oscreen.Top=_screen.top
		oscreen.Left=_screen.left
		oscreen.height=_screen.height
		oscreen.width=_screen.width		       
	 * =Oavisar.usuario('move '+STR(oscreen.width,5),0)      
      *   _obrowser.left = _SCREEN.Width - _obrowser.width
      ENDIF
   RETURN
   
ENDDEFINE
