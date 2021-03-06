PARAMETERS ldfecha,lcpath,lcBase
lcfecha = IIF(PCOUNT()< 1,"01-08-2010",DTOC(ldfecha))
lcpath = IIF(PCOUNT()<2,"",lcpath)
lcdata = lcbase
LOCAL lnid 

DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE  


SET SAFETY OFF

Oavisar.proceso('S','Vaciando archivos') 
*Oavisar.proceso('N') 
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
SELECT CsrProvCtaCon.* FROM ProvCtaCon as CsrProvCtaCon
left join PlanCue as CsrPlanCue on CsrProvCtaCon.idctarete = CsrPlancue.id
where CsrProvCtaCon.idejercicio = <<goapp.idejercicio>> and ISNULL(CsrPlanCue.id,-1) > -1
ENDTEXT 
IF !CrearCursorAdapter('CsrProvCtaCon',lccmd)
	MESSAGEBOX('Nose puede importar, Se produjo un error al cargar las provincias asociadas')
	RETURN .f.
ENDIF 
TEXT TO lccmd TEXTMERGE NOSHOW 
SELECT CsrParaVario.* FROM ParaVario as CsrParaVario
ENDTEXT 
IF !CrearCursorAdapter('CsrParaVario',lccmd)
	MESSAGEBOX('Nose puede importar, las tablas varias nose cargaron')
	RETURN .f.
ENDIF
TEXT TO lccmd TEXTMERGE NOSHOW 
SELECT CsrProvincia.* FROM Provincia as CsrProvincia
ENDTEXT 
IF !CrearCursorAdapter('CsrProvincia',lccmd)
	MESSAGEBOX('Nose puede importar, las provincias nose cargaron')
	RETURN .f.
ENDIF	

llok = CargarTabla(lcData,'Actividad')
llok = CargarTabla(lcData,'MovCtacte')
llok = CargarTabla(lcData,'CabeCpra')
llok = CargarTabla(lcData,'TablaImp')
llok = CargarTabla(lcData,'Ctacte')
llok = CargarTabla(lcData,'PlanCue')
llok = CargarTabla(lcData,'Maopera')
llok = CargarTabla(lcData,'Valor')
llok = CargarTabla(lcData,'ClaseValor')
llok = CargarTabla(lcData,'MovCaja')
llok = CargarTabla(lcData,'MovBcocar')
llok = CargarTabla(lcData,'AfeBcocar')
llok = CargarTabla(lcData,'AfeCtacte')
llok = CargarTabla(lcData,'DetaNroCaja')
llok = CargarTabla(lcData,'EMaopera')

llok = CargarTabla(lcData,'TablaOpe')
llok = CargarTabla(lcData,'CabeAsi')
llok = CargarTabla(lcData,'TablaAsi')

IF !llok
	RETURN .f.
ENDIF

SET SAFETY ON

IF USED('CsrAcreedor ')
	USE  IN  CsrAcreedor 
ENDIF 
IF USED('CsrMoviprov')
	USE  IN CsrMoviprov 
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

USE  ALLTRIM(lcpath )+"\gestion\proveed" in 0 alias CsrAcreedor EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\moviprov" in 0 alias CsrMoviprov EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\compropr" in 0 alias CsrComproba EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\tablaope" in 0 alias CsrTablaOpeGestion EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\movbacar" in 0 alias CsrMovBco EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\afeprov" in 0 alias CsrAfeProv EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\cajas" in 0 alias CsrCajas EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\parametr" in 0 alias CsrParametros EXCLUSIVE
*fecha de importacion
ldfecha		=CTOD(lcfecha)
lfechapost	= ldfecha
lcfiscal	=ALLTRIM(STR(YEAR(ldfecha)))+ALLTRIM(STRzero(MONTH(ldfecha),2,0))+ALLTRIM(STRzero(DAY(ldfecha),2,0))

lnidmaopera		= RecuperarID('CsrMaopera',Goapp.sucursal10)
lnidmovctacte	= RecuperarID('CsrMovCtacte',Goapp.sucursal10)
lnidCabeCpra	= RecuperarID('CsrCabeCpra',Goapp.sucursal10)
lnidtablaimp	= RecuperarID('CsrTablaImp',Goapp.sucursal10)
lnidmovcaja		= RecuperarID('CsrMovCaja',Goapp.sucursal10)
lnidmovbcocar	= RecuperarID('CsrMovBcocar',Goapp.sucursal10)
lnidafebcocar	= RecuperarID('CsrAfeBcocar',Goapp.sucursal10)
lnidafectacte	= RecuperarID('CsrAfeCtacte',Goapp.sucursal10)
lnidemaopera	= RecuperarID('CsrEMaopera',Goapp.sucursal10)

lnidtablaasi	= RecuperarID('CsrTablaAsi',Goapp.sucursal10)
lnidcabeasi		= RecuperarID('CsrCabeAsi',Goapp.sucursal10)

ldfechas	=DATETIME(YEAR(DATE()),MONTH(DATE()),DAY(DATE()),0,0,0)


oavisar.proceso("S","Reindexando TablaOpe por orden...")
SELECT CsrTablaOpeGestion.* FROM CsrTablaOpeGestion;
ORDER BY orden INTO CURSOR FsrTablaOpe
SELECT FsrTablaOpe
INDEX on orden TO FsrTablaOpe

Oavisar.proceso('S','Recuperando movimientos posteriores') 	

*fecha de importacion
ldfecha		=CTOD(lcfecha)

