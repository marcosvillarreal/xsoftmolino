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

llok = CargarTabla(lcData,'MovCtacte')
llok = CargarTabla(lcData,'CabeFac')
llok = CargarTabla(lcData,'TablaImp')
llok = CargarTabla(lcData,'Ctacte')
llok = CargarTabla(lcData,'PlanCue')
llok = CargarTabla(lcData,'Maopera')
llok = CargarTabla(lcData,'MovCaja')
llok = CargarTabla(lcData,'MovBcocar')
llok = CargarTabla(lcData,'Valor')
llok = CargarTabla(lcData,'ClaseValor')
llok = CargarTabla(lcData,'RenCtacte')
llok = CargarTabla(lcData,'Fletero')
llok = CargarTabla(lcData,'DetaNroCaja')
llok = CargarTabla(lcData,'AfeCtacte')
llok = CargarTabla(lcData,'EMaopera')
llok = CargarTabla(lcData,'AreaNeg')


llok = CargarTabla(lcData,'CuerRuta')
llok = CargarTabla(lcData,'CabeRuta')
llok = CargarTabla(lcData,'RutaVdor')

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

USE  ALLTRIM(lcpath )+"\gestion\clientes" in 0 alias CsrDeudor EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\movimien" in 0 alias CsrMovimien EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\comproba" in 0 alias CsrComproba EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\tablaope" in 0 alias CsrTablaOpeGestion EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\movbacar" in 0 alias CsrMovBco EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\afectaci" in 0 alias CsrAfeCta EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\cajas" in 0 alias CsrCajas EXCLUSIVE

*fecha de importacion
ldfecha		=CTOD(lcfecha)
lcfiscal	=ALLTRIM(STR(YEAR(ldfecha)))+ALLTRIM(STRzero(MONTH(ldfecha),2,0))+ALLTRIM(STRzero(DAY(ldfecha),2,0))

lnidmaopera		= RecuperarID('CsrMaopera',Goapp.sucursal10)
lnidrenCtacte	= RecuperarID('CsrRenCtacte',Goapp.sucursal10)
lnidmovctacte	= RecuperarID('CsrMovCtacte',Goapp.sucursal10)
lnidcabefac		= RecuperarID('CsrCabefac',Goapp.sucursal10)
lindtablaimp	= RecuperarID('CsrTablaImp',Goapp.sucursal10)
lnidmovcaja		= RecuperarID('CsrMovCaja',Goapp.sucursal10)
lnidmovbcocar	= RecuperarID('CsrMovBcocar',Goapp.sucursal10)
lnidafectacte	= RecuperarID('CsrAfeCtacte',Goapp.sucursal10)
lnidemaopera	= RecuperarID('CsrEMaopera',Goapp.sucursal10)

lnidtablaasi	= RecuperarID('CsrTablaAsi',Goapp.sucursal10)
lnidcabeasi		= RecuperarID('CsrCabeAsi',Goapp.sucursal10)

ldfechasis	=DATETIME(YEAR(ldfecha),MONTH(ldfecha),DAY(ldfecha),0,0,0)
ldfechas	=DATETIME(YEAR(DATE()),MONTH(DATE()),DAY(DATE()),0,0,0)

oavisar.proceso("S","Reindexando TablaOpe por orden...")
SELECT CsrTablaOpeGestion.* FROM CsrTablaOpeGestion;
ORDER BY orden INTO CURSOR FsrTablaOpe
SELECT FsrTablaOpe
INDEX on orden TO FsrTablaOpe

		
Oavisar.proceso('S','Recalculando saldo anterior') 	

Oavisar.proceso('S','Extrayendo comprobantes desde la fecha')		
*fecha de importacion
ldfecha		=CTOD(lcfecha)

