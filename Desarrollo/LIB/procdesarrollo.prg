
FUNCTION Retardo
LPARAMETERS nSec
*nSec = Numero de segundos de retardo
LOCAL nSecond1,nSecond2
nSecond1 = SECONDS()
nSecond2 = SECONDS()
DO WHILE nSecond1 + nSec > nSecond2
	nSecond2 = SECONDS()
ENDDO 
ENDFUNC 


FUNCTION LenTrim
PARAMETERS cDato

IF VARTYPE(cDato)<>'C'
	oavisar.usuario("Error Function LenTrim() requiere un dato caracter")
	RETURN 0
ENDIF 
RETURN LEN(LTRIM(cDato))
*----------------------------------------------------------------------------
* FUNCION DefaultVar(lcpropiedad,loValor,lcTypeDefault)
*----------------------------------------------------------------------------
* Funcion que determina si existe la propiedad, darle el valor, sino el valor
* 	por defecto.
*----------------------------------------------------------------------------
FUNCTION DefaultVar
PARAMETERS lcpropiedad,loValor,lcTypeDefault
	lcTypeDefault = IIF(PCOUNT()<3,varType(loValor),lcTypeDefault)
	*lcTypeDefault = IIF(PCOUNT()<3,Type('loValor'),lcTypeDefault)
	lbControla = IIF(PCOUNT()<3,.f.,.t.)
	
	lcCadenaPropiedad = "'"+lcPropiedad+"'"
	*lcEjemplo = "'"+'CsrEmpresa.id'+"'"
	IF !TYPE(&lcCadenaPropiedad)$'U'
		IF !VARTYPE(&lcPropiedad)$'X'
			IF lbControla
				IF !VARTYPE(&lcPropiedad)$lcTypeDefault
					RETURN loValor
				ENDIF 
			ENDIF 
			lcProperty = &lcCadenaPropiedad &&Tiene un valor string dentro de otro.
			loProperty = &lcProperty
			loValor = loProperty
		ENDIF 
		
		RETURN loValor
	ELSE
		RETURN loValor
	ENDIF 
	RETURN loValor
ENDFUNC 

*----------------------------------------------------------------------
*FUNCTION RecuperarCaja
*----------------------------------------------------------------------
* Recuperamos si existe el id de la caja
*----------------------------------------------------------------------
FUNCTION RecuperarCaja
LPARAMETERS nNumCaja
LOCAL nIdCaja
nIdCaja = 0

IF nNumCaja = 0
	RETURN nIDCaja
ENDIF 

TEXT TO lcCmd TEXTMERGE NOSHOW 
SELECT CsrDetaNroCaja.id FROM DetaNroCaja as CsrDetaNroCaja
where nrocaja = <<nNumCaja>>
ENDTEXT 
IF NOT CrearCursorAdapter('CsrCursor',lcCmd)
	RETURN nIdCaja
ENDIF 
IF RECCOUNT('CsrCursor') != 0
	SELECT CsrCursor
	GO TOP 
	nIdCaja = CsrCursor.id
ENDIF 
USE IN CsrCursor
RETURN nIdCaja


*-------------------------------------------------------
* FUNCTION AsociarColumnaGrupo
*-------------------------------------------------------
* Asocia un objeto columna al grupo
* cObjetoGrupo = Nombre del objeto grupo
* nGrupo = Numero del grupo a asociar
* nColumna = Cantidad de columnas a asociar
FUNCTION AsociarColumnaGrupo
PARAMETERS cObjetoGrupo,nGrupo,nColumna
cObjetoGrupo= IIF(PCOUNT()<1,"",cObjetoGrupo)
nGrupo		= IIF(PCOUNT()<2,0,nGrupo)
nColumna	= IIF(PCOUNT()<3,1,nColumna)

IF EMPTY(cObjetoGrupo) AND nGrupo>0
	oavisar.PROGRAMADOR("Falta definir el objeto grupo o el grupo")
	RETURN .f.
