PARAMETERS ldfecha,lcpath,lcbase
lcfecha = IIF(PCOUNT()< 1,"01-01-2011",DTOC(ldfecha))
lcpath = IIF(PCOUNT()<2,"",lcpath)
lcdata = lcBase

DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE  

SET SAFETY OFF

SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON
oavisar.proceso("Abriendo tablas...")
llok = .t.

TEXT TO lccmd TEXTMERGE NOSHOW 
SELECT CsrPlanCue.*,ISNULL(CsrClaseCta.cnumero,'ZZ') as clasecta FROM PlanCue as CsrPlanCue
left join ClaseCta as CsrClaseCta on CsrPlanCue.idclase = CsrClaseCta.id
where CsrPlanCue.idejercicio =  <<goapp.idejercicio>> 
ENDTEXT 
IF !CrearCursorAdapter('CsrPlanCue',lccmd) OR RECCOUNT('CsrPlanCue')=0
	MESSAGEBOX('Nose puede importar, pq no cargado el CsrPlanCue')
	RETURN .f.
ENDIF 

TEXT TO lccmd TEXTMERGE NOSHOW 
SELECT CsrParaVario.* FROM ParaVario as CsrParaVario
ENDTEXT 
IF !CrearCursorAdapter('CsrParaVario',lccmd)
	MESSAGEBOX('Nose puede importar, las tablas varias nose cargaron')
	RETURN .f.
ENDIF

llok = CargarTabla(lcData,'TablaAsi')
llok = CargarTabla(lcData,'Cabeasi')
llok = CargarTabla(lcData,'Maopera')
llok = CargarTabla(lcData,'DetaNroCaja')

IF !llok
	RETURN .f.
ENDIF

USE ALLTRIM(lcpath )+"\contab\cabe0132" IN 0 ALIAS FsrCabeAsi EXCLUSIVE 

USE  ALLTRIM(lcpath )+"\contab\movi0132" in 0 alias FsrTablaAsi EXCLUSIVE

*ldfechaant=DATE(2010,08,01)
ldfechaant=CTOD(lcfecha)

oavisar.proceso("S","Reindexando EnCabezados de asientos..")

SELECT YEAR(FsrCabeAsi.fecha) as periodo;
,FsrTablaAsi.origen,FsrTablaAsi.numero as cuenta;
,FsrTablaAsi.deb_Cre as debehaber,SUM(FsrTablaAsi.importe) as importe FROM FsrCabeAsi ;
INNER JOIN FsrTablaAsi ON FsrCabeAsi.asiori = FsrTablaAsi.asiento;
Where FsrTablaAsi.origen='G';
group BY FsrCabeasi.fecha,FsrTablaAsi.numero,FsrTablaAsi.deb_Cre,FsrTablaAsi.origen;
INTO CURSOR CsrCabeza READWRITE 

SELECT periodo,origen,cuenta,debehaber,SUM(importe) as importe FROM CsrCabeza GROUP BY periodo,origen,cuenta,debehaber ORDER BY periodo,debehaber INTO CURSOR CsrCabeza READWRITE 

TEXT TO lcCmd TEXTMERGE NOSHOW 
select convert(varchar(4),c.fecha,112) as periodo
,debehaber,sum(importe) as importe ,p.cuenta
from cabeasi as c
inner join tablaasi as t on c.idmaopera = t.idmaopera
inner join plancue as p on t.idcuenta = p.id
Where c.tipoasi='C'
group by  convert(varchar(4),c.fecha,112),debehaber,p.cuenta
order by  convert(varchar(4),c.fecha,112),debehaber
ENDTEXT 
IF NOT CrearCursorAdapter('CsrContab',lcCmd)
	RETURN .f.
ENDIF 

SELECT CsrCabeza
vista()


oavisar.proceso("S","Filtrando movimientos de asientos...")

SET SAFETY ON
oavisar.proceso("Procesando tablas...")
LOCAL lnid,lnidcabeza,lnidcuerpo

lnid 		= RecuperarID('CsrMaopera',Goapp.sucursal10)
lnidcabeza 	= RecuperarID('CsrCabeasi',Goapp.sucursal10)
lnidcuerpo	= RecuperarID('CsrTablaAsi',Goapp.sucursal10)

SELECT Csrcabeza
COUNT ALL TO lnCountCabeza
GO TOP 

lcTitulo = "CabeAsi "+STR(RECNO(),10)+"/"+STR(lnCountCabeza,10) 
Oavisar.proceso('S',lcTitulo,.t.,lnCountCabeza)
lbSalir = .f.