SELECT CsrMovimien.cliente,CsrMovimien.detalle,CsrMovimien.Importeco as importe;
,CsrMovimien.fecha,CsrMovimien.letra,CsrMovimien.talonario,CsrMovimien.numcomp ,CsrMovimien.saldocomp;
,CsrMovimien.vencimien,CsrMovimien.orden,CsrMovimien.tipocomp;
,CsrMovimien.negocio,CsrMovimien.nro_caja,CAST(0 as n(12)) as idmaopera;
,CsrMovimien.diasprome ;
FROM CsrMovimien ;
LEFT JOIN CsrComproba ON CsrMovimien.tipocomp=CsrComproba.numero ;
WHERE CsrMovimien.fecha=>ldfecha;
order by cliente into cursor CsrPosterior READWRITE 

SELECT FsrTablaOpe.Orden,FsrTablaOpe.importe as impvalor;
,IIF(ISNULL(CsrClaseValor.numero),'',CsrClaseValor.numero) as clasevalor;
,IIF(ISNULL(CsrValor.id),0,CsrValor.id) as idvalor,FsrTablaOpe.cheque;
,FsrTablaOpe.cliente,FsrTablaOpe.debehaber,FsrTablaOpe.detalle;
FROM CsrPosterior;
left JOIN FsrTablaOpe ON CsrPosterior.orden = FsrTablaOpe.orden;
left JOIN CsrValor ON FsrTablaOpe.valor = CsrValor.numero;
left JOIN CsrClaseValor ON CsrValor.idclase = CsrClaseValor.id;
where valor<>0 into CURSOR CsrAuxTablaOpe READWRITE 

SELECT CsrAuxTablaOpe
INDEX on orden TAG korden
SET ORDER TO korden

SELECT CsrMovBco.*,FsrTablaOpe.vendedor,FsrTablaOpe.cliente;
,IIF(ISNULL(CsrClaseValor.numero),'',CsrClaseValor.numero) as clasevalor;
,IIF(ISNULL(CsrValor.id),0,CsrValor.id) as idvalor;
,IIF(ISNULL(CsrCtacte.cnombre),SPACE(25),CsrCtacte.cnombre) as nomctacte;
,IIF(!(CsrMovBco.entregado),'0','1') as aentregar;
,IIF(!(CsrMovBco.depositado),'0','1') as depositados;
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
vista()

oavisar.proceso('N')

lcidcheque = ""

SELECT CsrCabeAsi
GO BOTTOM 
lnNumCabe = CsrCabeAsi.numero

SELECT CsrPosterior

Oavisar.proceso('S','Procesando movimientos posteriores') 