SELECT (CsrMovimien.cliente+50000) as cliente ,detalle,IIF((CsrComproba.debcre='C'),-1,01) as Signo;
,fecha_fac,actividad;
,CsrMovimien.Importeco as importe,porceniva as Tasa;
,negra as TotalNG,internos as TotalII,otroiva as TotalOI,exen as TotalEX;
,retegan as TotalRG,reteib as TotalRB,reteiva as TotalRI,iva as TotalIG;
,(perceib) as TotalPB,percegan as TotalPG,percep as TotalPI;
, provincia as codprovincia;
,tipocomp,vencimien,IIF(ISNULL(decontado),CAST(0 as numeric(11,2)),decontado)as decontado;
,IIF(ISNULL(saldocomp),CAST(0 as numeric(11,2)),saldocomp)as saldo;
,letra,talonario,numcomp,orden,CAST(0 as n(12,0)) as idmaopera;
,CsrMovimien.periodo,CsrMovimien.nro_caja;
FROM CsrMoviprov as CsrMovimien;
LEFT JOIN CsrComproba ON CsrMovimien.tipocomp=CsrComproba.numero;
WHERE fecha_fac=>ldfecha AND estado<>'A' ;
order by fecha_fac,orden into cursor CsrPosterior READWRITE 

SELECT CsrPosterior
INDEX on orden TAG orden
INDEX on DTOS(fecha_fac)+orden TAG fecha_fac 
SET ORDER TO fecha_fac ASCENDING 

SELECT FsrTablaOpe.Orden,FsrTablaOpe.importe as impvalor;
,IIF(ISNULL(CsrClaseValor.numero),'',CsrClaseValor.numero) as clasevalor;
,IIF(ISNULL(CsrValor.id),CAST(0 as int),CsrValor.id) as idvalor,FsrTablaOpe.cheque;
,FsrTablaOpe.cliente,FsrTablaOpe.debehaber,FsrTablaOpe.detalle;
,FsrTablaOpe.concepto;
FROM CsrPosterior;
left JOIN FsrTablaOpe ON CsrPosterior.orden = FsrTablaOpe.orden;
left JOIN CsrValor ON FsrTablaOpe.valor = CsrValor.numero;
left JOIN CsrClaseValor ON CsrValor.idclase = CsrClaseValor.id;
into CURSOR CsrAuxTablaOpe READWRITE 

SELECT CsrAuxTablaOpe
INDEX on orden TAG korden
SET ORDER TO korden

SELECT CsrMovBco.*,FsrTablaOpe.vendedor,FsrTablaOpe.cliente;
,IIF(ISNULL(CsrClaseValor.numero),'',CsrClaseValor.numero) as clasevalor;
,IIF(ISNULL(CsrValor.id),0,CsrValor.id) as idvalor;
,IIF(ISNULL(CsrCtacte.cnombre),SPACE(25),CsrCtacte.cnombre) as nomctacte;
,IIF(ISNULL(CsrMovBco.entregado),'0','1') as aentregar;
,IIF(ISNULL(CsrMovBco.depositado),'0','1') as depositados;
FROM CsrMovBco ;
LEFT JOIN FsrTablaOpe ON CsrMovBco.orden = FsrTablaOpe.orden AND CsrMovBco.numcomp = FsrTablaOpe.cheque;
left JOIN CsrValor ON FsrTablaOpe.valor = CsrValor.numero;
left JOIN CsrCtacte ON FsrTablaOpe.cliente = VAL(CsrCtacte.cnumero);
left JOIN CsrClaseValor ON CsrValor.idclase = CsrClaseValor.id;
where CsrMovBco.tipocomp=3 ;
INTO CURSOR CsrAuxMovBco READWRITE 

SELECT CsrAuxMovBco
INDEX on orden+STR(numcomp,10) TAG kcheque
SET ORDER TO kcheque

oavisar.proceso('N')

SELECT CsrCabeAsi
GO BOTTOM 
lnNumCabe = CsrCabeAsi.numero

&&Para los recibos de pago, las retenciones nose encuentran en el moviprov.
&&De esa manera los buscamos en el tablaope y los cargamos en las variables.


