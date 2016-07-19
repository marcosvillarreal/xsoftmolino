PARAMETERS ldvacio,lcpath,lcBase
LOCAL lcbdd,lcfecha,lnid
ldvacio = IIF(PCOUNT()<1,"",ldvacio)
lcpath = IIF(PCOUNT()<2,"",lcpath)
lcData = lcBase

DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE  

SET SAFETY OFF

Oavisar.proceso('S','Vaciando archivos') 
SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON

Oavisar.proceso('S','Vaciando archivos') 
llok = .t.
llok = CargarTabla(lcData,'Ctacte')
llok = CargarTabla(lcData,'CtacteCtaCon')
llok = CargarTabla(lcData,'TipoIva')
llok = CargarTabla(lcData,'CateCtacte')
llok = CargarTabla(lcData,'Categoiva')
llok = CargarTabla(lcData,'TipoDoc')
llok = CargarTabla(lcData,'PlanPago')
llok = CargarTabla(lcData,'PlanCue')
llok = CargarTabla(lcData,'Valor')

SET SAFETY ON
Oavisar.proceso('S','Abriendo archivos') 
USE  ALLTRIM(lcpath)+"\gestion\ctabco" in 0 alias FsrCliente EXCLUSIVE
USE  ALLTRIM(lcpath)+"\gestion\valores" in 0 alias FsrValor EXCLUSIVE

Oavisar.proceso('S','Procesando '+alias()) 
SELECT * FROM FsrCliente ORDER BY numero INTO CURSOR FsrBanco

lnid		= RecuperarID('CsrCtacte',Goapp.sucursal10)
lnidctacon 	= RecuperarID('CsrCtacteCtaCon',goapp.sucursal10)

LOCAL lnidlocalidad,lntipoiva,lnctalogistica,lnctadeudor,lnctaacreedor,lnidcategoria,lnidprovincia;
,lnctabanco,lnctaotro,lnidplanpago,lnidcanalvta,lnsaldo,lnsaldoant,lnestadocta,lnbonif1,lnbonif2;
,lncopiatkt,lnconvenio,lnsaldoauto,lnidbarrio,lnidcateibrng,lncomision,lnidtipodoc,lnlista,lndiasvto;
,lnexistegan 

