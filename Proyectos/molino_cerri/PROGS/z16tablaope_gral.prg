PARAMETERS ldfecha,lcpath,lcbase
lcfecha = IIF(PCOUNT()< 1,"01-08-2010",DTOC(ldfecha))
lcpath = IIF(PCOUNT()<2,"",lcpath)
lcdata = lcbase
LOCAL lnid

DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE  

SET SAFETY OFF

SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON
Oavisar.proceso('S','Abriendo archivos') 
llok = .t.

TEXT TO lccmd TEXTMERGE NOSHOW 
SELECT CsrParaConta.*,CsrPlanCue.cuenta as concepto FROM ParaConta as CsrParaConta
left join PlanCue as CsrPlanCue on CsrParaConta.idcuenta = CsrPlancue.id
where CsrParaConta.idejercicio = <<goapp.idejercicio>> and ISNULL(CsrPlanCue.id,-1) > -1
ENDTEXT 
IF !CrearCursorAdapter('CsrParaConta',lccmd)
	MESSAGEBOX('Nose puede importar, pq no cargado el CsrParaConta')
	RETURN .f.
ENDIF 

TEXT TO lccmd TEXTMERGE NOSHOW 
SELECT CsrProvincia.* FROM Provincia as CsrProvincia
ENDTEXT 
IF !CrearCursorAdapter('CsrProvincia',lccmd)
	MESSAGEBOX('Nose puede importar, las provincias nose cargaron')
	RETURN .f.
ENDIF

llok = CargarTabla(lcData,'Ctacte')
llok = CargarTabla(lcData,'PlanCue')
llok = CargarTabla(lcData,'Maopera')
llok = CargarTabla(lcData,'MovCaja')
llok = CargarTabla(lcData,'MovBcocar')
llok = CargarTabla(lcData,'AfeBcocar')
llok = CargarTabla(lcData,'Valor')
llok = CargarTabla(lcData,'DetaNroCaja')

llok = CargarTabla(lcData,'TablaOpe')
llok = CargarTabla(lcData,'CabeAsi')
llok = CargarTabla(lcData,'TablaAsi')

IF !llok
	RETURN .f.
ENDIF

SET SAFETY ON

IF USED('CsrDeudor')
	USE  IN  CsrDeudor
ENDIF 
IF USED('CsrMovimien')
	USE  IN CsrMovimien
ENDIF 
IF USED('CsrComproba')
	USE  IN  CsrComproba 
ENDIF 
IF USED('CsrAfeProv')
	USE IN CsrAfeProv
ENDIF
IF USED('CsrOrden')
	USE IN CsrOrden
ENDIF 
CREATE CURSOR CsrOrden(orden c(10),idmaopera n(12,0))
INDEX on orden TAG orden 

USE  ALLTRIM(lcpath )+"\gestion\tablaope" in 0 alias CsrTablaOpeGestion EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\movbacar" in 0 alias CsrMovBco EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\cajas" in 0 alias CsrCajas EXCLUSIVE

oavisar.proceso("S","Reindexando TablaOpe por orden...")
SELECT CsrTablaOpeGestion.* FROM CsrTablaOpeGestion;
ORDER BY orden INTO CURSOR FsrTablaOpe
SELECT FsrTablaOpe
INDEX on orden TO FsrTablaOpe

*fecha de importacion
ldfecha		=CTOD(lcfecha)
lcfiscal	=ALLTRIM(STR(YEAR(ldfecha)))+ALLTRIM(STRzero(MONTH(ldfecha),2,0))+ALLTRIM(STRzero(DAY(ldfecha),2,0))

lnidmaopera		= RecuperarID('CsrMaopera',Goapp.sucursal10)
lnidmovcaja		= RecuperarID('CsrMovCaja',Goapp.sucursal10)
lnidmovbcocar	= RecuperarID('CsrMovBcocar',Goapp.sucursal10)
lnidafebcocar	= RecuperarID('CsrAfeBcocar',Goapp.sucursal10)

lnidtablaasi	= RecuperarID('CsrTablaAsi',Goapp.sucursal10)
lnidcabeasi		= RecuperarID('CsrCabeAsi',Goapp.sucursal10)

ldfechasis	=DATETIME(YEAR(ldfecha),MONTH(ldfecha),DAY(ldfecha),0,0,0)
ldfechas	=DATETIME(YEAR(DATE()),MONTH(DATE()),DAY(DATE()),0,0,0)

		
Oavisar.proceso('S','Analizando contabilidad') 	