ENDIF 
LOCAL cObjeto,oObjeto,cGrupo,oGrupo

cObjeto = cObjetoGrupo + ".Grupo" + strzero(nGrupo,3)
oObjeto	= &cObjeto
=ExcelVistaPrevia(@oObjeto,nColumna,.t.,.f.)
cGrupo	= cObjetoGrupo + ".Grupo" + strzero(nGrupo,3)
oGrupo	= &cGrupo
oGrupo	= oObjeto
oGrupo.Columns = nColumna

RETURN 		
*----------------------------------------------------------------------
*FUNCTION ArmarComproba
*----------------------------------------------------------------------
* Formateamos la representacion del comprobante
* uniendo coomprobante+letra+talonario+numero
* Ejemplo ArmarComproba('FACTURA','A','0001','00012368')
*			= 'FACTURA A 0001-00012368'
* lcComproba = Nombre del comprobante
* lcLetra	 = Letra del comprobante
* lcTalonario= Talonario del comprobante
* lcNumcomp	 = Numero del comprobante
*----------------------------------------------------------------------
FUNCTION ArmarComproba
LPARAMETERS lcComproba,lcLetra,lcTalonario,lcNumComp,lCompleto
lcComproba	= IIF(PCOUNT()<1,'',lcComproba)
lcLetra		= IIF(PCOUNT()<2,'',lcLetra)
lcTalonario	= IIF(PCOUNT()<3,'',lcTalonario)
lcNumComp	= IIF(PCOUNT()<4,'',lcNumComp)
lCompleto	= IIF(PCOUNT()<5,.f.,lCompleto)
IF EMPTY(lcComproba)
	oavisar.usuario('ArmarComproba() falta definir descripci�n del comprobante')
	RETURN ""
ENDIF 
IF EMPTY(lcNumComp) AND NOT lCompleto
	*oavisar.usuario('ArmarComproba() falta definir el numero del comprobante')
	RETURN ALLTRIM(lcComproba)
ENDIF 
IF lCompleto
	cNum = ALLTRIM(lcComprobante)
	RETURN LEFT(cNum,1)+" "+SUBSTR(cNum,2,4)+"-"+RIGHT(cNum,8)
ELSE
	RETURN ALLTRIM(lcComproba)+" "+lcLetra+" "+lcTalonario+"-"+lcNumComp
ENDIF 
*----------------------------------------------------------------------
*FUNCTION PelarID
*----------------------------------------------------------------------
* Le extraemos al id los numeros que corresponden a la sucursal
* lnValorID = Valor del cual se extraen los numeros de sucursal
*----------------------------------------------------------------------
FUNCTION PelarID
LPARAMETERS lnValorID
LOCAL lnLen
lnLen = LEN(LTRIM(strTrim(lnValorID,12))) &&Si es valor Integer menor a 10, no tiene sucursal
DO CASE 
CASE LEN(LTRIM(strTrim(lnValorID,12)))= 12
	lnLen = 10
CASE LEN(LTRIM(strTrim(lnValorID,12)))= 10
	lnLen = 8
ENDCASE 
RETURN INT(VAL(RIGHT(strtrim(lnValorID,12),lnLen)))

*--------------------------------------------------------------------------
* FUNCTION NumCopias(lcNameFrx,lnCopies)
*--------------------------------------------------------------------------
* Editamos el numeros de copias en el report.
* Lo hacemos asi porque las copias las determina el prefijo.

* lcNameFrx = Nombre del archivo
* lnCopies = cantidad de Copias
*---------------------------------------------------------------------------
Function NumCopias
Lparameter lcNameFRX, lnCopies
Local lcNewExpr, lnStartCopiesLine, lcStartAtCopiesLine, lnEndCopiesLine, ;
        lnLenCopiesLine, lcTop, lcBottom, lcAlias
#Define vfCRLF Chr(13) + Chr(10)

lcAlias=Alias()

If !(Upper(Right(lcNameFRX, 4)) = ".FRX")
        lcNameFRX = lcNameFRX + ".FRX"
