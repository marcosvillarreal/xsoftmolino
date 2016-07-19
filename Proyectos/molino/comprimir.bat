@echo
cls
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\SECCION.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\MARCA.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\ARTICULO.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\CODBARRA.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\TABLAIVA.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\VENDEDOR.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\CATEGORI.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\ZONA.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\VALOR.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\PLAN.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\PLANCUE.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\PARAMETR.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\NEGOCIOS.tra
if not errorlevel 0 goto Error
pkzip -ep -t  C:\Temporal\09101606.ges C:\Temporal\DEPOSITO.tra
if not errorlevel 0 goto Error
goto salir
:Error
:Salir