SELECT CsrPosterior
Oavisar.proceso('S','Procesando movimientos posteriores')
GO TOP 
SCAN  
	SELECT CsrCtacte
	LOCATE FOR VAL(cnumero)=CsrPosterior.cliente
	IF FOUND()
		*ldfechas=DATETIME(YEAR(CsrPosterior.fecha),month(CsrPosterior.fecha),day(CsrPosterior.fecha),0,0,0)
		
		lcletra		= LTRIM(CsrPosterior.letra)
		DO CASE 
			CASE CsrPosterior.tipocomp=1 OR CsrPosterior.tipocomp=2 &&Ticket - Factura
				lnidcomproba=22
				lcclasecomp="A"
				lcorigen = "CPR"
				lcletra		= IIF(LEN(LTRIM(lcletra))=0,IIF(CsrCtacte.tipoiva=111,"A","B"),LEFT(CsrPosterior.letra,1))
			CASE CsrPosterior.tipocomp=3 &&N. Debito
				lnidcomproba=1100000055
				lcclasecomp="B"
				lcorigen = "CPR"
				lcletra		= IIF(LEN(LTRIM(lcletra))=0,IIF(CsrCtacte.tipoiva=111,"A","B"),LEFT(CsrPosterior.letra,1))
			CASE CsrPosterior.tipocomp=4 &&N. Credito
				lnidcomproba=7
				lcclasecomp="C"
				lcorigen = "CPR"
				lcletra		= IIF(LEN(LTRIM(lcletra))=0,IIF(CsrCtacte.tipoiva=111,"A","B"),LEFT(CsrPosterior.letra,1))
			CASE CsrPosterior.tipocomp=5 OR CsrPosterior.tipocomp=6 &&OPago
				lnidcomproba=8
				lcclasecomp="D"
				lcorigen = "PAG"
				lcletra		= IIF(LEN(LTRIM(lcletra))=0,"X",LEFT(CsrPosterior.letra,1))
			CASE CsrPosterior.tipocomp=12 &&Credito Interno
				lnidcomproba=1100000050
				lcclasecomp="G"
				lcorigen = "PAG"
				lcletra		= IIF(LEN(LTRIM(lcletra))=0,"X",LEFT(CsrPosterior.letra,1))
			CASE CsrPosterior.tipocomp=11 &&Debito Interno
				lnidcomproba=1100000049
				lcclasecomp="F"
				lcorigen = "PAG"
				lcletra		= IIF(LEN(LTRIM(lcletra))=0,"X",LEFT(CsrPosterior.letra,1))
			CASE CsrPosterior.tipocomp=8&&Liq de Compra
				lnidcomproba=44
				lcclasecomp="A"
				lcorigen = "CPR"
				lcletra		= IIF(LEN(LTRIM(lcletra))=0,IIF(CsrCtacte.tipoiva=111,"A","B"),LEFT(CsrPosterior.letra,1))
		ENDCASE
		
		SELECT CsrCajas
		LOCATE FOR caja = CsrPosterior.nro_caja
		SELECT CsrDetaNroCaja
		LOCATE FOR nrocaja = VAL(DTOS(CsrCajas.fecha))
		IF nrocaja != VAL(DTOS(CsrCajas.fecha)) OR nrocaja = 0
			GO TOP 
		ENDIF 
		lniddetanrocaja = CsrDetaNroCaja.id
		
		lcnum		= STRZERO(CsrPosterior.numcomp,8)
		lcnum		= IIF(LEN(LTRIM(lcnum))=0,strtran(str(VAL(CsrCtacte.cnumero),8,0),' ','0'),lcnum)
		lctalonario	= STRZERO(CsrPosterior.talonario,4)
		lctalonario = IIF(LEN(LTRIM(lctalonario))=0,"0000",lctalonario)
		lcnumero	= lcletra+lctalonario+lcnum
		ldfecha		= FechaHoraCero(CsrPosterior.fecha_fac)
		ldfechaserver	= DATETIME()
		ldfechasis	= FechaHoraCero(ldfechaserver)
		cSwitch		= "0000" + IIF(LEFT(CsrPosterior.orden,1)='*','9','0')
		
		
		SELECT CsrProvincia
		LOCATE FOR ALLTRIM(letracpostal) = ALLTRIM(CsrPosterior.codprovincia)
		lnidprovincia	= CsrProvincia.id
		
		oavisar.proceso('S',CsrCtacte.cnombre+" "+ALLTRIM(lcnumero)+" "+DTOC(ldfecha))
		
		INSERT INTO CsrMaopera (id,origen,programa,sucursal,terminal,sector	,fechasis,idoperador;
		,idvendedor,iddetanrocaja,idcomproba,numcomp,clasecomp,turno,puestocaja,idcotizadolar,switch;
		,estado,detalle,fechaserver);
		VALUES (lnidmaopera,lcorigen,"IMPORTACION MOVIMIENTOS",goapp.sucursal,goapp.terminal,1,ldfechasis;
		,1,0,lniddetanrocaja,lnidcomproba,lcnumero,lcclasecomp,1,1,1,cSwitch,"0","Importación";
		,ldfechaserver)
		
		lbGeneraAsto = .f.
		SELECT CsrTablaOpe
		LOCATE FOR VAL(orden) = VAL(CsrPosterior.orden)
		IF NOT (VAL(orden) = VAL(CsrPosterior.orden))
			INSERT INTO CsrTablaOpe (idmaopera,orden,origen);
			VALUES (CsrMaopera.id,CsrPosterior.orden,CsrMaopera.origen)
			lbGeneraAsto = .t.
		ENDIF 
		
		STORE 0 TO lnidareaneg,lnidactividad
		SELECT CsrActividad
		LOCATE FOR numero = CsrPosterior.actividad
		lnidactividad = CsrActividad.id
		
		INSERT INTO CsrEMaopera (id,idmaopera,idareaneg,oblealp,idactividad,idprovincia);
		VALUES (lnidemaopera,lnidmaopera,lnidareaneg,"",lnidactividad,lnidprovincia)
		
		STORE 0 TO lnidsubcta,lnbonif1,lnbonif2,lnlistaprecio,lnidfletero,lnidfuerzavta,lnidrutavdor
		STORE 0 TO lnhojaactual,lnhojatotal,lnidfrio,lntasamuni,lndiferida,lnidtiponcredito,lnrendida
		
		lnidctacte		= CsrCtacte.id
		lcctacte		= Csrctacte.cnumero
		
		ldfechavto		= DATETIME(YEAR(CsrPosterior.vencimien),MONTH(CsrPosterior.vencimien),DAY(CsrPosterior.vencimien),0,0,0)
		
		
		lcdetalle		= CsrPosterior.detalle
		lccnombre		= CsrCtacte.cnombre
		lccdireccion	= CsrCtacte.cdireccion
		lcctelefono		= CsrCtacte.ctelefono
		lccpostal		= CsrCtacte.cpostal
		lnidlocalidad	= CsrCtacte.idlocalidad
		lnidtipoiva		= CsrCtacte.tipoiva
		lccuit			= CsrCtacte.cuit
		lnidplanpago	= CsrCtacte.idplanpago
		lcswitch		="00000"
		lnidcategoria	= Csrctacte.idcategoria
		lnidlotemaopera	= lnidmaopera
		lcnropatron		= ""
		lcperiodo		= CsrPosterior.periodo
		lnimporte		= ABS(CsrPosterior.importe)
		lntotal			= lnimporte
		lnentrega		= ABS(CsrPosterior.decontado)
		lnsaldo			= ABS(CsrPosterior.saldo)
	
		replace idmaopera WITH lnidmaopera IN CsrPosterior
		&&Hya casos que se entrega el total y mantiene saldo.
		IF lnImporte != lnEntrega
			INSERT INTO CsrOrden (orden,idmaopera) VALUES (CsrPosterior.orden,lnidmaopera)
		ENDIF 
		
		lnsigno=1
		IF lnidcomproba=22 OR lnidcomproba=44 OR lnidcomproba=1100000049 OR lnidcomproba=1100000055
			IF lnimporte<0
				lnimporte=lnimporte*-1
			ENDIF 
			lnsigno=-1
		ENDIF
		
		IF lcorigen$'CPR'	 && si es un pago no grabo el cabepra			
			INSERT INTO CsrCabeCpra (id,idmaopera,idctacte,ctacte,cnombre,cdireccion,ctelefono;
			,cpostal,idlocalidad,idprovincia,idtipoiva,cuit,fecha,idplanpago,total,switch,idcategoria;
			,signo,pefiscal,recodevol);
			VALUES (lnidcabecpra,lnidmaopera,lnidctacte,lcctacte,lccnombre,lccdireccion,lcctelefono;
			,lccpostal,lnidlocalidad,lnidprovincia,lnidtipoiva,lccuit,ldfecha,lnidplanpago,lntotal;
			,lcswitch,lnidcategoria,lnsigno,lcperiodo,0)
			
			lnidcabecpra	= lnidcabecpra+1
        ENDIF 
        cSwitch		= "0000" + IIF(LEFT(CsrPosterior.orden,1)='*','9','0')
		INSERT INTO CsrMovctacte (id,idmaopera,fecha,ctacte,idctacte,subnumero,idsubcta,cuota,importe,saldo;
		,entrega,vencimien,total,detalle,pefiscal,switch,signo);
		VALUES (lnidmovctacte,lnidmaopera,ldfecha,lcctacte,lnidctacte," ",0,1,lnimporte,lnsaldo;
		,lnentrega,ldfechavto,lnimporte,"Comp.Importado - "+lcdetalle,lcperiodo,cSwitch,lnsigno)
		
		&&id para los asientos de impuestos
		lnidauxmovctacte	= lnidmovctacte
		lnidauxmaopera		= lnidmaopera
		
		&&Generamos contabilidad
		IF lbGeneraAsto
			*ldFecha = 
			lcDetalle = ""
			lnNumCabe = lnNumCabe + 1
			*lnIdOrigen = lnidauxmaopera
			 
			INSERT INTO CsrCabeAsi	(id,idmaopera,idejercicio,numero,fecha,tipoasi,detalle);
			VALUES (lnidCabeasi,lnidauxmaopera,goapp.idejercicio,lnnumcabe,ldfecha,'C',lcdetalle)
			lnidCabeAsi = lnidCabeAsi + 1
		
			SELECT FsrTablaOpe
			GO TOP 
			LOCATE FOR VAL(orden ) = VAL(CsrTablaOpe.orden)
			DO WHILE !EOF() AND VAL(orden ) = VAL(CsrTablaOpe.orden)
				lcDebeHaber = FsrTablaOpe.debehaber
				SELECT CsrPlanCue
				LOCATE FOR cuenta = FsrTablaOpe.concepto
				lnidcuenta	= CsrPlanCue.id
				lnImporte	= FsrTablaOpe.importe
				lctablaori	= "ASTO"
				lctablaori	= IIF(FsrTablaOpe.valor=7,"MOCT",lctablaori)
				lctablaori	= IIF(FsrTablaOpe.valor=1,"CAJA",lctablaori)
				lctablaori	= IIF(FsrTablaOpe.valor=2,"CAJA",lctablaori)
				lnIdOrigen	= IIF(lctablaori='MOCT',lnidauxmovctacte,lnidauxmaopera)
				lctipoconce	= "**"
				lcdetalle	= FsrTablaOpe.detalle
				INSERT INTO CsrTablaasi (id,idmaopera,idcuenta,debehaber,importe,idorigen,tablaori,tipoconce;
				,detalle);
				VALUES (lnidTablaasi,lnidauxmaopera,lnidcuenta,lcdebehaber,lnimporte,lnidorigen,lctablaori;
				,lctipoconce,lcdetalle)

				lnidTablaasi = lnidTablaasi + 1
				SELECT FsrTablaOpE
				SKIP 
			ENDDO 	
		ENDIF 
		
		lnidmovctacte	= lnidmovctacte+1
		lnidmaopera		= lnidmaopera+1
		lnidemaopera	= lnidemaopera + 1 
		
         &&Generamos los asientos de los impuestos.
		lnBaseImp	= IIF(lcorigen$"CPR",0,lntotal)
		
		IF VAL(CsrPosterior.orden) =  44782
			stop()
		ENDIF 
		IF CsrPosterior.TotalNG#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrParaConta
			LOCATE FOR numero = 19
			IF !numero = 19
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalNG
			lntasa		= 0
			lnBaseImp	= lnBaseImp + lnImporte
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"NG";
     		,lnimporte,lntasa,0,"",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF 
		IF CsrPosterior.TotalEX#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrParaConta
			LOCATE FOR numero = 24
			IF !numero = 24
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalEX
			lntasa		= 0
			lnBaseImp	= lnBaseImp + lnImporte
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"EX";
     		,lnimporte,lntasa,0,"",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF
		IF CsrPosterior.TotalII#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrParaConta
			LOCATE FOR numero = 21
			IF !numero = 21
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalII
			lntasa		= 0
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"II";
     		,lnimporte,lntasa,0,"",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF 	
		IF CsrPosterior.TotalIG#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrParaConta
			LOCATE FOR numero = 13
			IF !numero = 13
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalIG
			lntasa		= CsrPosterior.tasa
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"IG";
     		,lnimporte,lntasa,lnBaseImp,"",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF 	
		IF CsrPosterior.TotalOI#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			lnBase = CsrPosterior.TotalNG
			
			SELECT CsrParaConta
			LOCATE FOR numero = 34
			IF !numero =34
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalOI
			lntasa		= ROUND((CsrPosterior.TotalOI*100)/lnBase,1)
			lntasa		= ROUND(lntasa,IIF(lntasa<1,1,0))
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"OI";
     		,lnimporte,lntasa,lnBase,"",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF	
		IF CsrPosterior.TotalRG#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrParaConta
			LOCATE FOR numero = 10
			IF !numero = 10
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalRG
			lntasa		= ROUND((lnimporte*100)/lnBaseImp,1)
			lntasa		= ROUND(lntasa,IIF(lntasa<1,1,0))
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"RG";
     		,lnimporte,lntasa,lnBaseImp,"IBTO2",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF 
		IF CsrPosterior.TotalRI#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrParaConta
			LOCATE FOR numero = 7
			IF !numero = 7
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalRI
			lntasa		= ROUND((lnimporte*100)/CsrPosterior.TotalNG,1)
			lntasa		= ROUND(lntasa,IIF(lntasa<1,1,0))
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"RI";
     		,lnimporte,lntasa,lnBaseImp,"",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF 
		IF CsrPosterior.TotalRB#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrProvincia
			LOCATE FOR id = lnidprovincia
			SELECT CsrProvCtaCon
			LOCATE FOR idprovincia = lnidprovincia
			lnidcuenta = CsrProvCtaCon.idctarete

			IF lnidcuenta=0
				SELECT CsrParaConta
				LOCATE FOR numero = 9
				IF !numero = 9
					LOOP 
				ENDIF 
				lnidcuenta = CsrParaConta.idcuenta
			ENDIF 
			lnimporte	= CsrPosterior.TotalRB
			lntasa		= ROUND((lnimporte*100)/lnBaseImp,1)
			lntasa		= ROUND(lntasa,IIF(lntasa<1,1,0))
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"RB";
     		,lnimporte,lntasa,lnBaseImp,"IBTO2",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF 
		&&Las percepciones son donde se recibe la mercaderia. Eso es BsAs
		IF CsrPosterior.TotalPB#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrProvincia
			LOCATE FOR letracpostal = "B"
			lnconta = 8
			SELECT CsrParaConta
			LOCATE FOR numero = lnconta
			IF !numero =lnconta
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalPB
			lntasa		= ROUND((lnimporte*100)/lnBaseImp,1)
			lntasa		= ROUND(lntasa,IIF(lntasa<1,1,0))
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"PB";
     		,lnimporte,lntasa,lnBaseImp,"IBTO2",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF
		
		IF CsrPosterior.TotalPG#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			SELECT CsrParaConta
			LOCATE FOR numero = 11
			IF !numero =11
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalPG
			lntasa		= ROUND((lnimporte*100)/lnBaseImp,1)
			lntasa		= ROUND(lntasa,IIF(lntasa<1,1,0))
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"PG";
     		,lnimporte,lntasa,lnBaseImp,"",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF
		IF CsrPosterior.TotalPI#0 AND RIGHT(CsrMaopera.switch,1)!='9'
			lnBase = IIF(CsrPosterior.TotalNG#0,CsrPosterior.TotalNG,CsrPosterior.TotalEX)
			IF lnBase =0
				SELECT CsrPosterior
				LOOP 
			ENDIF 
			SELECT CsrParaConta
			LOCATE FOR numero = 6
			IF !numero =6
				LOOP 
			ENDIF 
			lnidcuenta 	= CsrParaConta.idcuenta
			lnimporte	= CsrPosterior.TotalPI
			lntasa		= ROUND((lnimporte*100)/lnBase,1)
			lntasa		= ROUND(lntasa,IIF(lntasa<1,1,0))
			INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
        	,importe,tasa,baseimp,nombre,detalle,idprovincia);
     		VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"PI";
     		,lnimporte,lntasa,lnBase,"",lcdetalle,lnidprovincia)
			lnidtablaimp = lnidtablaimp + 1
		ENDIF
		&&Cargamos los valores de los comprobantes.
		&&Importamos los valores, Retenciones, Percepciones
		SELECT CsrAuxTablaOpe
		GO TOP 
		SEEK CsrPosterior.orden 
		DO WHILE CsrAuxTablaOpe.orden = CsrPosterior.orden
			SELECT CsrParametros
			
			DO CASE 
			CASE CsrParametros.deudores = CsrAuxTablaOpe.concepto OR CsrParametros.proveedore = CsrAuxTablaOpe.concepto
				&&Son de cuenta corriente. No realizamos nada
			CASE CsrAuxTablaOpe.concepto = CsrParametros.perceib AND CsrMaopera.clasecomp='A'
				&&Percepcion de IBTO en compras
			CASE CsrAuxTablaOpe.concepto = CsrParametros.reteib AND CsrMaopera.clasecomp='D'
				&&Retencion de IBTO en pagos
				CASE CsrAuxTablaOpe.clasevalor$'T-P'
					SELECT CsrAuxMovBco
					lcClave = LTRIM(CsrAuxTablaope.orden)+STR(CsrAuxTablaOpe.cheque,10)
					IF !SEEK (lcClave,'CsrAuxMovBco','kcheque')
						SELECT CsrAuxTablaOpe
						SKIP 
						LOOP 
					ENDIF 
					STORE 0 TO lnidmaoperao,lnidorigen,lnidmaoperaa,lnidafecta
					
