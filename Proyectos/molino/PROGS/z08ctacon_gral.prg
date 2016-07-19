PARAMETERS ldvacio,lcpath,lcBase
LOCAL lcData,lnid,lcfecha
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
llok = .t.
llok = CargarTabla(lcData,'Producto')
llok = CargarTabla(lcData,'PlanCue')
llok = CargarTabla(lcData,'ProdCtaCon',.t.)
llok = CargarTabla(lcData,'Rubro')
llok = CargarTabla(lcData,'RubroCtaCon',.t.)
llok = CargarTabla(lcData,'CateCtacte')
llok = CargarTabla(lcData,'CateCtacteCtaCon',.t.)
llok = CargarTabla(lcData,'Ctacte')
llok = CargarTabla(lcData,'CtacteCtaCon',.t.)

SET SAFETY ON
IF !llok
	RETURN .f.
ENDIF

USE ALLTRIM(lcpath)+"\gestion\categori" in 0 alias FsrCateCtacte EXCLUSIVE
USE ALLTRIM(lcpath)+"\gestion\proveed" in 0 alias FsrProveedor EXCLUSIVE

lnid=RecuperarID('CsrProdCtaCon',goapp.sucursal10)

SELECT CsrProducto
Oavisar.proceso('S','Procesando los productos con la cuenta contable') 
GO top
SCAN FOR !EOF()
	STORE 0 TO lnIdctavta,lnIdctacpra
	
	SELECT CsrPlanCue 
	LOCATE FOR cuenta = CsrProducto.IdCtaVta
	IF cuenta = CsrProducto.IdCtaVta
		lnIdCtaVta = CsrPlancue.id
	ENDIF 
	SELECT CsrPlanCue 
	LOCATE FOR cuenta = CsrProducto.IdCtaCpra
	IF cuenta = CsrProducto.IdCtaCpra
		lnIdCtaCpra = CsrPlancue.id
	ENDIF 
	lnIdEjercicio = Goapp.idejercicio
	lnidarticulo = CsrProducto.id
	
   	INSERT INTO CsrProdCtaCon(id,idejercicio,idarticulo,idctavta,idctacpra);
    VALUES (lnId, lnidejercicio,lnidarticulo,lnidctavta,lnidctacpra)
    
    lnId = lnId +1  	
	
	replace IdCtaVta WITH 0, IdCtaCpra WITH 0 IN CsrProducto
	
	SELECT CsrProducto 				
ENDSCAN

lnid=RecuperarID('CsrRubroCtaCon',goapp.sucursal10)
SELECT CsrRubro
Oavisar.proceso('S','Procesando los rubros con la cuenta contable') 
GO top
SCAN FOR !EOF()
	STORE 0 TO lnIdctavta,lnIdctacpra
	
	SELECT CsrPlanCue 
	LOCATE FOR cuenta = CsrRubro.Cuenta_No
	IF cuenta = CsrRubro.Cuenta_No
		lnIdCtaVta = CsrPlancue.id
	ENDIF 
	
	lnIdEjercicio = Goapp.idejercicio
	lnidrubro = CsrRubro.id
	
   	INSERT INTO CsrRubroCtaCon(id,idejercicio,idrubro,idctavta,idctacpra);
    VALUES (lnId, lnidejercicio,lnidrubro,lnidctavta,lnidctacpra)
    
    lnId = lnId +1  	
	
	*replace IdTipoProd WITH 1  IN CsrRubro
	
	SELECT CsrRubro			
ENDSCAN

lnid=RecuperarID('CsrCateCtacteCtaCon',goapp.sucursal10)
SELECT CsrCateCtacte
Oavisar.proceso('S','Procesando los cartegorias con la cuenta contable') 
GO top
SCAN FOR !EOF()
	STORE 0 TO lnIdctavta,lnIdctacpra,lnCuenta
	
	SELECT FsrCateCtacte
	LOCATE FOR numero = CsrCateCtacte.numero
	IF numero = CsrCateCtacte.numero
		lncuenta = FsrCateCtacte.cuenta
	ENDIF 
	
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
	lnidcatectacte = CsrCateCtaCte.id
	
   	INSERT INTO CsrCateCtacteCtaCon(id,idejercicio,idcatectacte,idctavta,idctacpra);
    VALUES (lnId, lnidejercicio,lnidcatectacte,lnidctavta,lnidctacpra)
    
    lnId = lnId +1  	
	
	SELECT CsrCateCtacte
ENDSCAN

lnid=RecuperarID('CsrCtacteCtaCon',goapp.sucursal10)
SELECT FsrProveedor
Oavisar.proceso('S','Procesando los proveedores con la cuenta contable') 
GO top
SCAN FOR !EOF()
	STORE 0 TO lnIdctavta,lnIdctacpra,lnCuenta

	lncuenta = FsrProveedor.cuenta
	
	SELECT CsrCtacte
	LOCATE FOR cnumero = ALLTRIM(STR(50000+FsrProveedor.numero))
	IF !cnumero = ALLTRIM(STR(50000+FsrProveedor.numero))
		LOOP 
	ENDIF 
		
*!*		SELECT CsrPlanCue 
*!*		LOCATE FOR cuenta = lnCuenta
*!*		IF cuenta = lnCuenta
*!*			lnIdCtaVta = CsrPlancue.id
*!*		ENDIF 
	
	SELECT CsrPlanCue 
	LOCATE FOR cuenta = lnCuenta
	IF cuenta = lnCuenta
		lnIdCtaCpra = CsrPlancue.id
	ENDIF 
	
	lnIdEjercicio = Goapp.idejercicio
	lnidctacte = CsrCtaCte.id
	
   	INSERT INTO CsrCtacteCtaCon(id,idejercicio,idctacte,idctavta,idctacpra);
    VALUES (lnId, lnidejercicio,lnidctacte,lnidctavta,lnidctacpra)
    
    lnId = lnId +1  	
	
	SELECT FsrProveedor
ENDSCAN
Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
	