Endif
Use (lcNameFRX) IN 0
SELECT (lcNameFRX)
Locate For objType = 1 And objCode = 53

If Empty(Expr)
        lcNewExpr = "COPIES=" + Allt(Str(lnCopies)) + vfCRLF
Else
        lnStartCopiesLine = Atc("COPIES", Expr)
        
        If lnStartCopiesLine <> 0
                lcStartAtCopiesLine = Substr(Expr, lnStartCopiesLine)
                lnEndCopiesLine = Atc(vfCRLF, lcStartAtCopiesLine)
                lnLenCopiesLine = Len(Substr(lcStartAtCopiesLine, 1, lnEndCopiesLine))
                lcTop = Substr(Expr, 1, lnStartCopiesLine - 1)
                lcBottom = Substr(Expr, (Len(lcTop) + lnLenCopiesLine))
                lcNewExpr  = lcTop + "COPIES=" + Allt(Str(lnCopies)) + lcBottom
        Else
                lcNewExpr = Expr + "COPIES=" + Allt(Str(lnCopies)) + vfCRLF
        Endif
Endif

Replace Expr With lcNewExpr
Use In (lcNameFRX)
IF !EMPTY(lcAlias)
	Select &lcAlias
endif
ENDFUNC


*Funcion modificada para mandar la clave de busqueda
FUNCTION seek_dato
PARAMETERS tcdatobuscado,tbtipobusqueda,tbtabla,tbclave
tbtabla 	= IIF(PCOUNT()<3,"",tbtabla)
tbclave	= IIF(PCOUNT()<4,"",tbclave)
llok = .t.
IF tbtipobusqueda
	SET NEAR ON
ELSE
	SET NEAR OFF
ENDIF
IF LEN(LTRIM(tbtabla))=0 AND LEN(LTRIM(tbclave))=0
	SEEK(tcdatobuscado)
ELSE 
	llok = SEEK(tcdatobuscado,tbtabla,tbclave)
ENDIF 
SET NEAR OFF
RETURN llok

*---------------------------------------------------------------------------
* FUNCTION LeerCajaActivaOtroEjercicio(idejercicioaleer)
*---------------------------------------------------------------------------
*Si el ejercicio a leer es diferente al ejercicio del sistema.
*Configuramos el paraconfig para que use el ejercicioaleer y busque
*a su vez, la primera caja abierta en ese ejercicio.
*---------------------------------------------------------------------------
FUNCTION LeerCajaActivaOtroEjercicio(oForm,nidejercicioaleer)
LOCAL nidejercicio
oform = IIF(PCOUNT()<1,null,oForm)
nidejercicio = IIF(PCOUNT()<2,goapp.idejercicio,nidejercicioaleer)
IF ISNULL(oForm)
	RETURN 
ENDIF 
IF VARTYPE(oForm.buscarcajaactiva)$'XU'
	oForm.addproperty('buscarcajaactiva',.f.)
ENDIF 
IF VARTYPE(oForm.usarcajaactiva)$'XU'
	oForm.addproperty('usarcajaactiva',.t.)
ENDIF 


IF !USED('CsrParaConfig')
	RETURN 
ENDIF 
IF RECCOUNT('CsrParaconfig')=0
	RETURN 
ENDIF 
IF !oForm.buscarcajaactiva
	RETURN 
ENDIF 

IF nidejercicio != CsrParaConfig.idejercicio &&o goapp.idejercicioactual &&NO goapp.idejercicio
	oForm.usarcajaactiva = .f.
ENDIF 

