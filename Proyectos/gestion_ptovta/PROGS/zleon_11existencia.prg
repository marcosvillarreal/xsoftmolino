PARAMETERS ldvacio,lcpath
ldvacio = IIF(PCOUNT()<1,"",ldvacio)
lcpath = IIF(PCOUNT()<2,"",lcpath)

LOCAL lnid

DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE  

SET SAFETY OFF

SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON

Oavisar.proceso('S','Abriendo archivos') 
&&Tomamos la ultima caja
TEXT TO lccmd TEXTMERGE NOSHOW 
SELECT TOP 1 CsrDetaNroCaja.* FROM DetaNroCaja as CsrDetaNroCaja
order by id desc
ENDTEXT 
IF !CrearCursorAdapter('CsrDetaNroCaja',lccmd) 
	MESSAGEBOX('Nose puede importar, pq no puede cargar el CsrDetaNroCaja')
	RETURN .f.
ENDIF 
IF RECCOUNT('CsrDetaNroCaja')=0
	MESSAGEBOX('Nose puede importar, pq no hay datos en CsrDetaNroCaja')
	RETURN .f.
ENDIF	
lniddetanrocaja = CsrDetaNroCaja.id

llok = .t.
llok = CargarTabla('leon','Producto')
llok = CargarTabla('leon','Variedad')
llok = CargarTabla('leon','SubProducto')
llok = CargarTabla('leon','Existenc',.t.)
llok = CargarTabla('leon','MovStock',.t.)
llok = CargarTabla('leon','Deposito')
llok = CargarTabla('leon','FuerzaVta')
llok = CargarTabla('leon','CateCtacte')
llok = CargarTabla('leon','Ctacte')
llok = CargarTabla('leon','PlanCue')
llok = CargarTabla('leon','Maopera')

IF !llok
	RETURN .f.
ENDIF

SET SAFETY ON


USE  ALLTRIM(lcpath )+"\gestion\existenc" in 0 alias CsrStock EXCLUSIVE

ldfecha 	= DATE()
ldfechasis	= DATETIME(YEAR(ldfecha),MONTH(ldfecha),DAY(ldfecha),0,0,0)
lnid 		= RecuperarID('CsrExistenc',Goapp.sucursal10)
lnidmov 	= RecuperarID('CsrMovStock',Goapp.sucursal10) 
lnidmaopera	= RecuperarID('CsrMaopera',Goapp.sucursal10) 
lnidsubprod	= RecuperarID('CsrSubProducto',Goapp.sucursal10)


SELECT deposito as iddeposito,numero as idproducto,sabor as numsubprod,exiuni as existe;
,exikilo as kilos;
FROM CsrStock WHERE exiuni<>0 ORDER BY iddeposito,idproducto,numsubprod;
INTO CURSOR 'CsrLista' READWRITE 

oavisar.proceso('N')
SELECT CsrLista
*BROWSE 
Oavisar.proceso('S','Procesando '+alias()) 
GO TOP 
SCAN FOR !EOF('CsrLista')
	SELECT CsrDeposito
	LOCATE FOR numero=CsrLista.iddeposito
	IF FOUND()
		SELECT CsrProducto
		LOCATE FOR numero=CsrLista.idproducto
		IF FOUND()
			lccodigo=ALLTRIM(STR(CsrProducto.numero) )
		  	SELECT CsrVariedad
			LOCATE FOR numero = CsrLista.numsubprod
		  	SELECT CsrSubProducto
		  	LOCATE FOR idvariedad=Csrvariedad.id AND idarticulo =CsrProducto.id
		  	IF !FOUND() AND CsrLista.numsubprod#0
		  	
		  		
		  		lnidarticulo 	= CsrProducto.id
		  		lnnumero		= CsrProducto.numero
		  		lnsubnumero		= CsrVariedad.numero
		  		lcnombre		= CsrVariedad.nombre
		  		lccodigo		= '0'
		  		lctroquel		= '00000000'
		  		lnnofactura		= 1
		  		lnidvariedad	= CsrVariedad.id
		  		lnestado		= 1
		  		
		  		INSERT INTO Csrsubproducto (id,idarticulo,numero,subnumero,nombre,codigo,troquel;
		  		,nofactura,idvariedad,estado);
		  		VALUES (lnidsubprod,lnidarticulo,lnnumero,lnsubnumero,lcnombre,lccodigo,lctroquel,lnnofactura;
		  		,lnidvariedad,lnestado)
				
				lnidsubprod		= lnidsubprod + 1
		  		
			ENDIF 
	  		lnidsub=CsrSubproducto.id
	  		
			lnKilos = CsrLista.kilos
			IF CsrProducto.vtakilos=0
				lnKilos = INT(Round(CsrLista.existe,0)) * CsrProducto.peso
			ENDIF 
			
			ldfecha=DATETIME(1996,1,1,0,0,0)
			
			INSERT INTO CsrExistenc (id,idarticulo,iddeposito,idsubarti,existe,existeant,existedisp,fecvto;
			,kilos,kilosant,kilosdisp,volumen,volumenant,volumendisp);
			 VALUES (lnid,CsrProducto.id,CsrDeposito.id,lnidsub,INT(Round(CsrLista.existe,0)),0;
			 ,INT(Round(CsrLista.existe,0)),ldfecha,lnKilos,0;
			 ,lnKilos,0,0,0)
			 
			lnid=lnid+1
			
			IF CsrLista.existe<>0
				IF CsrLista.existe>0
					lnidcomproba = 9
					lcclasecomp = "L"
				ELSE
					lnidcomproba = 10
					lcclasecomp = "M"
				ENDIF
				lcletra="X"
				lcnum="00000000"
				lcnumero=lcletra+"0000"+lcnum
				
				INSERT INTO CsrMaopera (id,origen,programa,sucursal,terminal,sector,fechasis,idoperador;
				,idvendedor,iddetanrocaja,idcomproba,numcomp,clasecomp,turno,puestocaja,idcotizadolar;
				,switch,estado,detalle,fechaserver);
				VALUES (lnidmaopera,"EXI","IMPORTACION STOCK",goapp.sucursal,goapp.terminal,1,ldfechasis;
				,1,1,lniddetanrocaja,lnidcomproba,lcnumero,lcclasecomp,1,1,1,"0000","0";
				,"Importación Stock",ldfechasis)
				
				INSERT INTO CsrMovStock (id,idmaopera,idorigen,idarticulo,idsubarti,codigo,fecha,iddeposito;
				,cantidad,kilos,volumen,importe,switch,signo);
				VALUES (lnidmov,lnidmaopera,lnidmaopera,CsrProducto.id,lnidsub,lccodigo,ldfechasis;
				,CsrDeposito.id,INT(round(ABS(CsrLista.existe),0)),0,0,0,"0000",IIF(CsrLista.existe>0,1,-1))
				
				lnidmov=lnidmov+1
				lnidmaopera=lnidmaopera+1
			ENDIF
			
		ENDIF 
	ENDIF
	SELECT CsrLista
	
ENDSCAN
Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
USE IN CsrStock