*!*						IF CsrAuxMovBco.numcomp=40619761
*!*							DEBUG
*!*							SUSPEND 
*!*						ENDIF 
					
					lcidcheque  = CsrAuxTablaOpe.cheque&&CsrAuxMovBco.idcheque					
					lnimporte	= CsrAuxMovBco.importe
					lnnumero	= CsrAuxMovBco.numcomp
					lcbanco		= CsrAuxMovBco.banco
					lclocalidad	= CsrAuxMovBco.localidad
					ldfecha		= CsrAuxMovBco.fecha
					ldfechavto	= CsrauxMovBco.fecha_vto
					lctitular	= CsrAuxMovBco.titular
					lcrecibido	= ""
					lcentregado	= CsrAuxMovBco.nomctacte
					lcdetalle	= CsrAuxMovBco.detalle
					lcSwitch	= IIF(VAL(CsrAuxMovBco.aentregar)+VAL(CsrAuxMovBco.depositados)>0,'1','0')+'0000'
					
					&&grabamos el movimiento como retiro
					INSERT INTO CsrMovbcocar (id,idmaopera,origen,importe,idtipomov,numero;
					,idctabco,banco,localidad,fecha,fechavto,cuit,titular,recibido,entregado;
					,detalle,signo,switch);
					VALUES (lnidmovbcocar,lnidmaopera,'3RO',lnimporte,20,lnnumero,0,lcbanco;
					,lclocalidad,ldfecha,ldfechavto,'',lctitular,lcrecibido;
					,lcentregado,lcdetalle,-1,lcSwitch)	
					lnidorigen	  = lnidmovbcocar
					lnidmovbcocar = lnidmovbcocar + 1	
					DELETE FROM CsrAuxMovBco WHERE numcomp = lcidcheque AND orden = CsrAuxTablaOpe.orden
					*lcidcheque = LTRIM(lcidcheque) + IIF(LEN(LTRIM(lcidcheque))#0,',','') + LTRIM(CsrAuxMovBco.idcheque)
									
					lnidmaoperao	= lnidmaopera
									
					SELECT CsrMovBcocar
					LOCATE FOR numero=lnnumero AND signo=1
					IF FOUND()
						lnidmaoperaa	= CsrMovBcocar.idmaopera
						lnidafecta		= CsrMovBcocar.id
					ENDIF 
					
					INSERT INTO Csrafebcocar(id,idmaoperao,idorigen,idmaoperaa,idafecta);
     				VALUES(lnidafebcocar,lnidmaoperao,lnidorigen,lnidmaoperaa,lnidafecta)
     				
					lnidafebcocar = lnidafebcocar +1
					
				CASE CsrAuxTablaOpe.clasevalor$'E-N'
					
					idorigen	= lnidauxmovctacte
					lctablaori	= 'MOCT'
					lcclase 	= CsrAuxTablaOpe.debehaber
					lnimporte 	= CsrAuxTablaOpe.impvalor
					lcdetalle	= CsrAuxTablaOpe.detalle
					ldfecha		= CsrMovCtacte.fecha
					lnidvalor	= CsrAuxTablaOpe.idvalor

					INSERT INTO Csrmovcaja (id,idmaopera,idorigen,tablaori,clase,importe,detalle;
					,fecha,idvalor);
					VALUES (lnidmovcaja,lnidmaopera,idorigen,lctablaori,clase,lnimporte;
					,lcdetalle,ldfecha,lnidvalor)
					
					lnidmovcaja = lnidmovcaja + 1 
					
*!*					&&HA DETERMINAR PORQUE NO EXISTEN VALORES CON ESAS CLASES	
*!*					CASE CsrAuxTablaOpe.clasevalor$'I-R' &&las ordenas de pago tiene las retenciones tablaope
*!*						lnidprov = IIF(CsrAuxTablaOpe.clasevalor$'I',1100000002,1100000022)
*!*						lnconta	 = IIF(CsrAuxTablaOpe.clasevalor$'I',9,31)
*!*				 	
*!*						SELECT CsrParaConta
*!*						LOCATE FOR numero = lnconta
*!*						IF !numero =lnconta
*!*							LOOP 
*!*						ENDIF 
*!*						lnidcuenta 	= CsrParaConta.idcuenta
*!*						lnimporte	= CsrAuxTablaOpe.impvalor
*!*						lntasa		= ROUND((lnimporte*100)/lnBaseImp,1)
*!*						lntasa		= ROUND(lntasa,IIF(lntasa<1,1,0))
*!*						INSERT INTO tablaimp (id,idmaopera,idorigen,tablaori,idasiento,idcuenta,tipoconce;
*!*	        			,importe,tasa,baseimp,nombre,detalle,idprovincia);
*!*	     				VALUES (lnidtablaimp,lnidauxmaopera,lnidauxmovctacte,"MOCT",0,lnidcuenta,"RB";
*!*	     				,lnimporte,lntasa,lnBaseImp,"IBTO2",lcdetalle,lnidprov)
*!*						lnidtablaimp = lnidtablaimp + 1
			ENDCASE 
			SELECT CsrAuxTablaOpe
			SKIP 
		ENDDO 
 
	ENDIF
	SELECT CsrPosterior
ENDSCAN 
oavisar.proceso('S','Armando afectaciones..')



SELECT 'D' as tipo,CsrAfeProv.orden,CsrAfeProv.ordenafe,CsrAfeProv.importe,CsrAfeProv.estado;
FROM CsrOrden inner JOIN CsrAfeProv ON CsrOrden.orden = CsrAfeProv.orden WHERE estado<>'A';
union ALL ;
SELECT 'A' as tipo,CsrAfeProv.ordenafe as orden,CsrAfeProv.orden as ordenafe,CsrAfeProv.importe;
,CsrAfeProv.estado FROM CsrOrden inner JOIN CsrAfeProv ON CsrOrden.orden = CsrAfeProv.ordenafe;
WHERE estado<>'A';
INTO CURSOR CsrAfectados READWRITE 

SELECT CsrAfectados
INDEX on orden TAG orden 
INDEX on ordenafe TAG ordenafe
SET ORDER TO orden 

*!*	SELECT * FROM CsrAfectados WHERE orden in ("0000830637","0000830745") ;
*!*	OR ordenafe in ("0000830637","0000830745") 

SELECT CsrPosterior
GO TOP 
Oavisar.proceso('S','Procesando afectaciones..') 

SCAN  
	SELECT CsrOrden
	SEEK CsrPosterior.orden
	IF !FOUND()
		LOOP 
	ENDIF 
	SELECT CsrMaopera
	LOCATE FOR id = CsrOrden.idmaopera
	IF FOUND()
		lnRecnoMaope= RECNO()
		lcclasecomp	=	CsrMaopera.clasecomp
		lcorigen	= 	CsrMaopera.origen
		lnidcomproba=	CsrMaopera.idcomproba
		
		SELECT CsrMovCtacte
		LOCATE FOR idmaopera = CsrMaopera.id
		
		&&Imputamos el comprobante
		SELECT CsrAfectados
		SEEK CsrOrden.orden &&AND tipo = lctipo
		
		&&Puede que un comporbante afecte a mas d eun comprobante
		DO WHILE CsrAfectados.orden = CsrPosterior.orden AND !EOF() &&AND tipo=lctipo
			lnRecnoAfe = RECNO()

			&&Si lo encontramos en el afeprov. fue afectado 
			IF orden = CsrPosterior.orden AND !(CsrAfectados.estado$'A')
				STORE 0 TO lnidmaoperad,lniddebe,lnidmaoperah,lnidhaber,lnimporte
				llok = .f.
				&&Posicionamos en el comprobante afectador/afectado
				SELECT CsrOrden
				SEEK CsrAfectados.orden
				&&Si lo encontramos generamos la afectacion por el comprobante
				IF CsrOrden.orden = CsrAfectados.orden AND FOUND()
					SELECT CsrMovCtacte
					LOCATE FOR idmaopera = CsrOrden.idmaopera
					llok = IIF(idmaopera = CsrOrden.idmaopera,.t.,llok)
				ENDIF 
				IF !llok
					SELECT CsrAfectados
					SKIP
					LOOP 
				ENDIF 
				*Molisud se puden afectar de muchas formas, respetamos el afectador
				*Debe Afectado - Haber Afectador
*!*					lnidhaber 	 = IIF((CsrMaopera.clasecomp$'A-B-C-G-F'),0,CsrMovCtacte.id)
*!*					lniddebe 	 = IIF(!(CsrMaopera.clasecomp$'A-B-C-G-F'),0,CsrMovCtacte.id)
*!*					lnidmaoperah = IIF((CsrMaopera.clasecomp$'A-B-C-G-F'),0,CsrMovCtacte.idmaopera)
*!*					lnidmaoperad = IIF(!(CsrMaopera.clasecomp$'A-B-C-G-F'),0,CsrMovCtacte.idmaopera)

				lnidhaber 	 = IIF((CsrAfectados.tipo='D'),CsrMovCtacte.id,0)
				lniddebe 	 = IIF(!(CsrAfectados.tipo='D'),CsrMovCtacte.id,0)
				lnidmaoperah = IIF((CsrAfectados.tipo='D'),CsrMovCtacte.idmaopera,0)
				lnidmaoperad = IIF(!(CsrAfectados.tipo='D'),CsrMovCtacte.idmaopera,0)

				IF CsrMaopera.clasecomp$"A-B-C"
					lnidhaber 	 = 0
					lniddebe 	 = CsrMovCtacte.id
					lnidmaoperah = 0
					lnidmaoperad = CsrMovCtacte.idmaopera				
				ENDIF 
				IF CsrMaopera.clasecomp$"D"
					lnidhaber 	 = CsrMovCtacte.id
					lniddebe 	 = 0
					lnidmaoperah = CsrMovCtacte.idmaopera		
					lnidmaoperad = 0			
				ENDIF 
				
				lnimporte	 = CsrAfectados.importe	
				
				lnordenabuscar = CsrAfectados.ordenafe &&Afectado/Afectado
				lnEntro=0
				llok = .f.
				&&Buscamos si existe el afectador/afectado en el CsrPosterior
				SELECT CsrOrden
				SEEK lnOrdenABuscar
				&&Si lo encontramos generamos la afectacion por el comprobante
				IF CsrOrden.orden = lnordenabuscar AND FOUND()
					SELECT CsrMovCtacte
					LOCATE FOR idmaopera = CsrOrden.idmaopera
					IF idmaopera = CsrOrden.idmaopera
						llok = .t.
						lnEntro=1
					ENDIF 	
					nOrden		= CsrAfectados.orden
					nOrdenAfe	= CsrAfectados.ordenafe
					replace ALL estado WITH 'A' FOR orden=nOrden AND ordenafe = nOrdenAfe IN CsrAfectados
					replace ALL estado WITH 'A' FOR ordenAfe=nOrden AND orden = nOrdenAfe IN CsrAfectados
					GO lnRecnoAfe IN CsrAfectados
					
*!*						&&Si el afectado es una orden de pago. No importa el comprobante afectador. Es un error.
*!*						SELECT CsrMaopera
*!*						LOCATE FOR id = CsrMovCtacte.idmaopera
*!*						IF id = CsrMovCtacte.idmaopera AND CsrMaopera.clasecomp='D' AND CsrAfectados.tipo='D'
*!*							lnidhaber_		= lnidhaber
*!*							lniddebe_		= lniddebe
*!*							lnidmaoperah_	= lnidmaoperah
*!*							lnidmaoperad_	= lnidmaoperad
*!*							
*!*							lnidhaber 	 = IIF((lnidhaber=0),lniddebe_,0)
*!*							lniddebe 	 = IIF((lniddebe=0),lnidhaber_,0)
*!*							lnidmaoperah = IIF((lnidmaoperah=0),lnidmaoperad_,0)
*!*							lnidmaoperad = IIF((lnidmaoperad=0),lnidmaoperah_,0)					
*!*						ENDIF 
*!*						
*!*						GO lnRecnoMaope IN CsrMaopera
				ELSE
					&&afectaciones con orden nulo
					IF LEN(LTRIM(lnordenabuscar))=0
						LOOP 
					ENDIF 
					&&Sino esta en los posteriores. Debemos afectar al saldo anterior
					&&Es decir, saldo, importe, total, para al afectar el saldo vuelva al correspondiente
					SELECT CsrMovCtacte
					LOCATE FOR VAL(CsrMovCtacte.ctacte)=CsrPosterior.cliente AND RIGHT(switch,1)='9'
					IF VAL(CsrMovCtacte.ctacte)=CsrPosterior.cliente AND RIGHT(switch,1)='9'

						lnimporteAfe = CsrAfectados.importe
						
						*replace saldo WITH saldo + lnImporteAfe IN CsrMovCtacte	
						
						*replace importe WITH importe + lnImporteAfe IN CsrMovCtacte	
						*replace total WITH total + lnImporteAfe IN CsrMovCtacte	
						llok = .t.
						lnEntro = 2
					
					ENDIF 


*!*	*!*						&&Sino esta la afectacion o el afectador. Devolvemos el importe al saldo 		
*!*	*!*						SELECT CsrMovCtacte
*!*	*!*						LOCATE FOR idmaopera = CsrMaopera.id
*!*	*!*						replace saldo WITH CsrAfectados.importe IN CsrMovCtacte
*!*	*!*						
*!*	*!*						llok = .f. &&Para no generar afectacion
				ENDIF 
				
				IF llok
					lnidhaber 	 = IIF(lnidhaber =0,CsrMovctacte.id,lnidhaber)
					lniddebe 	 = IIF(lniddebe =0,CsrMovCtacte.id,lniddebe)
					lnidmaoperah = IIF(lnidmaoperah=0,CsrMovctacte.idmaopera,lnidmaoperah)
					lnidmaoperad = IIF(lnidmaoperad=0,CsrMovCtacte.idMaopera,lnidmaoperad)
					
					lnimporteAfe = CsrAfectados.importe
					
					SELECT CsrAfeCtacte
					LOCATE FOR idmaoperah = lnidmaoperah AND idmaoperad = lnidmaoperad
					IF idmaoperah = lnidmaoperah AND idmaoperad = lnidmaoperad
						&&Si entro por lnEntro=2. Quiere decir que el comprobante esta compactado
						&&Por lo tanto debe incrementar a la afectacion el importe afectado.
						&&Y luego restar al total del comprobante compactado los saldos afectados
						&&Puede ser que se de el caso que incremente el saldo
						&&Si en una N.Credito y un R.Pago.
						IF lnEntro=2
							
							replace importe WITH importe + lnImporteAfe IN CsrAfeCtacte
							*replace saldo WITH saldo - lnImporteAfe IN CsrMovCtacte						
						ENDIF 
						&&Ya se grabo con anterioridad
						SELECT CsrAfectados
						SKIP 
						LOOP 
					ENDIF 
					INSERT INTO Csrafectacte(id,idmaoperad,iddebe,idmaoperah,idhaber,importe);
					VALUES (lnidafectacte,lnidmaoperad,lniddebe,lnidmaoperah,lnidhaber,lnimporte)

					
					lnidafectacte = lnidafectacte +1
				ENDIF 
			ENDIF 
			SELECT CsrAfectados
			SKIP 
		ENDDO 
	ENDIF
	SELECT CsrPosterior
ENDSCAN
SELECT CsrAfeCtacte
oavisar.proceso('N')
*BROWSE  



Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
USE IN  CsrAcreedor 
USE IN CsrMoviprov 
USE IN  CsrComproba 
USE IN CsrAfeProv
USE IN CsrOrden
USE IN FsrTablaOpe
USE IN CsrTablaOpeGestion