IF !oForm.usarcajaactiva
	LOCAL oEjercicioActivo as Object 
	LeerEjercicioActivo (@oEjercicioActivo,1)
	IF oEjercicioActivo.idcajaactual != 0
		replace iddetanrocaja WITH oEjercicioActivo.idcajaactual,nrocaja WITH oEjercicioActivo.cajaactual;
					,pefiscal WITH oEjercicioActivo.peFiscalCaja;
					,fecdesde WITH oEjercicioActivo.fecCajadesde;
					,fecHasta WITH oEjercicioActivo.fecCajahasta IN CsrParaConfig
	ELSE
		=Oavisar.usuario("Debe cambiar parametros diarios;"+CHR(13);
			+ "no se encontro CAJA ACTIVA ABIERTA"+CHR(13)+CHR(13);
			+"UTILES \\ PARAMETROS \\ PARAMETROS DIARIOS")
	ENDIF 
	RELEASE oEjercicioActivo
ENDIF 
RETURN 
ENDFUNC 

*----------------------------------------------------------------------------
* FUNCION Grabar_Sec(tcTexto,tcArchivo,tcCarpeta)
*----------------------------------------------------------------------------
*Grabamos secuencias de comenados en un archivo
*tcTexto = Secuencia
*tcArchivo = Nombre del Archivo
*tcCarpeta = Ruta del archivo
*----------------------------------------------------------------------------
Function GRABAR_SEC

Parameters tcTexto,tcArchivo,tcCarpeta

Private plRet, pnFich, pnFichn, pnFtama, pnTammax, pnLongAc
Private pcChar, pnPos,Lcdirlog,Lcfilelog,Lcnewlog

tcArchivo=IIF(PCOUNT()<2,'Secuencia'+DTOS(DATE())+'.txt',tcArchivo)
tcCarpeta=IIF(PCOUNT()<2,'Sec',tcCarpeta)

Lcdirlog=Sys(5)+Sys(2003)+'\'+tcCarpeta
Lcfilelog=Lcdirlog+'\'+tcArchivo
LcNewlog=Lcdirlog+'\'+'New'+ALLTRIM(tcArchivo)

If !Directory(Lcdirlog)
	Md (Lcdirlog)
Endif

plRet    = .T.
pnLongAc = 0
pnTammax = 60000
pnFtama = 0
pnFich = -1

tcTexto=Dtoc(Datetime())+' , '+tcTexto

If File(Lcfilelog)                && �Existe el archivo?
	pnFich = Fopen(Lcfilelog,12)  && S�: abrir lect./escrit.
	pnFtama=Fseek(pnFich, 0, 2)                     && Mueve el puntero a EOF
&& y devuelve el tama�o
Else
	pnFich = Fcreate(Lcfilelog)   && Si no, crearlo
Endif
If pnFich < 0                                       && Comprobar el error
&& abriendo el archivo
	plRet = .F.
	Wait 'No puedo abrir o crear el archivo de salida (fich)' Window Nowait
Else                                                && Si no hay error,
&& escribir en el archivo
	If pnFtama > pnTammax                           && Si el tama�o es mayor que el max
		pnFichn = Fcreate(Lcnewlog)    && Crear nuevo log
		If pnFichn < 0
			Wait 'No puedo abrir o crear el archivo de salida (fichn)' Window Nowait
		Else
			pnPos = Fseek(pnFich, -(pnTammax - 256), 1)
			pcChar = Fread(pnFich, 1)
			Do While pcChar <> Chr(10)
				pcChar = Fread(pnFich, 1)
			Enddo
			pnPos = Fseek(pnFich, 0, 1)
			Do While Not(Feof(pnFich))
				= Fputs(pnFichn,Fgets(pnFich))
			ENDDO
			
			=Fclose(pnFich)
			=Fclose(pnFichn)
			
			Delete File &Lcfilelog
			Rename &Lcnewlog To &Lcfilelog
			pnFich = Fopen(Lcfilelog,12)
			pnFtama=Fseek(pnFich, 0, 2)
		Endif
	Endif
	=Fputs(pnFich, tcTexto)
Endif
=Fclose(pnFich)                                    && Cerrar archivo

Return plRet

*----------------------------------------------------------------------------
* FUNCION TtoS(tFecha)
*----------------------------------------------------------------------------
* Crea la cadena con el formato de un datetime que reconoce SQL
* tFecha Fecha de tipo datetime 
*----------------------------------------------------------------------------
FUNCTION TtoS
PARAMETERS tFecha