SELECT CsrCabeAsi
GO BOTTOM 
lnNumCabe = CsrCabeAsi.numero


SELECT FsrTablaOpe
GO TOP 
SCAN  FOR !EOF('FsrTablaOpe')
	&&Controlamos si no lo importo otro metodo
	SELECT CsrTablaOpe
	LOCATE FOR orden = FsrTablaOpe.orden
	IF orden = FsrTablaOpe.orden
		LOOP 
	ENDIF 
	
	SELECT FsrTablaOpe
	SCATTER NAME OscOpera
	&&Origen
	&&CC Cartera
	&&	TipoComp 6 =Retiro 3=Cheque
	&&CA Caja
	&&	Clase E=Egreso I=Ingreso
	
	&&Para ver Origen='F' que no este en tablaope de importador
	&&Es una anulacion.
	DO CASE
	CASE OscOpera.origen="CA"
		lnidcomproba	= IIF(OscOpera.clase$"E",33,32)
		lcclasecomp		= IIF(OscOpera.clase$"E","Y","W")
		lnsigno			= IIF(OscOpera.clase$"E",-1,1)
		lcOrigen		= IIF(OscOpera.clase$"E","ECA","ICA")
		lcComp			= IIF(OscOpera.clase$"E","EGCAJA","INCAJA")
	CASE OscOpera.origen="CC" 
		lnidcomproba	= IIF(OscOpera.tipocomp=6,20,16)
		lcclasecomp		= IIF(OscOpera.tipocomp=6,"T","O")
		lnsigno			= IIF(OscOpera.tipocomp=6,-1,1)
		lcOrigen		= "CAR"
		lcComp			= IIF(OscOpera.clase$"E","RETIRO","CHEQUE")
	OTHERWISE
		LOOP 
	ENDCASE
	
	lnidvendedor = 0
	lnimporte	= OscOpera.importe

	SELECT CsrCajas
	LOCATE FOR caja = OscOpera.nro_caja
	SELECT CsrDetaNroCaja
	LOCATE FOR nrocaja = VAL(DTOS(CsrCajas.fecha))
	IF nrocaja != VAL(DTOS(CsrCajas.fecha)) OR nrocaja = 0
		GO TOP 
	ENDIF 
	lniddetanrocaja = CsrDetaNroCaja.id
		
	lcletra		= "X"
	lcnum		= STRZERO(OscOpera.numcomp,8)
	lctalonario	= STRZERO(OscOpera.talon,4)
	lctalonario = IIF(LEN(LTRIM(lctalonario))=0,"0000",lctalonario)
	lcnumero	= lcletra+lctalonario+lcnum
	cSwitch		= "00000"
	
	ldfechaserver	= FsrTablaOpe.fecha
	ldfechasis		= FechaHoraCero(ldfechaserver)
	ldFechaCARGA	= FsrTablaOpe.fecha
		
	INSERT INTO CsrMaopera (id,origen,programa,sucursal,terminal,sector	,fechasis,idoperador;
	,idvendedor,iddetanrocaja,idcomproba,numcomp,clasecomp,turno,puestocaja,idcotizadolar,switch;
	,estado,detalle,fechaserver);
	VALUES (lnidmaopera,lcorigen,"IMPORTACION MOVIMIENTOS",goapp.sucursal,goapp.terminal,1,ldfechasis;
	,1,lnidvendedor,lniddetanrocaja,lnidcomproba,lcnumero,lcclasecomp,1,1,1,cSwitch,"0","Importación";
	,ldfechaserver)
		
	INSERT INTO CsrTablaOpe (idmaopera,orden,origen);
	VALUES (CsrMaopera.id,OscOpera.orden,CsrMaopera.origen)

	lnNumCabe 	= lnNumCabe + 1
	lcDetalle	= lcComp + " " + lcNumero
	
	SELECT CsrParaConta
	LOCATE FOR numero=1
	lnIdCaja= CsrParaConta.idcuenta
	lnCajas	= CsrParaconta.concepto
	
	INSERT INTO CsrCabeAsi	(id,idmaopera,idejercicio,numero,fecha,tipoasi,detalle,FECHACARGA);
	VALUES (lnidCabeasi,lnidmaopera,goapp.idejercicio,lnnumcabe,ldFechaCARGA,'C',lcdetalle,ldFechaCARGA)
	lnidCabeAsi = lnidCabeAsi + 1
	
	lnIdOrigRetiro = 0	
	lnidmaoperao = 0
	SELECT FsrTablaOpe
	DO WHILE !EOF() AND orden = OscOpera.orden
		lnImporte	= FsrTablaOpe.importe
		lcDetalle	= FsrTablaOpe.detalle
		ldFecha		= FsrTablaOpe.fecha
		lcDebeHaber	= FsrTablaOpe.debehaber
		lnIdOrigen 	= 0
		
		IF lnCajas = FsrTablaOpe.concepto AND OscOpera.origen="CA"
			SELECT CsrValor
			LOCATE FOR numero = FsrTablaOpe.valor
			lnidvalor = CsrValor.id
			
			INSERT INTO CsrMovCaja (id,idmaopera,idorigen,tablaori,clase,importe,detalle,fecha,idvalor);
 			VALUES (lnidmovcaja,lnidmaopera,0,"MAOP",lcdebehaber,lnimporte,lcdetalle,ldfecha,lnidvalor)
 			lnidmovcaja = lnidmovcaja + 1 
 			lnIdOrigen = CsrMovCaja.id
     	ENDIF 	
     	
		IF OscOpera.origen="CC"
			&&No funciona para registracion de cheque directo. No habia ejemplos.
			IF FsrTablaOpe.orden =  '0000037719'
				*stop()
			ENDIF 
			IF FsrTablaOpe.valor <> 0
				SELECT CsrValor
				LOCATE FOR numero = FsrTablaOpe.valor
				lnidvalor = CsrValor.id
				
				SELECT CsrMovBcocar
				LOCATE FOR origen='3RO' AND numero = FsrTablaOpe.cheque AND signo = 1
				IF origen='3RO' AND numero = FsrTablaOpe.cheque AND signo = 1
					replace entregado WITH lctitular, switch WITH "1"+RIGHT(switch,4) IN CsrMovBcocar
					
					INSERT INTO Csrafebcocar(id,idmaoperao,idorigen,idmaoperaa,idafecta);
     				VALUES(lnidafebcocar,lnidmaoperao,lnIdOrigRetiro,CsrMovBcocar.idmaopera,CsrMovBcocar.id)
     				lnidafebcocar = lnidafebcocar +1     			
				ENDIF 

	 		ELSE
	 			&&Retiro
	 			lnNumero = OscOpera.numcomp
				lctitular = OscOpera.detalle
				INSERT INTO CsrMovbcocar (id,idmaopera,origen,importe,idtipomov,numero;
				,idctabco,banco,localidad,fecha,fechavto,cuit,titular,recibido,entregado;
				,detalle,signo,switch);
				VALUES (lnidmovbcocar,lnidmaopera,'3RO',lnimporte,lnidcomproba,lnnumero,0,"";
				,"",ldfecha,ldfecha,'',lctitular,"","",lctitular,lnSigno,"00000")	
				
				lnIdOrigRetiro	= CsrMovBcocar.id
				lnidmaoperao	= CsrMovBcocar.idmaopera
				lnidmovbcocar = lnidmovbcocar + 1 
	 		ENDIF 
     	ENDIF 	
		SELECT CsrPlanCue
		LOCATE FOR cuenta = FsrTablaOpe.concepto
		lnidcuenta	= CsrPlanCue.id
		lctablaori	= IIF(lnIdCaja=lnidcuenta,"CAJA","MAOP")
		lctipoconce	= "**"
		
		INSERT INTO CsrTablaasi (id,idmaopera,idcuenta,debehaber,importe,idorigen,tablaori,tipoconce;
		,detalle);
		VALUES (lnidTablaasi,lnidmaopera,lnidcuenta,lcdebehaber,lnimporte,lnidorigen,lctablaori;
		,lctipoconce,lcdetalle)

		lnidTablaasi = lnidTablaasi + 1
		sELECT FsrTablaOpE
		SKIP 
	ENDDO 
	&&Sino termino de recorrer todo. vuelvo al registro anterior que termino el ciclo
	IF NOT EOF()
		SKIP -1
	ENDIF 	

	lnidmaopera = lnidmaopera + 1 
	SELECT FsrTablaOpe
ENDSCAN 

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')


USE IN FsrTablaOpe
USE IN CsrMovBco
USE IN CsrCajas
USE IN CsrTablaOpeGestion

CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