SCAN  FOR !EOF('CsrPosterior')
	SELECT CsrCtacte
	LOCATE FOR VAL(cnumero)=CsrPosterior.cliente
	IF FOUND()
		*ldfechas=DATETIME(YEAR(CsrPosterior.fecha),month(CsrPosterior.fecha),day(CsrPosterior.fecha),0,0,0)
		lnsigno		= 1
		lnimporte	= ABS(CsrPosterior.importe)
		lntipocomp	= CsrPosterior.tipocomp
		lnidcomproba= 0
		lcDebeHaberMov = ""
		DO case
			CASE lntipocomp=2	&& factura
				lnidcomproba = 1
				lcclasecomp	 = 'A'
				lcDebeHaberMov = "D"
			CASE lntipocomp=3	&& n.deb
				lnidcomproba = 2
				lclasecomp	 = 'B'
				lcDebeHaberMov = "D"
			CASE lntipocomp	=4	&& n.cre
				lnidcomproba = 3
				lcclasecomp	 ='C'
				lnsigno 	 = -1
				lcDebeHaberMov = "H"
			CASE lntipocomp = 5 OR lntipocomp=6 &&recibos manuales entrada
				lnidcomproba = 4
				lcclasecomp	 ='D'
				lnsigno = -1
				lcDebeHaberMov = "H"
			CASE lntipocomp = 12 &&credito
				lnidcomproba = 37
				lcclasecomp	 ='G'
				lnsigno		 = -1
				lcDebeHaberMov = "H"
			CASE lntipocomp=11 &&debito
				lnidcomproba = 36
				lcclasecomp	 ='F'
				lcDebeHaberMov = "D"
			CASE lntipocomp=7 &&recibo de salida
				lnidcomproba = 43
				lcclasecomp	 ='D'
				lcDebeHaberMov = "D"
		ENDCASE 
	
		lnimporte	= CsrPosterior.importe
		
		lcdetalle	= IIF(lcclasecomp="D","Recibo","Movimiento ctacte")+" Importado"
		lcorigen	= "COB" &&IIF(lcclasecomp="D","COB","MOV")
		
		*----------Vendedor actual
		lnidvendedor  = 0
		SELECT CsrCuerRuta
		LOCATE FOR idctacte = CsrCtacte.id
		SELECT CsrCabeRuta
		LOCATE FOR id= CsrCuerRuta.idcaberuta
		SELECT CsrRutaVdor
		LOCATE FOR id = CsrCabeRuta.idrutavdor
		lnidvendedor = CsrRutaVdor.idvendedor 
		*--------------------
		
		SELECT CsrCajas
		LOCATE FOR caja = CsrPosterior.nro_caja
		SELECT CsrDetaNroCaja
		LOCATE FOR nrocaja = VAL(DTOS(CsrCajas.fecha))
		IF nrocaja != VAL(DTOS(CsrCajas.fecha)) OR nrocaja = 0
			GO TOP 
		ENDIF 
		lniddetanrocaja = CsrDetaNroCaja.id
		
		lcletra		= LTRIM(CsrPosterior.letra)
		lcletra		= IIF(LEN(LTRIM(lcletra))=0,IIF(CsrCtacte.tipoiva=1,"A","B"),LEFT(CsrPosterior.letra,1))
		lcletra		= IIF(lcclasecomp$"DFG",'X',lcletra)
		lcnum		= STRZERO(CsrPosterior.numcomp,8)
		lcnum		= IIF(LEN(LTRIM(lcnum))=0,strtran(str(VAL(CsrCtacte.cnumero),8,0),' ','0'),lcnum)
		lctalonario	= STRZERO(CsrPosterior.talonario,4)
		lctalonario = IIF(LEN(LTRIM(lctalonario))=0,"0000",lctalonario)
		lcnumero	= lcletra+lctalonario+lcnum
		cSwitch		= "0000" + IIF(LEFT(CsrPosterior.orden,1)='*','9','0')
		
		ldfechaserver	= DATETIME()
		ldfechasis		= FechaHoraCero(ldfechaserver)
		
		INSERT INTO CsrMaopera (id,origen,programa,sucursal,terminal,sector	,fechasis,idoperador;
		,idvendedor,iddetanrocaja,idcomproba,numcomp,clasecomp,turno,puestocaja,idcotizadolar,switch;
		,estado,detalle,fechaserver);
		VALUES (lnidmaopera,lcorigen,"IMPORTACION MOVIMIENTOS",goapp.sucursal,goapp.terminal,1,ldfechasis;
		,1,lnidvendedor,lniddetanrocaja,lnidcomproba,lcnumero,lcclasecomp,1,1,1,cSwitch,"0","Importación";
		,ldfechaserver)
		
		lbGeneraAsto = .f.
		SELECT CsrTablaOpe
		LOCATE FOR VAL(orden) = VAL(CsrPosterior.orden)
		IF NOT (VAL(orden) = VAL(CsrPosterior.orden))
			INSERT INTO CsrTablaOpe (idmaopera,orden,origen);
			VALUES (CsrMaopera.id,CsrPosterior.orden,CsrMaopera.origen)
			lbGeneraAsto = .t.
		ENDIF 
	
		STORE 0 TO lnidareaneg,lnidactividad,lnidprovincia
		SELECT CsrAreaNeg
		LOCATE FOR numero = CsrPosterior.negocio
		lnidareaneg = CsrAreaNeg.id
		
		INSERT INTO CsrEMaopera (id,idmaopera,idareaneg,oblealp,idactividad,idprovincia);
		VALUES (lnidemaopera,lnidmaopera,lnidareaneg,"",lnidactividad,lnidprovincia)
		
		lnidctacte	= CsrCtacte.id
		lcctacte	= Csrctacte.cnumero
		ldfecha		= DATETIME(YEAR(CsrPosterior.fecha),month(CsrPosterior.fecha),day(CsrPosterior.fecha),0,0,0)
		lcperiodo	= ALLTRIM(STR(YEAR(ldfecha)))+ALLTRIM(STRzero(MONTH(ldfecha),2,0))
		lnSaldo		= CsrPosterior.saldocomp
		ldfechavto	= DATETIME(YEAR(CsrPosterior.vencimien),month(CsrPosterior.vencimien),day(CsrPosterior.vencimien),0,0,0)
		lnCuota		= CsrPosterior.cuota
		lnDiasProm	= CsrPosterior.diasprome
		
		replace idmaopera WITH lnidmaopera IN CsrPosterior
		INSERT INTO CsrOrden (orden,idmaopera) VALUES (CsrPosterior.orden,lnidmaopera)
			
		INSERT INTO CsrMovctacte (id,idmaopera,fecha,ctacte,idctacte,subnumero,idsubcta,cuota,importe,saldo;
		,entrega,vencimien,total,detalle,pefiscal,switch,signo,diasprom,totalocuota);
		VALUES (lnidmovctacte,lnidmaopera,ldfecha,lcctacte,lnidctacte," ",0,lncuota,lnimporte,lnSaldo;
		,0,ldfechavto,lnimporte,lcdetalle,lcperiodo,cSwitch,lnsigno,lndias,lncuota)
		
		&&Importamos los valores
		SELECT CsrAuxTablaOpe
		GO TOP 
		SEEK CsrPosterior.orden 
		DO WHILE CsrAuxTablaOpe.orden = CsrPosterior.orden
			
			DO CASE 
				CASE CsrAuxTablaOpe.clasevalor$'T-P'
					SELECT CsrAuxMovBco
					lcClave = LTRIM(CsrAuxTablaope.orden)+STR(CsrAuxTablaOpe.cheque,10)
					IF !SEEK (lcClave,'CsrAuxMovBco','kcheque')
						SELECT CsrAuxTablaOpe
						SKIP 
						LOOP 
					ENDIF 
					
					lcidcheque  = CsrAuxTablaOpe.cheque &&CsrAuxMovBco.idcheque					
					lnimporte	= CsrAuxMovBco.importe
					lnnumero	= CsrAuxMovBco.numcomp
					lcbanco		= CsrAuxMovBco.banco
					lclocalidad	= CsrAuxMovBco.localidad
					ldfecha		= CsrAuxMovBco.fecha
					ldfechavto	= CsrauxMovBco.fecha_vto
					lctitular	= CsrAuxMovBco.titular
					lcrecibido	= CsrAuxMovBco.recibidode
					lcentregado	= CsrAuxMovBco.nomctacte
					lcdetalle	= CsrAuxMovBco.detalle
					lcSwitch	= IIF(VAL(CsrAuxMovBco.aentregar)+VAL(CsrAuxMovBco.depositados)>0,'1','0')+'0000'
					
					INSERT INTO CsrMovbcocar (id,idmaopera,origen,importe,idtipomov,numero;
					,idctabco,banco,localidad,fecha,fechavto,cuit,titular,recibido,entregado;
					,detalle,signo,switch);
					VALUES (lnidmovbcocar,lnidmaopera,'3RO',lnimporte,16,lnnumero,0,lcbanco;
					,lclocalidad,ldfecha,ldfechavto,'',lctitular,lcrecibido;
					,lcentregado,lcdetalle,1,lcSwitch)	
					
					lnidmovbcocar = lnidmovbcocar + 1	
					DELETE FROM CsrAuxMovBco WHERE numcomp = lcidcheque AND orden = CsrAuxTablaOpe.orden
					*lcidcheque = LTRIM(lcidcheque) + IIF(LEN(LTRIM(lcidcheque))#0,',','') + LTRIM(CsrAuxMovBco.idcheque)
				CASE CsrAuxTablaOpe.clasevalor$'E-N'
					
					idorigen	= lnidmovctacte
					lctablaori	= 'MOCT'
					lcclase 	= CsrAuxTablaOpe.debehaber
					lnimporte 	= CsrAuxTablaOpe.impvalor
					lcdetalle	= CsrAuxTablaOpe.detalle
					ldfecha		= CsrMovCtacte.fecha
					lnidvalor	= CsrAuxTablaOpe.idvalor

					INSERT INTO Csrmovcaja (id,idmaopera,idorigen,tablaori,clase,importe,detalle;
					,fecha,idvalor);
					VALUES (lnidmovcaja,lnidmaopera,lnidmovctacte,lctablaori,clase,lnimporte;
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
		
		
		&&Generamos contabilidad
		IF lbGeneraAsto
			*ldFecha = 
			lcDetalle = ""
			lnNumCabe = lnNumCabe + 1
			lnIdMovOri = CsrMovCtacte.id
			 
			INSERT INTO CsrCabeAsi	(id,idmaopera,idejercicio,numero,fecha,tipoasi,detalle);
			VALUES (lnidCabeasi,lnidmaopera,goapp.idejercicio,lnnumcabe,ldfecha,'C',lcdetalle)
			lnidCabeAsi = lnidCabeAsi + 1
			
			SELECT CsrParaConta
			LOCATE FOR numero=1
			lnIdCaja= CsrParaConta.idcuenta
			lnCajas	= CsrParaconta.concepto
	
			SELECT FsrTablaOpe
			GO TOP 
			LOCATE FOR VAL(orden ) = VAL(CsrTablaOpe.orden)
			DO WHILE !EOF() AND VAL(orden ) = VAL(CsrTablaOpe.orden)
				lcDebeHaber = FsrTablaOpe.debehaber
				SELECT CsrPlanCue
				LOCATE FOR cuenta = FsrTablaOpe.concepto
				lnidcuenta	= CsrPlanCue.id
				lnImporte	= FsrTablaOpe.importe
				lctablaori	= IIF(lnIdCaja=lnidcuenta,"CAJA","MAOP")
				lctablaori 	= IIF(lcDebeHaberMov = lcDebeHaber,"MOCT",lctablaori)
				lnidorigen	= IIF(lcDebeHaberMov = lcDebeHaber,lnIdMovOri,lnIdMaopera)
				lctipoconce	= "**"
				lcdetalle	= FsrTablaOpe.detalle
				INSERT INTO CsrTablaasi (id,idmaopera,idcuenta,debehaber,importe,idorigen,tablaori,tipoconce;
				,detalle);
				VALUES (lnidTablaasi,lnidmaopera,lnidcuenta,lcdebehaber,lnimporte,lnidorigen,lctablaori;
				,lctipoconce,lcdetalle)

				lnidTablaasi = lnidTablaasi + 1
				SELECT FsrTablaOpE
				SKIP 
			ENDDO 	
		ENDIF 
		lnidmovctacte	=lnidmovctacte+1
		lnidmaopera		=lnidmaopera+1
		lnidemaopera	= lnidemaopera + 1 
	ENDIF
	SELECT CsrPosterior
ENDSCAN 

&&Generaremos un registro de cheques en cartera que no fueron grabados. Entregados pero no vencidos
SELECT CsrauxMovBco
GO TOP 
SCAN 
   && cheque
	lnidcomproba = 16
	lcclasecomp	 = 'O'
						
	lnimporte	= CsrAuxMovBco.importe
	lnnumero	= CsrAuxMovBco.numcomp
	lcbanco		= CsrAuxMovBco.banco
	lclocalidad	= CsrAuxMovBco.localidad
	ldfecha		= CsrAuxMovBco.fecha
	ldfechavto	= CsrauxMovBco.fecha_vto
	lctitular	= CsrAuxMovBco.titular
	lcrecibido	= CsrAuxMovBco.recibidode
	lcentregado	= CsrAuxMovBco.nomctacte
	lcdetalle	= CsrAuxMovBco.detalle
		
	lcletra		= " "
	lcnum		= STRZERO(lnnumero,8)
	lcnum		= IIF(LEN(LTRIM(lcnum))=0,strtran(str(VAL(CsrCtacte.cnumero),8,0),' ','0'),lcnum)
	lctalonario	= "0000"
	lcnumero	= lcletra+lctalonario+lcnum
	lcSwitch	= IIF(VAL(CsrAuxMovBco.aentregar)+VAL(CsrAuxMovBco.depositados)>0,'1','0')+'0000'
	
	ldfechaserver	= DATETIME()
	ldfechasis		= FechaHoraCero(ldfechaserver)
		
	INSERT INTO CsrMaopera (id,origen,programa,sucursal,terminal,sector	,fechasis,idoperador;
	,idvendedor,iddetanrocaja,idcomproba,numcomp,clasecomp,turno,puestocaja,idcotizadolar,switch;
	,estado,detalle,fechaserver);
	VALUES (lnidmaopera,"CAR","IMPORTACION MOVIMIENTOS",goapp.sucursal,goapp.terminal,1,ldfechasis;
	,111,111,lniddetanrocaja,lnidcomproba,lcnumero,lcclasecomp,1,1,1,"0000","0","Importación de Cartera";
	,ldfechaserver)
	
	INSERT INTO CsrMovbcocar (id,idmaopera,origen,importe,idtipomov,numero;
	,idctabco,banco,localidad,fecha,fechavto,cuit,titular,recibido,entregado;
	,detalle,signo,switch);
	VALUES (lnidmovbcocar,lnidmaopera,'3RO',lnimporte,lnidcomproba,VAL(lcnum),0,lcbanco;
	,lclocalidad,ldfecha,ldfechavto,'',lctitular,lcrecibido;
	,lcentregado,lcdetalle,1,lcSwitch)	
		
	lnidmovbcocar = lnidmovbcocar + 1
	lnidmaopera		=lnidmaopera+1
ENDSCAN 
Oavisar.proceso('N')
SELECT csrAuxMovBco


oavisar.proceso('S','Armando afectaciones..')



SELECT 'D' as tipo,CsrAfeCta.orden,CsrAfeCta.ordenafe,CsrAfeCta.importe,CsrAfeCta.estado;
FROM CsrOrden inner JOIN CsrAfeCta ON CsrOrden.orden = CsrAfeCta.orden WHERE estado<>'A';
union ALL ;
SELECT 'A' as tipo,CsrAfeCta.ordenafe as orden,CsrAfeCta.orden as ordenafe,CsrAfeCta.importe;
,CsrAfeCta.estado FROM CsrOrden inner JOIN CsrAfeCta ON CsrOrden.orden = CsrAfeCta.ordenafe;
WHERE estado<>'A';
INTO CURSOR CsrAfectados READWRITE 

SELECT CsrAfectados
INDEX on orden TAG orden 
INDEX on ordenafe TAG ordenafe
SET ORDER TO orden 

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

USE IN CsrDeudor
USE IN CsrMovimien
USE IN CsrComproba
USE IN FsrTablaOpe
USE IN CsrMovBco
USE IN CsrAfeCta
USE IN CsrCajas
USE IN CsrTablaOpeGestion

CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