cFecha = LEFT(TTOC(tFecha),10)
cFecha = DTOS(CTOD(cFEcha))
cHora = strzero(HOUR(tFecha),2)+":"+strzero(MINUTE(tFecha),2)+":"+strzero(SEC(tFecha),2)

RETURN cFEcha+" "+cHora

*----------------------------------------------------------------------------
* FUNCION ArmarFechaWhere(cCampo,cFechaDesde,cFechaHasta)
*----------------------------------------------------------------------------
* Crea la cadena con el campo de donde debe buscarse las fechas
* cCampo nombre del campo donde se hace refrencia a la busqueda
* cFechaDesde campo caracter de donde se debe buscar la fecha
* cFechaHasta campo caracter de donde se debe buscar la fecha
*----------------------------------------------------------------------------
FUNCTION ArmarFechaWhere
PARAMETERS cCampo,cFechaDesde,cFechaHasta

cCampo = ALLTRIM(IIF(PCOUNT()<1,"fecha",cCampo))
cFechaDesde = IIF(PCOUNT()<2,"",cFechaDesde)
cFechaHasta = IIF(PCOUNT()<3,"",cFechaHasta)
LOCAL lHayFechaDesde,lHayFechaHasta,cWhere
cWhere = ""
*Tres Posibilidades 
*Si existen ambas fechas se arma un between
*Si solo existe una si es desde entonces >= , sino es hasta entonces <=
lHayFechaDesde = IIF(LEN(LTRIM(cFechaDesde))#0,.t.,.f.)
lHayFechaHasta = IIF(LEN(LTRIM(cFechaHasta))#0,.t.,.f.)
IF lHayFechaDesde AND lHayFechaHasta
	cWhere = " (" + cCampo + " BETWEEN '"+DTOS(CTOD(cFechaDesde)) + "' and '" + DTOS(CTOD(cFechaHasta))+ "')"
ELSE
	cWhere = IIF(lHayFechaDesde OR lHayFechaHasta," " + cCampo + IIF(lHayFechaDesde," >= "," <= ") + " '" +DTOS(CTOD(IIF(lHayFechaDesde,cFechaDesde,cFechaHasta)))+"' ","")
ENDIF 
RETURN  cWhere
*----------------------------------------------------------------------------
* FUNCION ExcelVistaPrevia(Objeto,Columnas,Titulo)
*----------------------------------------------------------------------------
* Crea el objeto que interactua para generar la salida por excel para vista previa
* El Objeto debe ser pasado por referencia
* Columnas = la cantidad de columnas.
* Titulo = Por defecto determina si el titulos se divide en filas
*----------------------------------------------------------------------------
FUNCTION ExcelVistaPrevia
PARAMETERS loObjeto,lnColumnas,llTitulo,llInit
lnColumnas = IIF(PCOUNT()<2,0,lnColumnas)
lltitulo = IIF(PCOUNT()<3,.t.,llTitulo)
llInit	= IIF(PCOUNT()<4,.t.,llInit)

IF llInit
	loObjeto = CREATEOBJECT("Custom")
ENDIF 
WITH loObjeto
	.Addproperty('cuantos',lnColumnas) &&Indica la cantidad de columnas
	.AddProperty('recortarheader',lltitulo) &&Indica si el titulo se divide en filas
	
	FOR i=1 TO lnColumnas
		&&Se vuelve a crear el objeto, pq sino todos hacen referencia al mismo
		ObjColumna = CREATEOBJECT("Custom")
		ObjColumna.AddProperty('Header',"") &&Indica el nombre del encabezado
		ObjColumna.AddProperty('BodyFormat','')  &&Indica el formato del cuerpo
		ObjColumna.AddProperty('Ajusta',.f.) &&Siempre es verdadero. Si se quiere Que el ancho funcione
		ObjColumna.AddProperty('BodyWidth',-1) &&Determina en caso que exista un ancho especifico para la columna
		
		.AddProperty('Column'+strzero(i,3),ObjColumna) 
		
		ObjColumna=null
	NEXT 
ENDWITH 
RETURN 
*----------------------------------------------------------------------------
* FUNCION ExcelVistaPreviaGrupo(Objeto,Grupos)
*----------------------------------------------------------------------------
* Crea el objeto que interactua para generar la salida por excel para vista previa
* El Objeto debe ser pasado por referencia
* Este objeto contendra las columnas por grupo
* Grupos = la cantidad de grupos.
*----------------------------------------------------------------------------
FUNCTION ExcelVistaPreviaGrupo
PARAMETERS loObjeto,lnGrupos
lnGrupos = IIF(PCOUNT()<2,0,lnGrupos)

loObjeto = CREATEOBJECT("Custom")
WITH loObjeto
	.AddProperty('recortarheader',.f.) &&Indica si el titulo se divide en filas
	.AddProperty('cuantos',lnGrupos)
	FOR i=1 TO lnGrupos
		&&Se vuelve a crear el objeto, pq sino todos hacen referencia al mismo
		ObjGrupo = CREATEOBJECT("Custom")
		ObjGrupo.AddProperty('NameGroup',"") &&Titulo del Grupo
		ObjGrupo.AddProperty('ListColumns',null)  &&Arreglo con los nombre de los campos
		ObjGrupo.AddProperty('Columns',0) &&Cantidad de columnas
		
		.AddProperty('Grupo'+strzero(i,3),ObjGrupo) 
		
		ObjGrupo=null
	NEXT 
ENDWITH 
RETURN
*----------------------------------------------------------------------------
* FUNCION StoC(lcFecha)
*----------------------------------------------------------------------------
* De String fecha sin formato a String con formato
*----------------------------------------------------------------------------
FUNCTION StoC
PARAMETERS lcFecha
lcfecha = alltrim(lcFecha)
IF LEN(lcFecha)#8
	RETURN "01-01-1900"
ENDIF 
RETURN RIGHT(lcfecha,2)+"-"+LEFT(RIGHT(lcfecha,4),2)+"-"+LEFT(lcfecha,4)

*----------------------------------------------------------------------------
* FUNCION SaveSQL(lcCmd,lcArchivo,llgenera)
*----------------------------------------------------------------------------
* Guarda la consulta al motor
*----------------------------------------------------------------------------
FUNCTION SaveSQL
PARAMETERS lcCmd,lcArchivo,llgenera
llgenera = IIF(PCOUNT()<3,.f.,llgenera)

IF LEN(LTRIM(lcCmd))=0
	RETURN 
ENDIF 
IF LEN(LTRIM(lcArchivo))=0
	RETURN 
ENDIF 
lcRuta = SYS(5)+ "\tempsql\"+ALLTRIM(goapp.initcatalo)
IF VARTYPE(goapp.rutaaplicacion)$'C'
	lcRutaApli = IIF(LEN(ALLTRIM(goapp.rutaaplicacion))#0,goapp.rutaaplicacion,"")
	lcRutaApli = RTRIM(lcRutaApli) + IIF(RIGHT(lcRutaApli,1)="\" or LEN(LTRIM(lcRutaApli))=0,"","\") &&Si es vacio o tiene \. Mantiene lo mismo.
	lcRuta = IIF(LEN(LTRIM(lcRutaApli))#0,lcRutaApli+ "tempsql",lcRuta)	
ENDIF 
IF llgenera &&Determinamos que queres que siempre se guarde
	IF !DIRECTORY(lcRuta)
		MKDIR &lcRuta
	ENDIF 
ENDIF 
SET SAFETY OFF 
= STRTOFILE(lccmd,lcRuta+"\"+lcArchivo+".txt")
SET SAFETY ON 

RETURN 
*----------------------------------------------------------------------------
* FUNCION StrTrim(lnValor,lnTam,lcDec)
*----------------------------------------------------------------------------
* Funcion que devuelve la trasformacion de str sin espaciones vacios.
*----------------------------------------------------------------------------
FUNCTION StrTrim
PARAMETERS lnValor,lnTam,lnDec
lnValor = IIF(PCOUNT()<1,0,lnValor)
lnTam = IIF(PCOUNT()<2,10,lnTaM)
lnDec = IIF(PCOUNT()<3,0,lnDec)

RETURN ALLTRIM(STR(lnValor,lnTam,lnDec))
*!*	*!*	*----------------------------------------------------------------------------
*!*	*!*	* FUNCION DefaultVar(lcpropiedad,loValor,lcTypeDefault)
*!*	*!*	*----------------------------------------------------------------------------
*!*	*!*	* Funcion que determina si existe la propiedad, darle el valor, sino el valor
*!*	*!*	* 	por defecto.
*!*	*!*	*----------------------------------------------------------------------------
*!*	*!*	FUNCTION DefaultVar
*!*	*!*	PARAMETERS lcpropiedad,loValor,lcTypeDefault
*!*	*!*		lcTypeDefault = IIF(PCOUNT()<3,Type('loValor'),lcTypeDefault)
*!*	*!*		lbControla = IIF(PCOUNT()<3,.f.,.t.)
*!*	*!*		
*!*	*!*		lcCadenaPropiedad = "'"+lcPropiedad+"'"
*!*	*!*		*lcEjemplo = "'"+'CsrEmpresa.id'+"'"
*!*	*!*		IF !TYPE(&lcCadenaPropiedad)$'U'
*!*	*!*			IF !VARTYPE(&lcPropiedad)$'X'
*!*	*!*				IF lbControla
*!*	*!*					IF !VARTYPE(&lcPropiedad)$lcTypeDefault
*!*	*!*						RETURN loValor
*!*	*!*					ENDIF 
*!*	*!*				ENDIF 
*!*	*!*				lcProperty = &lcCadenaPropiedad &&Tiene un valor string dentro de otro.
*!*	*!*				loProperty = &lcProperty
*!*	*!*				loValor = loProperty
*!*	*!*			ENDIF 
*!*	*!*			
*!*	*!*			RETURN loValor
*!*	*!*		ELSE
*!*	*!*			RETURN loValor
*!*	*!*		ENDIF 
*!*	*!*		RETURN loValor
*!*	*!*	ENDFUNC 
*----------------------------------------------------------------------------
* FUNCION GuardaPagina(lnRecno)
*----------------------------------------------------------------------------
* Funcion que se utiliza en reportes, para guardar la ultima pagina generada
* en un Cursor, para luego almacenarla en otro sitio
*----------------------------------------------------------------------------
FUNCTION GuardaPagina
PARAMETERS lnRecno
	replace ultpagina with nropagina + lnrecno in CsrEncabezado
RETURN 
*--------------------------------------------------
* FUNCION Stop()
*--------------------------------------------------
* Funcion que se utiliza en desarrollo para debug
*--------------------------------------------------
FUNCTION STOP()
	lldesarrollo=(_vfp.startmode()#4)
	IF lldesarrollo
		oavisar.proceso('N')
		DEBUG
		SUSPEND 
	ENDIF 
	RETURN
ENDFUNC  
*--------------------------------------------------
* FUNCION Vista()
*--------------------------------------------------
* Funcion que se utiliza en desarrollo para browse
*--------------------------------------------------
FUNCTION VISTA()
	lldesarrollo=(_vfp.startmode()#4)
	IF lldesarrollo
		oavisar.proceso('N')
		SELECT (ALIAS())
		BROWSE 
	ENDIF 
	RETURN
ENDFUNC  

*********************************************************
* Funcion: GRABAR_LOG
*
* Graba una linea en el log (en raiz\LOG.TXT)
*
* Parametros:
*
*       tctexto   - texto a grabar
*
* Ejemplos:
*
*       ret = GRABAR_LOG("Inicio de Programa")
*
* Retorno:
*
*        .T.    Grabacion correcta
*        .F.	Error en la grabacion
*
* Nota:
*
**********************************************************
Function GRABAR_LOG

Parameters tcTexto,tcArchivo,tcCarpeta

Private plRet, pnFich, pnFichn, pnFtama, pnTammax, pnLongAc
Private pcChar, pnPos,Lcdirlog,Lcfilelog,Lcnewlog

tcArchivo=IIF(PCOUNT()<2,'Log.txt',tcArchivo)
tcCarpeta=IIF(PCOUNT()<3,'Logs',tcCarpeta)

Lcdirlog=Sys(5)+Sys(2003)+'\'+tcCarpeta
Lcfilelog=Lcdirlog+'\'+tcArchivo
LcNewlog=Lcdirlog+'\'+'New'+ALLTRIM(tcArchivo)

If !Directory(Lcdirlog)
	Md (Lcdirlog)
Endif

plRet    = .T.
pnLongAc = 0
pnTammax = 60000
pnFtama = 0
pnFich = -1

tcTexto=Dtoc(DATE())+' '+time()+' , '+tcTexto

If File(Lcfilelog)                && �Existe el archivo?
	pnFich = Fopen(Lcfilelog,12)  && S�: abrir lect./escrit.
	pnFtama=Fseek(pnFich, 0, 2)                     && Mueve el puntero a EOF
&& y devuelve el tama�o
Else
	pnFich = Fcreate(Lcfilelog)   && Si no, crearlo
Endif
If pnFich < 0                                       && Comprobar el error
&& abriendo el archivo
	plRet = .F.
	Wait 'No puedo abrir o crear el archivo de salida (fich)' Window Nowait
Else                                                && Si no hay error,
&& escribir en el archivo
	If pnFtama > pnTammax                           && Si el tama�o es mayor que el max
		pnFichn = Fcreate(Lcnewlog)    && Crear nuevo log
		If pnFichn < 0
			Wait 'No puedo abrir o crear el archivo de salida (fichn)' Window Nowait
		Else
			pnPos = Fseek(pnFich, -(pnTammax - 256), 1)
			pcChar = Fread(pnFich, 1)
			Do While pcChar <> Chr(10)
				pcChar = Fread(pnFich, 1)
			Enddo
			pnPos = Fseek(pnFich, 0, 1)
			Do While Not(Feof(pnFich))
				= Fputs(pnFichn,Fgets(pnFich))
			ENDDO
			
			=Fclose(pnFich)
			=Fclose(pnFichn)
			
			Delete File &Lcfilelog
			Rename &Lcnewlog To &Lcfilelog
			pnFich = Fopen(Lcfilelog,12)
			pnFtama=Fseek(pnFich, 0, 2)
		Endif
	Endif
	=Fputs(pnFich, tcTexto)
Endif
=Fclose(pnFich)                                    && Cerrar archivo

Return plRet



PROCEDURE InstallSystemFont() 
LPARAMETERS lcFontLocFile 
LOCAL lnNumFontsAdded 

DECLARE INTEGER AddFontResource IN GDI32.DLL ; 
STRING @ lpszFileName 
DECLARE INTEGER SendMessage IN USER32.DLL ; 
INTEGER hWnd, ; 
INTEGER Msg, ; 
INTEGER wParameter, ; 
INTEGER lParameter 
#DEFINE HWND_BROADCAST 0xFFFF 
#DEFINE WM_FONTCHANGE 0x001D 

lnNumFontsAdded=AddFontResource(lcFontLocFile) 
IF lnNumFontsAdded > 0 
	*\\Font added sucessfully, send notification to Windows so apps get updated 
	=SendMessage(HWND_BROADCAST,WM_FONTCHANGE,0,0) 
	RETURN .T. 
ELSE 
	*\\Unable to add font 
	RETURN .F. 
ENDIF 
ENDPROC 