SELECT Csrcabeza
DO WHILE !EOF()
	SELECT Csrcabeza
	
   	lcTitulo = "Cabefac "+STR(RECNO(),10)+"/"+STR(lnCountCabeza,10) 
   	Oavisar.proceso('I',lcTitulo,.t.,lnCountCabeza,RECNO())

	
	lcnumcomp 		= CsrCabeza.debehaber+"000000"+STR(CsrCabeza.periodo,6)
	ldfecha			= GOMONTH(CTOD(StoC(STR(CsrCabeza.periodo,4)+'1201')),1)-1
	ldfechaserver 	= DATETIME()
	ldfechasis 		= ldfecha		
	
	lcestado 	= '0'
	
	lnidcomproba = 0
	lcclasecomp = ""
    lnidvendedor = 0      

	SELECT CsrDetaNroCaja
	LOCATE FOR nrocaja = VAL(DTOS(ldfecha))
	IF nrocaja != VAL(DTOS(ldfecha)) 
		GO TOP 
	ENDIF 
	lniddetanrocaja = CsrDetaNroCaja.id
	
	lbInsertCabeza = .t.
	SELECT CsrCabeza
    lnperiodo = CsrCabeza.periodo
    lcorigen = CsrCabeza.origen
    DO WHILE !EOF() AND CsrCabeza.periodo = lnperiodo AND CsrCabeza.origen = lcOrigen
    	
    	STORE 0 TO lnidcuenta,lnidprovincia
    	lctipoconce = ""
    	lctablaori 	= "MAOP"
    	
    	SELECT CsrPlanCue
    	LOCATE FOR cuenta = CsrCabeza.cuenta
    	IF 	cuenta = CsrCabeza.cuenta
    		lnidcuenta = CsrPlanCue.id
    		lctipoconce = CsrPlanCue.clasecta
		ENDIF 
		
		lcDebeHaber = CsrCabeza.debehaber
		lnimporte 	= CsrCabeza.importe
		
		IF CsrCabeza.cuenta=1838
			stop()
		ENDIF 
		
		SELECT CsrContab
		LOCATE FOR VAL(periodo) = CsrCabeza.periodo AND cuenta = CsrCabeza.cuenta AND debehaber = CsrCabeza.debehaber
		IF VAL(periodo) = CsrCabeza.periodo AND cuenta = CsrCabeza.cuenta AND debehaber = CsrCabeza.debehaber
			lnimporte = lnImporte -  CsrContab.importe
		ENDIF 
		IF lnImporte < 0
			lcDebeHaber = IIF(lcDebeHaber$"D","H","D")
			lnImporte=ABS(lnImporte)
		ENDIF 
		
		IF lbInsertCabeza
			INSERT INTO Csrmaopera (id,origen,programa,terminal,fechasis,idoperador,idvendedor,idcomproba,numcomp;
			,clasecomp,iddetanrocaja,turno,switch,sucursal,sector,puestocaja,idcotizadolar,estado,fechaserver);
			VALUES (lnid,'AST',"IMPORTACION CONTABLE",goapp.terminal,ldfechasis,1,lnidvendedor,lnidcomproba;
			,lcnumcomp,lcclasecomp,lniddetanrocaja,1,"00000",goapp.sucursal,1,1,1,lcestado,ldfechaserver)
			
			lnnumero	= IIF(CsrCabeza.origen='X',1,2)
			lctipoasi	= IIF(lnnumero#1,"C","A")
			lcdetalle	= IIF(CsrCabeza.origen='X',"APERTURA DE EJERCICIO","AJUSTE IMP CONTABILIDAD")
			ldfechacarga= ldfecha
				
			INSERT INTO Csrcabeasi (id,idmaopera,idejercicio,numero,fecha,tipoasi,detalle,fechacarga);
		    VALUES (lnidcabeza,lnid,goapp.idejercicio,lnnumero,ldfecha,lctipoasi,lcdetalle,ldfechacarga)

    		
    		lbInsertCabeza = .f.		
		ENDIF 
		
		INSERT INTO CsrTablaasi (id,idmaopera,idcuenta,debehaber,importe,idorigen,tablaori,tipoconce,detalle);
		VALUES (lnidcuerpo,lnid,lnidcuenta,lcdebehaber,lnimporte,lnid,lctablaori,lctipoconce,lcdetalle)

		lnidCuerpo = lnidCuerpo + 1		
		
		SELECT CsrCabeza	
		SKIP 
	ENDDO  
	lnid = lnid + 1
	lnidcabeza = lnidcabeza + 1
		
	SELECT CsrCabeza		     				
ENDDO 

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
 
USE IN CsrCabeza
USE IN FsrCabeAsi
USE IN FsrTablaAsi