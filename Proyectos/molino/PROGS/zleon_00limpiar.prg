PARAMETERS ldfecha,lcpath
LOCAL lcfecha
lcfecha = IIF(PCOUNT()< 1,"01-08-2010",DTOC(ldfecha))
lcpath = IIF(PCOUNT()<2,"",lcpath)

DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE  

SET SAFETY OFF

SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON

Oavisar.proceso('S','Abriendo archivos') 

TEXT TO lccmd TEXTMERGE NOSHOW 
SELECT CsrParaConta.* FROM ParaConta as CsrParaConta
where idejercicio = <<goapp.idejercicio>>
ENDTEXT 
IF !CrearCursorAdapter('CsrParaConta',lccmd)
	MESSAGEBOX('Nose puede importar, pq no cargado el CsrParaConta')
	RETURN .f.
ENDIF 

llok = .t.
llok = CargarTabla('leon','Maopera',.t.)
llok = CargarTabla('leon','MovCtacte',.t.)
llok = CargarTabla('leon','CabeCpra',.t.)
llok = CargarTabla('leon','CabeFac',.t.)
llok = CargarTabla('leon','CuerFac',.t.)
llok = CargarTabla('leon','CuerVari',.t.)
llok = CargarTabla('leon','CuerCpra',.t.)
llok = CargarTabla('leon','TablaImp',.t.)
llok = CargarTabla('leon','RenCtacte',.t.)
llok = CargarTabla('leon','MovCaja',.t.)
llok = CargarTabla('leon','MovBcocar',.t.)
llok = CargarTabla('leon','FuerzaVta',.t.)
llok = CargarTabla('leon','CabeAsi',.t.)
llok = CargarTabla('leon','AfeBcocar',.t.)
llok = CargarTabla('leon','DetaNroCaja',.t.)
llok = CargarTabla('leon','AfeCtacte',.t.)

SET SAFETY ON
IF !llok
	RETURN .f.
ENDIF

LOCAL lnid
lnid 			= RecuperarID('CsrFuerzaVta',Goapp.sucursal10)
lniddetanrocaja = RecuperarID('CsrDetanroCaja',Goapp.sucursal10)

INSERT INTO Csrfuerzavta (id,numero,nombre) VALUES (lnid,1,"FUERZA VTA 1")
lnid = lnid + 1 
INSERT INTO Csrfuerzavta (id,numero,nombre) VALUES (lnid,2,"FUERZA VTA 2")

STORE 0 TO lnidejercicio,lndebe,lnhaber,lnsaldo,lnnrocaja
STORE "" TO lcpefiscal,lcswitch
STORE CTOD('01-01-1900') TO ldfecdesde,ldfechasta

lniddetanrocaja = RecuperarID('CsrDetanroCaja',Goapp.sucursal10)
lnidejercicio	= CsrParaConta.idejercicio
lnnrocaja		= VAL(DTOS(CTOD(lcfecha)))
lcpefiscal		= LEFT(STR(lnnrocaja,8),6)
ldfecdesde		= CTOD('01-01-'+RIGHT(lcfecha,4))
ldfechasta		= CTOD(lcfecha)
lndebe			= 0
lnhaber			= 0
lnsaldo			= 0
lcswitch		= "0000000000"

INSERT INTO Csrdetanrocaja(id,idejercicio,nrocaja,pefiscal,fecdesde,fechasta,debe,haber,saldo,switch);
VALUES(lniddetanrocaja,lnidejercicio,lnnrocaja,lcpefiscal,ldfecdesde,ldfechasta,lndebe,lnhaber;
,lnsaldo,lcswitch)

oavisar.usuario('En enviar datos la opcion 1, asi los movimientos seran grabados en la caja numero '+ STR(lnnrocaja,8);
+"."+CHR(13)+"Si desea importar los movimientos a otra caja. Abra una nueva caja en el sistema.";
+CHR(13)+"Recuerde que la caja se captura del sistema nuevo.")

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