SELECT FsrBanco
Oavisar.proceso('S','Procesando bancos') 	
GO  TOP 
SCAN 
	STORE 0 TO lnidlocalidad,lnidprovincia,lntipoiva,lnidcategoria,lnctadeudor,lnctaacreedor,lnctalogistica;
	,lnctabanco,lnctaotro,lnctaorden,lnidplanpago,lnidcanalvta,lnsaldo,lnsaldoant,lnestadocta;
    ,lnbonif1,lnbonif2,lncopiatkt,lnconvenio,lnsaldoauto,lnidbarrio,lnlista,lnidcateibrng,lncomision;
    ,lnidtipodoc,lnexisteibto,lnexistegan,lndiasvto,lnidtablaint,lnesrecodevol,lntotalizabonif,lnidcategoria;
    ,lnIdCtaVta,lnIdCtaCpra
    
   STORE "" TO lccnumero,lccnombre,lccdireccion,lccpostal,lcctelefono2,lcctelefono,lcemail,lccuit;
    ,lcobserva,lcinscri01,lcinscri02,lcinscri03,lcingbrutos,lcnumdoc
    
     IF recno('FsrBanco')/500=INT(RECNO('FsrBanco')/500)
	   lcTitulo = "Bancos "+STR(RECNO(),10)   
	   Oavisar.proceso('S',lcTitulo,.t.,recno())
	 ENDIF
    
    STORE 1 TO 	lnctabanco, lnidcanalvta
    
	lnestadocta		= 0
	SELECT MAX(VAL(cnumero)) as codigo FROM CsrCtacte INTO CURSOR CsrCodigo READWRITE 
    lccnumero	= ALLTRIM(STR(CsrCodigo.codigo + 1,6))
    
	lccnombre		= 'BANCO '+ALLTRIM(IIF(EMPTY(FsrBanco.banco),FsrBanco.nombre,FsrBanco.banco))+ALLTRIM(FsrBanco.numero)
	lccdireccion	= ""
	lccpostal		= ""
	lcctelefono		= ""
	lcemail			= ""
	lccuit			= ""
	ldfechalta		= DATETIME(1900,01,01,0,0,0)
	lcobserva		= ""
	lcinscri01		= ""
	ldfecins01		= DATETIME(1900,01,01,0,0,0)
	lcinscri02		= ""
	lcinscri03		= ""
	lcingbrutos		= ""
	ldfecultcompra	= DATETIME(1900,01,01,0,0,0)
	ldfecultpago	= DATETIME(1900,01,01,0,0,0)
	lnexisteibto	= 0
	lnexistegan 	= 0
	lcctelefono2 	= ""
	lndiasvto		= 0
	lntipoiva 		= 0
	lcLocalidadBuscada = ""
	lnidplanpago	= 1100000001
	lnplanpago		= 0
	lntotalizabonif	= 0
	lnesrecodevol	= 0
	
	lnidlocalidad 	= 0
	lnidprovincia 	= 0
	lccpostal		= ""
	lccp = ""
	lnidtablaint	= 4 &&Por defecto es el interes de socio
	lcnumdoc		= ""
	
	&&Buscamos si existen los tipo de documento valido
	SELECT CsrTipoDoc
	GO TOP 
	lnidtipodoc = CsrTipoDoc.id
		
	SELECT CsrPlanPago
	LOCATE FOR codigo = lnplanpago
	IF codigo = lnplanpago
		lnidplanpago = CsrPlanPago.id
	ENDIF 
	
	SELECT CsrCateCtacte
	LOCATE FOR ALLTRIM(nombre) = "CTA CTE BANCO"
	IF FOUND()
		lnidcategoria = CsrCateCtacte.id
	ENDIF 
	
	lccuit =""
	SELECT CsrCategoiva
	LOCATE FOR ALLTRIM(abrevia )= "RI"
	IF ALLTRIM(abrevia )= "RI"
		lntipoiva = CsrCategoiva.id
	ENDIF
			
	lccnombre = NombreNi(ALLTRIM(UPPER(lccnombre)))
	lccdireccion = NombreNi(ALLTRIM(UPPER(lccdireccion)))
     
      
	INSERT INTO Csrctacte (id,cnumero,cnombre,cdireccion,cpostal,idlocalidad,idprovincia,ctelefono2;
	,ctelefono,email,tipoiva,cuit,idcategoria,ctadeudor,ctaacreedor,ctalogistica,ctabanco,ctaotro;
	,ctaorden,idplanpago,idcanalvta,fechalta,observa,saldo,saldoant,estadocta,bonif1,bonif2,copiatkt;
	,inscri01,fecins01,inscri02,inscri03,convenio,saldoauto,idbarrio,lista,idcateibrng,ingbrutos;
	,comision,fecultcompra,fecultpago,numdoc,idtipodoc,existeibto,existegan,diasvto,idtablaint,esrecodevol;
	,totalizabonif);
    VALUES(lnid,lccnumero,lccnombre,lccdireccion,lccpostal,lnidlocalidad,lnidprovincia,lcctelefono2;
    ,lcctelefono,lcemail,lntipoiva,lccuit,lnidcategoria,lnctadeudor,lnctaacreedor,lnctalogistica,lnctabanco;
    ,lnctaotro,lnctaorden,lnidplanpago,lnidcanalvta,ldfechalta,lcobserva,lnsaldo,lnsaldoant,lnestadocta;
    ,lnbonif1,lnbonif2,lncopiatkt,lcinscri01,ldfecins01,lcinscri02,lcinscri03,lnconvenio,lnsaldoauto;
    ,lnidbarrio,lnlista,lnidcateibrng,lcingbrutos,lncomision,ldfecultcompra,ldfecultpago,lcnumdoc,lnidtipodoc;
    ,lnexisteibto,lnexistegan,lndiasvto,lnidtablaint,lnesrecodevol,lntotalizabonif)
    
    *Agragamos la cuenta contable del banco
    lncuenta = FsrBanco.cuenta
    
    SELECT CsrPlanCue 
	LOCATE FOR cuenta = lnCuenta
	IF cuenta = lnCuenta
		lnIdCtaVta = CsrPlancue.id
	ENDIF 
	
	SELECT CsrPlanCue 
	LOCATE FOR cuenta = lnCuenta
	IF cuenta = lnCuenta
		lnIdCtaCpra = CsrPlancue.id
	ENDIF 
	
	lnIdEjercicio = Goapp.idejercicio
	lnidctacte = CsrCtaCte.id
	
   	INSERT INTO CsrCtacteCtaCon(id,idejercicio,idctacte,idctavta,idctacpra);
    VALUES (lnIdctacon, lnidejercicio,lnid,lnidctavta,lnidctacpra)
    
    *agregamos a los valores la referencia al banco
    SELECT FsrValor
    GO TOP 
    SCAN 
    	IF !(ALLTRIM(FsrBanco.numero)$ALLTRIM(FsrValor.ctabco))
    		LOOP 
    	ENDIF 
    	SELECT CsrValor
    	LOCATE FOR numero = FsrValor.numero
    	IF numero = FsrValor.numero
    		replace idctabco WITH lnid IN CsrValor
    	ENDIF 
    	SELECT FsrValor
    ENDSCAN 
    
    lnId = lnId +1  	
	lnIdctacon = lnidctacon + 1
	 
	SELECT FsrBanco      
ENDSCAN




Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
USE in FsrBanco 
USE in FsrCliente
USE in FsrValor

CLOSE tables
CLOSE INDEXES
CLOSE DATABASES

