PARAMETERS ldvacio,lcpath,lcBase
LOCAL lcbdd,lcfecha,lnid
ldvacio = IIF(PCOUNT()<1,"",ldvacio)
lcpath = IIF(PCOUNT()<2,"",lcpath)
lcbdd = lcBase

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
llok = CargarTabla(lcbdd,'Ctacte')
llok = CargarTabla(lcbdd,'CanalVta',.t.)

SET SAFETY ON
Oavisar.proceso('S','Abriendo archivos') 
USE  ALLTRIM(lcpath)+"\gestion\clientes" in 0 alias FsrCliente EXCLUSIVE

USE  ALLTRIM(lcpath)+"\gestion\canales" in 0 alias FsrCanal EXCLUSIVE


Oavisar.proceso('S','Procesando '+alias()) 
SELECT * FROM FsrCliente ORDER BY numero INTO CURSOR FsrDeudor
USE IN FsrCliente

Oavisar.proceso('S','Procesando '+alias()) 

lnid = RecuperarID('CsrCanalVta',Goapp.sucursal10)

SELECT FsrCanal
SCAN FOR !EOF()    
	&&&comprobar Ñ
	lcnombre=NombreNi(ALLTRIM(UPPER(FsrCanal.nombre)))
	INSERT INTO CsrCanalVta(id,numero,nombre,lista);
    VALUES (lnid,FsrCanal.numero,lcnombre,1)
    lnid = lnid +1 
ENDSCAN

USE in FsrCanal


SELECT FsrDeudor
Oavisar.proceso('S','Procesando clientes') 	
GO  TOP 
SCAN 
	STORE 0 TO lnidcanalvta
   
	IF recno('FsrDeudor')/500=INT(RECNO('FsrDeudor')/500)
		lcTitulo = "Clientes "+STR(RECNO(),10)   
		Oavisar.proceso('S',lcTitulo,.t.,recno())
	ENDIF
	
	SELECT CsrCtacte
	LOCATE FOR VAL(cnumero) = FsrDeudor.numero
	IF VAL(cnumero) = FsrDeudor.numero
		SELECT CsrCanalVta
		LOCATE FOR numero = FsrDeudor.canal
		IF numero = FsrDeudor.canal
			replace idcanalvta WITH CsrCanalVta.id IN CsrCtacte
		ENDIF 
	ENDIF 
	SELECT FsrDeudor
ENDSCAN 

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')

CLOSE tables
CLOSE INDEXES
CLOSE DATABASES

